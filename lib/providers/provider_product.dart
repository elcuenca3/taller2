class ProductDataModel{
  final int id;
  final String name;
  final String category;
  final String imageURL;
  final String oldPrice;
  final String price;

  const ProductDataModel({
        required this.id,
        required this.name,
        required this.category,
        required this.imageURL,
        required this.oldPrice,
        required this.price
      });
  factory ProductDataModel.fromJson(Map<String, dynamic> json) {
    return ProductDataModel(
      id: json['is'],
      name :json['name'],
      category : json['category'],
      imageURL : json['imageUrl'],
      oldPrice : json['oldPrice'],
      price : json['price'],
    );
  }
}

/*
factory ProductDataModel.fromJson(Map<String,dynamic> json){
    return ProductDataModel(
    id : json['id'];
    name :json['name'];
    category : json['category'];
    imageURL : json['imageUrl'];
    oldPrice : json['oldPrice'];
    price : json['price'];
    );
  }

 */

