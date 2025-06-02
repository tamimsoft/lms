import 'package:flutter/material.dart';

class MenuItem {
  final IconData icon;
  final String label;
  final String route;
  final bool danger;

  MenuItem({
    required this.icon,
    required this.label,
    required this.route,
    this.danger = false,
  });
}
