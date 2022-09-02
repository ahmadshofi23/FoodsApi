import 'package:equatable/equatable.dart';
import 'package:flutter/widgets.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

abstract class FoodEvent extends Equatable {
  const FoodEvent();

  @override
  List<Foods> get props => [];
}

class GetFoodsList extends FoodEvent {}
