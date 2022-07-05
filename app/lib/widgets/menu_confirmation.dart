import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/models/menu/menu.dart';
import 'package:chouxcream_app/utils/extension/string.dart';
import 'package:chouxcream_app/widgets/carb/carb_divider.dart';
import 'package:chouxcream_app/widgets/carb/text_carp.dart';
import 'package:chouxcream_app/widgets/layout/popover.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:ndialog/ndialog.dart';

import '../classes/theme.dart';
import 'carb/icon_carb.dart';

class MenuConfirmation extends StatefulWidget {
  final Menu menu;
  final String meal;
  final Function added;

  const MenuConfirmation({
    Key? key,
    required this.menu,
    required this.meal,
    required this.added,
  }) : super(key: key);

  @override
  State<MenuConfirmation> createState() => _MenuConfirmationState();
}

class _MenuConfirmationState extends State<MenuConfirmation> {
  double _multiplier = 1;

  submit() {
    // * Display progress dialog
    CustomProgressDialog progressDialog = CustomProgressDialog(
      context,
      blur: 5,
      dismissable: false,
    );
    progressDialog.show();

    // * Call preference update endpoint
    Caller.dio.post("/tracking/record", data: {
      "menu_id": widget.menu.id,
      "meal": widget.meal,
      "calorie": widget.menu.numCalorie * _multiplier,
      "protein": widget.menu.numProtein * _multiplier,
      "carbohydrate": widget.menu.numCarbohydrate * _multiplier,
      "fat": widget.menu.numFat * _multiplier,
    }).then((response) {
      Navigator.pop(context);
      progressDialog.dismiss();
      Caller.inform(context, response.data["message"]);
      widget.added();
    }).onError((DioError error, _) {
      Navigator.pop(context);
      Caller.handle(context, error);
      progressDialog.dismiss();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Popover(
        child: Column(
      children: [
        Text(
          widget.menu.name,
          style: const TextStyle(
            fontSize: 24,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: Image.network(
              widget.menu.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(flex: 1, child: IconCarb(icon: Icons.fastfood_rounded, value: widget.meal.capitalize())),
            const CarbDivider(),
            Expanded(
                flex: 1,
                child: IconCarb(
                    icon: Icons.whatshot_rounded,
                    value: "${(widget.menu.numCalorie * _multiplier).toStringAsFixed(2)} kcal")),
          ],
        ),
        Container(
          height: 1,
          color: Colors.black12,
        ),
        Row(
          children: [
            Expanded(
                flex: 1,
                child: TextCarb(
                    title: "Protein", value: "${(widget.menu.numProtein * _multiplier).toStringAsFixed(2)} g.")),
            const CarbDivider(),
            Expanded(
                flex: 1,
                child: TextCarb(
                    title: "Carbohydrate",
                    value: "${(widget.menu.numCarbohydrate * _multiplier).toStringAsFixed(2)} g.")),
            const CarbDivider(),
            Expanded(
                flex: 1,
                child: TextCarb(title: "Fat", value: "${(widget.menu.numFat * _multiplier).toStringAsFixed(2)} g.")),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                flex: 1,
                child: Slider(
                  value: _multiplier,
                  min: 0.1,
                  max: 2,
                  onChanged: (double value) {
                    setState(() {
                      _multiplier = value;
                    });
                  },
                ),
              ),
              Text(
                "${_multiplier.toStringAsFixed(2)}x",
                style: const TextStyle(fontFamily: "monospace"),
              ),
            ],
          ),
        ),
        SizedBox(
          width: 168,
          height: 42,
          child: ElevatedButton(
              style: ButtonStyle(
                  shape: MaterialStateProperty.all(ThemeConstant.pillBorderShape),
                  side: MaterialStateProperty.all(
                      BorderSide(color: ThemeConstant.colorPrimary, width: 1.2, style: BorderStyle.solid))),
              onPressed: submit,
              child: const Text(
                'Submit',
                style: TextStyle(fontSize: 16),
              )),
        )
      ],
    ));
  }
}
