part of 'product_bloc.dart';

enum ProductStatus {
  initial,
  success,
  failure,
}

class ProductState extends Equatable {
  const ProductState({
    this.status = ProductStatus.initial,
    this.products = const <Product>[],
    this.filteredProducts = const <Product>[],
  });

  final List<Product> products;
  final ProductStatus status;
  final List<Product> filteredProducts;

  @override
  List<Object> get props => [status, products];

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
    );
  }

  @override
  String toString() {
    return '''ProductState { status: $status, products: ${products.length} }''';
  }
}

class ProductInitial extends ProductState {
  @override
  List<Object> get props => [];
}
