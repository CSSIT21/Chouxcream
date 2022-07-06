import 'package:flutter/material.dart';

class HelpCenter extends StatefulWidget {
  const HelpCenter({Key? key}) : super(key: key);

  @override
  State<HelpCenter> createState() => _HelpCenterState();
}

class _HelpCenterState extends State<HelpCenter> {
  final List<Questions> _questions = [
    Questions(id: 1,question: 'What is CHOUXCREAM', answer: 'Ullamco voluptate ut qui dolore aliquip sunt laborum id cillum ut irure aliqua duis.', isExpanded: false),
    Questions(id: 2,question: 'How to add menu?', answer: 'Et eiusmod minim officia deserunt aute proident deserunt et exercitation nisi.', isExpanded: false),
    Questions(id: 3,question: 'How to change password?', answer: 'Ut cupidatat fugiat incididunt laborum veniam qui sint aliquip tempor cillum officia proident excepteur irure.', isExpanded: false),
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
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(q.question),
              );
            },
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(q.answer),
            ))
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