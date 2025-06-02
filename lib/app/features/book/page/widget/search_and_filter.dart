import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/tag.dart';
import 'package:lms/app/features/home/controller/tag_controller.dart';
import 'package:lms/app/features/home/page/widget/generic_search_bar.dart';

class SearchAndFilterBar extends StatelessWidget {
  final String selectedValue;
  final Function(String?) onChanged;

  const SearchAndFilterBar({
    super.key,
    required this.selectedValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    TagController tagController = TagController.instance;
    List<Tag> tags = tagController.tags;
    return Row(
      children: [
        // Search Bar
        const SizedBox(width: 16),
        Expanded(flex: 3, child: GenericSearchBar(padding: 0)),

        // Dropdown
        const SizedBox(width: 8),
        Expanded(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: context.theme.cardColor,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: selectedValue,
                  onChanged: onChanged,
                  isExpanded: true,
                  menuMaxHeight: 300,
                  icon: const Icon(Icons.keyboard_arrow_down),

                  items: [
                    DropdownMenuItem(value: '0', child: Text('All')),
                    for (var tag in tags)
                      DropdownMenuItem(value: tag.id, child: Text(tag.name)),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
      ],
    );
  }
}
