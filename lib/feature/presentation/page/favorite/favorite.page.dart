import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/bloc/favorite.bloc.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/bloc/favorite.event.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/favorite/bloc/favorite.state.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  final FavoriteBloc _favoriteBloc = FavoriteBloc();

  @override
  void initState() {
    // TODO: implement initState
    _favoriteBloc.add(GetFavoriteFoods());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text(
          "Favorite Foods",
          style: TextStyle(
            fontSize: MediaQuery.of(context).size.width * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: BlocProvider(
        create: (context) => _favoriteBloc,
        child: BlocListener<FavoriteBloc, FavoriteState>(
          listener: (context, state) {
            if (state is FavoriteError) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("data"),
                ),
              );
            }
          },
          child: BlocBuilder<FavoriteBloc, FavoriteState>(
            builder: (context, state) {
              if (state is FavoriteInitial) {
                return _buildLoading();
              } else if (state is FavoriteLoading) {
                return _buildLoading();
              } else if (state is FavoriteLoaded) {
                if (state.favoriteFoods.isEmpty) {
                  return Center(child: Text("Data Masih Kosong"));
                }

                return ListView.builder(
                  itemCount: state.favoriteFoods.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(screenHeight * 0.02),
                      width: double.infinity,
                      height: screenHeight * 0.3,
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              state.favoriteFoods[index].strCategoryThumb!,
                              fit: BoxFit.cover,
                              height: screenHeight * 0.3,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15)),
                            width: double.infinity,
                          ),
                          Positioned(
                            right: screenWidth * 0.02,
                            bottom: screenHeight * 0.01,
                            child: Text(
                              state.favoriteFoods[index].strCategory!,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: screenHeight * 0.05,
                              ),
                            ),
                          ),
                          Positioned(
                            right: screenWidth * 0.02,
                            top: screenHeight * 0.01,
                            child: IconButton(
                                onPressed: () {
                                  _favoriteBloc.deleteFavorite(
                                      state.favoriteFoods[index]);
                                },
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                  size: screenHeight * 0.06,
                                )),
                          )
                        ],
                      ),
                    );
                  },
                );
              } else if (state is FavoriteError) {
                return Container();
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLoading() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}
