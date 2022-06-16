import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/screens/cubitScreen/bloc_observer.dart';
import 'package:movies/screens/cubitScreen/cubit.dart';
import 'package:movies/screens/cubitScreen/states.dart';
import 'package:movies/screens/dioScreen/dio.dart';
import 'package:movies/screens/movies/movie_list.dart';

void main() {
  DioHelper.dioGet();
  BlocOverrides.runZoned(() {
    runApp(const MovieApp());
  }, blocObserver: MyBlocObserver());
}

class MovieApp extends StatelessWidget {
  const MovieApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: ((context) => MovieAppCubit()
        ..getMovieList()
        ..getGeners()),
      child: BlocConsumer<MovieAppCubit, MovieAppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              home: MovieScreen(),
            );
          }),
    );
  }
}
