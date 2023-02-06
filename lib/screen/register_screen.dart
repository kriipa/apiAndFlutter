import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'package:furniturezoid/model/user.dart';
import 'package:motion_toast/motion_toast.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';




import '../repository/user_repo.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

    static const String route = "registerScreen";


  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _key = GlobalKey<FormState>();
  final _fnameController = TextEditingController(text: "kripa");
  final _lnameController = TextEditingController(text: "kripa");
  final _emailController = TextEditingController(text: "kripa@gmail.com");
  final _passwordController = TextEditingController(text: "123456");
  final _passwordConfirmationController =TextEditingController(text: "123456");

  String? _radioValue = "true";

  saveUser() async {
    User user = User(
      fname: _fnameController.text,
      lname: _lnameController.text,
      gender: _radioValue!,
      email: _emailController.text,
      password: _passwordController.text,
      passwordConfirmation:_passwordConfirmationController.text,
    );
    int status = await UserRepositoryImpl().addUser(_img, user);
    _showMessage(status);
  }

  _showMessage(int status) {
    if (status > 0) {
      MotionToast.error(
        description: const Text("Error adding user"),
      ).show(context);
    } else {
      MotionToast.success(
        description: const Text("user added successfully"),
      ).show(context);
    }
  }

  // _showMessage(int status) {
  //   if (status > 0) {
  //     showSnackbar(context, 'Successfully added student', Colors.green);
  //   } else {
  //     showSnackbar(context, 'Error registring student', Colors.red);
  //   }
  // }

  File? _img;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        backgroundColor: const Color.fromARGB(255, 133, 100, 100),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _key,
              child: Column(
                children: [
                  // SizedBox(
                  //   // backgroundColor : Colors.amber,
                  //   height: 200,
                  //   width: 200,
                  //   child: _img == null
                  //     ? Image.asset('assets/images/images.png')
                  //     : Image.file(_img!),
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           _loadImage(ImageSource.camera);
                  //         },
                  //         child: Wrap(children: const [Text('Open Camera')]),
                  //     ),
                  //     ElevatedButton(
                  //         onPressed: () {
                  //           _loadImage(ImageSource.gallery);
                  //         },
                  //         child: const Text('Open Gallery'),
                  //     ),
                  //   ],
                  // ),
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
                          ? Image.asset('assets/images/images.png')
                          : Image.file(_img!,fit: BoxFit.cover,),
                    ),
                  ),
                  TextFormField(
                    controller: _fnameController,
                    decoration: InputDecoration(
                        labelText: 'First Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 113, 77, 44)),
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
                  TextFormField(
                    controller: _lnameController,
                    decoration: InputDecoration(
                        labelText: 'Last Name',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 113, 77, 44)),
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
                  RadioListTile(
                      title: const Text("Male"),
                      value: "m",
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Female"),
                      value: "f",
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value.toString();
                        });
                      }),
                  RadioListTile(
                      title: const Text("Other"),
                      value: "o",
                      groupValue: _radioValue,
                      onChanged: (value) {
                        setState(() {
                          _radioValue = value.toString();
                        });
                      }),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        labelText: 'Email',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 113, 77, 44)),
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
                  TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Enter Password',
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Color.fromARGB(255, 113, 77, 44)),
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
                    height: 10,
                  ),

                  TextFormField(
                      controller: _passwordConfirmationController,
                      obscureText: true,
                      decoration: InputDecoration(
                          // labelText: 'Password',
                          hintText: 'Confirm Password ',
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
                  
                  const SizedBox(
                    height: 10,
                  ),
                  // SizedBox(
                  //   height: 40,
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     onPressed: () {
                  //       if (_key.currentState!.validate()) {
                  //         saveUser();
                  //       }
                  //     },
                  //     child: const Text(
                  //       'Register',
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         fontFamily: "Brand Bold",
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
