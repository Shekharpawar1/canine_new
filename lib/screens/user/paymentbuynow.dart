import 'dart:convert';
import 'dart:ui';

import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:canine/controllers/user_controller/addtocartcontroller.dart';
import 'package:canine/screens/user/myOrderPage.dart';
import 'package:canine/screens/user/orderDetails.dart';
import 'package:canine/screens/user/payment2.dart';
import 'package:canine/screens/user/userHome.dart';
import 'package:canine/screens/user/userUpiScreen.dart';
import 'package:canine/screens/wholesaler/notification.dart';
import 'package:canine/utils/colors.dart';
import 'package:canine/utils/fontstyle.dart';
import 'package:canine/screens/wholesaler/payment2.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
import "package:http/http.dart" as http;

enum Choose { upi, cash, phonepay, paytm }

class PaymentUserBuyNow extends StatefulWidget {
  PaymentUserBuyNow(
      {super.key, required this.price, this.orderstatus, this.paymentstatus
      });
  double price;


  String? orderstatus;
  String? paymentstatus;

  @override
  State<PaymentUserBuyNow> createState() => _PaymentUserBuyNowState();
}

class _PaymentUserBuyNowState extends State<PaymentUserBuyNow> {
  MyCartController mycartController = Get.put(MyCartController());

  String? selectupi;
  String? selectcredit;
  String? selectphoepay;
  String? selectpaytm;
  // bool _isOn = false;
  Choose? selectone;

