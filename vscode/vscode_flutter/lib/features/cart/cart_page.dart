import 'package:flutter/material.dart';

import '../../app/app_scope.dart';
import '../../app/app_state.dart';
import '../../theme/soleva_theme.dart';
import '../../widgets/soleva_scaffold.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  bool testCheckout = false;
  bool orderPlaced = false;
  final coupon = TextEditingController();
  double discount = 0;

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 900;
    final shipping = app.cartSubtotal >= 150.0 || app.cart.isEmpty ? 0.0 : 12.0;
    final total = app.cartSubtotal - discount + shipping;

    if (orderPlaced) {
      return SolevaScaffold(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.check_circle_outline,
                size: 72,
                color: SolevaTheme.orange,
              ),
              const SizedBox(height: 18),
              const Text(
                'ORDER CONFIRMED',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 8),
              Text(
                'Test order SO-${DateTime.now().millisecondsSinceEpoch.toString().substring(8)}',
              ),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () {
                  app.cart.clear();
                  setState(() => orderPlaced = false);
                  Navigator.pushNamed(context, '/');
                },
                child: const Text('CONTINUE SHOPPING'),
              ),
            ],
          ),
        ),
      );
    }

    return SolevaScaffold(
      child: app.cart.isEmpty
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.shopping_bag_outlined, size: 72),
                  const SizedBox(height: 16),
                  const Text(
                    'YOUR BAG IS EMPTY',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
                  ),
                  const SizedBox(height: 16),
                  FilledButton(
                    onPressed: () => Navigator.pushNamed(context, '/shop'),
                    child: const Text('SHOP SNEAKERS'),
                  ),
                ],
              ),
            )
          : ListView(
              padding: EdgeInsets.all(wide ? 44 : 18),
              children: [
                Text(
                  'YOUR BAG',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                const SizedBox(height: 30),
                if (wide)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(flex: 3, child: _Items(app: app)),
                      const SizedBox(width: 40),
                      Expanded(
                        child: _Summary(
                          app: app,
                          subtotal: app.cartSubtotal,
                          shipping: shipping,
                          discount: discount,
                          total: total,
                          coupon: coupon,
                          testCheckout: testCheckout,
                          onCoupon: () => setState(() {
                            discount =
                                coupon.text.trim().toUpperCase() == 'SOLEVA20'
                                ? app.cartSubtotal * .20
                                : 0;
                          }),
                          onTestCheckout: () =>
                              setState(() => testCheckout = true),
                          onPlace: () => setState(() => orderPlaced = true),
                        ),
                      ),
                    ],
                  )
                else
                  Column(
                    children: [
                      _Items(app: app),
                      const SizedBox(height: 30),
                      _Summary(
                        app: app,
                        subtotal: app.cartSubtotal,
                        shipping: shipping,
                        discount: discount,
                        total: total,
                        coupon: coupon,
                        testCheckout: testCheckout,
                        onCoupon: () => setState(() {
                          discount =
                              coupon.text.trim().toUpperCase() == 'SOLEVA20'
                              ? app.cartSubtotal * .20
                              : 0;
                        }),
                        onTestCheckout: () =>
                            setState(() => testCheckout = true),
                        onPlace: () => setState(() => orderPlaced = true),
                      ),
                    ],
                  ),
              ],
            ),
    );
  }
}

class _Items extends StatelessWidget {
  final SolevaAppState app;
  const _Items({required this.app});

  @override
  Widget build(BuildContext context) => Column(
    children: app.cart
        .map(
          (entry) => Container(
            margin: const EdgeInsets.only(bottom: 16),
            padding: const EdgeInsets.all(12),
            color: Colors.white,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 120,
                  height: 140,
                  child: Image.network(
                    entry.product.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        entry.product.name,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('Size ${entry.size}'),
                      const SizedBox(height: 12),
                      Text(
                        '\$${entry.product.price.toStringAsFixed(0)}',
                        style: const TextStyle(fontWeight: FontWeight.w900),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () =>
                                app.changeQuantity(entry, entry.quantity - 1),
                            icon: const Icon(Icons.remove),
                          ),
                          Text(
                            '${entry.quantity}',
                            style: const TextStyle(fontWeight: FontWeight.w900),
                          ),
                          IconButton(
                            onPressed: () =>
                                app.changeQuantity(entry, entry.quantity + 1),
                            icon: const Icon(Icons.add),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () => app.removeFromCart(entry),
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
        .toList(),
  );
}

class _Summary extends StatelessWidget {
  final SolevaAppState app;
  final double subtotal, shipping, discount, total;
  final TextEditingController coupon;
  final bool testCheckout;
  final VoidCallback onCoupon, onTestCheckout, onPlace;
  const _Summary({
    required this.app,
    required this.subtotal,
    required this.shipping,
    required this.discount,
    required this.total,
    required this.coupon,
    required this.testCheckout,
    required this.onCoupon,
    required this.onTestCheckout,
    required this.onPlace,
  });

  @override
  Widget build(BuildContext context) => Container(
    color: Colors.white,
    padding: const EdgeInsets.all(24),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'ORDER SUMMARY',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w900),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            const Text('Subtotal'),
            const Spacer(),
            Text('\$${subtotal.toStringAsFixed(2)}'),
          ],
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const Text('Shipping'),
            const Spacer(),
            Text(shipping == 0 ? 'FREE' : '\$${shipping.toStringAsFixed(2)}'),
          ],
        ),
        if (discount > 0) ...[
          const SizedBox(height: 10),
          Row(
            children: [
              const Text('Discount'),
              const Spacer(),
              Text('-\$${discount.toStringAsFixed(2)}'),
            ],
          ),
        ],
        const Divider(height: 32),
        Row(
          children: [
            const Text('TOTAL', style: TextStyle(fontWeight: FontWeight.w900)),
            const Spacer(),
            Text(
              '\$${total.toStringAsFixed(2)}',
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: coupon,
                decoration: const InputDecoration(
                  hintText: 'COUPON',
                  filled: true,
                ),
              ),
            ),
            IconButton(
              onPressed: onCoupon,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: FilledButton(
            onPressed: testCheckout ? onPlace : onTestCheckout,
            child: Text(
              testCheckout ? 'PLACE TEST ORDER' : 'PROCEED TO TEST CHECKOUT',
            ),
          ),
        ),
        if (testCheckout)
          const Padding(
            padding: EdgeInsets.only(top: 12),
            child: Text(
              'TEST MODE — No payment will be processed.',
              style: TextStyle(color: SolevaTheme.muted, fontSize: 12),
            ),
          ),
      ],
    ),
  );
}
