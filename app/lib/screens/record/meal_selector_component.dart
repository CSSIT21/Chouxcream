import 'package:chouxcream_app/classes/theme.dart';
import 'package:flutter/material.dart';

class MealSelectorComponent extends StatelessWidget {
  static const meals = ["breakfast", "launch", "dinner", "snack", "drink"];

  final Function(String) setMeal;

  const MealSelectorComponent({Key? key, required this.setMeal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 120),
      clipBehavior: Clip.hardEdge,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          border: Border.all(color: ThemeConstant.colorPrimary, width: 2.0)),
      child: DefaultTabController(
        length: 5,
        child: TabBar(
          isScrollable: true,
          labelPadding: const EdgeInsets.symmetric(horizontal: 24),
          indicator: BoxDecoration(color: ThemeConstant.colorPrimary),
          splashBorderRadius: const BorderRadius.all(Radius.circular(10)),
          labelColor: Colors.white,
          unselectedLabelColor: Colors.black,
          onTap: (index) {
            setMeal(meals[index]);
          },
          tabs: const [
            Tab(
              text: 'Breakfast',
            ),
            Tab(
              text: 'Lunch',
            ),
            Tab(
              text: 'Dinner',
            ),
            Tab(
              text: 'Snack',
            ),
            Tab(
              text: 'Drink',
            )
          ],
        ),
      ),
    );
  }
}
