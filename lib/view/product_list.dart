import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingkart/bloc/product_bloc.dart';
import 'package:shopingkart/models/models.dart';
import 'package:shopingkart/view/product_item.dart';

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  Category dropdownValue = Category.any;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(builder: (context, state) {
      switch (state.status) {
        case ProductStatus.success:
          if (state.products.isEmpty) {
            return const Text('No products');
          }
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: SizedBox(
                              height: 200,
                              child: Center(
                                child: Text(
                                  state.products.toString(),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange.shade300,
                    ),
                    child: Text(
                      'Proceed to Buy ${state.products.length} items',
                      style: const TextStyle(
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1,
                          fontSize: 15),
                    ),
                  ),
                  DropdownButton(
                    value: dropdownValue,
                    hint: const Text('Filter'),
                    items: const [
                      DropdownMenuItem(
                        value: Category.any,
                        child: Text('All'),
                      ),
                      DropdownMenuItem(
                        value: Category.premium,
                        child: Text('Premium'),
                      ),
                      DropdownMenuItem(
                        value: Category.tamilnadu,
                        child: Text('Tamilnadu'),
                      ),
                      DropdownMenuItem(
                        value: Category.uncategorized,
                        child: Text('Uncategorized'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        dropdownValue = value!;
                      });
                      if (value == Category.any) {
                        return;
                      }
                    },
                    icon: const Icon(Icons.arrow_drop_down),
                  ),
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ProductItemWidget(
                      product: state.products[index],
                    );
                  },
                  itemCount: state.products.length,
                ),
              ),
            ],
          );

        case ProductStatus.failure:
          return const Center(
            child: Text('Failed to fetch products'),
          );

        default:
          return const CircularProgressIndicator();
      }
    });
  }
}
