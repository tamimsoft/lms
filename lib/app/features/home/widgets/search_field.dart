import 'package:lms/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: SearchBar(
        hintText: 'Search',
        elevation: WidgetStateProperty.all(0),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        onTap: () {
          // Handle search bar tap
        },
        onChanged: (value) {
          // Handle search bar text change
        },
        leading: IconButton(
          color: AppColors.primary,
          icon: const Icon(Icons.search),
          onPressed: () {
            // Handle filter button press
          },
        ),
        trailing: [
          IconButton(
            icon: const Icon(Icons.filter_alt_outlined),
            onPressed: () {
              // Handle search button press
            },
          ),
        ],
      ),
    );
  }
}
