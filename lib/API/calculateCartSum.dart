Future calculateCartSum(var data) async{
  double cartSum=0;
  for(int i=0;i<data['cart']['cartItems'].length;i++)
  {
    cartSum =cartSum + ((data['cart']['cartItems'][i]['product']['ptr'])*(data['cart']['cartItems'][i]['quantity'])).round();
  }
  return cartSum;
}