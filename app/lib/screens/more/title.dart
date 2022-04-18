import 'package:flutter/material.dart';

class titleBar extends StatelessWidget {
  const titleBar({required this.title, required this.routes});

  final String title;
  final String routes;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 32.0),
        child: GestureDetector(
          onTap: (){
            //Navigator.push(context, MaterialPageRoute(builder: (context) => routes));
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(title,style: TextStyle(fontSize: 16)),
              const Icon(Icons.navigate_next_rounded),
            ],
          ),
        ),
      )
    );
  }
}
