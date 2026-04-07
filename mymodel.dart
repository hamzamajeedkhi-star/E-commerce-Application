class Shoe {
  int? id;
  String image;
  String price;
  String name;
  int quantity;

  Shoe({
    this.id,
    required this.image,
    required this.price,
    required this.name,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'image': image,
      'price': price,
      'name': name,
      'quantity': quantity,
    };
  }

  factory Shoe.fromMap(Map<String, dynamic> map) {
    return Shoe(
      id: map['id'],
      image: map['image'],
      price: map['price'],
      name: map['name'],
      quantity: map['quantity'] ?? 1,
    );
  }
}