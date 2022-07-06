import 'package:chouxcream_app/models/menu/menu.dart';
import 'package:chouxcream_app/screens/record/choose_menu_fragment.dart';
import 'package:chouxcream_app/screens/record/meal_selector_component.dart';
import 'package:chouxcream_app/widgets/menu_confirmation.dart';
import 'package:flutter/material.dart';

class AddRecordScreen extends StatefulWidget {
  final Function onFinish;

  const AddRecordScreen({Key? key, required this.onFinish}) : super(key: key);

  @override
  State<AddRecordScreen> createState() => _AddRecordScreenState();
}

class _AddRecordScreenState extends State<AddRecordScreen> {
  String _meal = "breakfast";
  int _index = 0;
  bool _added = false;

  choose(Menu menu) {
    showModalBottomSheet(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (BuildContext context) {
          return Wrap(
            children: [
              MenuConfirmation(
                menu: menu,
                meal: _meal,
                added: () => setState(() {
                  setState(() {
                    _added = true;
                  });
                  Navigator.pop(context);
                  widget.onFinish();
                }),
              ),
            ],
          );
        });
  }

  setMeal(String meal) {
    setState(() {
      _meal = meal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Record"),
      ),
      body: Stepper(
        type: StepperType.horizontal,
        currentStep: _index,
        controlsBuilder: (BuildContext context, ControlsDetails details) {
          return Container();
        },
        onStepTapped: (index) {
          if (index == 0) {
            setState(() {
              _index = index;
            });
          }
        },
        steps: <Step>[
          Step(
            title: const Text('Choose meal'),
            isActive: _index == 0,
            state: _index == 0 ? StepState.editing : StepState.complete,
            content: Column(
              children: [
                MealSelectorComponent(setMeal: setMeal),
                const SizedBox(height: 20),
                Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: Colors.green,
                  ),
                  child: IconButton(
                      iconSize: 24,
                      icon: const Icon(
                        Icons.check,
                        color: Colors.white,
                      ),
                      onPressed: () => setState(() {
                            _index = 1;
                          })),
                ),
              ],
            ),
          ),
          Step(
            title: const Text('Choose menu'),
            isActive: _index == 1,
            state: _index == 1 ? StepState.editing : StepState.disabled,
            content: ChooseMenuFragment(choose: choose),
          ),
        ],
      ),
    );
  }
}
