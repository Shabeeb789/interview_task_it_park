import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:interview_task_trissur/controller/authentication/authentication_provider.dart';
import 'package:interview_task_trissur/utils/responsive.dart';
import 'package:interview_task_trissur/view/products_page.dart';
import 'package:interview_task_trissur/view/widgets/error_dialogue.dart';
import 'package:interview_task_trissur/view/widgets/togglebutton.dart';
import 'package:interview_task_trissur/view/widgets/update_user_dialogue_widget.dart';

import '../controller/products/products_provider.dart';
import '../model/product_model.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({super.key});

  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final getProduct = ref.watch(productsProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Home Screen"),
        centerTitle: true,
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (context) => UpdateUserDialogue(
                      formKey: _formKey,
                      name: _name,
                      password: _password,
                    ),
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.update,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "Update User",
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () async {
                  bool isDeleted = await ref
                      .read(authenticationProvider.notifier)
                      .deleteUser();
                  if (context.mounted) {
                    if (isDeleted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ToggleButton(),
                        ),
                        (route) => false,
                      );
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => const ErrorDialogue(
                            errorText: "Can't delete user, please try again"),
                      );
                    }
                  }
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.delete,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "Delete User",
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
              PopupMenuItem(
                onTap: () {
                  ref.read(authenticationProvider.notifier).logoutUser();
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ToggleButton(),
                    ),
                    (route) => false,
                  );
                },
                child: const ListTile(
                  leading: Icon(
                    Icons.logout,
                    color: Colors.teal,
                  ),
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
      body: SingleChildScrollView(
        child: getProduct.when(
          data: (data) {
            final filteredMap = categoryFilter(data);
            return GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Card(
                      color: Colors.teal[100],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      shadowColor: Colors.teal[300],
                      child: SizedBox(
                        width: double.infinity,
                        height: Responsive.height(100, context),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Message",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            ref.watch(getProtectedMessageProvider).when(
                              data: (data) {
                                return Text(
                                  data!,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              loading: () {
                                return const Text(
                                  "...",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                );
                              },
                              error: (Object error, StackTrace stackTrace) {
                                return GestureDetector(
                                  onTap: () {
                                    ref.invalidate(getProtectedMessageProvider);
                                  },
                                  child: const Text(
                                    "An Error Occured",
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white,
                                    ),
                                  ),
                                );
                              },
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: Responsive.height(20, context)),
                    GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                      ),
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: [
                        for (var category in filteredMap.entries)
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ProductsPage(
                                      title: category.key,
                                      products: category.value,
                                    ),
                                  ));
                            },
                            borderRadius: BorderRadius.circular(15),
                            splashColor: Colors.white54,
                            highlightColor: Colors.transparent,
                            child: Ink(
                              decoration: BoxDecoration(
                                color: Colors.teal[100],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Center(
                                child: Text(
                                  category.key.toUpperCase(),
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          error: (error, stackTrace) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("something went wrong"),
                Text("$error \n $stackTrace"),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.refresh),
                )
              ],
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  Map<String, List<ProductModel>> categoryFilter(List<ProductModel> products) {
    Map<String, List<ProductModel>> fileteredMap = {};
    // looping to get each products from product list
    for (ProductModel product in products) {
      // this condition is to add a new key-value pair if the category is not in the map
      // this condition is crutial for filetering
      if (!fileteredMap.containsKey(product.category)) {
        fileteredMap[product.category] = [];
      }
      // after adding the entry to map we add each products to the corresponding list
      fileteredMap[product.category]!.add(product);
    }
    return fileteredMap;
  }
}
