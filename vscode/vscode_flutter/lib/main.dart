import 'package:flutter/material.dart';

import 'app/app_state.dart';
import 'app/app_scope.dart';
import 'client.dart';
import 'theme/soleva_theme.dart';
import 'features/home/home_page.dart';
import 'features/shop/shop_page.dart';
import 'features/product/product_page.dart';
import 'features/cart/cart_page.dart';
import 'features/account/account_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const SolevaApp());
}

class SolevaApp extends StatefulWidget {
  const SolevaApp({super.key});

  @override
  State<SolevaApp> createState() => _SolevaAppState();
}

class _SolevaAppState extends State<SolevaApp> {
  final app = SolevaAppState();

  @override
  void initState() {
    super.initState();
    app.loadProducts();
  }

  @override
  Widget build(BuildContext context) => AppScope(
    app: app,
    child: MaterialApp(
      title: 'SOLEVA',
      debugShowCheckedModeBanner: false,
      theme: SolevaTheme.light,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        Widget page;
        switch (settings.name) {
          case '/shop':
            page = const ShopPage();
            break;
          case '/cart':
            page = const CartPage();
            break;
          case '/account':
            page = const AccountPage();
            break;
          default:
            if (settings.name?.startsWith('/product/') ?? false) {
              final slug = settings.name!.split('/').last;
              page = ProductPage(slug: slug);
            } else {
              page = const HomePage();
            }
        }
        return PageRouteBuilder<void>(
          settings: settings,
          pageBuilder: (_, __, ___) => page,
          transitionDuration: const Duration(milliseconds: 350),
          transitionsBuilder: (_, animation, __, child) =>
              FadeTransition(opacity: animation, child: child),
        );
      },
    ),
  );
}
