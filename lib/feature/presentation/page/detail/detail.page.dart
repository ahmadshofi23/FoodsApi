import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testmobileptsinarmas/feature/data/db/favorite.foods.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/detail/bloc/detail.bloc.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/detail/bloc/detail.state.dart';

import 'bloc/detail.event.dart';

class DetailFood extends StatefulWidget {
  const DetailFood({Key? key}) : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  final _detailBloc = DetailBloc(AppDatabase());

  @override
  Widget build(BuildContext context) {
    Categories _categories = Modular.args.data;
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Detail Foods",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: screenHeight * 0.02),
            Center(
                child: Image.network(
              _categories.strCategoryThumb!,
              height: screenHeight * 0.26,
            )),
            SizedBox(height: screenHeight * 0.02),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 2,
                        spreadRadius: 1,
                      ),
                    ],
                    color: Colors.redAccent,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * 0.03,
                      vertical: screenHeight * 0.02),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            _categories.strCategory!,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: screenWidth * 0.1,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          BlocBuilder<DetailBloc, DetailState>(
                            bloc: _detailBloc,
                            builder: (context, state) {
                              return InkWell(
                                onTap: () {
                                  // if (kDebugMode) {
                                  //   print("Add to cart");
                                  // }
                                  _detailBloc.addFavorite(FavoriteFood(
                                      idCategory: _categories.idCategory,
                                      strCategory: _categories.strCategory,
                                      strCategoryDescription:
                                          _categories.strCategoryDescription,
                                      strCategoryThumb:
                                          _categories.strCategoryThumb));
                                },
                                child: Container(
                                  width: screenWidth * 0.15,
                                  height: screenHeight * 0.09,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: screenHeight * 0.02),
                                    child: Center(
                                        child: Image.asset(
                                            "assets/images/heart.png")),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Flexible(
                        child: Text(
                          _categories.strCategoryDescription!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: screenWidth * 0.04,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
