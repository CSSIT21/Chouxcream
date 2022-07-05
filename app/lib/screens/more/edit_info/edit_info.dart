import 'dart:async';
import 'dart:io';

import 'package:chouxcream_app/classes/caller.dart';
import 'package:chouxcream_app/classes/theme.dart';
import 'package:chouxcream_app/models/user/user_information.dart';
import 'package:chouxcream_app/screens/more/edit_info/edit_password.dart';
import 'package:chouxcream_app/screens/more/edit_info/edit_pic.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class EditProfile extends StatefulWidget {
  final Function update;
  final User user;

  const EditProfile({Key? key, required this.update, required this.user}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _editBtnController = RoundedLoadingButtonController();
  final _picker = ImagePicker();
  bool isSubmit = false;

  @override
  void initState() {
    super.initState();
    _emailController.text = widget.user.email;
    _nameController.text = widget.user.name;
  }

  void saveInfo() {
    FocusManager.instance.primaryFocus?.unfocus();
    Caller.dio.patch("/profile/info", data: {
      "name": _nameController.text,
      "email": _emailController.text,
    }).then((response) {
      _editBtnController.success();
      widget.update();
    }).onError((DioError error, _) {
      _editBtnController.error();
      Caller.handle(context, error);
    }).whenComplete(() {
      Timer(const Duration(milliseconds: 2000), () {
        _editBtnController.reset();
      });
    });
  }

  void getImageFromGallery() async {
    XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (pickedFile != null) {
      setState(() {
        // TODO: Upload file
        File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Builder(builder: (context) {
          return ListView(children: [
            Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    EditPicture(
                      image: NetworkImage(widget.user.avatarUrl),
                      onTaped: () {
                        getImageFromGallery();
                      },
                    ),
                    Container(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 45, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text("Email"),
                          TextFormField(
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter email';
                              }
                            },
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _emailController,
                            decoration: InputDecoration(
                                focusedBorder:
                                    UnderlineInputBorder(borderSide: BorderSide(color: ThemeConstant.colorAccentDark))),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          const Text("Name"),
                          TextFormField(
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            controller: _nameController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter name';
                              }
                            },
                            decoration: InputDecoration(
                                focusedBorder:
                                    UnderlineInputBorder(borderSide: BorderSide(color: ThemeConstant.colorAccentDark))),
                          ),
                          const SizedBox(
                            height: 18,
                          ),
                          RoundedLoadingButton(
                            height: 50,
                            width: 420,
                            color: ThemeConstant.colorAccentDark,
                            controller: _editBtnController,
                            onPressed: saveInfo,
                            child: const Text('Save'),
                          ),
                          Container(
                            height: 18,
                          ),
                          SizedBox(
                            height: 50,
                            width: 420,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                                shape: MaterialStateProperty.all(ThemeConstant.pillBorderShape),
                              ),
                              onPressed: () {
                                showModalBottomSheet(
                                    context: context, builder: (context) => const EditPassword(), elevation: 2);
                              },
                              child: const Text('Change password'),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ))
          ]);
        }));
  }
}
