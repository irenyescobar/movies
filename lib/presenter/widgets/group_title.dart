import 'package:flutter/material.dart';

class GroupTitle extends StatelessWidget {
  final String title;
  const GroupTitle({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Text(title,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: Colors.black)));
  }
}
