import 'package:crafty_bay/app/constants.dart';
import 'package:crafty_bay/features/common/models/product_model.dart';
import 'package:flutter/material.dart';
import '../../../../app/app_colors.dart';
import '../../../product/ui/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.productModel,
  });

  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, ProductDetailsScreen.name,
            arguments: productModel.id);
      },
      child: Container(
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
              child: productModel.photoUrls.isNotEmpty
                  ? Image.network(
                      productModel.photoUrls.first,
                      height: 80,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        // Fallback widget if image fails to load
                        return Icon(
                          Icons.image_not_supported,
                          size: 40,
                          color: Colors.grey,
                        );
                      },
                    )
                  : Icon(
                      Icons.image_not_supported,
                      size: 40,
                      color: Colors.grey,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text(
                    productModel.title,
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
                        '${Constants.takaSign}${productModel.currentPrice}',
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
      ),
    );
  }
}
