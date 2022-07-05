import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/models/menu/menu.dart';
import 'package:chouxcream_app/widgets/menu_card.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class MenuListFragment extends StatefulWidget {
  final Function(Menu) choose;
  final String query;

  const MenuListFragment({Key? key, required this.choose, required this.query}) : super(key: key);

  @override
  State<MenuListFragment> createState() => _MenuListFragmentState();
}

class _MenuListFragmentState extends State<MenuListFragment> {
  List<Menu>? menus;

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void didUpdateWidget(MenuListFragment oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.query != widget.query) {
      init();
    }
  }

  init() {
    Caller.dio.get("/tracking/menus?query=${widget.query}").then((response) {
      setState(() {
        menus = response.data["data"].map<Menu>((e) => Menu.fromJson(e)).toList();
      });
    }).onError((DioError error, _) {
      Caller.handle(context, error);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (menus == null) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [CircularProgressIndicator()],
      );
    }

    return ListView(
      shrinkWrap: true,
      physics: const AlwaysScrollableScrollPhysics(),
      children: menus!
          .map((el) => MenuCard(
                menu: el,
                choose: widget.choose,
              ))
          .toList(),
    );
  }
}
