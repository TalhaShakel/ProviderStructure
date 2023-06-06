import 'dart:math';

import 'package:flutter/material.dart';
import 'package:yoga/Models/Moviee_models.dart';

final List<Movie> initialdata = List.generate(
    50,
    (index) => Movie(
        duration: "${Random().nextInt(100) + 60} minutes",
        title: "Movie $index"));

class MovieProvider with ChangeNotifier {
  final List<Movie> _movies = initialdata;
  List<Movie> get movies => _movies;

  final List<Movie> _mylist = [];
  List<Movie> get mylist => _mylist;

  addfav(Movie movie) {
    _mylist.add(movie);
    notifyListeners();
  }

  removeefav(Movie movie) {
    _mylist.remove(movie);
    notifyListeners();
  }
}
