import 'package:flutter/material.dart';

class CenteredCircularProgressIndcutor extends StatelessWidget {
  const CenteredCircularProgressIndcutor({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}