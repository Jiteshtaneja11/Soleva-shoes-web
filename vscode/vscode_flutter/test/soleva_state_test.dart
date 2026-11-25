import 'package:flutter_test/flutter_test.dart';
import 'package:vscode/app/app_state.dart';
import 'package:vscode/core/models.dart';

UiProduct createProduct() => const UiProduct(
  name: 'Aero 01',
  slug: 'aero-01',
  brand: 'SOLEVA',
  category: 'Running',
  gender: 'Unisex',
  description: 'Test sneaker',
  imageUrl: 'https://example.com/aero.jpg',
  secondaryImageUrl: 'https://example.com/aero-alt.jpg',
  price: 189,
  rating: 4.8,
  reviewCount: 124,
  colors: ['Volt', 'Black'],
  sizes: ['8', '9', '10'],
  stock: 42,
  featured: true,
  newArrival: true,
);

void main() {
  test('cart adds a product once and updates quantity', () {
    final app = SolevaAppState();
    final product = createProduct();

    app.addToCart(product, size: '9');
    app.addToCart(product, size: '9');

    expect(app.cart, hasLength(1));
    expect(app.cart.first.quantity, 2);
    expect(app.cartSubtotal, 378);
  });

  test('cart can remove an item', () {
    final app = SolevaAppState();
    final product = createProduct();
    app.addToCart(product, size: '9');

    app.removeFromCart(app.cart.first);

    expect(app.cart, isEmpty);
  });

  test('wishlist toggles a product', () {
    final app = SolevaAppState();
    final product = createProduct();

    app.toggleWishlist(product);
    expect(app.wishlist, contains('aero-01'));

    app.toggleWishlist(product);
    expect(app.wishlist, isEmpty);
  });
}
