import 'package:flutter/foundation.dart';

enum Complexity { SIMPLE, CHALLENGING, HARD }

enum Affordability { CHEAP, PRICEY, LUXURIOUS }

class Meal {
  const Meal({
    @required this.id,
    @required this.categories,
    @required this.title,
    @required this.imageUrl,
    @required this.ingredients,
    @required this.steps,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
    @required this.isGlutenFree,
    @required this.isLactoseFree,
    @required this.isVegan,
    @required this.isVegetarian,
  });

  final Affordability affordability;
  final List<String> categories;
  final Complexity complexity;
  final int duration;
  final String id;
  final String imageUrl;
  final List<String> ingredients;
  final bool isGlutenFree;
  final bool isLactoseFree;
  final bool isVegan;
  final bool isVegetarian;
  final List<String> steps;
  final String title;
}
