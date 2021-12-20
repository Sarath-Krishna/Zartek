import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:zartek/api/request.dart';
import 'package:zartek/logic/cart.dart';
import 'package:zartek/logic/google_sign_in.dart';
import 'package:zartek/model/dish_model.dart';
import 'package:zartek/ui/sign_in.dart';
import 'package:zartek/utils/colors.dart';
import 'package:get/get.dart';
import 'order_summary.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User? user = FirebaseAuth.instance.currentUser;
  late Future <List<Category_dishes>> futureData;
  late final List _loadedPhotos = [];
  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }
  @override
  Widget build(BuildContext context) {
    // Provider.of<GoogleSignInProvider>(context, listen: false)
    //     .signOutWithGoogle()
    //     .whenComplete(() => Get.to(() => const SignInPage()));
    var cartValue = Provider.of<CartProvider>(context).count;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar( iconTheme: IconThemeData(color: Colors.grey),
            bottom: const TabBar(indicatorColor: Colors.redAccent,isScrollable: true,
              tabs: [
                Tab(child: Text('Salads and Soup',style: TextStyle(color: Colors.redAccent,fontSize: 15),overflow: TextOverflow.visible,),),
                Tab(child: Text('From The Barnyard',style: TextStyle(color: Colors.redAccent,fontSize: 15),overflow: TextOverflow.visible,),),
                Tab(child: Text('From the Hen House',style: TextStyle(color: Colors.redAccent,fontSize: 15),overflow: TextOverflow.visible,),),
              ],
            ),
            backgroundColor: AppColors.kWhite,
            actions: [
            InkWell(onTap: (){
              Get.to(()=>const OrderSummary());
            },
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: Stack(children: <Widget>[
                const Padding(
                padding: EdgeInsets.all(16.0),
                child: Icon(Icons.add_shopping_cart,size: 30,color: Colors.grey,),),
                   Align(alignment: Alignment.topRight,
                    child: Container(
                      child: Center(child: Text('$cartValue',style: TextStyle(color: Colors.white,fontSize: 15),)),
                      alignment: Alignment.topRight,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                        color: Colors.red,borderRadius: BorderRadius.circular(25)
                      ),
                    ),
                  ),
                ],
                ),
              ),
            ),
            ],
          ),
          drawer: Drawer(
            child: ListView(
              children: [
                DrawerHeader(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25)),
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: <Color>[
                        AppColors.kGreen,
                        AppColors.kLightGreen,
                      ],
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(
                          child: CircleAvatar(
                              radius: 40.0,
                              child:ClipOval(
                                  child: Image.network(user!.photoURL??'https://www.kindpng.com/picc/m/273-2730244_free-medical-appointment-person-icon-png-green-transparent.png'))),
                          flex: 2,
                        ),
                           Text(
                                user!.displayName??'User',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                              ),
                        user==null
                            ? const Text(
                                "ID : UserId not found",
                                style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black,
                                ),
                              ):Text(
                          "ID: ${user!.uid}",
                          style: const TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.black,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Provider.of<GoogleSignInProvider>(context, listen: false)
                        .signOutWithGoogle()
                        .whenComplete(() => Get.to(() => const SignInPage()));
                  },
                  child: const ListTile(
                    title: Text("Log Out"),
                    leading: Icon(Icons.logout),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
          //TAB 1
          Center(
          child: FutureBuilder <List<Category_dishes>>(
            future: futureData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Category_dishes> data = snapshot.data!;
                print('DATA');
                print(snapshot.data!.length);
                return
                  ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Container(
                            // height: 75,
                            color: Colors.white,
                            child: Column(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      children: [
                                        Row(
                                          children: [
                                            Image.network('https://i.pinimg.com/originals/e4/1f/f3/e41ff3b10a26b097602560180fb91a62.png',
                                              height: 30,width: 30,),SizedBox(width: 5,),
                                            Container(width: 100,
                                              child: Text(
                                                "${snapshot.data![index].dishName}",),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text("INR ${data[index].dishPrice.toString()}"),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(4.0),
                                          child: Text("${data[index].dishCalories.toString()} calories"),
                                        ),SizedBox(width: 5,),
                                        Image.network('https://upload.wikimedia.org/wikipedia/commons/6/6d/Good_Food_Display_-_NCI_Visuals_Online.jpg',height: 100,width: 100,),
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(data[index].dishDescription!),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Container(
                                    height: 40,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      color: AppColors.kGreen,borderRadius: BorderRadius.circular(20),
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
                                Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text('Customization available',style: TextStyle(color: AppColors.kRed),),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                  );
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              // By default show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
              Center(child: Text('On Progress')),
              Center(child: Text('On Progress')),
            ],
          ),
        ),
      ),);
  }

  Future<bool> showExitPopup() async {
    return await showDialog(
          //show confirm dialogue
          //the return value will be from "Yes" or "No" options
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Close App'),
            content: Text('Do you want to exit the App?'),
            actions: [
              ElevatedButton(
                onPressed: () => Navigator.of(context).pop(false),
                //return false when click on "NO"
                child: Text('No'),
              ),
              ElevatedButton(
                onPressed: () => SystemNavigator.pop(),
                //return true when click on "Yes"
                child: Text('Yes'),
              ),
            ],
          ),
        ) ??
        false; //if showDialouge had returned null, then return false
  }
}
