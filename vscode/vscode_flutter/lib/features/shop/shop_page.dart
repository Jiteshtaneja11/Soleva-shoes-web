import 'dart:async';

import 'package:flutter/material.dart';

import '../../app/app_scope.dart';
import '../../core/models.dart';
import '../../client.dart';
import '../../theme/soleva_theme.dart';
import '../../widgets/product_card.dart';
import '../../widgets/soleva_scaffold.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  List<UiProduct> products = [];
  bool loading = true;
  String? error;
  String search = '';
  String? gender;
  String? category;
  String? size;
  String? color;
  double maxPrice = 300;
  String sort = 'newest';
  int offset = 0;
  static const int pageSize = 24;
  Timer? debounce;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void dispose() {
    debounce?.cancel();
    super.dispose();
  }

  Future<void> load() async {
    setState(() {
      loading = true;
      error = null;
    });
    try {
      final rows = search.trim().isEmpty
          ? await client.product.getProductsWithFilters(
              category: category,
              gender: gender,
              size: size,
              color: color,
              maxPrice: maxPrice,
              sort: sort,
              offset: offset,
              limit: pageSize,
              featuredOnly: false,
              newOnly: false,
              bestSellerOnly: false,
            )
          : await client.product.getProductsWithFilters(
              query: search.trim(),
              category: category,
              gender: gender,
              size: size,
              color: color,
              maxPrice: maxPrice,
              sort: sort,
              offset: offset,
              limit: pageSize,
              featuredOnly: false,
              newOnly: false,
              bestSellerOnly: false,
            );
      if (!mounted) return;
      setState(() {
        products = rows.map(UiProduct.fromServer).toList();
        loading = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        error = e.toString();
        loading = false;
      });
    }
  }

  void setFilter(VoidCallback update) {
    offset = 0;
    update();
    load();
  }

  void scheduleSearch(String value) {
    debounce?.cancel();
    debounce = Timer(const Duration(milliseconds: 350), () {
      setFilter(() => search = value);
    });
  }

  @override
  Widget build(BuildContext context) {
    AppScope.of(context);
    final width = MediaQuery.sizeOf(context).width;
    final wide = width >= 900;
    final medium = width >= 620;
    final columns = wide ? 4 : (medium ? 3 : 2);

    return SolevaScaffold(
      child: ListView(
        padding: EdgeInsets.fromLTRB(wide ? 44 : 18, 54, wide ? 44 : 18, 80),
        children: [
          Container(
            constraints: const BoxConstraints(minHeight: 180),
            alignment: Alignment.bottomLeft,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'SOLEVA / 2026',
                  style: TextStyle(
                    fontSize: 11,
                    letterSpacing: 2,
                    fontWeight: FontWeight.w900,
                    color: SolevaTheme.orange,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'ALL SNEAKERS',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontSize: wide ? 58 : 42,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '${loading ? 'Loading' : products.length} products',
                  style: const TextStyle(color: SolevaTheme.muted),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Essential forms for movement in the city.',
                  style: TextStyle(color: SolevaTheme.muted),
                ),
              ],
            ),
          ),
          const SizedBox(height: 34),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 18),
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(color: Color(0x22111111)),
                bottom: BorderSide(color: Color(0x22111111)),
              ),
            ),
            child: Wrap(
              spacing: 8,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                SizedBox(
                  width: wide ? 280 : 220,
                  child: TextField(
                    onChanged: scheduleSearch,
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      hintText: 'Search collection',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                    ),
                  ),
                ),
                ChoiceChip(
                  label: const Text('MEN'),
                  selected: gender == 'Men',
                  onSelected: (selected) =>
                      setFilter(() => gender = selected ? 'Men' : null),
                ),
                ChoiceChip(
                  label: const Text('WOMEN'),
                  selected: gender == 'Women',
                  onSelected: (selected) =>
                      setFilter(() => gender = selected ? 'Women' : null),
                ),
                ChoiceChip(
                  label: const Text('RUNNING'),
                  selected: category == 'Running',
                  onSelected: (selected) =>
                      setFilter(() => category = selected ? 'Running' : null),
                ),
                ChoiceChip(
                  label: const Text('LIFESTYLE'),
                  selected: category == 'Lifestyle',
                  onSelected: (selected) => setFilter(
                    () => category = selected ? 'Lifestyle' : null,
                  ),
                ),
                _SizeFilter(
                  value: size,
                  onChanged: (value) => setFilter(() => size = value),
                ),
                _ColorFilter(
                  value: color,
                  onChanged: (value) => setFilter(() => color = value),
                ),
                SizedBox(
                  width: 180,
                  child: DropdownButtonFormField<double>(
                    initialValue: maxPrice,
                    decoration: const InputDecoration(
                      labelText: 'MAX PRICE',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                    ),
                    items: const [150, 200, 250, 300]
                        .map(
                          (value) => DropdownMenuItem(
                            value: value.toDouble(),
                            child: Text('Up to \$$value'),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setFilter(() => maxPrice = value ?? 300),
                  ),
                ),
                SizedBox(
                  width: 170,
                  child: DropdownButtonFormField<String>(
                    initialValue: sort,
                    decoration: const InputDecoration(
                      labelText: 'SORT',
                      filled: true,
                      fillColor: Colors.white,
                      isDense: true,
                    ),
                    items:
                        const [
                              ('newest', 'Newest'),
                              ('price-low', 'Price: Low'),
                              ('price-high', 'Price: High'),
                              ('rating', 'Rating'),
                              ('popular', 'Popular'),
                            ]
                            .map(
                              (item) => DropdownMenuItem(
                                value: item.$1,
                                child: Text(item.$2),
                              ),
                            )
                            .toList(),
                    onChanged: (value) =>
                        setFilter(() => sort = value ?? 'newest'),
                  ),
                ),
                if (gender != null ||
                    category != null ||
                    size != null ||
                    color != null ||
                    search.isNotEmpty ||
                    maxPrice < 300)
                  TextButton(
                    onPressed: () {
                      setState(() {
                        gender = null;
                        category = null;
                        size = null;
                        color = null;
                        search = '';
                        maxPrice = 300;
                        sort = 'newest';
                        offset = 0;
                      });
                      load();
                    },
                    child: const Text('CLEAR ALL'),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 30),
          if (loading)
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: wide ? 18 : 10,
                mainAxisSpacing: 26,
                childAspectRatio: wide ? .66 : .56,
              ),
              itemCount: columns * 2,
              itemBuilder: (_, __) => const _SkeletonCard(),
            )
          else if (error != null)
            _StatePanel(
              icon: Icons.cloud_off_outlined,
              title: 'Catalog unavailable',
              detail: 'Serverpod could not return the product list.',
              action: 'RETRY',
              onAction: load,
            )
          else if (products.isEmpty)
            const _StatePanel(
              icon: Icons.search_off_outlined,
              title: 'No sneakers found',
              detail: 'Try clearing a filter or searching for another name.',
            )
          else
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: columns,
                crossAxisSpacing: wide ? 18 : 10,
                mainAxisSpacing: 26,
                childAspectRatio: wide ? .66 : .56,
              ),
              itemCount: products.length,
              itemBuilder: (_, index) => ProductCard(product: products[index]),
            ),
          if (!loading && error == null && products.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 36),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OutlinedButton(
                    onPressed: offset == 0
                        ? null
                        : () {
                            setState(
                              () =>
                                  offset = (offset - pageSize).clamp(0, 100000),
                            );
                            load();
                          },
                    child: const Text('PREVIOUS'),
                  ),
                  const SizedBox(width: 12),
                  OutlinedButton(
                    onPressed: products.length < pageSize
                        ? null
                        : () {
                            setState(() => offset += pageSize);
                            load();
                          },
                    child: const Text('NEXT'),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _SizeFilter extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  const _SizeFilter({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 150,
    child: DropdownButtonFormField<String>(
      initialValue: value,
      decoration: const InputDecoration(
        labelText: 'SIZE',
        filled: true,
        fillColor: Colors.white,
        isDense: true,
      ),
      items: const ['5', '6', '7', '8', '9', '10', '11', '12']
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    ),
  );
}

class _ColorFilter extends StatelessWidget {
  final String? value;
  final ValueChanged<String?> onChanged;
  const _ColorFilter({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 150,
    child: DropdownButtonFormField<String>(
      initialValue: value,
      decoration: const InputDecoration(
        labelText: 'COLOR',
        filled: true,
        fillColor: Colors.white,
        isDense: true,
      ),
      items: const ['Black', 'White', 'Orange', 'Silver', 'Blue', 'Grey']
          .map((item) => DropdownMenuItem(value: item, child: Text(item)))
          .toList(),
      onChanged: onChanged,
    ),
  );
}

class _SkeletonCard extends StatelessWidget {
  const _SkeletonCard();

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Expanded(child: Container(color: const Color(0xFFE8E5DD))),
      const SizedBox(height: 12),
      Container(width: 70, height: 9, color: const Color(0xFFE8E5DD)),
      const SizedBox(height: 8),
      Container(width: 130, height: 16, color: const Color(0xFFE8E5DD)),
    ],
  );
}

class _StatePanel extends StatelessWidget {
  final IconData icon;
  final String title;
  final String detail;
  final String? action;
  final VoidCallback? onAction;
  const _StatePanel({
    required this.icon,
    required this.title,
    required this.detail,
    this.action,
    this.onAction,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
    height: 380,
    child: Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 52, color: SolevaTheme.muted),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 8),
          Text(detail, style: const TextStyle(color: SolevaTheme.muted)),
          if (action != null) ...[
            const SizedBox(height: 20),
            FilledButton(onPressed: onAction, child: Text(action!)),
          ],
        ],
      ),
    ),
  );
}
