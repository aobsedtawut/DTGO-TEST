import 'package:dgto_test/feature/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final homeCubit = context.watch<HomeBloc>();
    final favoriteProducts = homeCubit.state.favoriteMovies;

    return Scaffold(
      appBar: AppBar(
        title: Text('Saved', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: favoriteProducts?.length ?? 0,
          itemBuilder: (context, index) {
            final product = favoriteProducts![index];
            return Container(
              margin: EdgeInsets.only(bottom: 10),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: ClipRRect(
                  child: Stack(
                    children: [
                      Image.network(
                        product.image.toString(),
                        width: double.infinity,
                        scale: 1.0,
                        fit: BoxFit.cover,
                      ),
                      Positioned.fill(
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.9)
                          ])),
                        ),
                      ),
                      Positioned(
                          top: 20,
                          left: 25,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.deepPurpleAccent,
                                        fontSize: 30),
                              ),
                            ],
                          ))
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
