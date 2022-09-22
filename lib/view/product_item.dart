import 'package:flutter/material.dart';
import 'package:shopingkart/models/models.dart';

class ProductItemWidget extends StatelessWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 260,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          color: Colors.cyan.shade100,
          shadowColor: Colors.brown,
          elevation: 1.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    'assets/${product.name.toLowerCase()}.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.fitWidth,
                  ),
                  const Divider(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const SizedBox(
                        height: 40,
                        width: 35,
                        child: Card(
                            child: Icon(
                          Icons.remove,
                          size: 15,
                        )),
                      ),
                      SizedBox(
                        height: 40,
                        width: 50,
                        child: Card(
                          child: Center(
                            child: Text(
                              product.quantity.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                        width: 35,
                        child: Card(
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      const Divider(
                        height: 8,
                      ),
                      Text(
                        '₹${product.cost}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.details,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Divider(
                        height: 4,
                      ),
                      Text(
                        'Stock: ${product.availablity.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Divider(
                        height: 4,
                      ),
                      Text(
                        product.category,
                        style: const TextStyle(fontSize: 20),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
