import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:canine/controllers/salesman_controller/myOrdersales_controller.dart';
import 'package:canine/controllers/salesman_controller/notification_controller.dart';
import 'package:canine/controllers/salesman_controller/salesfavourite_controller.dart';
import 'package:canine/controllers/salesman_controller/salesprofile_controller.dart';
import 'package:canine/controllers/user_controller/myOrder_controller.dart';
import 'package:canine/screens/intro2.dart';
import 'package:canine/screens/salesman/Dashboard.dart';
import 'package:canine/screens/salesman/home.dart';
import 'package:canine/screens/salesman/notification.dart';
import 'package:canine/screens/salesman/salesfavourite.dart';
import 'package:canine/screens/salesman/salesmyOrderPage.dart';
import 'package:canine/screens/salesman/salesprofile.dart';
import 'package:canine/screens/user/Mypetdetails.dart';
import 'package:canine/screens/user/UserAddMyPet.dart';
import 'package:canine/screens/user/login.dart';
import 'package:canine/screens/user/UserMyPet.dart';
import 'package:canine/screens/user/allveterniary.dart';
import 'package:canine/screens/user/myOrderPage.dart';
import 'package:canine/screens/user/myservices.dart';
import 'package:canine/screens/user/UserMyPet.dart';
import 'package:canine/screens/user/allveterniary.dart';
import 'package:canine/screens/user/myservices.dart';
import 'package:canine/screens/user/UserAddMyPet.dart';
import 'package:canine/screens/user/notification.dart';
import 'package:canine/screens/user/orderDetails.dart';
import 'package:canine/screens/user/ordersummary.dart';
// import 'package:canine/screens/user/userprofile.dart';
import 'package:canine/screens/user/service.dart';
// import 'package:canine/screens/user/userfavourite.dart';
// import 'package:canine/screens/user/usertranscation.dart';
import 'package:canine/utils/colors.dart';
import 'package:canine/utils/constants.dart';
import 'package:canine/utils/fontstyle.dart';

class drawerSalesMan extends StatefulWidget {
  const drawerSalesMan({
    super.key,
  });

  @override
  State<drawerSalesMan> createState() => _drawerSalesManState();
}

class _drawerSalesManState extends State<drawerSalesMan> {
  SalesMyOrderController myordercontroller = Get.put(SalesMyOrderController());
  SalesProfileController salesprofilecontroller =
      Get.put(SalesProfileController());
  NotificationsalesController notificationsalescontroller =
      Get.put(NotificationsalesController());
  SalesfavouriteController salesfavouriteController =
      Get.put(SalesfavouriteController());
  static final List<String> _listViewData = [
    "Profile",
    "DashBoard",
    "My Order",
    "Notifications",
    "Favourite",
    "Logout"
  ];

  static final List<IconData> _listViewIcons = [
    Icons.person,
    Icons.dashboard,
    Icons.shopping_bag_outlined,
    Icons.notifications,
    Icons.favorite,
    Icons.logout,
  ];

  int _currentSelected = 0;

  
 @override
  void initState() {
    super.initState();
    salesprofilecontroller.salesMyProfile();
 }


