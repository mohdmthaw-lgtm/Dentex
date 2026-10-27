import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'full_screen_image_viewer.dart';

/// Small rounded product image used everywhere a product/variant name is
/// listed (cart lines, order details, offer contents, pickers, best-sellers)
/// so a product is never identified by text alone. Falls back to a generic
/// inventory icon when no image is available, rather than collapsing to
/// nothing, so list rows keep a consistent leading-icon width. Tapping an
/// available image opens it full-screen with pinch-to-zoom.
class ProductThumbnail extends StatelessWidget {
  const ProductThumbnail({super.key, required this.imageUrl, this.size = 44});

  final String imageUrl;
  final double size;

  @override
  Widget build(BuildContext context) {
    final thumbnail = ClipRRect(
      borderRadius: BorderRadius.circular(8),
      child: SizedBox(
        width: size,
        height: size,
        child: imageUrl.isEmpty
            ? Container(
                color: Colors.grey.shade200,
                child: Icon(Icons.inventory_2_outlined,
                    color: Colors.grey, size: size * 0.5),
              )
            : CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(color: Colors.grey.shade100),
                errorWidget: (context, url, error) => Container(
                  color: Colors.grey.shade200,
                  child: Icon(Icons.inventory_2_outlined,
                      color: Colors.grey, size: size * 0.5),
                ),
              ),
      ),
    );

    if (imageUrl.isEmpty) return thumbnail;
    return GestureDetector(
      onTap: () => showFullScreenImage(context, imageUrl),
      child: thumbnail,
    );
  }
}
