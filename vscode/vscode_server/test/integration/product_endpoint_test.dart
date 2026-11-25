import 'package:test/test.dart';

import 'test_tools/serverpod_test_tools.dart';

void main() {
  withServerpod(
    'SOLEVA product endpoint',
    (sessionBuilder, endpoints) {
      test('seeds twelve unique products once', () async {
        final count = await endpoints.product.seed(sessionBuilder);
        final secondCount = await endpoints.product.seed(sessionBuilder);

        expect(count, 12);
        expect(secondCount, 12);
      });

      test('returns database products with pagination', () async {
        await endpoints.product.seed(sessionBuilder);
        final products = await endpoints.product.getProducts(
          sessionBuilder,
          offset: 0,
          limit: 24,
        );

        expect(products, isNotEmpty);
        expect(products.length, greaterThanOrEqualTo(12));
      });

      test('filters products by category and gender', () async {
        await endpoints.product.seed(sessionBuilder);
        final products = await endpoints.product.getProductsWithFilters(
          sessionBuilder,
          category: 'Running',
          gender: 'Women',
          featuredOnly: false,
          newOnly: false,
          bestSellerOnly: false,
          sort: 'newest',
          offset: 0,
          limit: 24,
        );

        expect(products, isNotEmpty);
        expect(
          products.every((p) => p.category == 'Running'),
          isTrue,
        );
      });

      test('finds a product by slug', () async {
        await endpoints.product.seed(sessionBuilder);
        final product = await endpoints.product.getProductBySlug(
          sessionBuilder,
          'aero-01',
        );

        expect(product, isNotNull);
        expect(product!.name, 'Aero 01');
      });
    },
    ephemeralDatabase: false,
    rollbackDatabase: RollbackDatabase.disabled,
  );
}