  @override
  Widget build(BuildContext context) {
    print("Price");
    print(widget.price??'');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
          child: GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_left, color: MyColors.black)),
        ),
        title: Center(
//SvgPicture.asset("assets/image/menu1.svg",height: 25,),
//
            child: Text(
              "Payment",
              style: TextStyle(
                fontSize: 16,
                color: MyColors.black,
                fontWeight: FontWeight.w700,
              ),
            )),

      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: ListView(
              shrinkWrap: true,
              primary: true,
              children: [
                Container(
                  width: 335,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: Choose.upi,
                          groupValue: selectone,
                          onChanged: (Choose? value) {
                            setState(() {
                              selectone = value!;
                            });
                          }),
                      Image.asset("assets/image/upi.png", height: 40),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                Container(
                  width: 335,
                  height: 54,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(28),
                      gradient: LinearGradient(
                        begin: Alignment.centerLeft,
                        end: Alignment.centerRight,
                        colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Radio(
                          value: Choose.cash,
                          groupValue: selectone,
                          onChanged: (Choose? value) {
                            setState(() {
                              selectone = value!;
                            });
                          }),
                      Image.asset("assets/image/house.png", height: 40),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                      Text(
                        "Cash",
                        style: CustomTextStyle.popinssmall0,
                      )
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                InkWell(
                  onTap: () async {

                    if (selectone == Choose.upi) {
                      print("UPI payment");

                      mycartController.addpaymenttype(
                        selectone == Choose.upi ? 'online' : "offline",
                        selectone == Choose.cash ? "paid" : "unpaid",
                        selectone == Choose.upi ? 'upi' : "cash",
                      );
                      // await mycartController.p/laceorder();
                      ///
                      /// yha pr place order online ka function call hoga
                      /// await mycartController.placeOrder2(widget.price,delivery_address_id,store_id);

                      // Get.to(UserUpiScreen(amount: (widget.price)));
                      String ApiKey='2ceb3077-fa6a-41d4-83f9-ac3250f66432';
                      String Env = 'UAT_SIM';
                      // String Env = 'PRODUCTION';
                      bool enableLogging = true;
                      String checksum = '';
                      String saltIndex = '1';
                      // String environmentValue = 'UAT_SIM';
                      String appId = "";
                      String merchantId = "PGTESTPAYUAT";
                      String saltKey = "	099eb0cd-02cf-4e2a-8aca-3e6c6aff0399";
                      // String saltKey = '2ceb3077-fa6a-41d4-83f9-ac3250f66432';
                      String callbackUrl ='https://canine.hirectjob.in/api/v1/auth/payment/callback';
                      String body = '';
                      Object? result;
                      String apiEndPoint = "/pg/v1/pay";
                      String transactionID=DateTime.now().millisecondsSinceEpoch.toString();

                      // String merchantId = 'M22USCTZ0J8DL';
                      // String AppId = "null";
                      // String ApiKey='2ceb3077-fa6a-41d4-83f9-ac3250f66432';
                      // String Env = 'PRODUCTION';
                      // bool enableLogging = true;
                      // String checksum = '';
                      // String saltIndex = '1';
                      // String saltKey = '2ceb3077-fa6a-41d4-83f9-ac3250f66432';
                      // String callbackUrl ='https://canine.hirectjob.in/api/v1/auth/payment/callback';
                      // String body = '';
                      // Object? result;
                      // String apiEndPoint = "/pg/v1/pay";
                      String userid = GetStorage().read("id").toString();
                      // String transactionID=DateTime.now().millisecondsSinceEpoch.toString();

                      String getCheckSum() {
                        final requestData = {
                          "merchantId": merchantId,
                          "merchantTransactionId": transactionID,
                          "merchantUserId": userid,
                          // "amount": 10000,
                          "amount": widget.price*100,
                          "callbackUrl": callbackUrl,

                          "paymentInstrument": {"type": "PAY_PAGE"}
                        };

                        String base64body = base64.encode(utf8.encode(json.encode(requestData)));
                        print("transactionID${requestData}");
                        checksum =
                        '${sha256.convert(utf8.encode(base64body + apiEndPoint + ApiKey)).toString()}###$saltIndex';

                        return base64body;
                      }
                      void handleError(err) {
                        setState(() {
                          result = {"error": err};
                        });
                      }

                      Future<void> checkStatus() async {
                        print("check called");
                        String url = 'https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/$merchantId/$transactionID';
                        String concatString = '/pg/v1/status/$merchantId/$transactionID$ApiKey';
                        print("concatString{$concatString");
                        var bytes = utf8.encode(concatString);
                        var digest = sha256.convert(bytes).toString();
                        String xVerify = '$digest###$saltIndex';

                        Map<String, String> headers = {
                          "Content-Type":"application/json",
                          "X-VERIFY":xVerify,
                          "X-MERCHANT-ID":merchantId,
                        };


                        print("check headers${headers}");
                        print("url${url}");
                        try {
                          await http.get(Uri.parse(url), headers: headers).then(
                                  (value) {
                                Map<String, dynamic> res = jsonDecode(value.body);
                                print("Response: ${res}");
                                if (res['success'] && res['code'] == 'PAYMENT_SUCCESS' &&
                                    res['data']['state'] == 'COMPLETED') {
                                  print("Response: ${res}");
                                } else {
                                  print("Response: ${res}");
                                }
                              });
                          // print("Response: ${res}");



                        } catch (e) {
                          print('Error: $e');

                        }
                      }

                      void startPgTransaction() async {
                        try {
                          String base64body = getCheckSum();
                          var response = await PhonePePaymentSdk.startTransaction(
                            base64body,
                            callbackUrl,
                            checksum,
                            "",
                          );

                          if (response != null) {
                            String status = response['status'].toString();
                            String error = response['error'].toString();
                            print("sdk response${response}");
                            if (status == 'SUCCESS') {
                              result = "Flow Completed - Status:${response}";
                              await checkStatus();
                            } else {
                              result = "Flow Completed - Status: $status and Error: $error";
                            }
                          } else {
                            result = "Flow Incomplete";
                          }
                        } catch (err) {
                          print(err);
                        }
                      }
                      void paymentInit() {
                        print("${[Env, "", merchantId, enableLogging]}")
                        ;    PhonePePaymentSdk.init(Env, "", merchantId, enableLogging)
                            .then((val) => {
                          startPgTransaction(),
                          setState(() {
                            result = 'PhonePe SDK Initialized - $val';
                          })
                        })
                            .catchError((error) {
                          handleError(error);
                          return <dynamic>{};
                        });
                      }
                      paymentInit();


                    } else if (selectone == Choose.cash) {
                      print("Cash payment");
                      mycartController.addpaymenttype(
                        selectone == Choose.cash ? 'offline' : "online",
                        selectone == Choose.cash ? "unpaid" : "paid",
                        selectone == Choose.cash ? 'cash' : "upi",);
                      try {

                        await mycartController.buynowplaceorder();

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              // title:  Text("Login"),

                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.all(10.0),
                                    child:
                                    Image.asset("assets/image/success.png", height: 50, width: 50,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("Order Placed Successfully"),
                                  ),
                                  SizedBox(height: 10)
                                  ,
                                  InkWell(
                                    onTap:(){
                                      Get.off(MyOrderUser());
                                    },
                                    child: Align(
                                        alignment: Alignment.bottomRight,
                                        child: Text("Ok")),
                                  )
                                ],
                              ),
                            );
                          },
                        );

                        Get.off(MyOrderUser());
                      } catch (e) {

                        await showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,

                              content: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [

                                  Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child:
                                    Image.asset("assets/image/multiply.png", height: 50, width: 50,),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text("Failed"),
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      }

                    }
                  },
                  child: Center(
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.08,
                      decoration: BoxDecoration(
                          color: MyColors.yellow,
                          borderRadius: BorderRadius.circular(25)),
                      child: Center(
                          child: Text(
                            "Next",
                            style: CustomTextStyle.mediumtextreem,
                          )),
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
          GetBuilder<MyCartController>(
              init: mycartController,
              builder: (_) {
                return mycartController.showLoading
                    ? BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Adjust the opacity as needed
                  ),
                )
                    : SizedBox();
              }),
          // Progress bar
          GetBuilder<MyCartController>(
              init: mycartController,
              builder: (_) {
                return mycartController.showLoading
                    ? Center(
                  child: SpinKitCircle(
                    color: Colors.white, // Color of the progress bar
                    size: 50.0, // Size of the progress bar
                  ),
                )
                    : SizedBox();
              }),
        ],
      ),
    );
  }
}

