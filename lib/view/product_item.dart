import 'package:flutter/material.dart';
import 'package:shopingkart/models/models.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/product_bloc.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({super.key, required this.product});
  final Product product;

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
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
                    'assets/${widget.product.name.toLowerCase()}.png',
                    height: 150,
                    width: 150,
                    fit: BoxFit.fitWidth,
                  ),
                  const Divider(
                    height: 15,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (widget.product.quantity > 1) {
                              widget.product.decreaseQuantiy();
                              context
                                  .read<ProductBloc>()
                                  .add(ProductUpdated(product: widget.product));
                            }
                          });
                        },
                        child: const SizedBox(
                          height: 40,
                          width: 35,
                          child: Card(
                              child: Icon(
                            Icons.remove,
                            size: 15,
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 40,
                        width: 50,
                        child: Card(
                          child: Center(
                            child: Text(
                              widget.product.quantity.toString(),
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            widget.product.increaseQuantiy();
                            context
                                .read<ProductBloc>()
                                .add(ProductUpdated(product: widget.product));
                          });
                        },
                        child: const SizedBox(
                          height: 40,
                          width: 35,
                          child: Card(
                            child: Icon(
                              Icons.add,
                              size: 15,
                            ),
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
                        widget.product.name,
                        style: const TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w400),
                      ),
                      const Divider(
                        height: 8,
                      ),
                      Text(
                        '₹${widget.product.cost}',
                        style: const TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.details,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Divider(
                        height: 4,
                      ),
                      Text(
                        'Stock: ${widget.product.availablity.toString()}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const Divider(
                        height: 4,
                      ),
                      Text(
                        widget.product.category,
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
