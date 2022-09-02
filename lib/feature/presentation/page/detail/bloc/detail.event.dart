import 'package:equatable/equatable.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

abstract class DetailEvent extends Equatable {
  const DetailEvent();

  @override
  List<Object> get props => [];
}

class AddProduct extends DetailEvent {
  final Categories categories;
  const AddProduct(this.categories);
}
