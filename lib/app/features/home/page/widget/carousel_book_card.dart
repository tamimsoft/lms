import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lms/app/common/data/model/slide.dart';
import 'package:lms/app/common/widget/custom_network_image.dart';
import 'package:lms/app/config/routes/routes_name.dart';

class CarouselBookCard extends StatelessWidget {
  const CarouselBookCard({super.key, required this.slide});

  final Slide slide;

  @override
  Widget build(BuildContext context) {
    //return Text('data');
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.theme.colorScheme.inversePrimary.withAlpha(128),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          _coverImage(),
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _title(),
                _author(),
                _rating(),
                const SizedBox(height: 4),
                _description(),
                const SizedBox(height: 8),
                _borrowButton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _coverImage() {
    return SizedBox(
      width: 80,
      height: 120,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomNetworkImage(imageUrl: slide.coverUrl),
      ),
    );
  }

  Widget _title() {
    return Text(
      slide.title,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }

  Widget _author() {
    return Expanded(
      child: Text(
        slide.authors.join(', '),
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 13),
      ),
    );
  }

  Widget _rating() {
    return Row(
      children: [
        const Icon(Icons.star, size: 16, color: Colors.amber),
        const SizedBox(width: 4),
        Text(slide.avgRating.toStringAsFixed(1)),
      ],
    );
  }

  Widget _description() {
    return Expanded(
      child: Text(
        slide.shortDescription,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _borrowButton() {
    return SizedBox(
      width: 150,
      child: FilledButton.icon(
        onPressed: () {
          Get.toNamed('${RoutesName.bookDetail}/${slide.id}');
        },
        icon: const Icon(Icons.menu_book, size: 16),
        label: const Text("Read Now"),
      ),
    );
  }
}
