import 'package:flutter/material.dart';

import '../../app/app_scope.dart';
import '../../theme/soleva_theme.dart';
import '../../widgets/product_card.dart';
import '../../widgets/soleva_scaffold.dart';
import '../../client.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final app = AppScope.of(context);
    final wide = MediaQuery.sizeOf(context).width >= 900;
    return SolevaScaffold(
      child: ListView(
        children: [
          Container(
            height: wide ? 650 : 520,
            color: const Color(0xFFD8D3C8),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Image.network(
                  'https://images.unsplash.com/photo-1552346154-21d32810aba3',
                  fit: BoxFit.cover,
                  alignment: const Alignment(0.25, 0),
                  errorBuilder: (_, __, ___) =>
                      const ColoredBox(color: Color(0xFFD8D3C8)),
                ),
                Container(color: Colors.black.withValues(alpha: 0.12)),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: wide ? 64 : 24,
                    vertical: wide ? 70 : 48,
                  ),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 580),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 7,
                            ),
                            color: SolevaTheme.lime,
                            child: const Text(
                              'NEW / 2026',
                              style: TextStyle(
                                fontSize: 11,
                                letterSpacing: 2,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(height: 22),
                          Text(
                            'MOVE\nBEYOND.',
                            style: Theme.of(context).textTheme.displayLarge
                                ?.copyWith(
                                  color: Colors.white,
                                  fontSize: wide ? 76 : 50,
                                ),
                          ),
                          const SizedBox(height: 18),
                          const Text(
                            'The new Aero 01. Engineered for motion.',
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          const SizedBox(height: 30),
                          Wrap(
                            spacing: 12,
                            runSpacing: 12,
                            children: [
                              FilledButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, '/shop'),
                                child: const Text('SHOP NOW'),
                              ),
                              OutlinedButton(
                                onPressed: () => Navigator.pushNamed(
                                  context,
                                  '/product/aero-01',
                                ),
                                style: OutlinedButton.styleFrom(
                                  side: const BorderSide(color: Colors.white),
                                  foregroundColor: Colors.white,
                                ),
                                child: const Text('EXPLORE AERO'),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              wide ? 44 : 18,
              80,
              wide ? 44 : 18,
              90,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'FEATURED',
                      style: Theme.of(context).textTheme.headlineLarge,
                    ),
                    const Spacer(),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/shop'),
                      child: const Text('VIEW ALL  →'),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                if (app.loading)
                  const SizedBox(
                    height: 360,
                    child: Center(child: CircularProgressIndicator()),
                  )
                else if (app.error != null)
                  Text(app.error!)
                else
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: wide ? 4 : 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 28,
                      childAspectRatio: wide ? .72 : .58,
                    ),
                    itemCount: app.products.length,
                    itemBuilder: (_, i) =>
                        ProductCard(product: app.products[i]),
                  ),
              ],
            ),
          ),
          Container(
            height: wide ? 460 : 560,
            color: SolevaTheme.ink,
            padding: EdgeInsets.symmetric(horizontal: wide ? 44 : 24),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Align(
                  alignment: wide
                      ? Alignment.centerRight
                      : Alignment.bottomCenter,
                  child: SizedBox(
                    width: wide ? 640 : 420,
                    child: Image.network(
                      'https://images.unsplash.com/photo-1491553895911-0055eca6402d',
                      fit: BoxFit.cover,
                      errorBuilder: (_, __, ___) => const SizedBox(),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 420),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'THE MONO SERIES',
                          style: TextStyle(
                            color: SolevaTheme.lime,
                            letterSpacing: 2,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 14),
                        Text(
                          'LESS NOISE.\nMORE FORM.',
                          style: Theme.of(context).textTheme.headlineLarge
                              ?.copyWith(
                                color: Colors.white,
                                fontSize: wide ? 54 : 42,
                              ),
                        ),
                        const SizedBox(height: 18),
                        const Text(
                          'A study in restraint, designed around essential lines and honest materials.',
                          style: TextStyle(
                            color: Color(0xFFB8B8B2),
                            height: 1.6,
                          ),
                        ),
                        const SizedBox(height: 28),
                        FilledButton(
                          onPressed: () =>
                              Navigator.pushNamed(context, '/shop'),
                          style: FilledButton.styleFrom(
                            backgroundColor: SolevaTheme.orange,
                          ),
                          child: const Text('EXPLORE COLLECTION'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const _Newsletter(),
          const _Footer(),
        ],
      ),
    );
  }
}

class _Newsletter extends StatefulWidget {
  const _Newsletter();

  @override
  State<_Newsletter> createState() => _NewsletterState();
}

class _NewsletterState extends State<_Newsletter> {
  final controller = TextEditingController();
  String message = '';

  Future<void> subscribe() async {
    try {
      final created = await client.newsletter.subscribe(controller.text);
      setState(
        () => message = created
            ? 'YOU’RE ON THE LIST.'
            : 'THIS EMAIL IS ALREADY ON THE LIST.',
      );
    } catch (_) {
      setState(() => message = 'ENTER A VALID EMAIL ADDRESS.');
    }
  }

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
    color: SolevaTheme.orange,
    child: Column(
      children: [
        Text(
          'STAY IN MOTION',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(height: 10),
        const Text('New releases, field notes and members-only access.'),
        const SizedBox(height: 24),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  controller: controller,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'EMAIL ADDRESS',
                    border: OutlineInputBorder(borderSide: BorderSide.none),
                  ),
                ),
              ),
              FilledButton(
                onPressed: subscribe,
                child: const Text('SUBSCRIBE'),
              ),
            ],
          ),
        ),
        if (message.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Text(
              message,
              style: const TextStyle(fontWeight: FontWeight.w900),
            ),
          ),
      ],
    ),
  );
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) => Container(
    color: const Color(0xFF0B0B0B),
    padding: const EdgeInsets.all(44),
    child: const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'SOLEVA',
          style: TextStyle(
            color: Colors.white,
            fontSize: 28,
            fontWeight: FontWeight.w900,
          ),
        ),
        SizedBox(height: 18),
        Text(
          'Premium movement for everyday life.',
          style: TextStyle(color: Color(0xFF999995)),
        ),
      ],
    ),
  );
}
