import 'package:chouxcream_app/screens/record/record_screen.dart';
import 'package:chouxcream_app/widgets/today_menu.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../classes/theme.dart';

class TodayFragment extends StatefulWidget {
  const TodayFragment({Key? key}) : super(key: key);

  @override
  State<TodayFragment> createState() => _TodayFragmentState();
}

class _TodayFragmentState extends State<TodayFragment> {
  final _textFieldController = TextEditingController();
  bool isSubmit = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(
                top: 20,
              ),
              child: Row(
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  const Text(
                    "Today",
                    style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  const Spacer(),
                  const Text(
                    "07 Mar",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w300, color: Color.fromARGB(255, 124, 120, 120)),
                  )
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Container(
                    margin: const EdgeInsets.only(left: 5, bottom: 10),
                    child: const Text(
                      "Calories",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    )),
                LinearPercentIndicator(
                  width: MediaQuery.of(context).size.width - 50,
                  animation: false,
                  lineHeight: 20.0,
                  //animationDuration: 2500,
                  percent: 0.8,
                  barRadius: const Radius.circular(16),
                  progressColor: const Color(0xFF407CD6),
                )
              ]),
            ),
            const SizedBox(
              height: 40,
            ),
            Container(
              margin: const EdgeInsets.only(left: 5),
              child: Row(
                children: const [
                  Text(
                    "Foods",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 300,
              child: ListView(
                shrinkWrap: true,
                physics: const AlwaysScrollableScrollPhysics(),
                children: [
                  TodayMenu(
                      name: "ข้าวมันไก่",
                      meal: "lunch",
                      cal: "620",
                      onPressedone: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      onPressedtwo: () {
                        setState(() {
                          //codeDialog = valueText
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      img: "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                  TodayMenu(
                      name: "ข้าวมันไก่",
                      meal: "lunch",
                      cal: "620",
                      onPressedone: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      onPressedtwo: () {
                        setState(() {
                          //codeDialog = valueText
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      img: "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                  TodayMenu(
                      name: "ข้าวมันไก่",
                      meal: "lunch",
                      cal: "620",
                      onPressedone: () {
                        setState(() {
                          Navigator.pop(context);
                        });
                      },
                      onPressedtwo: () {
                        setState(() {
                          //codeDialog = valueText
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      img: "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                  TodayMenu(
                      name: "ข้าวมันไก่",
                      meal: "lunch",
                      cal: "620",
                      onPressedone: () {
                        setState(() {
                          isSubmit = true;
                          Navigator.pop(context);
                        });
                      },
                      onPressedtwo: () {
                        setState(() {
                          //codeDialog = valueText
                          Navigator.pop(context);
                        });
                      },
                      controller: _textFieldController,
                      img: "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, top: 60, left: 20),
              child: SizedBox(
                width: 380,
                height: 40,
                child: OutlinedButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all(ThemeConstant.pillBorderShape),
                      side: MaterialStateProperty.all(
                          const BorderSide(color: Color(0xFFE07D12), width: 1.2, style: BorderStyle.solid))),
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AddRecordScreen()));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.add),
                      Text(
                        "Add New Menu",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
        // const Text("Today"),
        // ElevatedButton(
        //     onPressed: () {
        //       showModalBottomSheet<void>(
        //         context: context,
        //         builder: (BuildContext context) {
        //           return const RecordFragment();
        //         },
        //       );
        //     },
        //     child: const Text("Add new record"))
      ),
    );
  }
}
