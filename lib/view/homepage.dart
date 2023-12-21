import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/controller/apiservice.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProduct = ref.watch(productProvider);

    return Scaffold(
      body: getProduct.when(
        data: (data) => Column(
          children: [
            SizedBox(
              height: 700,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  width: 400,
                  decoration: const BoxDecoration(color: Colors.amber),
                  child: Text(data[index].price.toString()),
                ),
              ),
            )
          ],
        ),
        error: (error, stackTrace) => const Text("something went wrong"),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
