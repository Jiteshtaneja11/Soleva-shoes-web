import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';

class NewsletterEndpoint extends Endpoint {
  Future<bool> subscribe(Session session, String email) async {
    final normalized = email.trim().toLowerCase();
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(normalized)) {
      throw FormatException('Enter a valid email address.');
    }

    final existing = await NewsletterSubscriber.db.findFirstRow(
      session,
      where: (t) => t.email.equals(normalized),
    );
    if (existing != null) return false;

    await NewsletterSubscriber.db.insertRow(
      session,
      NewsletterSubscriber(email: normalized, subscribedAt: DateTime.now()),
    );
    return true;
  }
}
