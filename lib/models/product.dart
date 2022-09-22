import 'package:equatable/equatable.dart';

enum Category {
  any,
  uncategorized,
  premium,
  tamilnadu,
}

class Product extends Equatable {
  final String name;
  final int id;
  final int cost;
  final int availablity;
  final String details;
  final String category;
  final int quantity;

  const Product({
    required this.id,
    required this.name,
    required this.cost,
    required this.availablity,
    this.details = '',
    this.category = 'uncategorized',
    this.quantity = 1,
  });

  @override
  List<Object?> get props =>
      [id, name, cost, category, details, availablity, quantity];

  Map<String, dynamic> toJson() => {
        'p_name': name,
        'p_id': id,
        'p_cost': cost,
        'p_availability': availablity,
        'p_details': details,
        'p_category': category,
      };
}
