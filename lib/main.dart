import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingkart/bloc/product_bloc.dart';
import 'package:shopingkart/view/product_list.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter Demo',
    theme: ThemeData(
      primarySwatch: Colors.cyan,
    ),
    home: const HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ProductBloc()
        ..add(
          ProductFetched(),
        ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Shopkart'),
        ),
        body: const ProductList(),
      ),
    );
  }
}
