class Product {
  final int id;
  final String name;
  final int price;

  // Constructor
  const Product({required this.id, required this.name, required this.price});

  // Factory method untuk mengubah JSON menjadi Object Product
  // Sesuai dengan instruksi tugas nomor 9
  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] as int,
      name: json['name'] as String,
      price: json['price'] as int,
    );
  }
}
