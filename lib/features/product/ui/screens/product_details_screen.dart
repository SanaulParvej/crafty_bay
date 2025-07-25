import 'package:crafty_bay/app/app_colors.dart';
import 'package:crafty_bay/features/product/ui/screens/review_screen.dart';
import 'package:crafty_bay/features/product/ui/widgets/color_picker.dart';
import 'package:crafty_bay/features/product/ui/widgets/inc_dec_button.dart';
import 'package:crafty_bay/features/product/ui/widgets/product_image_slider.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants.dart';
import '../widgets/size_picker.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.productId});

  static const String name = '/product-details';

  final String productId;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ProductImageSlider(),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                'Nike 1204HST - new shoe of 2025',
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  letterSpacing: 0.6,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                            IncDecButton(
                              onChange: (int value) {},
                            ),
                          ],
                        ),
                        Row(
                          children: [
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
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, ReviewScreen.name);
                              },
                              child: Text('Review'),
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
                            ),
                          ],
                        ),
                        Text(
                          'Color',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        ColorPicker(
                          colors: [
                            'Black',
                            'Red',
                            'Blue',
                            'white',
                          ],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Size',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        SizePicker(
                          sizes: [
                            'S',
                            'M',
                            'L',
                            'XL',
                            'XXL',
                          ],
                          onSelected: (String value) {},
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Description',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '''Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.''',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _buildPriceAndAddToCartSection()
        ],
      ),
    );
  }

  Widget _buildPriceAndAddToCartSection() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: AppColors.themeColor.withOpacity(0.2),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(16),
            topRight: Radius.circular(16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                'Price',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Text(
                '${Constants.takaSign}100',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.themeColor),
              ),
            ],
          ),
          SizedBox(
              width: 120,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Add to cart')))
        ],
      ),
    );
  }
}
