import 'package:flutter/material.dart';

class RatingGenreRow extends StatelessWidget {
  final String rating;
  final String genre;

  const RatingGenreRow({super.key, required this.rating, required this.genre});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Rating'),
        ),
        const Icon(
          Icons.star,
          color: Colors.yellow,
          size: 14,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            rating,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Genre'),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            ':  $genre',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ],
    );
  }
}
