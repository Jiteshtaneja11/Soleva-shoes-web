import 'package:flutter/foundation.dart';

import '../core/models.dart';
import '../client.dart';

class SolevaAppState extends ChangeNotifier {
  List<UiProduct> products = [];
  final Set<String> wishlist = {};
  final List<CartEntry> cart = [];
  bool loading = true;
  String? error;

  Future<void> loadProducts() async {
    loading = true;
    error = null;
    notifyListeners();
    try {
      await client.product.seed();
      final rows = await client.product.getProductsWithFilters(
        offset: 0,
        limit: 24,
        featuredOnly: false,
        newOnly: false,
        bestSellerOnly: false,
        sort: 'newest',
      );
      products = rows.map(UiProduct.fromServer).toList();
    } catch (e) {
      error = 'The catalog could not be reached. $e';
    } finally {
      loading = false;
      notifyListeners();
    }
  }

  void toggleWishlist(UiProduct product) {
    if (wishlist.contains(product.slug)) {
      wishlist.remove(product.slug);
    } else {
      wishlist.add(product.slug);
    }
    notifyListeners();
  }

  void addToCart(UiProduct product, {String? size}) {
    final index = cart.indexWhere((e) => e.product.slug == product.slug);
    if (index >= 0) {
      cart[index].quantity++;
    } else {
      cart.add(CartEntry(product: product, size: size ?? product.sizes.first));
    }
    notifyListeners();
  }

  void removeFromCart(CartEntry entry) {
    cart.remove(entry);
    notifyListeners();
  }

  void changeQuantity(CartEntry entry, int quantity) {
    if (quantity < 1) return;
    entry.quantity = quantity;
    notifyListeners();
  }

  double get cartSubtotal => cart.fold(
    0,
    (total, entry) => total + entry.product.price * entry.quantity,
  );
}

class CartEntry {
  final UiProduct product;
  String size;
  int quantity;

  CartEntry({required this.product, required this.size, this.quantity = 1});
}
