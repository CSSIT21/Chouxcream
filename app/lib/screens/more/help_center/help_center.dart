import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final List<Questions> _questions = [
    Questions(id: 1,question: 'q1', answer: 'a1', isExpanded: false),
    Questions(id: 2,question: 'q2', answer: 'a2', isExpanded: false),
    Questions(id: 3,question: 'q3', answer: 'a3', isExpanded: false),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('Help Center')),
      body: ListView(children: [
        ExpansionPanelList.radio(
          children: _questions.map((q) => ExpansionPanelRadio(
            canTapOnHeader: true,
            value: q.id,
            headerBuilder: (bc, status) {
              return Text(q.question);
            },
            body: Text(q.answer))
            ).toList(),
          expansionCallback: (i, isExpanded) =>
              setState(() => _questions[i].isExpanded = !isExpanded),
        )
      ]),
    );
  }
}

class Questions {
  int id;
  String question;
  String answer;
  bool isExpanded;
  
  Questions({
    required this.id,
    required this.question,
    required this.answer,
    required this.isExpanded
  });
}