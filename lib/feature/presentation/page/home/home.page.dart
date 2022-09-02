import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testmobileptsinarmas/feature/data/models/foods.mode.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/bloc/food.bloc.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/bloc/food.event.dart';
import 'package:testmobileptsinarmas/feature/presentation/page/home/bloc/food.state.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FoodBloc _foodsBloc = FoodBloc();

  @override
  void initState() {
    _foodsBloc.add(GetFoodsList());
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
          'List Foods',
          style: TextStyle(
            fontSize: screenWidth * 0.06,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: BlocProvider(
          create: (contex) => _foodsBloc,
          child: BlocListener<FoodBloc, FoodState>(
            listener: (context, state) {
              if (state is FoodsError) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("data"),
                  ),
                );
              }
            },
            child: BlocBuilder<FoodBloc, FoodState>(
              builder: (context, state) {
                if (state is FoodInitial) {
                  return _buildLoading();
                } else if (state is FoodLoading) {
                  return _buildLoading();
                } else if (state is FoodLoaded) {
                  return GridView.builder(
                    itemCount: state.foods.categories!.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300,
                      childAspectRatio: 3 / 3.8,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          print(state.foods.categories![index]);
                          Modular.to.pushNamed('/detail',
                              arguments: state.foods.categories![index]);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.03,
                              vertical: screenHeight * 0.02),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: const [
                                BoxShadow(
                                  color: Colors.grey,
                                  blurRadius: 1,
                                  spreadRadius: 1,
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.02),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Spacer(),
                                  Image.network(
                                    state.foods.categories![index]
                                        .strCategoryThumb!,
                                  ),
                                  const Spacer(),
                                  Text(
                                    state.foods.categories![index].strCategory!,
                                    style: TextStyle(
                                      fontSize: screenWidth * 0.05,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "\$10.00",
                                        style: TextStyle(
                                          fontSize: screenWidth * 0.04,
                                          fontWeight: FontWeight.w600,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          primary: Colors.redAccent,
                                        ),
                                        onPressed: () {},
                                        child: Text(
                                          "ADD",
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: screenHeight * 0.01),
                                ],
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is FoodsError) {
                  return Container();
                } else {
                  return Container();
                }
              },
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.redAccent,
        onPressed: () {
          Modular.to.pushNamed('/favorite');
        },
        child: const Icon(
          Icons.forward_10_outlined,
          color: Colors.white,
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
