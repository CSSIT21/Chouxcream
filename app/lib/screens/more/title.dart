import 'package:flutter/material.dart';

class titleBar extends StatelessWidget {
  const titleBar({Key? key, required this.title, required this.routes}) : super(key: key);

  final String title;
  final Widget routes;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => routes));
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0),          
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 16)),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
    );
  }
}
