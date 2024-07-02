import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:canine/controllers/user_controller/home_controller.dart';
import 'package:canine/controllers/wholesaler_controller/addtocartcontroller.dart';
import 'package:canine/controllers/wholesaler_controller/home_controller.dart';
import 'package:canine/controllers/wholesaler_controller/productdetails_controller.dart';
import 'package:canine/models/usersModel/getUserPropertiesModel.dart';
import 'package:canine/screens/wholesaler/productdetails.dart';
import 'package:canine/screens/wholesaler/wholeSalerFilterUI.dart';
import 'package:canine/screens/wholesaler/wholesalerSearchScreen.dart';
import 'package:canine/screens/wholesaler/widget/Filter.dart';
import 'package:canine/screens/wholesaler/widget/wholeAppBar.dart';
import 'package:canine/utils/colors.dart';
import 'package:canine/utils/constants.dart';
import 'package:canine/utils/fontstyle.dart';
import 'package:canine/screens/user/productdetails.dart';

import '../../controllers/wholesaler_controller/wholesaler_ourbrand_filter_controller.dart';

class ProductAlllistPagewhole extends StatefulWidget {
  // var dat;

  // List<Datum> dat;
   ProductAlllistPagewhole({super.key,
     // required this.dat
   });

  @override
  State<ProductAlllistPagewhole> createState() => _ProductAlllistPagewholeState();
}

class _ProductAlllistPagewholeState extends State<ProductAlllistPagewhole> {
  WholeHomeController wholehomecontroller = Get.put(WholeHomeController());
  TextEditingController _searchcontroller = TextEditingController();

