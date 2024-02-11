class CartModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? image;
  int? subtotalPerItem;

  CartModel({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.subtotalPerItem,
  });

  Map<String, dynamic> toMap() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['quantity'] = quantity;
    data['image'] = image;
    data['subtotal'] = subtotalPerItem;
    return data;
  }

  factory CartModel.fromMap(Map<String, dynamic> map) {
    return CartModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      image: map['image'],
      subtotalPerItem: map['subtotalPerItem'],
    );
  }
}
