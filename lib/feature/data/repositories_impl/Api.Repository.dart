import 'package:testmobileptsinarmas/feature/data/datasource/Api.Service.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<Foods> fetchFoodList() => _provider.fetchFoodList();
}

class NetworkError extends Error {}
