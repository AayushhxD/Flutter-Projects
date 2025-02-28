class NysaProduct {
  final String productName;
  final String productPrice;
  final String productWeight;
  final String productId; // Changed to String for consistency
  final String productCategories;
  final String productType;
  final String imageUrl;
  final List<dynamic> relatedImageUrls;

  NysaProduct({
    required this.productName,
    required this.productPrice,
    required this.productWeight,
    required this.productId, // Ensure this is required
    required this.productCategories,
    required this.productType,
    required this.imageUrl,
    required this.relatedImageUrls,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productPrice': productPrice,
      'productWeight': productWeight,
      'productId': productId, // Correct key
      'productCategories': productCategories,
      'productType': productType,
      'imageUrl': imageUrl,
      'relatedImageUrls': relatedImageUrls.join(','),
    };
  }
}
