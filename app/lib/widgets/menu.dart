import 'package:chouxcream_app/widgets/card_menu.dart';
import 'package:flutter/material.dart';

import '../classes/theme.dart';

class Menu extends StatelessWidget {
  final String name;
  final String cal;
  final String img;

  const Menu(
      {Key? key, required this.name, required this.cal, required this.img})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          //child: Row(
          //children: [
          child: Container(
            height: 100,
            width: 320,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0, 1),
                      blurRadius: 2.0)
                ]),
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  width: 80,
                  height: 80,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(img),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(fontSize: 16),
                    ),
                    Text(
                      cal,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                Container(
                  margin: const EdgeInsets.only(
                    right: 10,
                  ),
                  child: SizedBox(
                    width: 88,
                    height: 30,
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: MaterialStateProperty.all(
                              ThemeConstant.pillBorderShape),
                          side: MaterialStateProperty.all(const BorderSide(
                              color: Color(0xFFE07D12),
                              width: 1.2,
                              style: BorderStyle.solid))),
                      onPressed: () {
                        showModalBottomSheet(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25)
                              ),
                            ),
                            backgroundColor: Colors.white,
                            context: context,
                            builder: (BuildContext context) {
                              return CardMenu(name: "ข้าวมันไก่");
                            });
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            "CHOOSE",
                            style: TextStyle(color: Colors.white, fontSize: 14),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
          //],
          ),
    );
  }
}
