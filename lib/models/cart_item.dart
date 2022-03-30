class CartItem {
  String? pizzaId;
  String? name;
  String? description;
  String? image;
  double? price;
  double? rating;
  int? quantity;
  String? size;

  CartItem({
    this.pizzaId,
    this.name,
    this.description,
    this.image,
    this.price,
    this.rating,
    this.quantity,
    this.size,
  });

  CartItem.fromJson(Map<String, dynamic> json) {
    pizzaId = json['pizzaId'];
    name = json['name'];
    description = json['description'];
    image = json['image'];
    price = json['price'];
    rating = json['rating'];
    quantity = json['quantity'];
    size = json['size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pizzaId'] = this.pizzaId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['price'] = this.price;
    data['rating'] = this.rating;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    return data;
  }
}
