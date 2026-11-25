import 'package:flutter/material.dart';

import '../../app/app_scope.dart';
import '../../theme/soleva_theme.dart';
import '../../widgets/soleva_scaffold.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    return SolevaScaffold(
      child: ListView(
        padding: const EdgeInsets.all(44),
        children: [
          Text('MY ACCOUNT', style: Theme.of(context).textTheme.headlineLarge),
          const SizedBox(height: 28),
          Wrap(
            spacing: 16,
            runSpacing: 16,
            children: [
              _AccountCard(
                title: 'ORDERS',
                detail: 'No recent orders',
                icon: Icons.receipt_long,
              ),
              _AccountCard(
                title: 'WISHLIST',
                detail: '${app.wishlist.length} saved items',
                icon: Icons.favorite_border,
              ),
              _AccountCard(
                title: 'ADDRESSES',
                detail: 'Manage saved addresses',
                icon: Icons.location_on_outlined,
              ),
              _AccountCard(
                title: 'PROFILE',
                detail: 'Sign in with Serverpod',
                icon: Icons.person_outline,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _AccountCard extends StatelessWidget {
  final String title, detail;
  final IconData icon;
  const _AccountCard({
    required this.title,
    required this.detail,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) => Container(
    width: 260,
    height: 170,
    padding: const EdgeInsets.all(22),
    color: Colors.white,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 30),
        const Spacer(),
        Text(title, style: const TextStyle(fontWeight: FontWeight.w900)),
        const SizedBox(height: 6),
        Text(detail, style: const TextStyle(color: SolevaTheme.muted)),
      ],
    ),
  );
}
