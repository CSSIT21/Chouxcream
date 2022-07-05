import 'dart:async';

import 'package:chouxcream_app/models/menu/menu.dart';
import 'package:chouxcream_app/screens/today/menu_list.dart';
import 'package:flutter/material.dart';

class ChooseMenuFragment extends StatefulWidget {
  final Function(Menu) choose;

  const ChooseMenuFragment({Key? key, required this.choose}) : super(key: key);

  @override
  State<ChooseMenuFragment> createState() => _ChooseMenuFragmentState();
}

class _ChooseMenuFragmentState extends State<ChooseMenuFragment> {
  Timer? _debounce;
  String _query = "";

  @override
  void dispose() {
    _debounce?.cancel();
    super.dispose();
  }

  onQueryChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1000), () {
      setState(() {
        _query = query;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            height: 40,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(40)),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2.0),
                ]),
            child: TextField(
              onChanged: onQueryChanged,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Search menu here',
                prefixIcon: Icon(Icons.search),
                iconColor: Colors.grey,
              ),
            )),
        Container(
          height: 1,
          color: Colors.black12,
          margin: const EdgeInsets.only(top: 10),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 225,
          child: MenuListFragment(
            choose: widget.choose,
            query: _query,
          ),
        ),
      ],
    );
  }
}
