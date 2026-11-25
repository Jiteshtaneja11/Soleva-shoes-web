import 'package:flutter/material.dart';

import '../app/app_scope.dart';
import '../theme/soleva_theme.dart';

class SolevaScaffold extends StatelessWidget {
  final Widget child;
  const SolevaScaffold({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 760;
    return Scaffold(
      drawer: wide
          ? null
          : Drawer(
              child: SafeArea(
                child: _NavColumn(
                  onNavigate: (route) => Navigator.pushNamed(context, route),
                ),
              ),
            ),
      body: Column(
        children: [
          Container(
            height: 34,
            color: SolevaTheme.ink,
            alignment: Alignment.center,
            child: const Text(
              'COMPLIMENTARY SHIPPING OVER \$150',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                letterSpacing: 1.8,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 78,
            padding: EdgeInsets.symmetric(horizontal: wide ? 44 : 18),
            decoration: const BoxDecoration(
              color: SolevaTheme.warmWhite,
              border: Border(bottom: BorderSide(color: Color(0x22111111))),
            ),
            child: Row(
              children: [
                if (!wide)
                  Builder(
                    builder: (context) => IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () => Scaffold.of(context).openDrawer(),
                    ),
                  ),
                InkWell(
                  onTap: () => Navigator.pushNamed(context, '/'),
                  child: const Text(
                    'SOLEVA',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      letterSpacing: -1,
                    ),
                  ),
                ),
                const Spacer(),
                if (wide) ...[
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/'),
                    child: const Text('HOME'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/shop'),
                    child: const Text('SHOP'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/shop'),
                    child: const Text('MEN'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/shop'),
                    child: const Text('WOMEN'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pushNamed(context, '/shop'),
                    child: const Text('NEW'),
                  ),
                ],
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/shop'),
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () => Navigator.pushNamed(context, '/account'),
                  icon: const Icon(Icons.person_outline),
                ),
                Stack(
                  clipBehavior: Clip.none,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pushNamed(context, '/cart'),
                      icon: const Icon(Icons.shopping_bag_outlined),
                    ),
                    if (app.cart.isNotEmpty)
                      Positioned(
                        right: 2,
                        top: 2,
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                            color: SolevaTheme.orange,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${app.cart.fold(0, (s, e) => s + e.quantity)}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 9,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(child: child),
        ],
      ),
    );
  }
}

class _NavColumn extends StatelessWidget {
  final ValueChanged<String> onNavigate;
  const _NavColumn({required this.onNavigate});

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SOLEVA',
          style: TextStyle(fontSize: 26, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 32),
        for (final item in const {
          'HOME': '/',
          'SHOP': '/shop',
          'MEN': '/shop',
          'WOMEN': '/shop',
          'ACCOUNT': '/account',
          'CART': '/cart',
        }.entries)
          TextButton(
            onPressed: () => onNavigate(item.value),
            child: Text(item.key),
          ),
      ],
    ),
  );
}
