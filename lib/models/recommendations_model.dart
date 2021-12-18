class Recommendations {
  String name;
  String imageUrl;
  int color;
  double price;

  Recommendations({
    required this.name,
    required this.imageUrl,
    required this.color,
    required this.price,
  });
}

List<Recommendations> recommendations = [
  Recommendations(
    name: 'BODYCON DRESS',
    imageUrl: 'assets/images/1.jpg',
    color: 4,
    price: 450.00,
  ),
  Recommendations(
    name: 'HALTER DRESS',
    imageUrl: 'assets/images/2.jpg',
    color: 4,
    price: 150.00,
  ),
  Recommendations(
    name: 'NATE DRESS',
    imageUrl: 'assets/images/3.jpg',
    color: 4,
    price: 550.00,
  ),
  Recommendations(
    name: 'LEWIS DRESS',
    imageUrl: 'assets/images/4.jpg',
    color: 4,
    price: 250.00,
  ),
  Recommendations(
    name: 'TAMARA DRESS',
    imageUrl: 'assets/images/5.jpg',
    color: 4,
    price: 950.00,
  ),
  Recommendations(
    name: 'BELLA DRESS',
    imageUrl: 'assets/images/6.jpg',
    color: 4,
    price: 550.00,
  ),
];
