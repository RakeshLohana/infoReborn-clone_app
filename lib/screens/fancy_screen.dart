import 'package:bet_app/widgets/fancy.dart';
import 'package:flutter/material.dart';

class FancyScreen extends StatefulWidget {
  const FancyScreen({super.key});

  @override
  State<FancyScreen> createState() => _FancyScreenState();
}

class _FancyScreenState extends State<FancyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Fancy()
    );
  }
}