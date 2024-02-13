import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:todoaa/screen_dart/dishborad.dart';
import 'package:todoaa/screen_dart/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController emailc, passwordc;
  @override
  void initState() {
    emailc = TextEditingController();
    passwordc = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    emailc.dispose();
    passwordc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login "),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: emailc,
              decoration: InputDecoration(
                hintText: "Emaill",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const Gap(20),
            TextField(
              controller: passwordc,
              decoration: InputDecoration(
                  hintText: "Password",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const Gap(20),
            ElevatedButton(
                onPressed: () async {
                  try {
                    FirebaseAuth auth = FirebaseAuth.instance;
                    UserCredential userCredential =
                        await auth.signInWithEmailAndPassword(
                            email: emailc.text.trim(),
                            password: passwordc.text.trim());
                    if (userCredential.user != null) {
                    } else {}
                  } on FirebaseAuthException catch (e) {
                    print(e);
                  }
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return DishboradScreen();
                  }));
                },
                child: Text("LOGIN")),
            const Gap(20),
            TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return SignupScreen();
                  }));
                },
                child: const Text("Not Register Yet? signup"))
          ],
        ),
      ),
    );
  }
}
