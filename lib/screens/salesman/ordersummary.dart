import 'package:cached_network_image/cached_network_image.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:canine/controllers/salesman_controller/addresscontroller.dart';
import 'package:canine/controllers/salesman_controller/addtocartcontroller.dart';
import 'package:canine/controllers/salesman_controller/productdetails_controller.dart';
import 'package:canine/controllers/salesman_controller/salescoupons_controller.dart';

import 'package:canine/screens/partner/partneraddress.dart';
import 'package:canine/screens/salesman/paymentsales.dart';
import 'package:canine/screens/salesman/salesaddnewAddress.dart';
import 'package:canine/screens/salesman/usercouponPage.dart';
import 'package:canine/screens/salesman/widget/wholeAppBar.dart';

import 'package:canine/screens/swepcard.dart';
import 'package:canine/utils/colors.dart';
import 'package:canine/utils/constants.dart';
import 'package:canine/utils/fontstyle.dart';

class AddToCardSales extends StatefulWidget {
  const AddToCardSales({super.key});

  @override
  State<AddToCardSales> createState() => _AddToCardSalesState();
}

class _AddToCardSalesState extends State<AddToCardSales> {
  SalesAddressController addressController = Get.put(SalesAddressController());
  SalesMyCartController addtocartController = Get.put(SalesMyCartController());
  SalesCouponsController couponsController = Get.put(SalesCouponsController());
   final SalesProductDetailsController salesproductdetailscontroller =
      Get.put(SalesProductDetailsController());
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: CustomAppBarSalesWholeback( title: "My Cart",),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: ListView(
          shrinkWrap: true,
          primary: true,
          
          children: [
            GetBuilder<SalesMyCartController>(
                init: addtocartController,
                builder: (_) {
                  return addtocartController.mycartmodel == null
                      ? SizedBox()
                      : addtocartController.cartlistLoaded == false
                          ? SizedBox()
                         
                          : Container(
                              child: ListView.builder(
                                  primary: false,
                                  scrollDirection: Axis.vertical,
                                  shrinkWrap: true,
                                  itemCount: addtocartController
                                      .mycartmodel!.data!.length,
                                  itemBuilder: (context, index) {
                                    var item = addtocartController
                                        .mycartmodel!.data![index];
                                      String imagePath =
                                        Constants.PRODUCT_HOME_IMAGE_PATH +
                                            "/${item.image!}";
                                      return (addtocartController
                                                .mycartmodel!.data ==
                                            null)
                                        ? SizedBox()
                                        : Container(
                                            margin: EdgeInsets.symmetric(
                                                vertical: 10),
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.18,
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(25),
                                                color: MyColors.boxbgcolor),
                                            child: Stack(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.end,
                                                    children: [
                                                      // Icon(Icons.edit_outlined),
                                                      // SizedBox(
                                                      //   width: 10,
                                                      // ),
                                                      InkWell(
                                                          onTap: () async {
                                                            //  items.removeAt(index);
                                                            addtocartController
                                                                .additem(
                                                                    item.id ??
                                                                        0);
                                                            print(
                                                                "Item${item.id}");
                                                            await addtocartController
                                                                .initdelete();
                                                            addtocartController
                                                                .init();
                                                          },
                                                          child: Icon(Icons
                                                              .delete_outline)),
                                                    ],
                                                  ),
                                                ),
                                                Row(children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15.0),
                                                    child:
                                                        //   Image.asset(
                                                        //   "assets/image/fooddog.png",
                                                        // ),
                                                        CachedNetworkImage(
                                                      imageUrl: imagePath,
                                                      width: 65,
                                                      height: 95,
                                                      placeholder:
                                                          (context, url) =>
                                                              Center(
                                                        child:
                                                            CircularProgressIndicator(),
                                                      ), // Replace with your own placeholder widget
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons
                                                              .error), // Replace with your own error widget
                                                    ),
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                       SizedBox(
                                                              width: Get.width *
                                                                  0.5,
                                                              child: Text(
                                                                (item.itemName ??
                                                                        '')
                                                                    .toString(),
                                                                maxLines: 1,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: CustomTextStyle
                                                                    .popinsmedium,
                                                              ),
                                                            ),
                                                      Text(
                                                          (item.variant ?? '')
                                                              .toString(),
                                                          style: CustomTextStyle
                                                              .popinssmall0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Text(
                                                            "₹" +
                                                                      ((item.price! *
                                                                              (item.quantity!.toInt())))
                                                                          .toStringAsFixed(2),
                                                            style: CustomTextStyle
                                                                .popinsmedium,
                                                          ),
                                                          SizedBox(
                                                            width: MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width *
                                                                0.1,
                                                          ),
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  addtocartController
                                                                      .decrementSize(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration: BoxDecoration(
                                                                      shape: BoxShape
                                                                          .rectangle,
                                                                      color: MyColors
                                                                          .yellow,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Icon(
                                                                      Icons
                                                                          .remove,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .black),
                                                                  //  Icon(
                                                                  //   Icons.minimize,
                                                                  //   size: 8,
                                                                  //   color: Colors.white,
                                                                  // ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 3,
                                                              ),
                                                              GetBuilder<
                                                                      SalesMyCartController>(
                                                                  init:
                                                                      addtocartController,
                                                                  builder: (_) {
                                                                    return Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            40,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          borderRadius:
                                                                              BorderRadius.circular(50),
                                                                        ),
                                                                        child: Center(
                                                                            child: Text(
                                                                          addtocartController
                                                                              .sizes[index]
                                                                              .toString(),
                                                                          style:
                                                                              TextStyle(fontWeight: FontWeight.w500),
                                                                        )));
                                                                  }),
                                                              SizedBox(
                                                                width: 3,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                  addtocartController
                                                                      .incrementSize(
                                                                          index);
                                                                },
                                                                child:
                                                                    Container(
                                                                  width: 25,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                          //shape: BoxShape.rectangle,
                                                                          borderRadius: BorderRadius.circular(
                                                                              10),
                                                                          color:
                                                                              MyColors.yellow),
                                                                  child: Icon(
                                                                      Icons.add,
                                                                      size: 15,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      )
                                                    ],
                                                  )
                                                ]),
                                              ],
                                            ),
                                          );
                                  }));
                }),

            //          Container(
            //                     height: MediaQuery.of(context).size.height * 0.18,
            //                     width: MediaQuery.of(context).size.width,
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(25),
            //                         color: MyColors.boxbgcolor),
            //                     child: Stack(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                             mainAxisAlignment: MainAxisAlignment.end,
            //                             children: [
            //                               // Icon(Icons.edit_outlined),
            //                               // SizedBox(
            //                               //   width: 10,
            //                               // ),
            //                               InkWell(
            //                                   onTap: () {

            //                                   },
            //                                   child: Icon(Icons.delete_outline)),
            //                             ],
            //                           ),
            //                         ),
            //                         Row(children: [
            //                           Padding(
            //                             padding: const EdgeInsets.all(15.0),
            //                             child: Image.asset(
            //                               "assets/image/fooddog.png",
            //                             ),
            //                           ),
            //                           Column(
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             mainAxisAlignment: MainAxisAlignment.center,
            //                             children: [
            //                               Text(
            //                                 "Mars Petcare Inc",
            //                                 style: CustomTextStyle.popinsmedium,
            //                               ),
            //                               Text("with paneer or cottage cheese",
            //                                   style: CustomTextStyle.popinssmall0),
            //                               Row(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.spaceBetween,
            //                                 children: [
            //                                   Text(
            //                                     "₹ 620.00",
            //                                     style: CustomTextStyle.popinsmedium,
            //                                   ),
            //                                   SizedBox(
            //                                     width: MediaQuery.of(context).size.width *
            //                                         0.1,
            //                                   ),
            //                                   Row(
            //                                     children: [
            //                                         GestureDetector(
            //                                   onTap: (){
            //                                     addtocartController.decrementSize();
            //                                   },
            //                                   child: Container(
            //                                     width: 25,
            //                                     height: 25,
            //                                     decoration: BoxDecoration(
            //                                         shape: BoxShape.rectangle,
            //                                         color: MyColors.yellow,
            //                                         borderRadius:
            //                                             BorderRadius.circular(10)),
            //                                     child:  Icon(Icons.remove,
            //                                         size: 15, color: Colors.black),
            //                                         //  Icon(
            //                                         //   Icons.minimize,
            //                                         //   size: 8,
            //                                         //   color: Colors.white,
            //                                         // ),

            //                                   ),
            //                                 ),
            //                                 SizedBox(
            //                                   width: 3,
            //                                 ),

            // GetBuilder<MyCartController>(
            //                 init: addtocartController,
            //                 builder: (_) {
            //                   return
            //                                 Container(
            //                                     width: 30,
            //                                     height: 40,
            //                                     decoration: BoxDecoration(
            //                                       borderRadius: BorderRadius.circular(50),
            //                                     ),
            //                                     child: Center(
            //                                         child: Text(
            //                                       addtocartController.sizecount.toString(),
            //                                       style: TextStyle(
            //                                           fontWeight: FontWeight.w500),
            //                                     )));
            //                 }),

            //                                 SizedBox(
            //                                   width: 3,
            //                                 ),
            //                                 GestureDetector(
            //                                    onTap: (){
            //                                     addtocartController.incrementSize();
            //                                   },
            //                                   child: Container(
            //                                     width: 25,
            //                                     height: 25,
            //                                     decoration: BoxDecoration(
            //                                         //shape: BoxShape.rectangle,
            //                                         borderRadius: BorderRadius.circular(10),
            //                                         color: MyColors.yellow),
            //                                     child: Icon(Icons.add,
            //                                         size: 15, color: Colors.black),
            //                                   ),
            //                                 ),
            //                               ],
            //                                   )
            //                                 ],
            //                               )
            //                             ],
            //                           )
            //                         ]),
            //                       ],
            //                     ),
            //                   ),

            //                   SizedBox(
            //                     height: 20,
            //                   ),
            //                   Container(
            //                     height: MediaQuery.of(context).size.height * 0.18,
            //                     width: MediaQuery.of(context).size.width,
            //                     decoration: BoxDecoration(
            //                         borderRadius: BorderRadius.circular(25),
            //                         color: MyColors.boxbgcolor),
            //                     child: Stack(
            //                       children: [
            //                         Padding(
            //                           padding: const EdgeInsets.all(8.0),
            //                           child: Row(
            //                             mainAxisAlignment: MainAxisAlignment.end,
            //                             children: [
            //                               // Icon(Icons.edit_outlined),
            //                               // SizedBox(
            //                               //   width: 10,
            //                               // ),
            //                               InkWell(
            //                                   onTap: () {
            //                                       // items.removeAt(index);
            //                                   },
            //                                   child: Icon(Icons.delete_outline)),
            //                             ],
            //                           ),
            //                         ),
            //                         Row(children: [
            //                           Padding(
            //                             padding: const EdgeInsets.all(15.0),
            //                             child: Image.asset(
            //                               "assets/image/fooddog.png",
            //                             ),
            //                           ),
            //                           Column(
            //                             crossAxisAlignment: CrossAxisAlignment.start,
            //                             mainAxisAlignment: MainAxisAlignment.center,
            //                             children: [
            //                               Text(
            //                                 "Mars Petcare Inc",
            //                                 style: CustomTextStyle.popinsmedium,
            //                               ),
            //                               Text("with paneer or cottage cheese",
            //                                   style: CustomTextStyle.popinssmall0),
            //                               Row(
            //                                 mainAxisAlignment:
            //                                     MainAxisAlignment.spaceBetween,
            //                                 children: [
            //                                   Text(
            //                                     "₹ 620.00",
            //                                     style: CustomTextStyle.popinsmedium,
            //                                   ),
            //                                   SizedBox(
            //                                     width: MediaQuery.of(context).size.width *
            //                                         0.1,
            //                                   ),
            //                                   Row(
            //                                     children: [
            //                                         GestureDetector(
            //                                   onTap: (){
            //                                     addtocartController.decrementSize();
            //                                   },
            //                                   child: Container(
            //                                     width: 25,
            //                                     height: 25,
            //                                     decoration: BoxDecoration(
            //                                         shape: BoxShape.rectangle,
            //                                         color: MyColors.yellow,
            //                                         borderRadius:
            //                                             BorderRadius.circular(10)),
            //                                     child:  Icon(Icons.remove,
            //                                         size: 15, color: Colors.black),
            //                                         //  Icon(
            //                                         //   Icons.minimize,
            //                                         //   size: 8,
            //                                         //   color: Colors.white,
            //                                         // ),

            //                                   ),
            //                                 ),
            //                                 SizedBox(
            //                                   width: 3,
            //                                 ),

            // GetBuilder<MyCartController>(
            //                 init: addtocartController,
            //                 builder: (_) {
            //                   return
            //                                 Container(
            //                                     width: 30,
            //                                     height: 40,
            //                                     decoration: BoxDecoration(
            //                                       borderRadius: BorderRadius.circular(50),
            //                                     ),
            //                                     child: Center(
            //                                         child: Text(
            //                                       addtocartController.sizecount.toString(),
            //                                       style: TextStyle(
            //                                           fontWeight: FontWeight.w500),
            //                                     )));
            //                 }),

            //                                 SizedBox(
            //                                   width: 3,
            //                                 ),
            //                                 GestureDetector(
            //                                    onTap: (){
            //                                     addtocartController.incrementSize();
            //                                   },
            //                                   child: Container(
            //                                     width: 25,
            //                                     height: 25,
            //                                     decoration: BoxDecoration(
            //                                         //shape: BoxShape.rectangle,
            //                                         borderRadius: BorderRadius.circular(10),
            //                                         color: MyColors.yellow),
            //                                     child: Icon(Icons.add,
            //                                         size: 15, color: Colors.black),
            //                                   ),
            //                                 ),
            //                               ],
            //                                   )
            //                                 ],
            //                               )
            //                             ],
            //                           )
            //                         ]),
            //                       ],
            //                     ),
            //                   ),
            //         SizedBox(
            //   height: 20,
            // ),

            // GestureDetector(
            //   onTap: () async {
               
            //     await couponsController.init();
            //     Get.to(SalescouponPage(
            //       price:(addtocartController.total) + (addtocartController.total * 0.05),
            //     ));
            //   },
            //   child: Container(
            //       height: MediaQuery.of(context).size.height * 0.06,
            //       width: MediaQuery.of(context).size.width,
            //       decoration: BoxDecoration(
            //           color: MyColors.blue123,
            //           borderRadius: BorderRadius.circular(20)),
            //       child: Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             Row(
            //               children: [
            //                 Image.asset("assets/image/applycodeimg.png"),
            //                 SizedBox(
            //                   width: 10,
            //                 ),
            //                 Text(
            //                   "Apply coupon",
            //                   style: CustomTextStyle.popinslight,
            //                 ),

            //                   SizedBox(
            //                   width: 10,
            //                 ),
            //                 GetBuilder<SalesCouponsController>(
            //   init: couponsController,
            //   // initState: (_) {},
            //   builder: (_) {
            //                      return Text(
            //                       couponsController.couponcode??"",
            //                       style: CustomTextStyle.popinslight,
            //                 );
            //                    }
            //                  ),
            //               ],
            //             ),
            //             Icon(
            //               Icons.arrow_forward_ios_outlined,
            //               size: 18,
            //             ),
            //           ],
            //         ),
            //       )),
            // ),

            SizedBox(
              height: 10,
            ),
            GetBuilder<SalesMyCartController>(
              init: addtocartController,
              // initState: (_) {},
              builder: (_) {
                return Container(
                  // height: MediaQuery.of(context).size.height * 0.24,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: MyColors.white),
                  child: DottedBorder(
                    color: Colors.black26,
                    borderType: BorderType.Rect,
                    radius: Radius.circular(25),
                    //  strokeWidth: 1,
                    child: Container(
                      // height:MediaQuery.of(context).size.height*0.28,

                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(children: [
                          Row(
                            children: [
                              Text(
                                "Sub Total",
                                style: CustomTextStyle.popinslight,
                              ),
                              Spacer(),
                              Text(
                              "₹"+  addtocartController.total.toStringAsFixed(2),
                                style: CustomTextStyle.popinstext,
                              ),
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Divider(
                            color: MyColors.lightdivider,
                            thickness: 1,
                            height: 1,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Row(
                            children: [
                              Text(
                                "Tax(5%)",
                                style: CustomTextStyle.popinslight,
                              ),
                              Spacer(),
                              Text(
                               "+ ₹"+ (addtocartController.total * 0.05).toStringAsFixed(2),
                                style: CustomTextStyle.popinstext,
                              ),
                            ],
                          ),
                            Divider(
                            color: MyColors.lightdivider,
                            thickness: 1,
                            height: 1,
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),

                            
                        
                          Row(
                            children: [
                              Text(
                                "Rounding Adjust",
                                style: CustomTextStyle.popinslight,
                              ),
                             Spacer(),
                              GetBuilder<SalesCouponsController>(
              init: couponsController,
              // initState: (_) {},
              builder: (_) {
                                  return Text(
                                    "₹${((addtocartController.total) + (addtocartController.total * 0.05)).toDouble().toStringAsFixed(2)}",
                                    // (((total) + (total * 0.05))-(num.parse(couponsController.maxAmount!) )).toString(),
                                    style: CustomTextStyle.popinstext,
                                  );
                                }
                              ),
                            ],
                          ),

]),
                      ),
                    ),
                  ),
                );
              },
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),

            Text(
              "Address",
              style: CustomTextStyle.popinslight,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            Container(
              // height:  MediaQuery.of(context).size.height*0.15,
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(45),
                  color: MyColors.blue123),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 10, bottom: 10, right: 15),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.48,
                              child: GetBuilder<SalesMyCartController>(
                                  init: addtocartController,
                                  builder: (_) {
                                    return addtocartController
                                                    .allAddresslistModel ==
                                                null ||
                                            addtocartController
                                                    .allAddresslistModel!
                                                    .data ==
                                                null ||
                                            addtocartController
                                                .allAddresslistModel!
                                                .data!
                                                .isEmpty
                                        ? SizedBox()
                                        : Text(
                                            (addtocartController
                                                        .allAddresslistModel!
                                                        .data![addtocartController
                                                                .isselected ??
                                                            0]
                                                        .area ??
                                                    "")
                                                .toString(),
                                            style: CustomTextStyle.popinstext);
                                  })),
                        ],
                      ),
                      InkWell(
                        onTap: () async {
                          await addtocartController.alladdressinit();

                          showModalBottomSheet(
                            isScrollControlled: true,
                            context: context,
                            backgroundColor: Colors.transparent,
                            builder: (context) => Container(
                              padding: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25),
                                  ),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.cancel),
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                        ),
                                      ],
                                    ),
                                    GetBuilder<SalesMyCartController>(
                                        init: addtocartController,
                                        builder: (_) {
                                          return ListView.builder(
                                            primary: false,
                                            shrinkWrap: true,
                                            itemCount: addtocartController
                                                .allAddresslistModel!
                                                .data!
                                                .length,
                                            itemBuilder: (context, index) {
                                              var item = addtocartController
                                                  .allAddresslistModel!
                                                  .data![index];

                                              return (addtocartController
                                                          .allAddresslistModel!
                                                          .data ==
                                                      null)
                                                  ? SizedBox()
                                                  : InkWell(
                                                      onTap: () {
                                                        addtocartController
                                                            .selectaddadress(
                                                                item.id ?? 0);
                                                      },
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(10),
                                                        child: Container(
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        10),
                                                            // height: MediaQuery.of(context).size.height*0.2,
                                                            width:
                                                                MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            15),
                                                                border: Border.all(
                                                                    color: MyColors
                                                                        .grey)),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                          .all(
                                                                      10.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    item!
                                                                        .firstName
                                                                        .toString(),
                                                                    style: CustomTextStyle
                                                                        .popinstext,
                                                                  ),
                                                                  Text(
                                                                    item!
                                                                        .lastName
                                                                        .toString(),
                                                                    style: CustomTextStyle
                                                                        .popinssmallnormal,
                                                                  ),
                                                                  Text(
                                                                    "${item.houseNo.toString()} ${item.area.toString()}",
                                                                    style: CustomTextStyle
                                                                        .popinssmallnormal,
                                                                  ),
                                                                  Text(
                                                                    "${item.landmark.toString()} ${item.state.toString()} ${item.city.toString()}",
                                                                    style: CustomTextStyle
                                                                        .popinssmallnormal,
                                                                  ),
                                                                  Text(
                                                                    "Mobile No: ${item.mobile.toString()}",
                                                                    style: CustomTextStyle
                                                                        .popinssmallnormal,
                                                                  ),
                                                                  SizedBox(
                                                                      height:
                                                                          10),
                                                                  Row(
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            addressController.addadressID(item.id ??
                                                                                0);
                                                                            addressController.updateaddress(
                                                                                item.id,
                                                                                item.firstName,
                                                                                item.lastName,
                                                                                item.mobile,
                                                                                item.pincode,
                                                                                item.area,
                                                                                item.houseNo,
                                                                                item.landmark);
                                                                            print("${item.lastName}");
                                                                             addressController.fethUserId();
                                                                            Get.to(SalesAddress(
                                                                              isSelected: false,
                                                                            ));
                                                                            await addressController.updateaddaddress();
                                                                            addressController.clearFields();
                                                                          },
                                                                          child: Container(
                                                                              height: 25,
                                                                              width: 60,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(3.0),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  "Edit",
                                                                                  style: CustomTextStyle.popinssmallnormal,
                                                                                )),
                                                                              )),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            await addtocartController.addressdeleteinit();
                                                                            //  addressController.removeaddress(index);
                                                                            addtocartController.alladdressinit();
                                                                          },
                                                                          child: Container(
                                                                              height: 25,
                                                                              width: 60,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(3.0),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  "Delete",
                                                                                  style: CustomTextStyle.popinssmallnormal,
                                                                                )),
                                                                              )),
                                                                        ),
                                                                        SizedBox(
                                                                            width:
                                                                                5),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            // addressController.areaaddressController.toString();
                                                                            addtocartController.chooseaddress(index);
                                                                            Get.back();


                                                                                    final storage = GetStorage();

                                                                                    // }
                                                                                    storage.write('salesaddress', item.area);
                                                                                    storage.write('salesaddresscity', item.city);
                                                                                    
                                                                                    print(storage.read('salesaddress').toString());
                                                                                    print(storage.read('salesaddresscity').toString());
                                                                          },
                                                                          child: Container(
                                                                              height: 25,
                                                                              width: 60,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), border: Border.all(color: MyColors.grey)),
                                                                              child: Padding(
                                                                                padding: const EdgeInsets.all(3.0),
                                                                                child: Center(
                                                                                    child: Text(
                                                                                  "Choose",
                                                                                  style: CustomTextStyle.popinssmallnormal,
                                                                                )),
                                                                              )),
                                                                        ),
                                                                      ])
                                                                ],
                                                              ),
                                                            )),
                                                      ),
                                                    );
                                            },
                                          );
                                        }),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // Center(
                                    //   child: ElevatedButton(
                                    //     style: ElevatedButton.styleFrom(
                                    //       primary: MyColors.yellow,
                                    //     ),
                                    //     onPressed: () {
                                    //       Get.to(PaymentUser());
                                    //     },
                                    //     child: Text(
                                    //       'Save Address',
                                    //       style: CustomTextStyle.popinssmall,
                                    //     ),
                                    //   ),
                                    // ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.35,
                          height: MediaQuery.of(context).size.height * 0.05,
                          decoration: BoxDecoration(
                              color: MyColors.yellow,
                              borderRadius: BorderRadius.circular(25)),
                          child: Center(
                              child: Text(
                            "Change",
                            style: CustomTextStyle.mediumtextreem,
                          )),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),

            InkWell(
              onTap: () async {
                addressController.dispose();
                await addressController.init();
                Get.to(SalesAddress(
                  isSelected: true,
                ));
              },
              child: Row(
                children: [
                  Icon(Icons.add, size: 15, color: MyColors.yellow),
                  Text("Add new address",
                      style: CustomTextStyle.yellowtextnormal),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Container(
              // height: MediaQuery.of(context).size.height * 0.09,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  color: MyColors.white),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, top: 5, bottom: 5, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //  Row(
                        //         children: [
                        //           Text(
                        //               "₹ 620",
                        //               style: CustomTextStyle.discounttext),
                        //           SizedBox(width: 3),
                        //           Container(
                        //             height: 20,
                        //             width: 40,
                        //             decoration: BoxDecoration(
                        //                 color: MyColors.red,
                        //                 borderRadius: BorderRadius.circular(10),
                        //                 border:
                        //                     Border.all(color: MyColors.red)),
                        //             child: Center(
                        //               child: Text(
                        //                   // item.discount.toString(),
                        //                   "Save20%",
                        //                   style: CustomTextStyle
                        //                       .popinstextsmal2222),
                        //             ),
                        //           ),
                        //             SizedBox(width: 10),
                        //   Text( "₹ 520", style: CustomTextStyle.appbartext),

                        //         ],
                        //       ),
                        Text("Total", style: CustomTextStyle.popinstext),

                          GetBuilder<SalesMyCartController>(
              init: addtocartController,
              // initState: (_) {},
              builder: (_) {
                     return   Text( "₹${(((addtocartController.total) + (addtocartController.total * 0.05))).toStringAsFixed(2)}",
                           style: CustomTextStyle.appbartext);
              })
                        // Row(
                        //   children: [
                        //     Text("₹ 620", style: CustomTextStyle.discounttext),
                        //     SizedBox(width: 3),
                        //     Container(
                        //       height: 20,
                        //       width: 40,
                        //       decoration: BoxDecoration(
                        //           color: MyColors.red,
                        //           borderRadius: BorderRadius.circular(10),
                        //           border: Border.all(color: MyColors.red)),
                        //       child: Center(
                        //         child: Text(
                        //             // item.discount.toString(),
                        //             "Save20%",
                        //             style: CustomTextStyle.popinstextsmal2222),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context)=> OrderSummary()));
                       
                          
                            if (addtocartController.isselected != null &&
                                addtocartController.allAddresslistModel !=
                                    null &&
                                addtocartController.allAddresslistModel!.data !=
                                    null &&
                                addtocartController
                                    .allAddresslistModel!.data!.isNotEmpty) {
                              if (addtocartController
                                  .mycartmodel!.data!.isEmpty) {
                                Get.snackbar(
                                  "Error",
                                  "Please add any items",
                                  snackPosition: SnackPosition.BOTTOM,
                                  colorText: Colors.white,
                                  backgroundColor: Colors.red,
                                );
                              } else {
                                // Proceed to the payment screen
                              Get.to(PaymentSales(
                         price:(((addtocartController.total) + (addtocartController.total * 0.05))).toString()
                        // paymentstatus: ,
                        ));
                              }
                            } else {
                              // Show a validation message indicating that no address is selected
                              Get.snackbar(
                                "Error",
                                "Please select an address before proceeding.",
                                snackPosition: SnackPosition.BOTTOM,
                                colorText: Colors.white,
                                backgroundColor: Colors.red,
                              );
                            }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.height * 0.06,
                        decoration: BoxDecoration(
                            color: MyColors.yellow,
                            borderRadius: BorderRadius.circular(25)),
                        child: Center(
                            child: Text(
                          "Proceed To Buy",
                          style: CustomTextStyle.mediumtextreem,
                        )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),

            //           Container(height:   MediaQuery.of(context).size.height*0.2,
            //      width:MediaQuery.of(context).size.width ,
            //      decoration: BoxDecoration(borderRadius: BorderRadius.circular(25),color: boxbgcolor),
            //      child: Row(children: [

            //              Padding(
            //                padding: const EdgeInsets.all(0.0),
            //                child: Image.asset("assets/image/fooddog.png",),
            //              ),

            //              Column(crossAxisAlignment: CrossAxisAlignment.start,

            //               children: [

            // Text("Mars Petcare Inc",style: CustomTextStyle.popinsmedium,),

            // Text(" with paneer or cottage cheese",style: CustomTextStyle.popinsmedium)

            //              ],)

            //      ]),

            //      )
          ],
        ),
      ),
    );
  }
}