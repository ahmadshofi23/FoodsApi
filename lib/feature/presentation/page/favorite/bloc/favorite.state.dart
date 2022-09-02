import 'package:equatable/equatable.dart';
import 'package:testmobileptsinarmas/feature/data/db/favorite.foods.dart';

abstract class FavoriteState extends Equatable {
  const FavoriteState();
  @override
  List<Object> get props => [];
}

class FavoriteInitial extends FavoriteState {}

class FavoriteLoading extends FavoriteState {}

class FavoriteLoaded extends FavoriteState {
  final List<FavoriteFood> favoriteFoods;
  const FavoriteLoaded(this.favoriteFoods);
}

class FavoriteError extends FavoriteState {
  final String? message;
  const FavoriteError(this.message);
}
