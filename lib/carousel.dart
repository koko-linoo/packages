import 'package:carousel_indicator/carousel_indicator.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:packages/network_image.dart';
import 'package:photo_view/photo_view.dart';

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
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PImageViewer(
                      index: index,
                      images: widget.images,
                    ),
                  ),
                );
              },
              child: PNetworkImage(file),
            );
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

class PImageViewer extends StatelessWidget {
  const PImageViewer({
    super.key,
    required this.index,
    required this.images,
  });

  final int index;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: PageView.builder(
        controller: PageController(initialPage: index),
        itemCount: images.length,
        itemBuilder: (context, index) => PhotoView(
          backgroundDecoration: const BoxDecoration(color: Colors.white),
          imageProvider: NetworkImage(
            images[index],
          ),
        ),
      ),
    );
  }
}
