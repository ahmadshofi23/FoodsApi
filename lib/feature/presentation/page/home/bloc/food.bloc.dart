import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';
import 'package:testmobileptsinarmas/feature/data/repositories_impl/Api.Repository.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/bloc/food.event.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/bloc/food.state.dart';

class FoodBloc extends Bloc<FoodEvent, FoodState> {
  FoodBloc() : super(FoodInitial()) {
    final ApiRepository _apiRepository = ApiRepository();
    on<GetFoodsList>((event, emit) async {
      try {
        emit(FoodLoading());
        final listFood = await _apiRepository.fetchFoodList();
        emit(FoodLoaded(listFood));
      } on NetworkError {
        emit(FoodsError(""));
      }
    });
  }
}