  @override
  Widget build(BuildContext context) {
// print("ImagePathsales" + "${Constants.SALESMAN_IMAGEPATH_URL}"+salesprofilecontroller.salesprofilemodel!.data![0].image.toString());
    return Drawer(
      backgroundColor: MyColors.bgcolor,
      child: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.2,
            child: DrawerHeader(
              child: GetBuilder<SalesProfileController>(
                  init: salesprofilecontroller,
                  builder: (_) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            // Get.to(Profile());
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Center(
                                              child: Stack(
                                                  alignment:
                                                      Alignment.topCenter,
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 20),
                                                      child: CircleAvatar(
                                                        radius: 35,
                                                        backgroundColor:
                                                            Colors.transparent,
                                                        child: salesprofilecontroller.salesprofilemodel == null ||
                                                                salesprofilecontroller
                                                                        .salesprofilemodel!
                                                                        .data ==
                                                                    null ||
                                                                salesprofilecontroller
                                                                    .salesprofilemodel!
                                                                    .data!
                                                                    .isEmpty
                                                            ? Image.asset(
                                                                "assets/image/boyprofile3.png")
                                                            : ClipOval(
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: "${Constants.SALESMAN_IMAGEPATH_URL}" +
                                                                      salesprofilecontroller
                                                                          .salesprofilemodel!
                                                                          .data![
                                                                              0]
                                                                          .image
                                                                          .toString(),

                                                                  fit: BoxFit
                                                                      .cover,

                                                                  width: 75,
                                                                  height:
                                                                      75, 
                                                                  placeholder:
                                                                      (context,
                                                                              url) =>
                                                                          Center(
                                                                    child:
                                                                        CircularProgressIndicator(),
                                                                  ), // Replace with your own placeholder widget
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error), // Replace with your own error widget
                                                                ),
                                                              ),
                                                        //  Image.asset("assets/image/boyprofile3.png"),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      bottom: 10,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Get.to(
                                                              salesProfile());
                                                        },
                                                        child: Image.asset(
                                                          "assets/image/drawer2.png",
                                                          height: 25,
                                                        ),
                                                      ),
                                                    )
                                                  ]),
                                            ),
                                            SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.05),
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: <Widget>[
                                                  salesprofilecontroller
                                                                  .salesprofilemodel ==
                                                              null ||
                                                          salesprofilecontroller
                                                                  .salesprofilemodel!
                                                                  .data ==
                                                              null ||
                                                          salesprofilecontroller
                                                              .salesprofilemodel!
                                                              .data!
                                                              .isEmpty
                                                      ? const SizedBox()
                                                      : Text(
                                                          "${salesprofilecontroller.salesprofilemodel!.data![0].fName.toString()} ${salesprofilecontroller.salesprofilemodel!.data![0].lName.toString()}",
                                                          style: TextStyle(
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              color: MyColors
                                                                  .white),
                                                        ),
                                                  SizedBox(
                                                    height: 5,
                                                  ),
                                                  salesprofilecontroller
                                                                  .salesprofilemodel ==
                                                              null ||
                                                          salesprofilecontroller
                                                                  .salesprofilemodel!
                                                                  .data ==
                                                              null ||
                                                          salesprofilecontroller
                                                              .salesprofilemodel!
                                                              .data!
                                                              .isEmpty
                                                      ? const SizedBox()
                                                      : Text(
                                                          salesprofilecontroller
                                                              .salesprofilemodel!
                                                              .data![0]
                                                              .email
                                                              .toString(),
                                                          style: TextStyle(
                                                              color: MyColors
                                                                  .white,
                                                              fontSize: 16),
                                                        ),
                                                ]),
                                          ],
                                        ),
                                      ]),
                                ]),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: _listViewData.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Navigate to the corresponding screen
                  _navigateToScreen(context, index);
                },
                child: Container(
                  // decoration: BoxDecoration(
                  //   color: _currentSelected == index
                  //       ? MyColors.gradient
                  //       : MyColors.bgcolor,
                  // ),
                  child: ListTile(
                    title: Text(
                      _listViewData[index],
                      style: CustomTextStyle.reemStyle,
                    ),
                    leading: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: MyColors.blue,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        _listViewIcons[index],
                        color: MyColors.yellow,
                        size: 24,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Future<void> _navigateToScreen(BuildContext context, int index) async {
    switch (index) {
      case 0:

        Get.to(salesProfile());
        break;
      case 1:
        Get.to(DashboardSales());
        break;

      case 2:
        myordercontroller.fethUserId();
        myordercontroller.init();
        Get.to(MyOrderSales());
        break;
      case 3:
        notificationsalescontroller.notifyinit();
        Get.to(NotificationSales());
        break;
      case 4:
        salesfavouriteController.fethUserId();
        Get.to(Salesfavourite());
        break;

      case 5:
        await GetStorage().erase();
        Get.offAll(LoginUser());
        break;
      //  case 7:
      //   Get.to(Usertranscation());
      //     break;
      // case 7:
      //   await GetStorage().erase();
      //   Get.offAll(LoginUser());
      //   break;
    }
  }
}
