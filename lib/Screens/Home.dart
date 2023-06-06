import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yoga/Providers/MovieProvider.dart';
import 'package:yoga/Screens/FavMovie.dart';

class HomePagee extends StatelessWidget {
  const HomePagee({super.key});

  @override
  Widget build(BuildContext context) {
    var movies = context.watch<MovieProvider>().movies;
    var mylist = context.watch<MovieProvider>().mylist;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => FavMoviee(),
                      ));
                },
                child: Card(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("GO to fav ${mylist.length}"),
                  ),
                ),
              ),
              Expanded(
                  child: ListView.builder(
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
                            if (!mylist.contains(currentmovietitle)) {
                              context
                                  .read<MovieProvider>()
                                  .addfav(currentmovietitle);
                            } else {
                              context
                                  .read<MovieProvider>()
                                  .removeefav(currentmovietitle);
                            }
                          },
                          child: Icon(
                            Icons.favorite,
                            color: mylist.contains(currentmovietitle)
                                ? Colors.red
                                : Colors.black,
                          )),
                    ),
                  );
                },
              ))
            ],
          ),
        ),
      ),
    );
  }
}
