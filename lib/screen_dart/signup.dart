import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  late TextEditingController namec, emailc, passwordc, mobilec;
  String? slectgender;
  @override
  void initState() {
    namec = TextEditingController();
    emailc = TextEditingController();
    passwordc = TextEditingController();
    mobilec = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    namec.dispose();
    emailc.dispose();
    passwordc.dispose();
    mobilec.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Signup"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView(
            children: [
              TextField(
                controller: namec,
                decoration: InputDecoration(
                    hintText: "NAME ", border: OutlineInputBorder()),
              ),
              Gap(30),
              TextField(
                controller: emailc,
                decoration: const InputDecoration(
                    hintText: "Emaill ", border: OutlineInputBorder()),
              ),
              Gap(30),
              TextField(
                controller: passwordc,
                decoration: const InputDecoration(
                    hintText: "password ", border: OutlineInputBorder()),
              ),
              Gap(30),
              TextField(
                controller: mobilec,
                decoration: const InputDecoration(
                    hintText: "Mobilenumber  ", border: OutlineInputBorder()),
              ),
              CupertinoSegmentedControl<String>(
                  groupValue: slectgender,
                  children: const {
                    'male ': Text("MALE"),
                    'Female': Text("Female")
                  },
                  onValueChanged: (newvalue) {
                    setState(() {
                      slectgender = newvalue;
                    });
                  }),
              ElevatedButton(
                  onPressed: () async {
                    try {
                      FirebaseAuth auth = FirebaseAuth.instance;
                      UserCredential? userCredential =
                          await auth.createUserWithEmailAndPassword(
                              email: emailc.text.trim(),
                              password: passwordc.text.trim());
                      if (userCredential.user != null) {
                        Fluttertoast.showToast(msg: 'Success', fontSize: 30);
                      } else {
                        Fluttertoast.showToast(msg: 'faild', fontSize: 30);
                      }
                    } on FirebaseAuthException catch (e) {
                      print(e);
                      print(e.message);
                      Fluttertoast.showToast(msg: e.message!, fontSize: 30);
                    }
                  },
                  child: const Text("Regester")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Already regiester? login  '))
            ],
          ),
        ));
  }
}
