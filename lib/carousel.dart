import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:packages/network_image.dart';

class PCarousel extends StatefulWidget {
  const PCarousel({
    super.key,
    this.aspectRatio = 1,
    required this.images,
  });

  final List<String> images;
  final double aspectRatio;

  @override
  State<PCarousel> createState() => _PCarouselState();
}

class _PCarouselState extends State<PCarousel> {
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.images.length,
          itemBuilder: (context, index, realIndex) {
            final file = widget.images[index];
            return PNetworkImage(file);
          },
          options: CarouselOptions(
            viewportFraction: 1,
            autoPlay: true,
            aspectRatio: widget.aspectRatio,
            onPageChanged: (index, reason) => setState(() => current = index),
          ),
        ),
        const SizedBox(height: 10),
        CarouselIndicator(
          color: Colors.grey,
          activeColor: Colors.black,
          count: widget.images.length,
          index: current,
        ),
      ],
    );
  }
}
