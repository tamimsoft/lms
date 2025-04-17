import 'package:flutter/material.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({this.text = 'or continue with', super.key});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
        ),
        const Expanded(child: Divider(thickness: 1, color: Colors.black26)),
      ],
    );
  }
}
