import 'package:tradegood/API/getProductById.dart';

Future calculateCartSum(var data) async{
  var productData;
  double cartSum=0;
  for(int i=0;i<data['cart']['cartItems'].length;i++)
  {
    print(data['cart']['cartItems'].length);
    cartSum =cartSum + (data['cart']['cartItems'][i]['product']['ptr']*(data['cart']['cartItems'][i]['quantity']));
  }
  print(cartSum);
  return cartSum;
}