import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PNetworkImage extends StatelessWidget {
  const PNetworkImage(this.imageUrl, {super.key, this.radius = 10});

  final String imageUrl;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          CircularProgressIndicator(value: downloadProgress.progress),
      imageBuilder: (context, imageProvider) => Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          image: DecorationImage(
            image: imageProvider,
            fit: BoxFit.cover,
            colorFilter: const ColorFilter.mode(
              Colors.red,
              BlendMode.colorBurn,
            ),
          ),
        ),
      ),
    );
  }
}
