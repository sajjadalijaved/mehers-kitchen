import 'dart:convert';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';
import 'package:mehers_kitchen/modelclasses/confirm_order_page.dart';
import 'package:mehers_kitchen/modelclasses/proceed_to_checkout_model.dart';
import 'package:mehers_kitchen/modelclasses/product_by_id.dart';
import 'package:mehers_kitchen/modelclasses/sign_in_user.dart';
import 'package:mehers_kitchen/modelclasses/sign_in_with_google.dart';
import 'package:mehers_kitchen/modelclasses/sign_up.dart';

Future<Map<String, dynamic>> signInUser(SignInUserModel model) async {
  var baseURL = "https://food.elms.pk/api/FoodDelivery/PublicCheckLogin";
  Response response = await post(
    Uri.parse(baseURL),
    body: jsonEncode(
      {'email': model.email!, 'password': model.password!},
    ),
    headers: {HttpHeaders.contentTypeHeader: 'application/json'},
  );
  Map<String, dynamic> data = jsonDecode(response.body);

  return data;
}

Future<Map<String, dynamic>> signUpUser(SignUpUserModel model) async {
  var baseUrl = "https://food.elms.pk/api/FoodDelivery/PublicInsertClient";
  Response response = await post(Uri.parse(baseUrl),
      body: jsonEncode({
        'email': model.email,
        'password': model.password,
        'displayName': model.displayName,
        'loginBy': model.loginBy
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  final stringResponseCode = response.body;
  Map<String, dynamic> data = jsonDecode(stringResponseCode);
  return data;
}

Future<UserCredential> signInWithWithGoogle() async {
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  final GoogleSignInAuthentication? googleAuth =
      await googleUser?.authentication;
  final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);
  return await FirebaseAuth.instance.signInWithCredential(credential);
}

Future<Map<String, dynamic>> signInWithGoogleThroughApiService(
    SignInWithGoogleModel model) async {
  var baseURL =
      "https://food.elms.pk/api/FoodDelivery/PublicCheckLoginForGoogle";
  UserCredential userCredential = await signInWithWithGoogle();
  String? email = userCredential.user!.email;
  Response response = await post(Uri.parse(baseURL),
      body: jsonEncode(
        {'email': email, 'loginBy': model.loginBy},
      ),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});

  final stringResponseCode = response.body;
  Map<String, dynamic> data = jsonDecode(stringResponseCode);
  return data;
}

Future<Map<String, dynamic>> checkEmail(SignUpUserModel model) async {
  var baseUrl = "https://food.elms.pk/api/FoodDelivery/PublicCheckEmail";
  Response response = await post(Uri.parse(baseUrl),
      body: jsonEncode({'email': model.email}),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  Map<String, dynamic> data = jsonDecode(response.body);
  return data;
}

Future<List<ProductByIdModel>> getProductList() async {
  var baseURL = "https://food.elms.pk/api/FoodProduct/PublicGetProductList";
  Response response = await get(Uri.parse(baseURL));
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);
    return data.map((e) => ProductByIdModel.fromJson(e)).toList();
  }
  return [];
}

Future<Map<String, dynamic>> proceedToCheckOutOrder(
    List<ProceedToCheckOutModel> list) async {
  var baseURL =
      'https://food.elms.pk/api/FoodDelivery/PublicInsertFoodOrderDetail';
  List<Map<String, dynamic>> ls = list.map((e) => e.toMap()).toList();
  Response response = await post(Uri.parse(baseURL),
      body: jsonEncode(ls),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  Map<String, dynamic> data = jsonDecode(response.body);
  return data;
}

Future<List<ProductByIdModel>> getProductById(int categoryId) async {
  Response response = await get(Uri.parse(
      'https://food.elms.pk/api/FoodProduct/PublicGetProductListByCategoryId ?CategoryId=$categoryId'));
  if (response.statusCode == 200) {
    List data = jsonDecode(response.body);

    return data.map((e) => ProductByIdModel.fromJson(e)).toList();
  }
  return [];
}

Future<Map<String, dynamic>> confirmOrder(ConfirmOrderModel model) async {
  var baseUrl = "https://food.elms.pk/api/FoodDelivery/PublicInsertFoodOrder";
  Response response = await post(Uri.parse(baseUrl),
      body: jsonEncode({
        'ClientId': model.clientId,
        'OrderTotalAmount': model.orderTotalAmount,
        'OrderAmount': model.orderAmount,
        'TaxAmount': model.taxAmount,
        'OrderDescription': model.orderDescription,
        'DeliveryAddress': model.deliveryCharges,
        'DeliveryPhoneNumber': model.deliveryPhoneNumber,
        'TaxPercentage': model.taxPercentage,
        'DeliveryCharges': model.deliveryCharges
      }),
      headers: {HttpHeaders.contentTypeHeader: 'application/json'});
  Map<String, dynamic> data = jsonDecode(response.body);
  return data;
}

Future<Position> getUserCurrentLocation() async {
  await Geolocator.requestPermission()
      .then((value) {})
      .onError((error, stackTrace) {});
  return await Geolocator.getCurrentPosition();
}
