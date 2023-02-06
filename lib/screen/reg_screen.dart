import 'dart:io';

import 'package:flutter/material.dart';
import 'package:furniturezoid/app/user_permission.dart';
import 'package:image_picker/image_picker.dart';

import 'package:furniturezoid/model/user.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:motion_toast/motion_toast.dart';



import '../repository/user_repo.dart';

class Register extends StatefulWidget {
  const Register({super.key});
  static const String route = "registerScreen";

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  void initState() {
    _checkUserPermission();
    super.initState();
  }

  _checkUserPermission() async {
    await UserPermission.checkCameraPermission();
  }

  final _key = GlobalKey<FormState>();
  
  
  final _fnameController = TextEditingController(text: "kripa");
  final _lnameController = TextEditingController(text: "kripa");
  String? _radioValue = "true";
  final _emailController = TextEditingController(text: "kripa@gmail.com");
  final _passwordController = TextEditingController(text: "kripa123");
  final _passwordConfirmationController =TextEditingController(text: "kripa123");

  File? _img;

  saveUser() async {
    User user = User(
      
    fname:_fnameController.text,
    lname:_lnameController.text,
    gender:_radioValue!,
    email:_emailController.text,
    password:_passwordController.text,
    passwordConfirmation:_passwordConfirmationController.text,
    
    );

    int status = await UserRepositoryImpl().addUser(_img, user);
    _showMessage(status);
  }

  

  Future _loadImage(ImageSource imageSource) async {
    try {
      final image = await ImagePicker().pickImage(source: imageSource);
      if (image != null) {
        setState(() {
          _img = File(image.path);
        });
      } else {
        return;
      }
    } catch (e) {
      debugPrint('Failed to pick Image $e');
    }
  }

  _showMessage(int status) {
    if (status == 1) {
      Navigator.pop(context);
      MotionToast.success(
        description: const Text("student added successfully"),
      ).show(context);
    } else if (status == 2) {
      MotionToast.error(
        description: const Text("Passwords do not match"),
      ).show(context);
    } else {
      MotionToast.error(
        description: const Text("Error adding student"),
      ).show(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color(0xff184a2c),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _key,
              child: Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.grey[300],
                          context: context,
                          isScrollControlled: true,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(20),
                            ),
                          ),
                          builder: (context) => Padding(
                            padding: const EdgeInsets.all(20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _loadImage(ImageSource.camera);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.camera),
                                  label: const Text('Camera'),
                                ),
                                ElevatedButton.icon(
                                  onPressed: () {
                                    _loadImage(ImageSource.gallery);
                                    Navigator.pop(context);
                                  },
                                  icon: const Icon(Icons.image),
                                  label: const Text('Gallery'),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: _img == null
                            ? Image.asset('assets/images/cd.jpeg')
                            : Image.file(
                                _img!,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    const Text("First Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _fnameController,
                      decoration: InputDecoration(
                          // labelText: '',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter first name';
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Last Name"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _lnameController,
                      decoration: InputDecoration(
                          // labelText: 'Last Name',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: ((value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter last name';
                        }
                        return null;
                      }),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: Text("Select Gender: "),
                    ),
                    Row(
                      children: [
                        Flexible(
                          child: RadioListTile(
                              title: const Text("Male"),
                              value: "m",
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value.toString();
                                });
                              }),
                        ),
                        Flexible(
                          child: RadioListTile(
                              title: const Text("Female"),
                              value: "f",
                              groupValue: _radioValue,
                              onChanged: (value) {
                                setState(() {
                                  _radioValue = value.toString();
                                });
                              }),
                        ),
                      ],
                    ),
                    const Text("Email"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(
                          // labelText: 'Email',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Email';
                        }
                        String pattern =
                            r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
                            r"{0,253}[a-zA-Z0-9])?)*$";
                        RegExp regex = RegExp(pattern);
                        // ignore: unnecessary_null_comparison
                        if (value == null ||
                            value.isEmpty ||
                            !regex.hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Password"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // labelText: 'Password',
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        if (value.length < 6) {
                          return 'Password length must be at least 6 characters';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    const Text("Confirm Password"),
                    const SizedBox(
                      height: 8,
                    ),
                    TextFormField(
                      controller: _passwordConfirmationController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // labelText: 'Password',
                          hintText: 'Enter Password',
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.blue),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(color: Colors.green),
                            borderRadius: BorderRadius.circular(5),
                          )),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter Password';
                        }
                        if (value.length < 6) {
                          return 'Password length must be at least 6 characters';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_key.currentState!.validate()) {
                            if (_passwordController.text ==
                                _passwordConfirmationController.text) {
                              saveUser();
                            } else {
                              _showMessage(2);
                            }
                          }
                        },
                        child: const Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: "Brand Bold",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}