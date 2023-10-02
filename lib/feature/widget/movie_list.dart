import 'package:dgto_test/feature/home/home_bloc.dart';
import 'package:dgto_test/feature/home/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MovieList extends StatelessWidget {
  const MovieList({
    super.key,
    required this.state,
  });

  final HomeState state;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
              height: MediaQuery.of(context).size.height * 0.55,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: state.movie!.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _onItemTapped(context, state.movie![index].id);
                    },
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.50,
                      child: Card(
                        color: Colors.transparent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 4,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ClipRRect(
                              child: Image.network(
                                state.movie![index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              state.movie![index].title,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            Wrap(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.yellow,
                                  size: 14,
                                ),
                                Text(
                                  state.movie![index].rating,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                IconButton(
                                    icon: Icon(
                                      state.movie![index].isFavorite!
                                          ? Icons.favorite
                                          : Icons.favorite_border,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      context
                                          .read<HomeBloc>()
                                          .toggleSaved(state.movie![index].id);
                                    }),
                                Text(
                                  'Saved',
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ],
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
    );
  }
}

void _onItemTapped(BuildContext context, String id) {
  context.go('/home/movie/$id');
}
