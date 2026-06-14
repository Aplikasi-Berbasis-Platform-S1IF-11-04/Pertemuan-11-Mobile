class Product {
  final String sku;
  final String title;
  final int stock;
  final double price;
  final String category;

  const Product({
    required this.sku,
    required this.title,
    required this.stock,
    required this.price,
    required this.category,
  });

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      sku: map['sku'] ?? '',
      title: map['title'] ?? '',
      stock: map['stock'] ?? 0,
      price: (map['price'] as num).toDouble(),
      category: map['category'] ?? 'Umum',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'sku': sku,
      'title': title,
      'stock': stock,
      'price': price,
      'category': category,
    };
  }
}