import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapplication/firebase/firebase_models/user_model.dart';
import 'package:juiceapplication/firebase/helpers/auth_helpers.dart';
import 'package:juiceapplication/firebase/helpers/firestore_helper.dart';
import 'package:juiceapplication/widgets/custom_textfield.dart';

// ignore: must_be_immutable
class RegisterScreen extends StatelessWidget {
  String email;
  setEmail(String value) {
    this.email = value;
  }

  String password;
  setPassword(String value) {
    this.password = value;
  }

  String fName;
  setFName(String value) {
    this.fName = value;
  }

  String lName;
  setLName(String value) {
    this.lName = value;
  }

  String city;
  setCity(String value) {
    this.city = value;
  }

  String nullValidation(String value) {
    if (value == null || value.length == 0) {
      return '*Required field';
    }
  }

  saveUser() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      UserModel userModel = UserModel(
          city: this.city,
          email: this.email,
          firstName: this.fName,
          lastName: this.lName,
          password: this.password);
      String userId = await AuthHelper.authHelper.register(userModel);
      userModel.id = userId;
      FirestoreHelper.firestoreHelper.addUserToFirestore(userModel);
    } else {
      return;
    }
  }

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Register')),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField('First Name', setFName, nullValidation),
              CustomTextField('Last Name', setLName, nullValidation),
              CustomTextField('City', setCity, nullValidation),
              CustomTextField('Email', setEmail, nullValidation),
              CustomTextField('Password', setPassword, nullValidation),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    saveUser();
                  },
                  child: Text('Register'))
            ],
          ),
        ),
      ),
    );
  }
}
