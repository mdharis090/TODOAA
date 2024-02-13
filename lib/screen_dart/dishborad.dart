import 'package:flutter/material.dart';

class DishboradScreen extends StatefulWidget {
  const DishboradScreen({Key? key}) : super(key: key);

  @override
  State<DishboradScreen> createState() => _DishboradScreenState();
}

class _DishboradScreenState extends State<DishboradScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DishBorad"),
        centerTitle: true,
        actions: const [Icon(Icons.person), Icon(Icons.logout)],
      ),
    );
  }
}