// ListTile(
//                               title: Text("Myself"),
//                               leading: Radio(
//                                   value:"",
//                                 //  activeColor: buttoncolor,
//                                   groupValue: select,
//                                   onChanged: (value) {
//                                     setState(() {
//                                       select = value.toString();


//                                     });
//                                   }),
//                             ),







// import 'dart:ui';




//
// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:canine/controllers/user_controller/addtocartcontroller.dart';
// import 'package:canine/screens/user/myOrderPage.dart';
// import 'package:canine/screens/user/orderDetails.dart';
// import 'package:canine/screens/user/payment2.dart';
// import 'package:canine/screens/user/userUpiScreen.dart';
// import 'package:canine/screens/wholesaler/notification.dart';
// import 'package:canine/utils/colors.dart';
// import 'package:canine/utils/fontstyle.dart';
// import 'package:canine/screens/wholesaler/payment2.dart';
//
// enum Choose { upi, cash, phonepay, paytm }
//
// class PaymentUserBuyNow extends StatefulWidget {
//   PaymentUserBuyNow(
//       {super.key, required this.price, this.orderstatus, this.paymentstatus
//        });
//   double price;
//
//
//   String? orderstatus;
//   String? paymentstatus;
//
//   @override
//   State<PaymentUserBuyNow> createState() => _PaymentUserBuyNowState();
// }
//
// class _PaymentUserBuyNowState extends State<PaymentUserBuyNow> {
//   MyCartController mycartController = Get.put(MyCartController());
//
//   String? selectupi;
//   String? selectcredit;
//   String? selectphoepay;
//   String? selectpaytm;
//   // bool _isOn = false;
//   Choose? selectone;
//
//   @override
//   Widget build(BuildContext context) {
//     print("Price");
//     print(widget.price??'');
//     return Scaffold(
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: Colors.transparent,
//         leading: Padding(
//           padding: const EdgeInsets.only(left: 5.0, top: 15, bottom: 15),
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.pop(context);
//               },
//               child: Icon(Icons.arrow_left, color: MyColors.black)),
//         ),
//         title: Center(
// //SvgPicture.asset("assets/image/menu1.svg",height: 25,),
// //
//             child: Text(
//           "Payment",
//           style: TextStyle(
//             fontSize: 16,
//             color: MyColors.black,
//             fontWeight: FontWeight.w700,
//           ),
//         )),
//
//       ),
//       body: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(15.0),
//             child: ListView(
//               shrinkWrap: true,
//               primary: true,
//               children: [
//                 Container(
//                   width: 335,
//                   height: 54,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(28),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
//                       )),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Radio(
//                           value: Choose.upi,
//                           groupValue: selectone,
//                           onChanged: (Choose? value) {
//                             setState(() {
//                               selectone = value!;
//                             });
//                           }),
//                       Image.asset("assets/image/upi.png", height: 40),
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//                 Container(
//                   width: 335,
//                   height: 54,
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(28),
//                       gradient: LinearGradient(
//                         begin: Alignment.centerLeft,
//                         end: Alignment.centerRight,
//                         colors: [Color(0xffeeeeff), Color(0x59eeeeff)],
//                       )),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     children: [
//                       Radio(
//                           value: Choose.cash,
//                           groupValue: selectone,
//                           onChanged: (Choose? value) {
//                             setState(() {
//                               selectone = value!;
//                             });
//                           }),
//                       Image.asset("assets/image/house.png", height: 40),
//                       SizedBox(width: MediaQuery.of(context).size.width * 0.05),
//                       Text(
//                         "Cash",
//                         style: CustomTextStyle.popinssmall0,
//                       )
//                     ],
//                   ),
//                 ),
//                 SizedBox(height: MediaQuery.of(context).size.height * 0.03),
//
//                 InkWell(
//                   onTap: () async {
//
//                     if (selectone == Choose.upi) {
//                       print("UPI payment");
//
//                       mycartController.addpaymenttype(
//                           selectone == Choose.upi ? 'online' : "offline",
//                           selectone == Choose.cash ? "paid" : "unpaid",
//                            selectone == Choose.upi ? 'upi' : "cash",
//                           );
//                       // await mycartController.p/laceorder();
// ///
//                       /// yha pr place order online ka function call hoga
//                       /// await mycartController.placeOrder2(widget.price,delivery_address_id,store_id);
//                       Get.to(
//                           UserUpiScreen(amount: (widget.price)));
//                     } else if (selectone == Choose.cash) {
//                       print("Cash payment");
//                       mycartController.addpaymenttype(
//                           selectone == Choose.cash ? 'offline' : "online",
//                           selectone == Choose.cash ? "unpaid" : "paid",
//                            selectone == Choose.cash ? 'cash' : "upi",);
//                           try {
//
//                       await mycartController.buynowplaceorder();
//
//                       await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             scrollable: true,
//                             // title:  Text("Login"),
//
//                             content: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.all(10.0),
//                                   child:
//                                       Image.asset("assets/image/success.png", height: 50, width: 50,),
//                                 ),
//                                 Padding(
//                                   padding: const EdgeInsets.all(8.0),
//                                   child: Text("Order Placed Successfully"),
//                                 ),
// SizedBox(height: 10)
// ,
//                                 InkWell(
//                                   onTap:(){
//                                        Get.off(MyOrderUser());
//                                   },
//                                   child: Align(
//                                     alignment: Alignment.bottomRight,
//                                     child: Text("Ok")),
//                                 )
//                               ],
//                             ),
//                           );
//                         },
//                       );
//
//                       Get.off(MyOrderUser());
//                           } catch (e) {
//
//  await showDialog(
//                         context: context,
//                         builder: (BuildContext context) {
//                           return AlertDialog(
//                             scrollable: true,
//
//                             content: Column(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//
//                                 Padding(
//                                   padding: const EdgeInsets.all(10.0),
//                                   child:
//                                       Image.asset("assets/image/multiply.png", height: 50, width: 50,),
//                                 ),
//                                 const Padding(
//                                   padding: EdgeInsets.all(8.0),
//                                   child: Text("Failed"),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       );
//                           }
//
//                     }
//                   },
//                   child: Center(
//                     child: Container(
//                       width: MediaQuery.of(context).size.width * 0.9,
//                       height: MediaQuery.of(context).size.height * 0.08,
//                       decoration: BoxDecoration(
//                           color: MyColors.yellow,
//                           borderRadius: BorderRadius.circular(25)),
//                       child: Center(
//                           child: Text(
//                         "Next",
//                         style: CustomTextStyle.mediumtextreem,
//                       )),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//               ],
//             ),
//           ),
//           GetBuilder<MyCartController>(
//               init: mycartController,
//               builder: (_) {
//                 return mycartController.showLoading
//                     ? BackdropFilter(
//                         filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
//                         child: Container(
//                           color: Colors.black
//                               .withOpacity(0.5), // Adjust the opacity as needed
//                         ),
//                       )
//                     : SizedBox();
//               }),
//           // Progress bar
//           GetBuilder<MyCartController>(
//               init: mycartController,
//               builder: (_) {
//                 return mycartController.showLoading
//                     ? Center(
//                         child: SpinKitCircle(
//                           color: Colors.white, // Color of the progress bar
//                           size: 50.0, // Size of the progress bar
//                         ),
//                       )
//                     : SizedBox();
//               }),
//         ],
//       ),
//     );
//   }
// }
//
//   // ListTile(
//   //                               title: Text("Myself"),
//   //                               leading: Radio(
//   //                                   value:"",
//   //                                 //  activeColor: buttoncolor,
//   //                                   groupValue: select,
//   //                                   onChanged: (value) {
//   //                                     setState(() {
//   //                                       select = value.toString();
//
//
//   //                                     });
//   //                                   }),
//   //                             ),
//