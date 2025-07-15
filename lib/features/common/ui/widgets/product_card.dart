import 'package:flutter/material.dart';

import '../../../../app/app_colors.dart';
import '../../../../app/asset_paths.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: AppColors.themeColor.withOpacity(0.1),
              offset: Offset(0.0, 0.7),
              blurRadius: 7,
            )
          ]),
      child: Column(
        children: [
          Container(
            width: 140,
            decoration: BoxDecoration(
              color: AppColors.themeColor.withOpacity(0.1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16),
                topRight: Radius.circular(16),
              ),
            ),
            padding: EdgeInsets.all(16),
            child: Image.asset(
              AssetPaths.dummyNikeShoePng,
              height: 80,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  'Nike ER345T - New Model Of 2025',
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black54,
                      fontWeight: FontWeight.w600),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '৳100',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: AppColors.themeColor,
                      ),
                    ),
                    Wrap(
                      children: [
                        Icon(
                          Icons.star,
                          size: 18,
                          color: Colors.amber,
                        ),
                        Text(
                          '4.5',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    Card(
                      color: AppColors.themeColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(2)),
                      child: Padding(
                        padding: const EdgeInsets.all(2),
                        child: Icon(
                          Icons.favorite_outline_rounded,
                          size: 18,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
