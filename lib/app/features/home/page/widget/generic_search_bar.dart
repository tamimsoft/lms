import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GenericSearchBar extends StatelessWidget {
  const GenericSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SearchBar(
        padding: const WidgetStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 8.0),
        ),
        elevation: const WidgetStatePropertyAll(0),
        leading: const Icon(LucideIcons.search),
        hintText: 'Search',
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
