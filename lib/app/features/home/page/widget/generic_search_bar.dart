import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GenericSearchBar extends StatelessWidget {
  const GenericSearchBar({super.key, this.padding = 16.0});

  final double padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
          ),

          hintText: 'Search',
          helperStyle: const TextStyle(fontWeight: FontWeight.w300),
          prefixIcon: const Icon(LucideIcons.search),
        ),
        onTapOutside: (event) {
          FocusScope.of(context).unfocus();
        },
      ),
    );
  }
}
