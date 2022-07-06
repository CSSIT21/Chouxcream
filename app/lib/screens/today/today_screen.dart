import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/models/menu/recent_record.dart';
import 'package:chouxcream_app/screens/today/calorie_component.dart';
import 'package:chouxcream_app/screens/today/date_component.dart';
import 'package:chouxcream_app/widgets/today_menu.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class TodayScreen extends StatefulWidget {
  final bool channel;

  const TodayScreen({Key? key, required this.channel}) : super(key: key);

  @override
  State<TodayScreen> createState() => _TodayScreenState();
}

class _TodayScreenState extends State<TodayScreen> {
  final _textFieldController = TextEditingController();
  bool isSubmit = false;
  RecentRecord? recent;

  @override
  void initState() {
    super.initState();
    load();
  }

  @override
  void didUpdateWidget(TodayScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.channel != widget.channel) {
      load();
    }
  }

  load() {
    if (!mounted) return;
    Caller.dio.get("/tracking/record/recent").then((response) {
      setState(() {
        recent = RecentRecord.fromJson(response.data["data"]);
      });
    }).onError((DioError error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (recent == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
        child: Column(
          children: [
            const DateComponent(),
            CalorieComponent(calorie: recent!.calorie, bmr: recent!.bmr),
            const SizedBox(
              height: 6,
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
              height: 12,
            ),
            Column(
              children: recent!.records
                  .map((e) => TodayMenu(
                        record: e,
                        // onPressedone: () {
                        //   setState(() {
                        //     Navigator.pop(context);
                        //   });
                        // },
                        // onPressedtwo: () {
                        //   setState(() {
                        //     //codeDialog = valueText
                        //     Navigator.pop(context);
                        //   });
                        // },
                        controller: _textFieldController,
                      ))
                  .toList(),
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
