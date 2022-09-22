part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class ProductFetched extends ProductEvent {}

class ProductFiltered extends ProductEvent {
  final Category category;

  const ProductFiltered({required this.category});
  @override
  List<Object> get props => [category];
}
