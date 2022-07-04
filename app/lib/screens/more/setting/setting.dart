import 'package:chouxcream_app/classes/theme.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class Setting extends StatefulWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _formkey = GlobalKey<FormState>();
  final _age = TextEditingController();
  final _height = TextEditingController();
  final _weight = TextEditingController();

  final _editBtnController = RoundedLoadingButtonController();
  bool isSubmit = false;

  String? selectedGender;
  final List _types = ['Male', 'Female'];

  @override
  void initState() {
    super.initState();
    //selectedGender = _types[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Setting Informations'),
      ),
      body: Form(
        key: _formkey,
        child: ListView(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    LimitedBox(
                      maxHeight: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Gender', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: DropdownButtonFormField<String>(
                                    decoration: InputDecoration(
                                      border: InputBorder.none,
                                    ),
                                    value: selectedGender,
                                    items: _types.map((value) {
                                      return DropdownMenuItem<String>(
                                        child: Text(value),
                                        value: value,
                                      );
                                    }).toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    })),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LimitedBox(
                      maxHeight: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Age', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: _age,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'Years',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LimitedBox(
                      maxHeight: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Height', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: _height,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'Centimeters',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LimitedBox(
                      maxHeight: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Weight', style: TextStyle(fontSize: 16)),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: _weight,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'Kilograms',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    LimitedBox(
                      maxHeight: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Desired Weight',
                              style: TextStyle(fontSize: 16)),
                          Container(
                            width: 180,
                            decoration: BoxDecoration(
                              color: Color(0xFFEBEBEB),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: TextFormField(
                                controller: _weight,
                                maxLines: 1,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  suffixText: 'Kilograms',
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      child: RoundedLoadingButton(
                        height: 50,
                        width: 420,
                        color: ThemeConstant.colorPrimary,
                        child: const Text('Save'),
                        controller: _editBtnController,
                        onPressed: () {
                          setState(() {
                            isSubmit = true;
                          });
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            //_editCall();
                            isSubmit = false;
                          }
                          _editBtnController.reset();
                        },
                      ),
                    ),
                  ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
