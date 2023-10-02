import 'package:dgto_test/core/model/movie_detail.dart';
import 'package:dgto_test/feature/movie/movie_detail_bloc.dart';
import 'package:dgto_test/feature/movie/movie_detail_state.dart';
import 'package:dgto_test/feature/widget/rating_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MovieDetailScreen extends StatefulWidget {
  final String id;
  const MovieDetailScreen({super.key, required this.id});

  @override
  State<MovieDetailScreen> createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  @override
  void initState() {
    super.initState();

    context.read<MovieBloc>().fetchMovieById(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    final state = context.watch<MovieBloc>().state;

    if (state.isLoading!) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          state.movie!.title.toString(),
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Builder(builder: (context) {
        String? videoId;
        videoId = YoutubePlayer.convertUrlToId(state.movie!.trailer.toString());
        final YoutubePlayerController controller = YoutubePlayerController(
          initialVideoId: videoId.toString(),
        );
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '${state.movie!.title} (${state.movie!.year.toString()})',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            YoutubePlayer(
              controller: controller,
              liveUIColor: Colors.amber,
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text('Description'),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.movie!.description,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Divider(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Director'),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                state.movie!.director.toString(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                RatingGenreRow(
                  rating: state.movie!.rating,
                  genre: state.movie!.genre.toString(),
                ),
              ],
            )
          ],
        );
      }),
    );
  }
}
