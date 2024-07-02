// import 'dart:convert';
//
// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:canine/controllers/wholesaler_controller/addtocartcontroller.dart';
//
// import 'package:canine/screens/wholesaler/notification.dart';
// import 'package:canine/screens/wholesaler/orderDetails.dart';
// import 'package:canine/screens/wholesaler/paymentdone.dart';
// import 'package:canine/utils/colors.dart';
// import 'package:canine/utils/fontstyle.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
// import 'package:upi_india/upi_india.dart';
//
// class WholeUpiScreen extends StatefulWidget {
//   WholeUpiScreen({super.key,this.amount});
//   double? amount;
//   @override
//   _WholeUpiScreenState createState() => _WholeUpiScreenState();
// }
//
// class _WholeUpiScreenState extends State<WholeUpiScreen> {
//   MyCartWholeController mycartwholeController = Get.put(MyCartWholeController());
//
//
//   Future<UpiResponse>? _transaction;
//   UpiIndia _upiIndia = UpiIndia();
//   List<UpiApp>? apps;
//
//   TextStyle header = TextStyle(fontSize: 18, fontWeight: FontWeight.bold,);
//
//   TextStyle value = TextStyle(fontWeight: FontWeight.w400, fontSize: 14,);
//
//   @override void initState() {
// //
// //     print("screen is on stack");
// //     super.initState();
// //   }
//
//
//   //List<UpiApp>? apps;
//
//   // String user_id=mycartController.user_id;
//
//
//   // Future<void> checkStatus() async {
//   //   print("check called");
//   //   String url = 'https://api-preprod.phonepe.com/apis/pg-sandbox/pg/v1/status/$merchantId/$transactionID';
//   //   String concatString = '/pg/v1/status/$merchantId/$transactionID$ApiKey';
//   //   print("concatString{$concatString");
//   //   var bytes = utf8.encode(concatString);
//   //   var digest = sha256.convert(bytes).toString();
//   //   String xVerify = '$digest###$saltIndex';
//   //
//   //   Map<String, String> headers = {
//   //     "Content-Type":"application/json",
//   //     "X-VERIFY":xVerify,
//   //     "X-MERCHANT-ID":merchantId,
//   //   };
//   //
//   //
//   //   print("check headers${headers}");
//   //   print("url${url}");
//   //   try {
//   //     await http.get(Uri.parse(url), headers: headers).then(
//   //             (value) {
//   //           Map<String, dynamic> res = jsonDecode(value.body);
//   //           print("Response: ${res}");
//   //           if (res['success'] && res['code'] == 'PAYMENT_SUCCESS' &&
//   //               res['data']['state'] == 'COMPLETED') {
//   //             print("Response: ${res}");
//   //             Get.to(PaymentDoneScreenuser());
//   //             mycartController.placeorder();
//   //           } else {
//   //             print("Response: ${res}");
//   //           }
//   //         });
//   //     // print("Response: ${res}");
//   //
//   //
//   //
//   //   } catch (e) {
//   //     print('Error: $e');
//   //
//   //   }
//   // }
//   Future<UpiResponse>? _transactionResult;
//
//
//   Widget displayUpiApps() {
//     if (apps == null || apps!.isEmpty) {
//       // If no UPI apps available, initiate PhonePe payment
//       startPgTransaction();
//       // Return a placeholder widget until the payment is initiated
//       return Center(child: CircularProgressIndicator());
//     }
//       return Align(
//         alignment: Alignment.topCenter,
//         child: SingleChildScrollView(
//           physics: BouncingScrollPhysics(),
//           child: Wrap(
//             children: apps!.map<Widget>((UpiApp app) {
//               return GestureDetector(
//                 onTap: () {
//                   startPgTransaction(); // Start the transaction
//                 },
//                 child: Container(
//                   height: 100,
//                   width: 100,
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: <Widget>[
//                       Image.memory(
//                         app.icon,
//                         height: 60,
//                         width: 60,
//                       ),
//                       Text(app.name),
//                     ],
//                   ),
//                 ),
//               );
//             }).toList(),
//           ),
//         ),
//       );
//   }
//
//   // void initState() {
//   //   _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
//   //     setState(() {
//   //       apps = value;
//   //     });
//   //   }).catchError((e) {
//   //     apps = [];
//   //   });
//   //   super.initState();
//   // }
//   //
//   // Future<UpiResponse> initiateTransaction(UpiApp app) async {
//   //   return _upiIndia.startTransaction(
//   //     app: app,
//   //     receiverUpiId: "ruchika.nawghare@ybl",
//   //     receiverName: 'Ruchika',
//   //     transactionRefId: 'TestingUpiIndiaPlugin',
//   //     transactionNote: 'Not actual. Just an example.',
//   //     amount: (widget.amount!),
//   //   );
//   // }
//   //
//   //
//   // String _upiErrorHandler(error) {
//   //   switch (error) {
//   //     case UpiIndiaAppNotInstalledException:
//   //       return 'Requested app not installed on device';
//   //     case UpiIndiaUserCancelledException:
//   //       return 'You cancelled the transaction';
//   //     case UpiIndiaNullResponseException:
//   //       return 'Requested app didn\'t return any response';
//   //     case UpiIndiaInvalidParametersException:
//   //       return 'Requested app cannot handle the transaction';
//   //     default:
//   //       return 'An Unknown error has occurred';
//   //   }
//   // }
//   //
//   // void _checkTxnStatus(String status) {
//   //   switch (status) {
//   //     case UpiPaymentStatus.SUCCESS:
//   //       Get.to(PaymentDoneScreenwhole());
//   //       mycartwholeController. placeorder();
//   //       print('Transaction Successful');
//   //       break;
//   //     case UpiPaymentStatus.SUBMITTED:
//   //       print('Transaction Submitted');
//   //       break;
//   //     case UpiPaymentStatus.FAILURE:
//   //       print('Transaction Failed');
//   //       break;
//   //     default:
//   //       print('Received an Unknown transaction status');
//   //   }
//   // }
//   //
//   // Widget displayTransactionData(title, body) {
//   //   return Padding(
//   //     padding: const EdgeInsets.all(8.0),
//   //     child: Row(
//   //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //       children: [
//   //         Text("$title: ", style: header),
//   //         Flexible(
//   //             child: Text(
//   //               body,
//   //               style: value,
//   //             )),
//   //       ],
//   //     ),
//   //   );
//   // }
//
//
//   @override
//   Widget build(BuildContext context) {
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
//             child: Text(
//               "UPI Payment",
//               style: TextStyle(
//                 fontSize: 16,
//                 color: MyColors.black,
//                 fontWeight: FontWeight.w700,
//               ),
//             )),
//       ),
//       body: Column(
//         children: <Widget>[
//           Expanded(
//             child: displayUpiApps(),
//           ),
//           // Expanded(
//           //   // child: FutureBuilder(
//           //   //   future: _transaction,
//           //   //   builder: (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
//           //   //     if (snapshot.connectionState == ConnectionState.done) {
//           //   //       if (snapshot.hasError) {
//           //   //         return Center(
//           //   //           child: Text(
//           //   //             _upiErrorHandler(snapshot.error.runtimeType),
//           //   //             style: header,
//           //   //           ), // Print's text message on screen
//           //   //         );
//           //   //       }
//           //   //
//           //   //       // If we have data then definitely we will have UpiResponse.
//           //   //       // It cannot be null
//           //   //       UpiResponse _upiResponse = snapshot.data!;
//           //   //
//           //   //       // Data in UpiResponse can be null. Check before printing
//           //   //       String txnId = _upiResponse.transactionId ?? 'N/A';
//           //   //       String resCode = _upiResponse.responseCode ?? 'N/A';
//           //   //       String txnRef = _upiResponse.transactionRefId ?? 'N/A';
//           //   //       String status = _upiResponse.status ?? 'N/A';
//           //   //       String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
//           //   //       //_checkTxnStatus(status);
//           //   //
//           //   //       return Padding(
//           //   //         padding: const EdgeInsets.all(8.0),
//           //   //         child: Column(
//           //   //           mainAxisAlignment: MainAxisAlignment.center,
//           //   //           children: <Widget>[
//           //   //             // displayTransactionData('Transaction Id', txnId),
//           //   //             // displayTransactionData('Response Code', resCode),
//           //   //             // displayTransactionData('Reference Id', txnRef),
//           //   //             // displayTransactionData('Status', status.toUpperCase()),
//           //   //             // displayTransactionData('Approval No', approvalRef),
//           //   //           ],
//           //   //         ),
//           //   //       );
//           //   //     } else
//           //   //       return Center(
//           //   //         child: Text(''),
//           //   //       );
//           //   //   },
//           //   // ),
//           // ),
//           InkWell(
//             onTap: () {
//               Get.to(OrderDetailswhole(
//
//
//               ));
//               // Get.to(Payment2User());
//             },
//             child: Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width * 0.9,
//                 height: MediaQuery.of(context).size.height * 0.08,
//                 decoration: BoxDecoration(
//                     color: MyColors.yellow,
//                     borderRadius: BorderRadius.circular(25)),
//                 child: Center(
//                     child: Text(
//                       "Next",
//                       style: CustomTextStyle.mediumtextreem,
//                     )),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }


// import 'dart:convert';
//
// import 'package:crypto/crypto.dart';
// import 'package:flutter/material.dart';
// import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
//
//
// class UpiPayment extends StatefulWidget {
//   const UpiPayment({super.key});
//
//   @override
//   State<UpiPayment> createState() => _UpiPaymentState();
// }
//
// class _UpiPaymentState extends State<UpiPayment> {
//
//   @override
//   void initState() {
//
//     print("screen is on stack");
//     super.initState();
//     print("--2--");
//     paymentInit();
//     print("--3--");
//   }
//   String merchantId = 'PGTESTPAYUAT';
//   String AppId = "";
//   String ApiKey='aeed1568-1a76-4fa4-9f47-3e1c81232660';
//   // String Env = 'UAT_SIM';
//   String Env = 'SANDBOX';
//   double price=0.0;
//
//   bool enableLogging = true;
//   String checksum = '';
//   //String saltKey = '	099eb0cd-02cf-4e2a-8aca-3e6c6aff0399';
//   String saltIndex = '1';
//   //String callbackUrl ='https://canine.hirectjob.in/api/v1/auth/payment/callback';
//   String callbackUrl ='https://webhook.site/97004445-2c1f-4c18-b2dd-89bbc71bfaf1';
//   String body = '';
//   Object? result;
//   String apiEndPoint = "/pg/v1/pay";
//   String transactionID=DateTime.now().millisecondsSinceEpoch.toString();
//   String packageName = "com.phonepe.app";
//   // String packageName = "com.example.pet";
//
//
//   String getCheckSum() {
//     final requestData = {
//       "merchantId": merchantId,
//       "merchantTransactionId": transactionID,
//       "merchantUserId": "90223250",
//       "amount": 1000,
//       "mobileNumber": "9999999999",
//       "callbackUrl": callbackUrl,
//       "paymentInstrument": {
//         "type": "UPI_INTENT",
//         "targetApp": "com.phonepe.app"
//       },
//     };
//
//     String base64body = base64.encode(utf8.encode(json.encode(requestData)));
//     print("base64body:${base64body}");
//     print("transactionID${requestData}");
//     setState(() {
//       checksum =
//       '${sha256.convert(utf8.encode(base64body + apiEndPoint + ApiKey)).toString()}###$saltIndex';
//       //'${sha256.convert(utf8.encode(base64body + apiEndPoint + saltKey)).toString()}###$saltIndex';
//       print("checksum:${checksum}");
//
//     });
//     print("base64body---:${base64body}");
//     return base64body;
//
//   }
//
//   String _upiErrorHandler(error) {
//     setState(() {
//       result = {"error": error};
//     });
//     return "An error occurred"; // Return a default error message
//   }
//
//   void startPgTransaction() async {
//     try {
//       String base64body = getCheckSum();
//       var response = await PhonePePaymentSdk.startTransaction(base64body, callbackUrl, checksum, "",);
//
//       if (response != null) {
//         String status = response['status'].toString();
//         String error = response['error'].toString();
//         print("sdk response${response}");
//         if (status == 'SUCCESS') {
//           result = "Flow Completed - Status:${response}";
//           print("Result:${result}");
//           //await checkStatus();
//         } else {
//           result = "Flow Completed - Status: $status and Error: $error";
//           print("Result:${result}");
//         }
//       } else {
//         result = "Flow Incomplete";
//         print("Result:${result}");
//       }
//     } catch (err) {
//       print(err);
//     }
//   } void paymentInit() {
//     print("${[Env, AppId, merchantId, enableLogging, packageName]}");
//     PhonePePaymentSdk.init(Env, AppId, merchantId, enableLogging)
//         .then((val) {
//       setState(() {
//         result = 'PhonePe SDK Initialized - $val';
//         body=getCheckSum().toString();
//       });
//       print("body${body}");
//       startPgTransaction();
//     })
//         .catchError((error) {
//       _upiErrorHandler(error);
//       return <dynamic>{};
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return  Scaffold(
//       appBar: AppBar(
//         title: Text("UPI Payment Screen"),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           ElevatedButton(onPressed: (){
//             startPgTransaction();
//           }, child: Text("Start Transaction")),
//
//           SizedBox(height: 20),
//           Text("Result \n $result"),
//         ],
//       ),
//     );
//   }
// }


import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:phonepe_payment_sdk/phonepe_payment_sdk.dart';
//import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
class WholeUpiScreen extends StatefulWidget {
  const WholeUpiScreen({Key? key}) : super(key: key);

  @override
  State<WholeUpiScreen> createState() => _WholeUpiScreenState();
}

class _WholeUpiScreenState extends State<WholeUpiScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transaction Complered"),
        centerTitle: true,
      ),
    );
  }
}
