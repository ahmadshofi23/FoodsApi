import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobileptsinarmas/feature/data/db/favorite.foods.dart';
import 'package:testmobileptsinarmas/feature/data/repositories_impl/Api.Repository.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/bloc/favorite.event.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/bloc/favorite.state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final AppDatabase _appDatabase = AppDatabase();
  FavoriteBloc() : super(FavoriteInitial()) {
    on<GetFavoriteFoods>((event, emit) async {
      try {
        emit(FavoriteLoading());
        final listFavorite = await _appDatabase.getFavoriteFoods();
        emit(FavoriteLoaded(listFavorite));
      } on NetworkError {
        emit(FavoriteError(""));
      }
    });
  }

  void deleteFavorite(FavoriteFood foods) async {
    // emit(FavoriteLoading());
    await _appDatabase.deleteFavoriteFood(foods);
    final listFavorite = await _appDatabase.getFavoriteFoods();
    emit(FavoriteLoaded(listFavorite));
    //
  }
}
