import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/model/product_model.dart';

import 'widgets/product_card_widget.dart';

class ProductsPage extends ConsumerWidget {
  final String title;
  final List<ProductModel> products;
  const ProductsPage({super.key, required this.title, required this.products});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final titleList = title.split(' ');
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text(
            "${titleList.first[0].toUpperCase()}${titleList.first.substring(1)} ${titleList.last[0].toUpperCase()}${titleList.last.substring(1)}"),
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: products.length,
        controller: PageController(viewportFraction: 0.8),
        onPageChanged: (value) {
          ref.read(pageProvider.notifier).state = value;
        },
        itemBuilder: (context, index) => ProductCard(product: products[index]),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 25, top: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            for (var i = 0; i < products.length; i++)
              AnimatedContainer(
                width: ref.watch(pageProvider) == i ? 16 : 8,
                height: ref.watch(pageProvider) == i ? 12 : 8,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: ref.watch(pageProvider) == i
                      ? Colors.teal
                      : Colors.grey[300],
                ),
                duration: const Duration(milliseconds: 300),
              ),
          ],
        ),
      ),
    );
  }
}

final pageProvider = StateProvider<int>((ref) {
  return 0;
});
