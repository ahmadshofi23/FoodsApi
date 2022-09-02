import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';

abstract class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

class DetailInitial extends DetailState {}

class DetailLoading extends DetailState {}

class DetailSucces extends DetailState {}

class SaveFavoriteFood extends DetailState {}
// class AddBookMark extends DetailState {
//   final Categories categories;
//   const AddBookMark(this.categories);
// }

class DetailError extends DetailState {
  final String? message;
  const DetailError(this.message);
}
