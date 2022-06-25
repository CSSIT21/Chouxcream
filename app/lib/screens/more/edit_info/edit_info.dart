import 'dart:io';

import 'package:chouxcream_app/constants/theme.dart';
import 'package:chouxcream_app/models/user/user_information.dart';
import 'package:chouxcream_app/screens/more/edit_info/edit_pic.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:image_picker/image_picker.dart';

class EditProfile extends StatefulWidget {
  final Function readJson;
  final User userInfo;

  const EditProfile({Key? key, required this.readJson, required this.userInfo})
      : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _editBtnController = RoundedLoadingButtonController();
  bool isSubmit = false;
  User user = User(name: '', email: '', avatarUrl: '');

  File? _imageFile = null;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    widget.readJson();
    if (mounted) {
      setState(() {
        user = widget.userInfo;
      });
    }
    _emailController.text = user.email;
    _usernameController.text = user.name;
  }

  void getImageFromGallery() async {
    XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Form(
          child: ListView(
            children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: Column(
                children: [
                  const SizedBox(height: 40,),
                  _imageFile == null ? EditPicture(
                    image: NetworkImage(user.avatarUrl),
                    onTaped: () {
                      getImageFromGallery();
                      },
                    )
                  : EditPicture(
                      image: FileImage(_imageFile!),
                      onTaped: () {
                        getImageFromGallery();
                      },
                    ),
                  const SizedBox(height: 38,),
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
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeConstant.colorAccentDark))),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                        const Text("Username"),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: _usernameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter username';
                            }
                          },
                          decoration: InputDecoration(
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: ThemeConstant.colorAccentDark))),
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35),
                    child: Container(
                      margin: const EdgeInsets.only(bottom: 60),
                      child: RoundedLoadingButton(
                        height: 70,
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
              )
            )
          ]
        )
      )
    );
  }
}
