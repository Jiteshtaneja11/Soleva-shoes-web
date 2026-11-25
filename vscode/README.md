# SOLEVA

SOLEVA is a premium sneaker storefront built in the existing Serverpod workspace.

## Projects

- `vscode_flutter`: Flutter Web customer experience
- `vscode_server`: Serverpod API, models, migrations, and authentication
- `vscode_client`: generated Serverpod client

## Implemented

- Premium responsive storefront and navigation
- Home, catalogue, product detail, bag, and account routes
- Live Serverpod product catalogue
- Product search and Men/Women/Running/Lifestyle filters
- Wishlist state and guest cart state
- Size selection, stock indicators, coupon UI, and labelled test checkout
- Newsletter subscription backed by PostgreSQL
- Serverpod authentication dependencies retained
- Product and newsletter database migrations

## Run requirements

The project requires Flutter, Dart, Serverpod CLI, and PostgreSQL/Docker.

The current machine has Flutter 3.50.1, Dart 3.14.0, Serverpod 4.1.2, and no Docker executable.
The embedded PostgreSQL runtime failed while initializing `pgdata` on Windows. Install Docker Desktop or configure a reachable external PostgreSQL instance before applying migrations and starting the API.

## Development

```powershell
cd D:\vscode\coding\vscode
dart format .
dart analyze
flutter build web --release
serverpod start
```

The recommended order is to use `serverpod start` after PostgreSQL is available. The Flutter app calls the product seed endpoint on first catalog load.

## Test coupon

Use `SOLEVA20` in the bag to apply a 20% test discount.

## Integration placeholders

- Real card payments are intentionally not claimed as implemented.
- 3D sneaker models require GLB/GLTF assets supplied under `vscode_flutter/assets/models`.
- Production image delivery should be moved to Serverpod cloud storage or an approved image CDN.
- Complete admin, review, order, address, and persistent authenticated cart features remain for subsequent implementation phases.
