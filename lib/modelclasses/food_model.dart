// ignore_for_file: constant_identifier_names

class FoodModelData {
  String? productId;
  double? price;
  double? singleItemPrice;
  int? quantity;
  String? pictureUrl;
  String? productName;
  double? subTotalPrice;
  double? salesTax;
  double? deliveryCharges;
  double? totalPrice;

  static const String dbname = "foodModel.db";
  static const String table_name = "foodModel_tb";

  static const String key_ProductId = 'productId';
  static const String key_Price = 'price';
  static const String key_Quantity = 'quantity';
  static const String key_PictureUrl = 'pictureUrl';
  static const String key_ProductName = 'productName';
  static const String key_SubTotalPrice = 'subTotalPrice';
  static const String key_SalesTax = 'salesTax';
  static const String key_DeliveryCharges = 'deliveryCharges';
  static const String key_TotalPrice = 'totalPrice';
  static const String key_SingleItemPrice = 'singleItemPrice';

  static const String create_table =
      'CREATE TABLE  $table_name($key_ProductId TEXT PRIMARY KEY, $key_ProductName TEXT, $key_Price REAL, $key_Quantity INTEGER, $key_PictureUrl TEXT, $key_SalesTax REAL, $key_DeliveryCharges REAL, $key_SubTotalPrice REAL, $key_TotalPrice REAL, $key_SingleItemPrice REAL)';
  static const String drop_table = 'DROP TABLE IF EXISTS $table_name';

  static const String fetch_data = 'SELECT *FROM $table_name';

  FoodModelData(
      {this.productId,
      this.price,
      this.quantity,
      this.pictureUrl,
      this.productName,
      this.subTotalPrice,
      this.salesTax,
      this.deliveryCharges,
      this.totalPrice,
      this.singleItemPrice});

  Map<String, dynamic> toMap(FoodModelData model) {
    return {
      FoodModelData.key_ProductId: model.productId,
      FoodModelData.key_Price: model.price,
      FoodModelData.key_Quantity: model.quantity,
      FoodModelData.key_PictureUrl: model.pictureUrl,
      FoodModelData.key_ProductName: model.productName,
      FoodModelData.key_SubTotalPrice: model.subTotalPrice,
      FoodModelData.key_SalesTax: model.salesTax,
      FoodModelData.key_DeliveryCharges: model.deliveryCharges,
      FoodModelData.key_TotalPrice: model.totalPrice,
      FoodModelData.key_SingleItemPrice: model.singleItemPrice,
    };
  }

  FoodModelData.fromMap(Map<String, dynamic> map) {
    productId = map['productId'];
    price = map['price'];
    quantity = map['quantity'];
    pictureUrl = map['pictureUrl'];
    productName = map['productName'];
    subTotalPrice = map['subtotalPrice'];
    salesTax = map['salesTax'];
    deliveryCharges = map['deliveryCharges'];
    totalPrice = map['totalPrice'];
    singleItemPrice = map['singleItemPrice'];
  }
}
