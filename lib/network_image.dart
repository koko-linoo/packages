import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PNetworkImage extends StatelessWidget {
  const PNetworkImage(this.imageUrl, {super.key});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      progressIndicatorBuilder: (context, url, progress) {
        return const CircularProgressIndicator();
      },
    );
  }
}
