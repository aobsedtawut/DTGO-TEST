import 'package:dgto_test/common/constant.dart';
import 'package:dgto_test/core/model/movie.dart';
import 'package:dgto_test/feature/home/home_bloc.dart';
import 'package:dgto_test/feature/home/home_state.dart';
import 'package:dgto_test/feature/movie/movie_detail_bloc.dart';
import 'package:dgto_test/feature/widget/movie_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();

    context.read<HomeBloc>().fetchMovie();
    context.read<HomeBloc>().fetchMovieInComing();
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeBloc>().state;
    final isLoadingMovie = state.isLoading;
    Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'IMDb',
          style: TextStyle(color: Colors.yellowAccent),
        ),
      ),
      body: Visibility(
        visible: !isLoadingMovie!,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
                child: Text(
                  'Top 100 Movie ...',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            MovieList(state: state),
            SliverToBoxAdapter(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 2.0, horizontal: 24),
                child: Text(
                  'New Movie Up Coming ...',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
            ),
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                return Visibility(
                  visible: !isLoadingMovie,
                  child: SliverToBoxAdapter(
                    child: SingleChildScrollView(
                      physics: const ScrollPhysics(),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 24.0),
                            height: MediaQuery.of(context).size.height * 0.32,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: state.movieIncoming!.length,
                              itemBuilder: (context, index) {
                                return InkWell(
                                  onTap: () {},
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    child: AspectRatio(
                                      aspectRatio: 16 / 9,
                                      child: ClipRRect(
                                        child: Stack(
                                          children: [
                                            Image.network(
                                              Constant.imagePath +
                                                  state.movieIncoming![index]
                                                      .backdropPath
                                                      .toString(),
                                              width: double.infinity,
                                              scale: 1.0,
                                              fit: BoxFit.cover,
                                            ),
                                            Positioned.fill(
                                              child: DecoratedBox(
                                                decoration: BoxDecoration(
                                                    gradient:
                                                        LinearGradient(colors: [
                                                  Colors.transparent,
                                                  Colors.black.withOpacity(0.9)
                                                ])),
                                              ),
                                            ),
                                            Positioned(
                                                left: 20,
                                                bottom: 20,
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.min,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      state
                                                          .movieIncoming![index]
                                                          .title,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                    Text(
                                                      'Release: ${state.movieIncoming![index].releaseDate}',
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .titleMedium,
                                                    ),
                                                  ],
                                                ))
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
