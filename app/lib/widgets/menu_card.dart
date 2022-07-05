import 'package:chouxcream_app/models/menu/menu.dart';
import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget {
  final Menu menu;
  final Function(Menu) choose;

  const MenuCard({Key? key, required this.menu, required this.choose}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 2,
        ),
        child: Container(
          height: 100,
          clipBehavior: Clip.hardEdge,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white,
              boxShadow: [BoxShadow(color: Colors.black26, offset: Offset(0, 1), blurRadius: 2.0)]),
          child: Row(
            children: [
              Image.network(menu.imageUrl, fit: BoxFit.cover, width: 100),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menu.name,
                      style: const TextStyle(fontSize: 16),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${menu.numCalorie} kcal",
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(
                  right: 10,
                ),
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                  color: Colors.green,
                ),
                child: IconButton(
                    iconSize: 18,
                    icon: const Icon(
                      Icons.check,
                      color: Colors.white,
                    ),
                    onPressed: () => choose(menu)),
              ),
            ],
          ),
        ));
  }
}
