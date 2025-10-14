class ProductModel {
  final String id;
  final String title;
  final int currentPrice;
  final List<String> photoUrls;

  ProductModel(
      {required this.id,
      required this.title,
      required this.currentPrice,
      required this.photoUrls});

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    // Handle potential null values and provide defaults
    final id = jsonData['_id'] as String? ?? '';
    final title = jsonData['title'] as String? ?? 'Untitled Product';
    final currentPrice = jsonData['current_price'] as int? ??
        jsonData['regular_price'] as int? ??
        0;
    final photos = jsonData['photos'] as List? ?? [];

    return ProductModel(
      id: id,
      title: title,
      currentPrice: currentPrice,
      photoUrls:
          photos.map((e) => e.toString()).where((e) => e.isNotEmpty).toList(),
    );
  }
}
