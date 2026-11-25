import 'package:flutter/material.dart';

import '../app/app_scope.dart';
import '../core/models.dart';
import '../theme/soleva_theme.dart';

class ProductCard extends StatelessWidget {
  final UiProduct product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final wished = app.wishlist.contains(product.slug);
    return InkWell(
      onTap: () => Navigator.pushNamed(context, '/product/${product.slug}'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  color: const Color(0xFFEAE7DF),
                  child: Image.network(
                    product.imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => const Icon(
                      Icons.image_not_supported_outlined,
                      size: 48,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  top: 12,
                  child: product.newArrival
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 5,
                          ),
                          color: SolevaTheme.lime,
                          child: const Text(
                            'NEW',
                            style: TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        )
                      : const SizedBox(),
                ),
                if (product.discount > 0)
                  Positioned(
                    left: 12,
                    top: product.newArrival ? 48 : 12,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 5,
                      ),
                      color: SolevaTheme.orange,
                      child: Text(
                        '-${product.discount}%',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                    ),
                  ),
                Positioned(
                  right: 8,
                  top: 8,
                  child: IconButton(
                    onPressed: () => app.toggleWishlist(product),
                    style: IconButton.styleFrom(backgroundColor: Colors.white),
                    icon: Icon(
                      wished ? Icons.favorite : Icons.favorite_border,
                      color: wished ? SolevaTheme.orange : SolevaTheme.ink,
                    ),
                  ),
                ),
                Positioned(
                  left: 12,
                  right: 12,
                  bottom: 12,
                  child: FilledButton(
                    onPressed: () {
                      app.addToCart(product);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('${product.name} added to bag'),
                          duration: const Duration(seconds: 2),
                        ),
                      );
                    },
                    style: FilledButton.styleFrom(
                      minimumSize: const Size(double.infinity, 44),
                    ),
                    child: const Text('QUICK ADD'),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Text(
            product.brand,
            style: const TextStyle(
              fontSize: 10,
              letterSpacing: 1.4,
              fontWeight: FontWeight.w800,
              color: SolevaTheme.muted,
            ),
          ),
          const SizedBox(height: 4),
          Text(product.name, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '\$${product.price.toStringAsFixed(0)}',
                style: const TextStyle(fontWeight: FontWeight.w900),
              ),
              if (product.originalPrice != null) ...[
                const SizedBox(width: 8),
                Text(
                  '\$${product.originalPrice!.toStringAsFixed(0)}',
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: SolevaTheme.muted,
                  ),
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
