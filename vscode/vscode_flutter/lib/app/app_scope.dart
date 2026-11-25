import 'package:flutter/widgets.dart';

import 'app_state.dart';

class AppScope extends InheritedNotifier<SolevaAppState> {
  const AppScope({super.key, required SolevaAppState app, required super.child})
    : super(notifier: app);

  static SolevaAppState of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppScope>()!.notifier!;
}
