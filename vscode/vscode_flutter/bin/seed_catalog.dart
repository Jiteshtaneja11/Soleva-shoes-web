import 'package:vscode_client/vscode_client.dart';

Future<void> main() async {
  final client = Client('http://127.0.0.1:8080/');
  final count = await client.product.seed();
  final products = await client.product.getProducts(offset: 0, limit: 24);

  print('seedCount=$count');
  print('returnedProducts=${products.length}');
  for (final product in products) {
    print('${product.id}\t${product.name}\t${product.category}\t${product.price}');
  }
}