  WholeProductDetailsController wholeproductdetailsController = Get.put(WholeProductDetailsController());
  MyCartWholeController mycartwholeController = Get.put(MyCartWholeController());




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBarWholeback(
          title: "All Products",
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: SingleChildScrollView(
            child: Column(
              children:[
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 45,
                        width: 300,
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius: BorderRadius.circular(17),
                          // border: Border.all(color:brandcolor ),
                          color: MyColors.white,
                        ),
                        child: TextFormField(
                          onTap: () {
                            wholehomecontroller.clearSearchData();
                            Get.to(WholeSalerSearchScreen());
                          },
                          readOnly: true,
                          controller: _searchcontroller,
                          style: TextStyle(
                            fontSize: 14,
                            color: MyColors.voliet,
                            fontFamily: "SF-Pro-Display",
                          ),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(left: 15),
                              fillColor: MyColors.white,
                              focusColor: MyColors.white,
                              enabledBorder: OutlineInputBorder(borderSide: BorderSide.none
                                // borderRadius: BorderRadius.circular(50),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide.none,
                                //  borderRadius: BorderRadius.circular(50),
                              ),
                              hintText: "Search",
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Image.asset(
                                  "assets/image/searchnormal.png",
                                  width: 10,
                                ),
                              ),
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400)),
                        ),
                      ),
                      GestureDetector(
                              onTap: () {
                                WholeSalerOurBrandFilterController filtercontroller = Get.put(WholeSalerOurBrandFilterController());
                                // filtercontroller.init();
                                filtercontroller.loadDefaultData();
                                filtercontroller.clearFields();

                                filtercontroller.init();
                                Get.to(WholeSalerFilterScreenUI());
                                Get.to(FilterScreenWhole());
                              },
                              child: Container(
                                  width: 45,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: Color(0xffffcc00)
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Image.asset("assets/image/filter3.png",),
                                  ),
                              ),
                            ),
                  ]
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    // height: MediaQuery.of(context).size.height,
                    child: Obx((){
                    return  GridView.builder(
                        // primary: false,
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 15.0,
                              mainAxisSpacing: 15.0,
                              mainAxisExtent: 285
                          ),
                          // itemCount: 2,

                          itemCount: wholehomecontroller.listLength.value,
                          // itemCount: widget.dat.length,
                          itemBuilder: (BuildContext ctx, index) {
                            print("item length ${ wholehomecontroller.listLength.value}");
                            var item = wholehomecontroller.userPropertiesModel!.data![index];
                            String imagePath = Constants.PRODUCT_HOME_IMAGE_PATH + "/${item.image!}";
                            // print(imagePath);
                            return InkWell(
                              onTap: () async{wholeproductdetailsController.dispose() ;
                              wholeproductdetailsController.viewproduct(item.id ?? 0);
                              print("productid${item.id ?? 0}");
                              await wholeproductdetailsController.init();
                              Get.to(ProductDetailswhole(id: item.id??0,
                              ));
                              },
                              child:
                              Container(
                                width: 140,
                                // height: 700,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      // _getRandomColor(),
                                      // _getRandomColor(),
                                      // _getRandomColor(),
                                      // _getRandomColor(),
                                      // MyColors.white
                                      //     .withOpacity(0.1),
                                      MyColors.white,
                                      MyColors.white,
                                      // MyColors.white,
                                    ],
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                  ),
                                  borderRadius: BorderRadius.circular(25),
                                  // color: MyColors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.3),
                                      spreadRadius: 3,
                                      blurRadius: 7,
                                      offset: Offset(0, 3), // Offset of the shadow
                                    ),
                                  ],
                                  // color: MyColors.white
                                ),
                                child: Column(
                                  children: [

                                    GetBuilder<WholeHomeController>(
                                        init: wholehomecontroller,
                                        builder: (_) {
                                          return InkWell(
                                            onTap: () {
                                              wholehomecontroller.addItemToWishList(item.id!);
                                            },
                                            child: Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Align(
                                                  alignment: Alignment.centerRight,
                                                  child: Icon(wholehomecontroller.wishListItemsId.contains(item.id!)
                                                      ? Icons.favorite
                                                      : Icons.favorite_border,color:Colors.red)),
                                            ),
                                          );
                                        }
                                    ),
                                    Container(
                                      height: 125,
                                      child: CachedNetworkImage(
                                        imageUrl: imagePath,
                                        placeholder: (context, url) => Center(child: CircularProgressIndicator()), // Replace with your own placeholder widget
                                        errorWidget: (context, url, error) => Icon(Icons.error), // Replace with your own error widget
                                      ),
                                    ),

                                    Container(
                                      child: Padding(
                                        padding:
                                        const EdgeInsets.only(
                                            left: 10.0, right: 5, top: 5),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(item.name!, maxLines: 1, overflow: TextOverflow.ellipsis,
                                                style: CustomTextStyle.popinsmedium),
                                            Text(item.description.toString().length < 30
                                                ? item.description! : item.description!.substring(0, 19),
                                                style: CustomTextStyle.popinssmall0),
                                            SizedBox(height: 5),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    (item.discount !="0.00" && item.discount !="0"&&item.discount !="0.0")?
                                                    Row(
                                                      children: [
                                                        Text("₹" + item.wholePrice.toString(), style: CustomTextStyle.discounttext),
                                                        SizedBox(width: 2),
                                                        Text("Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                                                            style: CustomTextStyle.popinstextsmal2222red),
                                                      ],
                                                    ): const  SizedBox(),

                                                    SizedBox(height: 5),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        SizedBox(
                                                          width: Get.width * 0.23,
                                                          child:
                                                          Text(
                                                            "₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                                                            style: CustomTextStyle.popinsmedium,
                                                          ),
                                                        ),
                                                        SizedBox(width: Get.width * 0.054),
                                                        InkWell(
                                                          onTap: () async{
                                                            wholeproductdetailsController.viewproductHome(
                                                                item.id??0,item.name??'',"1kg",1 ,double.parse(item.wholePrice ?? ''),item.image??'',"yes");
                                                            await wholeproductdetailsController.addProductHome();
                                                            mycartwholeController.init();
                                                          },
                                                          child: Padding(
                                                            padding: const EdgeInsets.only(right: 5.0),
                                                            child: Container(
                                                                width: 35,
                                                                height: 35,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                                                                child: Padding(
                                                                  padding: EdgeInsets.all(5.0),
                                                                  child: Image.asset("assets/image/bag2.png", height: 25),
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),


                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),



                            );
                          });
                    }),
                  ),
                ),
                SizedBox(height: 150),

                // ListView(
                //   primary: true,
                //   children: [
                //     // SizedBox(height: MediaQuery.of(context).size.height*0.02),
                //
                //     !wholehomecontroller.propertyLoaded
                //         ? SizedBox()
                //         : Container(
                //       height: 100,
                //       child: GridView.builder(
                //           primary: false,
                //           shrinkWrap: true,
                //           scrollDirection: Axis.vertical,
                //           physics: NeverScrollableScrollPhysics(),
                //           gridDelegate:
                //           SliverGridDelegateWithFixedCrossAxisCount(
                //               crossAxisCount: 2,
                //               crossAxisSpacing: 15.0,
                //               mainAxisSpacing: 15.0,
                //               mainAxisExtent: 285),
                //           itemCount: wholehomecontroller.userPropertiesModel!.data!.length,
                //           itemBuilder: (BuildContext ctx, index) {
                //             var item = wholehomecontroller.userPropertiesModel!.data![index];
                //
                //             String imagePath = Constants.PRODUCT_HOME_IMAGE_PATH + "/${item.image!}";
                //             // print(imagePath);
                //             return InkWell(
                //               onTap: () async{wholeproductdetailsController.dispose() ;
                //               wholeproductdetailsController.viewproduct(item.id ?? 0);
                //               print("productid${item.id ?? 0}");
                //               await wholeproductdetailsController.init();
                //               Get.to(ProductDetailswhole(id: item.id??0,
                //               ));
                //               },
                //               child:
                //               Container(
                //                 width: 140,
                //                 // height: 700,
                //                 decoration: BoxDecoration(
                //                   gradient: LinearGradient(
                //                     colors: [
                //                       // _getRandomColor(),
                //                       // _getRandomColor(),
                //                       // _getRandomColor(),
                //                       // _getRandomColor(),
                //                       // MyColors.white
                //                       //     .withOpacity(0.1),
                //                       MyColors.white,
                //                       MyColors.white,
                //                       // MyColors.white,
                //                     ],
                //                     begin: Alignment.topCenter,
                //                     end: Alignment.bottomCenter,
                //                   ),
                //                   borderRadius: BorderRadius.circular(25),
                //                   // color: MyColors.white,
                //                   boxShadow: [
                //                     BoxShadow(
                //                       color: Colors.grey.withOpacity(0.3),
                //                       spreadRadius: 3,
                //                       blurRadius: 7,
                //                       offset: Offset(0, 3), // Offset of the shadow
                //                     ),
                //                   ],
                //                   // color: MyColors.white
                //                 ),
                //                 child: Column(
                //                   children: [
                //
                //                     GetBuilder<WholeHomeController>(
                //                         init: wholehomecontroller,
                //                         builder: (_) {
                //                           return InkWell(
                //                             onTap: () {
                //                               wholehomecontroller.addItemToWishList(item.id!);
                //                             },
                //                             child: Padding(
                //                               padding: const EdgeInsets.all(8.0),
                //                               child: Align(
                //                                   alignment: Alignment
                //                                       .centerRight,
                //                                   child: Icon(wholehomecontroller
                //                                       .wishListItemsId
                //                                       .contains(
                //                                       item.id!)
                //                                       ? Icons.favorite
                //                                       : Icons
                //                                       .favorite_border,color:Colors.red)),
                //                             ),
                //                           );
                //                         }
                //                     ),
                //                     Container(
                //                       height: 125,
                //                       child: CachedNetworkImage(
                //                         imageUrl: imagePath,
                //                         placeholder: (context, url) =>
                //                             Center(child: CircularProgressIndicator()), // Replace with your own placeholder widget
                //                         errorWidget: (context, url, error) =>
                //                             Icon(Icons
                //                                 .error), // Replace with your own error widget
                //                       ),
                //                     ),
                //
                //
                //                     Container(
                //
                //                       child: Padding(
                //                         padding:
                //                         const EdgeInsets.only(
                //                             left: 10.0, right: 5, top: 5),
                //                         child: Column(
                //                           mainAxisAlignment: MainAxisAlignment.start,
                //                           crossAxisAlignment: CrossAxisAlignment.start,
                //                           children: [
                //                             Text(item.name!, maxLines: 1, overflow: TextOverflow.ellipsis,
                //                                 style: CustomTextStyle.popinsmedium),
                //                             Text(item.description.toString().length < 30
                //                                 ? item.description! : item.description!.substring(0, 19),
                //                                 style: CustomTextStyle.popinssmall0),
                //                             SizedBox(height: 5),
                //                             Row(
                //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                               children: [
                //                                 Column(
                //                                   crossAxisAlignment: CrossAxisAlignment.start,
                //                                   children: [
                //                                     (item.discount !="0.00" && item.discount !="0"&&item.discount !="0.0")?
                //                                     Row(
                //                                       children: [
                //                                         Text("₹" + item.wholePrice.toString(), style: CustomTextStyle.discounttext),
                //                                         SizedBox(width: 2),
                //                                         Text("Save${double.parse(item.discount??'').toStringAsFixed(0)}%",
                //                                             style: CustomTextStyle.popinstextsmal2222red),
                //                                       ],
                //                                     ): const  SizedBox(),
                //
                //                                     SizedBox(height: 5),
                //                                     Row(
                //                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //                                       children: [
                //                                         SizedBox(
                //                                           width: Get.width * 0.23,
                //                                           child:
                //                                           Text("₹ ${((double.parse(item.wholePrice ?? '')) - ((double.parse(item.wholePrice ?? "")) * (double.parse(item.discount ?? "0")) / 100)).toDouble()}",
                //                                             style: CustomTextStyle.popinsmedium,
                //                                           ),
                //                                         ),
                //                                         SizedBox(width: Get.width * 0.054),
                //                                         InkWell(
                //                                           onTap: () async{
                //                                             wholeproductdetailsController.viewproductHome(
                //                                                 item.id??0,item.name??'',"1kg",1 ,double.parse(item.wholePrice ?? ''),item.image??'',"yes");
                //                                             await wholeproductdetailsController.addProductHome();
                //                                             mycartwholeController.init();
                //                                           },
                //                                           child: Padding(
                //                                             padding:
                //                                             const EdgeInsets.only(right: 5.0),
                //                                             child: Container(
                //                                                 width: 35,
                //                                                 height: 35,
                //                                                 decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xffffcc00)),
                //                                                 child: Padding(
                //                                                   padding: EdgeInsets.all(5.0),
                //                                                   child: Image.asset("assets/image/bag2.png", height: 25),
                //                                                 )),
                //                                           ),
                //                                         )
                //                                       ],
                //                                     ),
                //                                   ],
                //                                 ),
                //
                //
                //                               ],
                //                             )
                //                           ],
                //                         ),
                //                       ),
                //                     )
                //                   ],
                //                 ),
                //               ),
                //
                //
                //
                //             );
                //           }),
                //     ),
                //   ],
                // ),
              ],
            ),
          ),
        ));
  }
}
