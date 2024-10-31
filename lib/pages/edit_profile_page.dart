import 'dart:io';
import 'dart:math';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:stadium/helper/const.dart';
import 'package:stadium/helper/function_helper.dart';
import 'package:stadium/models/user_model.dart';
import 'package:stadium/provider/auth_provider.dart';
import 'package:stadium/widgets/clickables/main_button_widget.dart';
import 'package:stadium/widgets/inputs/text_form_widget.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();
  bool edit = false;

  @override
  void initState() {
    Provider.of<AuthenProvider>(context, listen: false)
        .getUser()
        .then((onValue) {
      _nameController.text = onValue.name;
      _phoneController.text = onValue.phone;
      _emailController.text = onValue.email;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenProvider>(builder: (context, authConsumer, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Profile Page'),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: authConsumer.isLoading || authConsumer.userModel == null
                ? Center(child: CircularProgressIndicator())
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: getScreenSize(context).height * 0.3,
                        child: Stack(
                          children: [
                            GestureDetector(
                              onTap: () {
                                if (edit) {
                                  FilePicker.platform
                                      .pickFiles(
                                          type: FileType.custom,
                                          allowMultiple: false,
                                          withData: true,
                                          allowedExtensions: [
                                            'jpg',
                                            'png',
                                            'jpeg'
                                          ],
                                          onFileLoading:
                                              (FilePickerStatus status) {
                                            if (kDebugMode) {
                                              print(status);
                                            }
                                          })
                                      .then((value) {
                                    if (value != null) {
                                      Provider.of<AuthenProvider>(context,
                                              listen: false)
                                          .updateUserProfilecover(
                                              File(value.files.first.path!));
                                    }
                                  });
                                }
                              },
                              child: SizedBox(
                                height: getScreenSize(context).height * 0.23,
                                width: double.infinity,
                                child: Image.network(
                                  authConsumer.userModel!.cover ?? "",
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Image.asset('assets/image_tot.png',
                                        fit: BoxFit.cover,
                                        width: double.infinity);
                                  },
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: 0,
                              left: getScreenSize(context).width * 0.35,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(200),
                                child: GestureDetector(
                                  onTap: () {
                                    if (edit) {
                                      FilePicker.platform
                                          .pickFiles(
                                              type: FileType.custom,
                                              allowMultiple: false,
                                              withData: true,
                                              allowedExtensions: [
                                                'jpg',
                                                'png',
                                                'jpeg'
                                              ],
                                              onFileLoading:
                                                  (FilePickerStatus status) {
                                                if (kDebugMode) {
                                                  print(status);
                                                }
                                              })
                                          .then((value) {
                                        if (value != null) {
                                          Provider.of<AuthenProvider>(context,
                                                  listen: false)
                                              .updateUserProfilePhoto(File(
                                                  value.files.first.path!));
                                        }
                                      });
                                    }
                                  },
                                  child: Container(
                                    // color: Colors.black12,
                                    width: getScreenSize(context).width * 0.3,
                                    height: getScreenSize(context).width * 0.3,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      width: getScreenSize(context).width * 0.3,
                                      height:
                                          getScreenSize(context).width * 0.3,
                                      authConsumer.userModel!.avatar ?? "",
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Center(
                                          child: Container(
                                              width:
                                                  getScreenSize(context).width *
                                                      0.33,
                                              height:
                                                  getScreenSize(context).width *
                                                      0.33,
                                              color: Colors.black12,
                                              child: Icon(
                                                Icons.person,
                                                size: getScreenSize(context)
                                                        .width *
                                                    0.15,
                                              )),
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              TextForm(
                                enabled: edit,
                                controller: _nameController,
                                labelText: "Name",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your name';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 26,
                              ),
                              TextForm(
                                  enabled: edit,
                                  controller: _phoneController,
                                  labelText: "Phone"),
                              SizedBox(
                                height: 26,
                              ),
                              TextForm(
                                enabled: edit,
                                controller: _emailController,
                                labelText: "Date of Birth",
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your date of birth';
                                  }
                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 53,
                              ),
                              Mainbutton(
                                  backgroundColor:
                                      edit ? Colors.red : primaryColor,
                                  text: edit ? "cancel" : "Edit",
                                  ontap: () {
                                    setState(() {
                                      edit = !edit;
                                    });
                                  }),
                              SizedBox(
                                height: 20,
                              ),
                              if (edit)
                                Mainbutton(
                                    text: "Save",
                                    backgroundColor: primaryColor,
                                    textcolor: Colors.white,
                                    ontap: () {
                                      if (_formKey.currentState!.validate()) {
                                        Provider.of<AuthenProvider>(context,
                                                listen: false)
                                            .updateProfile(
                                          UserModel(
                                            id: authConsumer.userModel!.id,
                                            name: _nameController.text,
                                            phone: _phoneController.text,
                                            avatar: authConsumer
                                                .userModel!.avatar
                                                .toString(),
                                            cover: authConsumer.userModel!.cover
                                                .toString(),
                                            createdAt: authConsumer
                                                .userModel!.createdAt,
                                            updatedAt: authConsumer
                                                .userModel!.updatedAt,
                                            role: authConsumer.userModel!.role,
                                            email: _emailController.text,
                                          ),
                                        )
                                            .then((value) {
                                          if (value.first) {
                                            setState(() {
                                              edit = false;
                                            });
                                          } else {
                                            if (kDebugMode) {
                                              print("Update failed");
                                            }
                                          }
                                        });
                                      }
                                    }),
                              SizedBox(
                                height: 25,
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      );
    });
  }
}
