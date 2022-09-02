import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobileptsinarmas/feature/data/db/favorite.foods.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/detail/bloc/detail.event.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/detail/bloc/detail.state.dart';

class DetailBloc extends Bloc<DetailEvent, DetailState> {
  final AppDatabase _appDatabase;
  DetailBloc(this._appDatabase) : super(DetailInitial());

  void addFavorite(FavoriteFood foods) async {
    emit(DetailLoading());
    await _appDatabase.saveFavoriteFood(foods);
    //
  }
}
