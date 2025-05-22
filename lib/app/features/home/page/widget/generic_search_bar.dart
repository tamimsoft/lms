import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class GenericSearchBar extends StatelessWidget {
  final TextEditingController? controller;
  final String hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final double padding;
  final bool autoFocus;

  const GenericSearchBar({
    super.key,
    this.controller,
    this.hintText = 'Search...',
    this.onChanged,
    this.onClear,
    this.padding = 16,
    this.autoFocus = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding),
      child: Material(
        elevation: 0.5,
        borderRadius: BorderRadius.circular(12),
        child: TextFormField(
          autofocus: autoFocus,
          controller: controller,
          onChanged: onChanged,
          decoration: InputDecoration(
            hintText: hintText,
            prefixIcon: const Icon(LucideIcons.search),
            suffixIcon:
                controller != null && controller!.text.isNotEmpty
                    ? IconButton(
                      icon: const Icon(LucideIcons.removeFormatting),
                      onPressed: () {
                        controller?.clear();
                        onClear?.call();
                      },
                    )
                    : null,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: theme.cardColor,
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
          ),
        ),
      ),
    );
  }
}
