import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:movies/screens/componentScreen/useable_items.dart';
import 'package:movies/screens/cubitScreen/cubit.dart';
import 'package:movies/screens/cubitScreen/states.dart';

class MovieScreen extends StatelessWidget {
  const MovieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MovieAppCubit, MovieAppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var c = MovieAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('Movies'),
          ),
          body: c.movieModel == null
              ? Center(child: Lottie.asset('assets/98432-loading.json'))
              : Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      c.genr != null
                          ? Container(
                              height: 35,
                              child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) =>
                                      buildCategoryItem(
                                          context, c.genr!.genres![index]),
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                        width: 15,
                                      ),
                                  itemCount: c.genr!.genres!.length),
                            )
                          : const LinearProgressIndicator(),
                      const SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              return buildMovieItme(
                                  context, c.movieModel!.results![index]);
                            },
                            separatorBuilder: (context, index) =>
                                const SizedBox(
                                  height: 20,
                                ),
                            itemCount: c.movieModel!.results!.length),
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}
