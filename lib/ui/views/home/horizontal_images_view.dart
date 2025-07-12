import 'package:flutter/material.dart';

class HorizontalImageCards extends StatelessWidget {
  final List<String> imagePaths;
  final List<String> titles;
  final double? height;
  final double cardWidth;
  final EdgeInsets? padding;
  final Function(int)? onTap;

  const HorizontalImageCards({
    super.key,
    this.imagePaths = const [
      'assets/iced_americano.jpg',
      'assets/espresso.jpg',
      'assets/nutella_pancake.jpg',

    ],
    this.titles = const [
      'Nutella Pancake',
      'Iced Americano',
      'Espresso',
    ],
    this.height = 200,
    this.cardWidth = 300,
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.onTap,
  }) : assert(imagePaths.length == titles.length);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: padding,
        itemCount: imagePaths.length,
        itemBuilder: (context, index) => _ImageCard(
          width: cardWidth,
          imagePath: imagePaths[index],
          title: titles[index],
          onTap: () => onTap?.call(index),
        ),
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  final double width;
  final String imagePath;
  final String title;
  final VoidCallback? onTap;

  const _ImageCard({
    required this.width,
    required this.imagePath,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: width,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
          ),
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 6,
                    color: Colors.black54,
                    offset: Offset(1, 1),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}