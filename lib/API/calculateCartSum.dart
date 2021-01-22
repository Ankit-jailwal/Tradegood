import 'package:tradegood/API/getProductById.dart';

Future calculateCartSum(var data) async{
  var productData;
  double cartSum=0;
  for(int i=0;i<data['cart']['cartItems'].length;i++)
  {
    print(data['cart']['cartItems'].length);
    productData = await getProductByID(data['cart']['cartItems'][i]['product']);
    print(data['cart']['cartItems'][i]['quantity']);
    print(productData['product'][0]['quantity']);
    cartSum =cartSum + (productData['product'][0]['ptr']*(data['cart']['cartItems'][i]['quantity']));
  }
  print(cartSum);
  return cartSum;
}