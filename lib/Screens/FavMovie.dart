import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:provider/provider.dart';

import '../Providers/MovieProvider.dart';

class FavMoviee extends StatelessWidget {
  const FavMoviee({super.key});

  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().mylist;

    return Scaffold(
      body: ListView.builder(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          final currentmovietitle = movies[index];
          return Card(
            key: ValueKey(currentmovietitle.title),
            child: ListTile(
              title: Text(currentmovietitle.title),
              subtitle: Text(currentmovietitle.duration),
              leading: GestureDetector(
                  onTap: () {
                    context.read<MovieProvider>().removeefav(currentmovietitle);
                  },
                  child: Icon(Icons.remove, color: Colors.red)),
            ),
          );
        },
      ),
    );
  }
}
