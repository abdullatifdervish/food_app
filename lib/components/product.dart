

class Product {
  final String name;
  final String imagePath;
  final double price;
  int quantity; // Her ürünün kendi adetini burada tutuyoruz!

  Product({
    required this.name,
    required this.imagePath,
    required this.price,
    this.quantity = 0, // Başlangıçta sepette 0 adet var
  });
}