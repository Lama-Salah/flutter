import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:juiceapplication/firebase/firebase_models/user_model.dart';
import 'package:juiceapplication/firebase/helpers/auth_helpers.dart';
import 'package:juiceapplication/firebase/helpers/firestore_helper.dart';
import 'package:juiceapplication/widgets/custom_textfield.dart';



// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email;

  setEmail(String value) {
    this.email = value;
  }

  String password;
  setPassword(String value) {
    this.password = value;
  }

  String nullValidation(String value) {
    if (value == null || value.length == 0) {
      return '*Required field';
    }
  }

  saveUser() async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      String userId =
          await AuthHelper.authHelper.login(this.email, this.password);

      UserModel userModel =
          await FirestoreHelper.firestoreHelper.deleteUserFromFirestore(userId);
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              CustomTextField('Email', setEmail, nullValidation),
              CustomTextField('Password', setPassword, nullValidation),
              Spacer(),
              ElevatedButton(
                  onPressed: () {
                    saveUser();
                  },
                  child: Text('Login'))
            ],
          ),
        ),
      ),
    );
  }
}

