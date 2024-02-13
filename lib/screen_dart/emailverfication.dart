import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:todoaa/screen_dart/dishborad.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({Key? key}) : super(key: key);

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  bool emailverfication = false;
  Timer? timer;
  @override
  void initState() {
    FirebaseAuth.instance.currentUser!.sendEmailVerification();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      verficationcheck();
    });
    super.initState();
  }

  verficationcheck() {
    if (FirebaseAuth.instance.currentUser!.emailVerified) {
      timer?.cancel();
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) {
        return const DishboradScreen();
      }));
    }
    ;
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text(
            "verify email \n An email has been send ${FirebaseAuth.instance.currentUser!.email}"),
        const SizedBox(
          height: 20,
        ),
        const Text("plz it  verify "),
        const Gap(20),
        const SpinKitCubeGrid(
          color: Colors.blue,
        ),
        const Gap(20),
        ElevatedButton(
            onPressed: () {
              FirebaseAuth.instance.currentUser!.sendEmailVerification();
            },
            child: const Text('Resend  Email'))
      ],
    );
  }
}
