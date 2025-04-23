import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:transparent_image/transparent_image.dart';

import '../../resources/color_manager.dart';
import '../../resources/values_manager.dart';

class ProductImage extends StatelessWidget {
  final String photoUrl;
  const ProductImage({super.key, required this.photoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: AppMargin.m20),
      height: AppSize.s150,
      width: AppSize.s150,
      decoration: BoxDecoration(
        color: ColorManager.colorLightGray4,
        borderRadius: BorderRadius.circular(AppSize.s8),
        border:
            Border.all(width: AppSize.s1, color: ColorManager.colorLightGray4),
      ),
      child: CachedNetworkImage(
        imageUrl: photoUrl,
        placeholder: (context, url) => Image.memory(kTransparentImage),
        errorWidget: (context, url, error) => Icon(Icons.error),
        fit: BoxFit.cover,
        cacheManager: CacheManager(
          Config(
            'customCache',
            stalePeriod: const Duration(days: 7),
            maxNrOfCacheObjects: 100,
          ),
        ),
      ),
    );
  }
}
