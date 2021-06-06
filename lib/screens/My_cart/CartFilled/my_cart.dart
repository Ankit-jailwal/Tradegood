import 'package:flutter/material.dart';
import 'package:tradegood/size_config.dart';
import 'package:tradegood/screens/Wishlist/wishlist_fill/wishlist_fill.dart';
import 'package:flutter/cupertino.dart';
import 'package:tradegood/API/removeItemCart.dart';
import 'package:tradegood/API/placeOrder.dart';
import 'package:tradegood/screens/My_cart/CartEmpty/components/Body.dart';
import 'package:tradegood/API/getCart.dart';
import 'package:tradegood/API/editDeliveryDate.dart';
import 'package:tradegood/screens/Location_list/location_list.dart';
import 'package:intl/intl.dart';
import 'package:tradegood/API/updateQuantity.dart';
import 'package:tradegood/API/calculateCartSum.dart';
import 'package:toast/toast.dart';
import '../../../constants.dart';
import '../../../size_config.dart';
import 'package:tradegood/screens/additionalInfo/additionalInfo.dart';
import 'package:tradegood/screens/My_orders/my_order.dart';
import 'package:tradegood/components/internet_handler.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:tradegood/screens/My_cart/CartFilled/OrderPlaced.dart';


class cart_screen extends StatefulWidget {
  static String routeName = "/cart";

  @override
  _cart_screenState createState() => _cart_screenState();
}

