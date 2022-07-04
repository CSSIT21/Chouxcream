import 'package:flutter/material.dart';

import '../classes/theme.dart';

class CardMenu extends StatelessWidget {
  final String name;

  const CardMenu({
    Key? key,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(150, 20, 150, 20),
              child: Container(
                height: 8.0,
                width: 80.0,
                decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.all(Radius.circular(8))),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 30,
                    margin: EdgeInsets.only(top: 10),
                    child: Center(
                        child: Text(
                      name,
                      style: const TextStyle(
                        fontSize: 24,
                      ),
                    )),
                  ),
                  const Carb(carb: "Calories:", value: '693kcal'),
                  const Carb(carb: "Protein:", value: '26g'),
                  const Carb(carb: "Fat:", value: '22g'),
                  const Carb(carb: "Carbohydrate:", value: '53g')
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30),
              child: SizedBox(
                width: 100,
                height: 30,
                child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(ThemeConstant.pillBorderShape),
                      side: MaterialStateProperty.all(
                          BorderSide(color: ThemeConstant.colorPrimary, width: 1.2, style: BorderStyle.solid))),
                  onPressed: () {
                    //setState(() {
                    //isSubmit - true;
                    //});

                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'OK',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}

class Carb extends StatelessWidget {
  final String carb;
  final String value;

  const Carb({Key? key, required this.carb, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2),
      child: Row(
        children: [Text(carb), const Spacer(), Text(value)],
      ),
    );
  }
}
