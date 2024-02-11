class TransactionModel {
  int? id;
  String? name;
  int? price;
  int? quantity;
  String? image;
  int? subtotalPerItem;

  TransactionModel({
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

  factory TransactionModel.fromMap(Map<String, dynamic> map) {
    return TransactionModel(
      id: map['id'],
      name: map['name'],
      price: map['price'],
      quantity: map['quantity'],
      image: map['image'],
      subtotalPerItem: map['subtotalPerItem'],
    );
  }
}
