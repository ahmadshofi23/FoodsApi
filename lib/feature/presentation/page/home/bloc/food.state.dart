import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

abstract class FoodState extends Equatable {
  const FoodState();

  @override
  List<Foods> get props => [];
}

class FoodLoading extends FoodState {}

class FoodInitial extends FoodState {}

class FoodLoaded extends FoodState {
  final Foods foods;
  const FoodLoaded(this.foods);
}

class FoodsError extends FoodState {
  final String? message;
  const FoodsError(this.message);
}
