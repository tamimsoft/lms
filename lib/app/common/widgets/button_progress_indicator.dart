import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonProgressIndicator extends StatelessWidget {
  const ButtonProgressIndicator({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 24,
      height: 24,
      child: Platform.isIOS
          ? CupertinoActivityIndicator(
              color: Colors.white,
            )
          : CircularProgressIndicator(
              color: color ?? Colors.white,
              strokeWidth: 2,
            ),
    );
  }
}
