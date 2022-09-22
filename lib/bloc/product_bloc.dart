import 'dart:convert';
import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopingkart/models/models.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductFetched>(_onProductFetched);
    on<ProductFiltered>(_onProductFiltered);
  }

  Future<void> _onProductFetched(
      ProductEvent event, Emitter<ProductState> emit) async {
    try {
      if (state.status == ProductStatus.initial) {
        final products = await _fetchProducts();

        return emit(
          state.copyWith(
            status: ProductStatus.success,
            products: products,
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
        ),
      );
    }
  }

  Future<void> _onProductFiltered(
      ProductFiltered event, Emitter<ProductState> emit) async {
    log('filtering event');
    try {
      if (event.category == Category.any) {
        final products = await _fetchProducts();
        return emit(
          state.copyWith(
            products: products,
            status: ProductStatus.success,
          ),
        );
      } else if (event.category == Category.premium) {
        final products = await _fetchProducts();
        final filteredProducts = <Product>[];
        for (Product product in products) {
          if (product.category == 'Premium') {
            filteredProducts.add(product);
          }
        }
        return emit(
          state.copyWith(
            products: filteredProducts,
            status: ProductStatus.success,
          ),
        );
      } else if (event.category == Category.tamilnadu) {
        final products = await _fetchProducts();
        final filteredProducts = <Product>[];
        for (Product product in products) {
          if (product.category == 'Tamilnadu') {
            filteredProducts.add(product);
          }
        }
        return emit(
          state.copyWith(
            products: filteredProducts,
            status: ProductStatus.success,
          ),
        );
      } else {
        final products = await _fetchProducts();
        final filteredProducts = <Product>[];
        for (Product product in products) {
          if (product.category == 'uncategorized') {
            filteredProducts.add(product);
          }
        }
        return emit(
          state.copyWith(
            products: filteredProducts,
            status: ProductStatus.success,
          ),
        );
      }
    } catch (_) {
      emit(
        state.copyWith(
          status: ProductStatus.failure,
        ),
      );
    }
  }

  Future<List<Product>> _fetchProducts() async {
    try {
      final response = await rootBundle.loadString('assets/db.json');
      if (response.isNotEmpty) {
        final data = json.decode(response) as List;

        return data.map((dynamic json) {
          final item = json as Map<String, dynamic>;

          final details = item['p_details'];
          final category = item['p_category'];

          return details != null && category != null
              ? Product(
                  id: item['p_id'] as int,
                  name: item['p_name'] as String,
                  cost: item['p_cost'] as int,
                  availablity: item['p_availability'] as int,
                  details: details as String,
                  category: category as String,
                )
              : details == null && category != null
                  ? Product(
                      id: item['p_id'] as int,
                      name: item['p_name'] as String,
                      cost: item['p_cost'] as int,
                      availablity: item['p_availability'] as int,
                      category: category as String,
                    )
                  : details != null && category == null
                      ? Product(
                          id: item['p_id'] as int,
                          name: item['p_name'] as String,
                          cost: item['p_cost'] as int,
                          availablity: item['p_availability'] as int,
                          details: details as String,
                        )
                      : Product(
                          id: item['p_id'] as int,
                          name: item['p_name'] as String,
                          cost: item['p_cost'] as int,
                          availablity: item['p_availability'] as int,
                        );
        }).toList();
      }
    } catch (err) {
      log(err.toString());
      throw Exception('error fetching');
    }
    throw Exception('error fetching');
  }
}
