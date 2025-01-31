import 'package:bookly_app/Core/widgets/custom_loading_indecator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.imageUrl});
  final String? imageUrl;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: AspectRatio(
          aspectRatio: 3 / 4,
          child: CachedNetworkImage(
            imageUrl: imageUrl!,
            fit: BoxFit.fill,
            placeholder: (context, url) => const CustomLoadingIndecator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          )),
    );
  }
}
