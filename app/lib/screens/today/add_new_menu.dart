import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/widgets/menu.dart';
import 'package:flutter/material.dart';

class AddNewMenu extends StatefulWidget {
  const AddNewMenu({Key? key}) : super(key: key);

  @override
  State<AddNewMenu> createState() => _AddNewMenuState();
}

class _AddNewMenuState extends State<AddNewMenu> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Add Menu"),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20),
                height: 50,
                width: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    border: Border.all(
                        color: ThemeConstant.colorPrimary, width: 3.0)),
                child: TabBar(
                  isScrollable: true,
                  indicator: BoxDecoration(
                      color: ThemeConstant.colorPrimary,
                      borderRadius: BorderRadius.circular(25)),
                  labelColor: Colors.white,
                  unselectedLabelColor: Colors.black,
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
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                child: const TabBarView(children: [
                  Center(
                    child: Text(
                      "Breakfast",
                      style:
                          TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Center(
                    child: Text("Lunch",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text("Dinner",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text("Snack",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                  Center(
                    child: Text("Drink",
                        style: TextStyle(
                            fontSize: 32, fontWeight: FontWeight.bold)),
                  ),
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                  height: 40,
                  width: 260,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(40)),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0, 1),
                            blurRadius: 2.0),
                      ]),
                  child: const TextField(
                    //onchanged: (value) => _runFilter(value),
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search menu here',
                        prefixIcon: Icon(Icons.search),
                        iconColor: Colors.grey,
                        labelStyle: TextStyle(color: Colors.grey)),
                  )),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 500,
                    child: ListView(
                      shrinkWrap: true,
                      physics: const AlwaysScrollableScrollPhysics(),
                      children: const [
                        Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                              Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                              Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                              Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                              Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                              Menu(
                          name: 'ข้าวมันไก่',
                          cal: '620 kcal',
                          img:
                              "https://img.wongnai.com/p/l/2017/06/22/c71d69ad5dbd48f49b5c82e2405d3b10.jpg"),
                      ],
                    )
                     
                  )
            ],
          ),
        ),
      ),
    );
  }
}