class _cart_screenState extends State<cart_screen> {
  bool flag;
  bool checkCart(var data){
    if(data['cart']=="empty")
      {
        flag=false;
      }
    else if(data.length==0)
    {
      flag= false;
    }
    else if(data['cart']['cartItems'].length!=0)
    {
      flag= true;
    }
    else
      flag=false;
    return flag;
  }
  bool sumFlag=false;
  double updateCartSum=0;
  void update(bool flagUpdate) {
    setState(() => flag=flagUpdate);
  }
  var carStaticData;
  bool updateScreenFlag;
  void updateCart(bool pseudoFlag) {
    setState(() => updateScreenFlag=true);
  }
  final _formKey = GlobalKey<FormState>();
  bool check(int index, int size){
    if (index == size - 1)
      return true;
    else
      return false;
  }
  var removeCart;
  var picked;
  bool checkRoute(int index, int size){
    if (index == 0)
      return true;
    else
      return false;
  }
  bool stockFlag=true;
  bool checkAvailability(var quantity,var stock) {
    if(quantity>stock) {
      stockFlag=false;
      return false;
    }
    else {
      return true;
    }
  }
  bool updateFlag=true;
  double sumUpdate=0;
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  bool removeItemFlag=true;
  int prevQuantity=0;
  final TextEditingController quantityController = TextEditingController();
  var cartData;
  void updateSum(double sumUpdate) {
    setState(() {
    updateCartSum=sumUpdate;
        sumFlag=true;
    }
    );
  }
  bool pseudoFlag;
  Future updatePage() async{
    await Future.delayed(Duration(seconds: 2));
    setState(() {
      pseudoFlag=true;
    }
    );
  }
bool checkOrderAvailability(var productData) {
    for(int i=0;i<productData['cart']['cartItems'].length;i++)
      {
        if(productData['cart']['cartItems'][i]['product']['availableStock']<productData['cart']['cartItems'][i]['product']['minQuantity'])
          {
            return false;
          }
      }
    return true;
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_rounded,
            size: 33,
            color: Colors.white,
          ),
        ),
        title:Text("My cart",
          style: TextStyle(
            color: Colors.white,
          ),),
        actions: [
          GestureDetector(
            onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => wishListScreen()));
            },
            child: Image.asset(
              "assets/images2/406096fa0d4df7618ea2b7bd7b3b1beaa4c6b8bd.png",
              width: 33,
              height: 33,
            ),
          ),
          SizedBox(width: SizeConfig.screenWidth * 0.02,),
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => my_order()));
              },
              child: Image.asset(
                "assets/images2/order.png",
                width: 33,
                height: 33,
              ),
            ),
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Builder(
        builder: (BuildContext context) {
      return OfflineBuilder(
          connectivityBuilder: (BuildContext context,
              ConnectivityResult connectivity, Widget child) {
            final bool connected =
                connectivity != ConnectivityResult.none;
            return !connected?noInternet():RefreshIndicator(
              onRefresh: updatePage,
              child: FutureBuilder(
                  future: getCart(),
                  builder: (context, cartData) {
                    if(cartData.hasData) {
                      carStaticData=cartData.data;
                      return checkCart(cartData.data)?
                      FutureBuilder(
                          future: calculateCartSum(cartData.data),
                          builder: (context, cartSum)  {
                            if(cartSum.hasData) {
                              return Column(
                                children: [
                                  Container(
                                    height: SizeConfig.screenHeight * 0.075,
                                    decoration: BoxDecoration(color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.5),
                                              blurRadius: 5,
                                              offset: Offset(0, 3))
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 10, right: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment: MainAxisAlignment
                                                .center,
                                            children: [
                                              RichText(
                                                text: TextSpan(
                                                    text: 'Deliver to ',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 16),
                                                    children: <TextSpan>[
                                                      TextSpan(
                                                        text: cartData.data['cart']['user']['name'],
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 20,
                                                            fontWeight: FontWeight
                                                                .w800),
                                                      )
                                                    ]),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: SizeConfig.screenHeight * 0.01,
                                  ),
                                  Expanded(
                                      child: ListView.builder(
                                          itemCount: cartData.data['cart']['cartItems']
                                              .length, //list view declaration
                                          padding: EdgeInsets.only(
                                              top: 10.0, bottom: 15.0),
                                          itemBuilder: (BuildContext context, int index) {
                                            return Column(
                                              children: [
                                                checkRoute(index, cartData.data['cart']['cartItems'].length)?Column(
                                                    children: [
                                                    Padding(
                                                      padding: const EdgeInsets.only(left: 5, right: 5),
                                                      child: Container(
                                                        width: SizeConfig.screenWidth,
                                                        decoration: BoxDecoration(color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                  color: Colors.grey.withOpacity(0.5),
                                                                  blurRadius: 5,
                                                                  offset: Offset(0, 3))
                                                            ]),
                                                        child: Padding(
                                                          padding: EdgeInsets.only(left: 10, right: 10),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            crossAxisAlignment: CrossAxisAlignment.end,
                                                            children: [
                                                              Column(
                                                                crossAxisAlignment: CrossAxisAlignment
                                                                    .start,
                                                                mainAxisAlignment: MainAxisAlignment
                                                                    .center,
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      cartData.data['cart']['user']['route']!=null?Text(picked==null?cartData.data['cart']['user']['route']['day']:DateFormat('EEEE').format(picked), style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 18,
                                                                          fontWeight: FontWeight.w800),):Container(),
                                                                      cartData.data['cart']['user']['route']!=null?Row(
                                                                        children: [
                                                                          cartData.data['cart']['user']['route']!=null?Text(
                                                                            "Delivery on: ${picked==null?DateFormat('d MMM, yy').format(DateTime.parse(cartData.data['cart']['user']['route']['deliveryDate']),):DateFormat('d MMM, yy').format(picked,)}",
                                                                            style: TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 14,
                                                                            ),):Container(),
                                                                          GestureDetector(
                                                                              onTap: ()async{
                                                                                final DateTime selected = await showDatePicker(
                                                                                  helpText: "Choose Customized Delivery Date",
                                                                                  context: context,
                                                                                  initialDate: picked==null?DateTime.parse(cartData.data['cart']['user']['route']['deliveryDate']):picked, // Refer step 1
                                                                                  firstDate: DateTime.now().subtract(Duration(days: 0)),
                                                                                  lastDate: DateTime(2025),
                                                                                );
                                                                                if (selected != null && selected != cartData.data['cart']['user']['route']['deliveryDate']) {
                                                                                  if(DateFormat('dd').format(DateTime.parse(cartData.data['cart']['user']['route']['deliveryDate']),)!=DateFormat('dd').format(selected)) {
                                                                                    setState(() {
                                                                                      picked = selected;
                                                                                    });
                                                                                    await editDeliveryDate(picked);
                                                                                    setState(() {
                                                                                      picked = selected;
                                                                                    });
                                                                                  }
                                                                                  else if(picked!=null)
                                                                                  {
                                                                                    if(DateFormat('dd').format(DateTime.parse(cartData.data['cart']['user']['route']['deliveryDate']))==DateFormat('dd').format(selected))
                                                                                    {
                                                                                      setState(() {
                                                                                        picked=null;
                                                                                      });
                                                                                    }
                                                                                    else{
                                                                                      setState(() {
                                                                                        picked = selected;
                                                                                      });
                                                                                      await editDeliveryDate(picked);
                                                                                    }
                                                                                  }
                                                                                }
                                                                              },
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.only(left:8.0),
                                                                                child: Icon(Icons.edit,size:20
                                                                                  ,color: Colors.black,),
                                                                              )),
                                                                        ],
                                                                      ):Container(),
                                                                    ],
                                                                  ),
                                                                  SizedBox(height: 5,),
                                                                  Container(
                                                                    child: Text(
                                                                      cartData.data['cart']['user']['route']!=null?"Route: ${picked==null?cartData.data['cart']['user']['route']['location'].join(', '):cartData.data['cart']['user']['address']==null?"No address found":cartData.data['cart']['user']['address']}":"Route: Route not selected",
                                                                      style: TextStyle(
                                                                        color: Colors.black,
                                                                        fontSize: 14,
                                                                      ),),
                                                                  ),
                                                                  SizedBox(height: 5,)
                                                                ],
                                                              ),
                                                                Row(
                                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                children: [
                                                                  cartData.data['cart']['user']['route']!=null?Text(
                                                                    "Delivery Charge: ${picked==null?cartData.data['cart']['user']['route']['deliveryCharge']==0?"FREE":"₹"+cartData.data['cart']['user']['route']['deliveryCharge'].toString():"₹"+cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge'].toString()}",
                                                                    style: TextStyle(
                                                                      color: Colors.black,
                                                                      fontSize: 14,
                                                                    ),):Container(),
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                location_list()),
                                                                      );
                                                                    },
                                                                    child: Container(
                                                                      height: SizeConfig.screenHeight *
                                                                          0.045,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border: Border.all(
                                                                            color: Colors.black54),
                                                                        borderRadius: BorderRadius.circular(
                                                                            5),
                                                                      ),
                                                                      child: Padding(
                                                                        padding: const EdgeInsets.only(left:5.0,right: 5.0),
                                                                        child: Center(
                                                                          child: Text(
                                                                            cartData.data['cart']['user']['route']!=null?"Change":"Select Route",
                                                                            style: TextStyle(
                                                                                color: Colors.lightBlue,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.w700),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: SizeConfig.screenHeight * 0.01,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: SizeConfig
                                                          .screenHeight *
                                                          0.015,
                                                    ),
                                                  ],
                                                ):Container(),

                                                Dismissible(
                                                  key: Key(cartData.data['cart']['cartItems'].toString()),
                                                  direction: DismissDirection.horizontal,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 5, right: 5),
                                                    child: Container(
                                                      width: SizeConfig
                                                          .screenWidth,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            color: Colors.grey
                                                                .withOpacity(
                                                                0.5),
                                                            blurRadius: 5.0,
                                                            offset: Offset(
                                                                0, 3),
                                                          ),
                                                        ],
                                                      ),
                                                      child: Padding(
                                                        padding: EdgeInsets
                                                            .only(
                                                            top: 10,
                                                            bottom: 10,
                                                            left: 15,
                                                            right: 20),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Column(
                                                                  crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                                  children: [
                                                                    Container(
                                                                      width: SizeConfig
                                                                          .screenWidth *
                                                                          0.7,
                                                                      child: Text(
                                                                        cartData.data['cart']['cartItems'][index]['product']['name'],
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 16,
                                                                            fontWeight: FontWeight
                                                                                .w600),
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      height:
                                                                      SizeConfig
                                                                          .screenHeight *
                                                                          0.025,
                                                                    ),

                                                                    quantityChange(cartData.data,index,updateSum)

                                                                  ],
                                                                ),
                                                                Container(
                                                                    width: SizeConfig
                                                                        .screenWidth *
                                                                        0.15,
                                                                    child: ClipRRect(
                                                                      borderRadius: BorderRadius
                                                                          .circular(
                                                                          5),
                                                                      child: Image
                                                                          .network(
                                                                        cartData.data['cart']['cartItems'][index]['product']['productPicture'],
                                                                        fit: BoxFit.fill,),
                                                                    )),
                                                              ],
                                                            ),
                                                            SizedBox(height:5),
                                                            checkAvailability(cartData.data['cart']['cartItems'][index]['quantity'], cartData.data['cart']['cartItems'][index]['product']['availableStock'])?Container():Align(alignment:Alignment.centerLeft,child: Text("OUT OF STOCK",style: TextStyle(color: Colors.red,fontWeight: FontWeight.w800,fontSize: 12),)),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                  top: 5),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                                children: [
                                                                  cartData.data['cart']['user']['route']!=null?RichText(
                                                                      text: TextSpan(
                                                                        text:
                                                                        'Delivery by ${picked==null?DateFormat('d MMM, yy').format(DateTime.parse(cartData.data['cart']['user']['route']['deliveryDate']),):DateFormat('d MMM, yy').format(picked)}',
                                                                        style: TextStyle(
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 14),
                                                                      )
                                                                  ):Container(),
                                                                  GestureDetector(
                                                                    onTap: () async{
                                                                      removeItemCart(carStaticData['cart']['cartItems'][index]['product']['_id']);
                                                                      carStaticData['cart']['cartItems'].removeAt(index);
                                                                      updateCart(true);
                                                                    },
                                                                    child: Container(
                                                                      height: SizeConfig.screenHeight * 0.045,
                                                                      width: SizeConfig.screenWidth * 0.25,
                                                                      decoration: BoxDecoration(
                                                                        color: Colors.white,
                                                                        border:
                                                                        Border.all(
                                                                            color: Colors.grey),
                                                                        borderRadius: BorderRadius.circular(4),
                                                                      ),
                                                                      child: Row(
                                                                        mainAxisAlignment:
                                                                        MainAxisAlignment.spaceEvenly,
                                                                        children: [
                                                                          Icon(
                                                                            Icons.delete,
                                                                            color: Colors.black54,
                                                                            size: 14  ,
                                                                          ),
                                                                          Text(
                                                                            "Remove",
                                                                            style: TextStyle(
                                                                                color: Colors
                                                                                    .black54,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight
                                                                                    .w800),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  onDismissed: (direction) async{
                                                    await removeItemCart(carStaticData['cart']['cartItems'][index]['product']['_id']);
                                                    carStaticData['cart']['cartItems'].removeAt(index);
                                                    updateCart(true);
                                                  },
                                                ),
                                                SizedBox(
                                                  height: SizeConfig
                                                      .screenHeight *
                                                      0.015,
                                                ),
                                                check(index, cartData.data['cart']['cartItems'].length)
                                                    ?Column(
                                                  children: [
                                                    Divider(
                                                      color: Colors.grey,
                                                      thickness: 0.5,),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 10,
                                                          right: 5),
                                                      child: Row(
                                                        children: [
                                                          Text(
                                                            "Price Details",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black
                                                                    .withOpacity(
                                                                    0.7),
                                                                fontSize: 16,
                                                                fontWeight: FontWeight
                                                                    .w800),),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                      thickness: 0.5,),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          right: 5,
                                                          left: 10),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment
                                                                .spaceBetween,
                                                            children: [
                                                              Text(
                                                                "Price(${cartData.data['cart']['cartItems'].length} item)",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black),),
                                                              Text(
                                                                  "₹${(cartSum.data).round()}",
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black)),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    cartData.data['cart']['user']['route']!=null?Divider(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.6),
                                                      thickness: 0.5,):Container(),
                                                    cartData.data['cart']['user']['route']!=null?Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 10,
                                                          right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Delivery charge: ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),),
                                                          Text("${picked==null?cartData.data['cart']['user']['route']['deliveryCharge']==0?"FREE":"₹"+cartData.data['cart']['user']['route']['deliveryCharge'].toString():"₹"+cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge'].toString()}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                        ],
                                                      ),
                                                    ):Container(),
                                                    Divider(
                                                      color: Colors.grey
                                                          .withOpacity(
                                                          0.6),
                                                      thickness: 0.5,),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          left: 10,
                                                          right: 5),
                                                      child: Row(
                                                        mainAxisAlignment: MainAxisAlignment
                                                            .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "Total amount",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black),),
                                                          Text("₹${picked==null?cartData.data['cart']['user']['route']==null?(cartSum.data).round():(cartSum.data+cartData.data['cart']['user']['route']['deliveryCharge']).round():(cartSum.data+cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge']).round()}",
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black)),
                                                        ],
                                                      ),
                                                    ),
                                                    Divider(
                                                      color: Colors.grey,
                                                      thickness: 0.5,),
                                                  ],
                                                )
                                                    : Container()
                                              ],
                                            );
                                          })),
                                  Container(
                                    decoration: BoxDecoration(color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                              color: Colors.grey.withOpacity(0.4),
                                              blurRadius: 5,
                                              offset: Offset(0, -3))
                                        ]),
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                          left: 10, bottom: 10, top: 10),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceBetween,
                                        crossAxisAlignment: CrossAxisAlignment
                                            .center,
                                        children: [
                                          Text(
                                            "₹${picked==null?cartData.data['cart']['user']['route']==null?(cartSum.data).round():(cartSum.data+cartData.data['cart']['user']['route']['deliveryCharge']).round():cartData.data['cart']['user']['customDelivery']==null?cartSum.data:(cartSum.data+cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge']).round()}",
                                            style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          FlatButton(
                                            onPressed: () async{
                                              if(checkOrderAvailability(cartData.data)){
                                              if(cartData.data['cart']['user']['route']!=null){
                                                if(cartData.data['cart']['user']['address']!=null&&cartData.data['cart']['user']['certificate']!=null) {
                                                  showDialog(
                                                    context: context,
                                                    builder: (ctx) =>
                                                        AlertDialog(
                                                          title: Text(
                                                            "Confirm your order",
                                                            style: TextStyle(
                                                                fontWeight: FontWeight
                                                                    .w800),),
                                                          content: Text(
                                                              "Are you sure you want to place order?"),
                                                          actions: <Widget>[
                                                            FlatButton(
                                                              onPressed: () {
                                                                Navigator.pop(
                                                                    context);
                                                              },
                                                              child: Text("No",
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .red,
                                                                    fontWeight: FontWeight
                                                                        .w800,
                                                                    fontSize: 16),),
                                                            ),
                                                            FlatButton(
                                                              onPressed: () async {
                                                                Navigator.pop(context);
                                                                final orderConfirmation = await placeOrderItem(cartData.data, picked==null?(cartSum.data.toInt()+cartData.data['cart']['user']['route']['deliveryCharge']).round():(cartSum.data.toInt()+cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge']).round(),picked==null?cartData.data['cart']['user']['route']['deliveryDate']:picked.toString(),picked==null?cartData.data['cart']['user']['route']['deliveryCharge']:cartData.data['cart']['user']['customDelivery']['deliveryCharge']['deliveryCharge']);
                                                                if (orderConfirmation !=
                                                                    null) {
                                                                  Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder: (
                                                                            context) =>
                                                                            orderPlaced()),
                                                                  );
                                                                }
                                                              },
                                                              child: Text("Yes",
                                                                  style: TextStyle(
                                                                      fontSize: 16,
                                                                      fontWeight: FontWeight
                                                                          .w800)),
                                                            ),
                                                          ],
                                                        ),
                                                  );
                                                }
                                                else {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(builder: (context) => additionalInfo(cartData.data['cart']['user']['name'])),
                                                  );
                                                  //Toast.show("Please fill additional details", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                                }
                                              }
                                              else
                                                Toast.show("Please select route before placing order", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                            }
                                              else
                                                Toast.show("Selected product is out of stock", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                              },
                                            child: Container(
                                              height: SizeConfig.screenHeight *
                                                  0.05,
                                              width: SizeConfig.screenWidth * 0.25,
                                              decoration: BoxDecoration(
                                                color: Colors.deepOrangeAccent,
                                                borderRadius: BorderRadius.circular(
                                                    5),
                                              ),
                                              child: Center(
                                                child: Text(
                                                  "Place order",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                      fontWeight: FontWeight.w900),
                                                ),
                                              ),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              );
                            }
                            return Center(child: Container(child: CircularProgressIndicator()));
                          }
                      ):cartEmptyBody();
                    }
                    return Center(child: Container(child: CircularProgressIndicator()));
                  }
              ),
            );
          },
          child: Container()
      );
    },
    )
    );
  }
}

