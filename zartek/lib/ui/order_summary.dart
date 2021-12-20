import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zartek/logic/cart.dart';
import 'package:zartek/ui/home_page.dart';
import 'package:zartek/utils/colors.dart';
import 'package:get/get.dart';

class OrderSummary extends StatefulWidget {
  const OrderSummary({Key? key}) : super(key: key);

  @override
  _OrderSummaryState createState() => _OrderSummaryState();
}

class _OrderSummaryState extends State<OrderSummary> {

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var cartValue = Provider.of<CartProvider>(context).count;
    return Scaffold(bottomNavigationBar: Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: (){
          Get.snackbar('Order Placed Successfully', 'Thank You!!',backgroundColor: AppColors.kRed, snackPosition:SnackPosition.BOTTOM,colorText: Colors.white);
          Get.to(()=>HomePage());
        },
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),
            color: Colors.green[900]
          ),
          width: width*0.80,
          height: height*0.07,
          child: Center(child: Text('Place Order',style: TextStyle(color:AppColors.kWhite,fontSize: 20),)),
        ),
      ),
    ),
      appBar: AppBar( iconTheme: IconThemeData(
        color: Colors.grey, //change your color here
      ),backgroundColor: AppColors.kWhite,
        title: Text('Order Summary',style: TextStyle(color:Colors.grey),),
      ),body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(elevation: 15,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8),
                          color: Colors.green[900]
                      ),
                      width: width*0.99,
                      height: height*0.07,
                      child: Center(child: Text('Dish 1 - 1 Item',style: TextStyle(color:AppColors.kWhite,fontSize: 20),))
                  ),
                ),
                Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network('https://i.pinimg.com/originals/e4/1f/f3/e41ff3b10a26b097602560180fb91a62.png',
                                height: 30,width: 30,),SizedBox(width: 5,),
                              Text('Gopi Manchurian Dry'),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Container(
                              height: 40,
                              width: 100,
                              decoration: BoxDecoration(
                                color:Colors.green[900],borderRadius: BorderRadius.circular(20),
                              ),child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 8.0),
                                  child: InkWell(
                                      onTap: (){
                                        if(cartValue>=1){
                                          Provider.of<CartProvider>(context,listen: false).removeItem();
                                        }else null;
                                      },
                                      child: Icon(Icons.minimize,color: AppColors.kWhite,size: 20,)),
                                ),
                                Text('$cartValue',style: TextStyle(color: AppColors.kWhite),),
                                InkWell(
                                    onTap: (){
                                      Provider.of<CartProvider>(context,listen: false).addItem();
                                    },
                                    child: Icon(Icons.add,color: AppColors.kWhite,size: 20,)),
                              ],
                            ),
                            ),
                          ),
                          Text('INR 20.00'),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('INR 20.00'),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text('112 calories'),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Total Amount'),
                      Text('INR 65.00',style: TextStyle(color: AppColors.kLightGreen),),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
