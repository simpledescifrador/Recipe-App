import 'package:flutter/material.dart';
import 'package:meals/widgets/meal_item.dart';
import 'package:meals/models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // CategoryMealsScreen(this.categoryId, this.categoryTitle, this.color);

  // final String categoryId;
  // final String categoryTitle;
  // final Color color;

  static const ROUTE_NAME = '/category-meals';
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String _categoryId;
  List<Meal> _categoryMeals;
  String _categoryTitle;
  Color _color;
  bool _isLoadedInitData = false;

  @override
  void didChangeDependencies() {
    if (!_isLoadedInitData) {
      final args =
          ModalRoute.of(context).settings.arguments as Map<String, Object>;
      _categoryTitle = args['title'] as String;
      _categoryId = args['id'] as String;
      _color = args['color'] as Color;
      _categoryMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(_categoryId);
      }).toList();

      _isLoadedInitData = true;
    }
    super.didChangeDependencies();  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_categoryTitle),
        backgroundColor: _color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _categoryMeals[index].id,
            title: _categoryMeals[index].title,
            imageUrl: _categoryMeals[index].imageUrl,
            duration: _categoryMeals[index].duration,
            complexity: _categoryMeals[index].complexity,
            affordability: _categoryMeals[index].affordability,
          );
        },
        itemCount: _categoryMeals.length,
      ),
    );
  }
}