class quantityChange extends StatefulWidget {
  var cartData;
  int index;
  final ValueChanged<double> sumUpdate;
  quantityChange(this.cartData,this.index,this.sumUpdate);
  @override
  _quantityChangeState createState() => _quantityChangeState();
}
class _quantityChangeState extends State<quantityChange> {
  final _formKey = GlobalKey<FormState>();
  bool updateFlag=true;
  int realQuantity=0;
  int changeQuantity(int quantity)
  {
    realQuantity=quantity;
    return realQuantity;
  }
  bool sumFlag=false;
  double sumUpdate=0;
  final List<String> errors = [];
  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }
  bool checkAvailability(var quantity,var stock) {
    if(quantity>stock) {
      return false;
    }
    else {
      return true;
    }
  }
  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }
  bool removeItemFlag=true;
  int prevQuantity=0;
  final TextEditingController quantityController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "₹${(updateFlag?(widget.cartData['cart']['cartItems'][widget.index]['product']['ptr']*widget.cartData['cart']['cartItems'][widget.index]['quantity']).round():(widget.cartData['cart']['cartItems'][widget.index]['product']['ptr']*realQuantity).round())
              .toString()}",
          style: TextStyle(
              color: Colors
                  .black,
              fontSize: 18,
              fontWeight: FontWeight
                  .w600),
        ),
        SizedBox(
          width: 10,
        ),
        !checkAvailability(widget.cartData['cart']['cartItems'][widget.index]['quantity'], widget.cartData['cart']['cartItems'][widget.index]['product']['availableStock'])?Container():GestureDetector(
          onTap: (){
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Form(
                          key:_formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Text("Quantity should be greater then ${widget.cartData['cart']['cartItems'][widget.index]['product']['minQuantity'].toString()}!",style: TextStyle(fontWeight: FontWeight.w600),),
                              Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: TextFormField(
                                    keyboardType: TextInputType.emailAddress,
                                    controller: quantityController,
                                    onChanged: (value) {
                                      if (value.isNotEmpty) {
                                        removeError(error: kEmailNullError);
                                      } else if (emailValidatorRegExp.hasMatch(value)) {
                                        removeError(error: kInvalidEmailError);
                                      }
                                      return null;
                                    },
                                    validator: (value) {
                                      if (value.isEmpty) {
                                        addError(error: kEmailNullError);
                                        return "";
                                      } else if (!emailValidatorRegExp.hasMatch(value)) {
                                        addError(error: kInvalidEmailError);
                                        return "";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      hintText: "Enter quantity",
                                      floatingLabelBehavior: FloatingLabelBehavior.always,
                                      suffixIcon: Padding(
                                        padding: const EdgeInsets.only(right:20),
                                        child: Icon(Icons.edit,size: 30,),
                                      ),
                                    ),
                                  )
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: FlatButton(
                                  onPressed: () async{
                                    int quantity= int.parse(quantityController.text);
                                    if(quantity>=widget.cartData['cart']['cartItems'][widget.index]["product"]['minQuantity'])
                                    {
                                      if(quantity<=widget.cartData['cart']['cartItems'][widget.index]['product']['availableStock']) {
                                        prevQuantity=updateFlag?changeQuantity(widget.cartData['cart']['cartItems'][widget.index]["product"]['minQuantity']):realQuantity;
                                        updateFlag=false;
                                        changeQuantity(quantity);
                                        await updateQuantity(realQuantity,widget.cartData['cart']['cartItems'][widget.index]['product']['_id']);
                                        sumUpdate=widget.cartData['cart']['cartItems'][widget.index]['product']['ptr']*((realQuantity-prevQuantity)/widget.cartData['cart']['cartItems'][widget.index]["product"]['minQuantity']);
                                        sumFlag=true;
                                        widget.sumUpdate(widget.cartData['cart']['cartItems'][widget.index]['product']['ptr']*((realQuantity-prevQuantity)/widget.cartData['cart']['cartItems'][widget.index]["product"]['minQuantity']));
                                        Navigator.pop(context);
                                      }
                                      else
                                        Toast.show("Quantity should be less then ${widget.cartData['cart']['cartItems'][widget.index]['product']['availableStock']}", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                    }
                                    else
                                      Toast.show("Quantity should be greater then minimum quantity", context, duration: Toast.LENGTH_SHORT, gravity:  Toast.TOP);
                                  },
                                  child: Container(
                                      decoration:BoxDecoration(
                                        color: Colors.blue,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                                        child: Text("Change",style: TextStyle(color: Colors.white,fontWeight: FontWeight.w600),),
                                      )),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
          child: Container(
            height: SizeConfig
                .screenHeight *
                0.045,
            decoration: BoxDecoration(
              color: Colors
                  .white,
              border: Border
                  .all(
                  color: Colors
                      .grey),
              borderRadius:
              BorderRadius
                  .circular(
                  3),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                mainAxisAlignment:
                MainAxisAlignment
                    .center,
                children: [
                  Text(
                    "Qty: ${updateFlag?changeQuantity(widget.cartData['cart']['cartItems'][widget.index]['quantity']):realQuantity}",
                    style: TextStyle(
                        color: Colors
                            .black54,
                        fontSize: 14,
                        fontWeight:
                        FontWeight
                            .w700),
                  ),
                  Icon(
                    Icons
                        .edit,
                    color: Colors
                        .black,
                    size: 12,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}