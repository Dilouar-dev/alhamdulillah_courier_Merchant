// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';
//
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/home.dart';

// class PaymentInfoAddScreen extends StatefulWidget {
//   @override
//   _PaymentInfoAddScreenState createState() => _PaymentInfoAddScreenState();
// }

// class _PaymentInfoAddScreenState extends State<PaymentInfoAddScreen> {
//   String selectedPaymentType = 'Select Payment Type';
//   String selectedBank = 'Select Bank';
//   String selectedAccount = 'Select Account';
//
//
//   List<String> paymentTypes = ['Select Payment Type', 'Bkash', 'Rocket', 'Nagad', 'Bank'];
//
//   List<String> bankNames =
//   ['Select Bank',
//     'Dutch Bangla Bank Ltd',
//     'BRAC Bank Ltd',
//     'AB BANK LTD',
//     'DHAKA BANK LTD',
//     'EASTERN BANK LTD',
//     'EXIM BANK LTD',
//     'IFIC BANK LTD',
//     'MERCANTILE BANK LTD',
//     'MUTUAL TRUST BANK LTD',
//     'NATIONAL CREDIT & COMMERCE BANK LTD',
//     'ONE BANK LTD',
//     'PRIME BANK LTD',
//     'SOCIAL ISLAMI BANK LTD',
//     'STANDARD BANK LTD',
//     'STANDARD CHARTERED BANK LTD',
//     'THE CITY BANK LTD',
//     'PREMIER BANK LTD',
//     'TRUST BANK LTD',
//     'UNITED COMMERCIAL BANK LTD',
//     'UTTRA BANK LTD'
//   ];
//   List<String> Accounttype = [
//     'Select Account',
//     'A',
//     'B',
//   ];
//
//
//   final TextEditingController branchNameController = TextEditingController();
//   final TextEditingController accountHolderNameController = TextEditingController();
//   final TextEditingController accountTypeController = TextEditingController();
//   final TextEditingController accountNumberController = TextEditingController();
//   final TextEditingController routingNumberController = TextEditingController();
//
//   bool showBankFields() {
//     return selectedPaymentType == 'Bank';
//   }
//
//   bool showAccountTypeAndNumberFields() {
//     return !['Bank', 'Select Payment Type'].contains(selectedPaymentType);
//   }
//
//   Future<void> addPaymentInfo() async {
//     if (selectedPaymentType == 'Select Payment Type') {
//       print('Please select a valid payment type.');
//       return;
//     }
//
//     print('Selected Payment Type: $selectedPaymentType');
//     print('Selected Bank: $selectedBank');
//     print('Selected Data:');
//     print('Branch Name: ${branchNameController.text}');
//     print('Account Holder Name: ${accountHolderNameController.text}');
//     print('Routing Number: ${routingNumberController.text}');
//     print('Account Type: ${accountTypeController.text}');
//     print('Account Number: ${accountNumberController.text}');
//
//     // Remaining code for HTTP request...
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xffB7050A),
//         title: Text('Add Payment'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: ListView(
//           children: [
//             DropdownButtonFormField(
//               value: selectedPaymentType,
//               items: paymentTypes.map((type) {
//                 return DropdownMenuItem(
//                   value: type,
//                   child: Text(type),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedPaymentType = value.toString();
//                   selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
//                 });
//               },
//               decoration: InputDecoration(
//                 labelText: 'Payment Type',
//                 labelStyle: TextStyle(color: Colors.black), // Change label color
//               ),
//               style: TextStyle(color: Colors.black), // Change text color
//
//             ),
//             SizedBox(height: 20),
//
//             if (showBankFields())
//               DropdownButtonFormField(
//                 value: selectedBank,
//                 items: bankNames.map((bank) {
//                   return DropdownMenuItem(
//                     value: bank,
//                     child: Text(bank, style: TextStyle(color:Colors.black),),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedBank = value.toString();
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Bank Name',
//                 ),
//               ),
//             SizedBox(height: 20),
//
//             if (showBankFields())
//               TextFormField(
//                 controller: branchNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Branch Name',
//                   labelStyle: TextStyle(color: Colors.black), // Change label color
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//               ),
//
//
//             SizedBox(height: 20),
//
//             if (showBankFields())
//               // DropdownButtonFormField(
//               //   value: selectedAccount,
//               //   items: Accounttype.map((account) {
//               //     return DropdownMenuItem(
//               //       value: account,
//               //       child: Text(account, style: TextStyle(color:Colors.black),),
//               //     );
//               //   }).toList(),
//               //   onChanged: (value) {
//               //     setState(() {
//               //       selectedAccount = value.toString();
//               //     });
//               //   },
//               //   decoration: InputDecoration(
//               //     labelText: 'Account Type',
//               //   ),
//               // ),
//
//               DropdownButtonFormField(
//                 value: selectedAccount,
//                 items: Accounttype.map((account) {
//                   return DropdownMenuItem(
//                     value: account,
//                     child: Text(account, style: TextStyle(color: Colors.black)),
//                   );
//                 }).toList(),
//                 onChanged: (value) {
//                   setState(() {
//                     selectedAccount = value.toString();
//                   });
//                 },
//                 decoration: InputDecoration(
//                   labelText: 'Account Type',
//                 ),
//               ),
//
//             SizedBox(height: 20),
//
//             if (showBankFields())
//               TextFormField(
//                 controller: accountHolderNameController,
//                 decoration: InputDecoration(
//                     labelText: 'Account Holder Name',
//                   labelStyle: TextStyle(color: Colors.black), // Change label color
//
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//               ),
//             SizedBox(height: 20),
//
//
//
//             if (showBankFields())
//               TextFormField(
//                 controller: routingNumberController,
//                 decoration: InputDecoration(
//                   labelText: 'Routing Number',
//                   labelStyle: TextStyle(color: Colors.black), // Change label color
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//               ),
//             SizedBox(height: 20),
//
//             if (showBankFields())
//               TextFormField(
//                 controller: accountNumberController,
//                 decoration: InputDecoration(
//                   labelText: 'Account Number',
//                   labelStyle: TextStyle(color: Colors.black), // Change label color
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//               ),
//
//
//
//             if (showAccountTypeAndNumberFields())
//               TextFormField(
//                 controller: accountTypeController,
//                 decoration: InputDecoration(
//                     labelText: 'Account Type',
//                     labelStyle: TextStyle(color: Colors.black), // Change label color
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//
//               ),
//             SizedBox(height: 20),
//
//             if (showAccountTypeAndNumberFields())
//               TextFormField(
//                 controller: accountNumberController,
//                 decoration: InputDecoration(
//                     labelText: 'Account Number',
//                   labelStyle: TextStyle(color: Colors.black), // Change label color
//                 ),
//                 style: TextStyle(color: Colors.black), // Change text color
//               ),
//             SizedBox(height: 16),
//
//             Container(
//               width: MediaQuery.of(context).size.width / 10,
//               height: MediaQuery.of(context).size.height / 15,
//               decoration: BoxDecoration(
//                 shape: BoxShape.rectangle,
//                 color: Color(0xffB7050A),
//                 borderRadius: BorderRadius.circular(20),
//               ),
//               child: GestureDetector(
//                 onTap: () {
//                   addPaymentInfo();
//                   Get.to(HomeView());
//                 },
//                 child: Center(child: Text('Submit', style: TextStyle(fontSize: 25))),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'dart:convert';

import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/home.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';

class PaymentInfoAddScreen extends StatefulWidget {
  @override
  _PaymentInfoAddScreenState createState() => _PaymentInfoAddScreenState();
}

class _PaymentInfoAddScreenState extends State<PaymentInfoAddScreen> {
  String selectedPaymentType = 'Select Payment Type';
  String selectedBank = 'Select Bank';
  String selectBankAccount = 'Account Type'; // Initialize to the default value
  String selectAccount = 'Select Account'; // Initialize to the default value


  List<String> paymentTypes = ['Select Payment Type', 'Bkash', 'Rocket', 'Nagad', 'Bank'];

  List<String> bankNames = [
    'Select Bank',
    'Dutch Bangla Bank Ltd',
    'BRAC Bank Ltd',
    'AB BANK LTD',
    'DHAKA BANK LTD',
    'EASTERN BANK LTD',
    'EXIM BANK LTD',
    'IFIC BANK LTD',
    'MERCANTILE BANK LTD',
    'MUTUAL TRUST BANK LTD',
    'NATIONAL CREDIT & COMMERCE BANK LTD',
    'ONE BANK LTD',
    'PRIME BANK LTD',
    'SOCIAL ISLAMI BANK LTD',
    'STANDARD BANK LTD',
    'STANDARD CHARTERED BANK LTD',
    'THE CITY BANK LTD',
    'PREMIER BANK LTD',
    'TRUST BANK LTD',
    'UNITED COMMERCIAL BANK LTD',
    'UTTRA BANK LTD'
  ];

  List<String> BankAccounttype = [
    'Select Account Type',
    'Current',
    'Saving',
    'AWCDI',
    'SND',
    'STD',
    'AWCA'

  ];
  List<String> Accounttype = [
    'Select Account',
    'Agent',
    'Personal'

  ];


  final TextEditingController branchNameController = TextEditingController();
  final TextEditingController accountHolderNameController = TextEditingController();
  final TextEditingController accountTypeController = TextEditingController();
  final TextEditingController accountNumberController = TextEditingController();
  final TextEditingController routingNumberController = TextEditingController();

  bool showBankFields() {
    return selectedPaymentType == 'Bank';
  }

  bool showAccountTypeAndNumberFields() {
    return !['Bank', 'Select Payment Type'].contains(selectedPaymentType);
  }

  void _copyToClipboard(String text) {
    FlutterClipboard.copy(text).then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Copied to clipboard'),
        ),
      );
    });
  }


  // Future<void> addPaymentInfo() async {
  //   if (selectedPaymentType == 'Select Payment Type') {
  //     print('Please select a valid payment type.');
  //     return;
  //   }
  //
  //   print('Selected Payment Type: $selectedPaymentType');
  //   print('Selected Bank: $selectedBank');
  //   print('Selected Account: $selectBankAccount');
  //   print('Selected Data:');
  //   print('Branch Name: ${branchNameController.text}');
  //   print('Account Holder Name: ${accountHolderNameController.text}');
  //   print('Routing Number: ${routingNumberController.text}');
  //   print('Account Type: ${accountTypeController.text}');
  //   print('Account Number: ${accountNumberController.text}');
  //
  //   // Remaining code for HTTP request...
  // }



  Future<void> addPaymentInfo(
      String paymentType,
      String bankName,
      String branchName,
      String accountHolderName,
      String accountType,
      String accountNumber,
      String routingNumber,
      ) async {
    final String apiUrl = 'https://system.alhamdulillahcourierservice.com/api/payment-info-add';

    final Uri apiUri = Uri.parse('$apiUrl?p_type=$paymentType&bank_name=$bankName'
        '&branch_name=$branchName&account_holder_name=$accountHolderName'
        '&account_type=$accountType&account_number=$accountNumber&routing_number=$routingNumber&mb_type=$accountType&mb_number=$accountNumber');

    // final Uri apiUri = Uri.parse(
    //   '$apiUrl?p_type=jjj'
    //       '&bank_name=jj'
    //       '&branch_name=fghfhf'
    //       '&account_holder_name=fgfg'
    //       '&account_type=fghfg'
    //       '&account_number=5334'
    //       '&routing_number=3453',
    // );


    try {
      final response = await http.post(apiUri,


        headers: {
          'Accept': 'application/json',
          // 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY1MDkxYWM1YmY2YzEwNGRhNTY3ZmQ0YWJmODU4NGJlOGVmZjIzYWI5MTc3YmRiMzNkZTVlODEzOTRhMjZmZWE0ZWMzMTIxMzZkOTliMTVkIn0.eyJhdWQiOiIyNCIsImp0aSI6ImY1MDkxYWM1YmY2YzEwNGRhNTY3ZmQ0YWJmODU4NGJlOGVmZjIzYWI5MTc3YmRiMzNkZTVlODEzOTRhMjZmZWE0ZWMzMTIxMzZkOTliMTVkIiwiaWF0IjoxNzA2NTg1MTE4LCJuYmYiOjE3MDY1ODUxMTgsImV4cCI6MTczODIwNzUxOCwic3ViIjoiMTEwNSIsInNjb3BlcyI6W119.azvPlKZxFnn6IT7ZlqbwaWO3z-r_ZweVLEcSGZuLwj8cC5_TE3h5rK2Nt0o3cQUzIVEkjV3CWcc8medZ2QJuewUpz34e6IoVVNCOMNDFAnHBcs2QrBgbbjBo-5h6YTM5bHp7756LCXG_4PjjnnQX3rjVt-5KfHW_TVjz4QgNUvVh6s2QHM7NhT1TEMrd9_V89vTEsXKq_mUi5l4sTxUjxUHM1YSzt3ZjEj3JLaUsAjYcW0hnoegpd0rha6DaJQqHvScn2qS3xjjZb_2PI9T1fEUxIQVuEDZOUD6NBE_ySsv5dhebbGi-VbWm1QsbnUNNn33tvTSr5MdHbuX8iSPWzqzLyGq_eFs7xZfP0bxgKXmXJN9Xn5A_O6QNalXjo2BjdncFHZt0U4uaLZrdm0H_hJIjpQempoMSIUF7t65f5NuCf5Qb4xD1bE-4DtFB2XWXs_3naP1IhorfbaKQJcip0Au_MGwg78oDCE3pvL3Y3i5rc8A_VcMw3qUwagozuY8rT2UFKR_AITamdg8X6adj_7o1XVEwLSnXusZo46iiWd1cElPSZAGk3YGk0-FuC8cNKnCi29im687O2B6MMPvdjGxWv66sjzodzPa6hFFnioiMUBZwznZYlvnO2R-_I6tMUiJcvE7cn1geUZ1oNskrcxzMPFZRuur_cTK7ug4DPiQ',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'

        },
      );

      if (response.statusCode == 200) {

        // API call successful, handle the response as needed
        print('API call successful. Response: ${response.body}');
        Get.snackbar(
          // 'Error',
          // 'Payment Info Already Created',
          'Alert',
          'Payment created Successfully',
          // 'API Message: ${responseBody['message']}',
          backgroundColor: Colormanager.darkPrimary,
          borderColor: Colors.white,
          borderWidth: 2,
          colorText: Colors.white,
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 4),
        );


        // Extract and print the message from the response
        final Map<String, dynamic> responseBody = json.decode(response.body);
        // if (responseBody.containsKey('message')) {
        //   print('API Message: ${responseBody['message']}');
        //   Get.snackbar(
        //     // 'Error',
        //     // 'Payment Info Already Created',
        //     'Alert',
        //     'API Message: ${responseBody['message']}',
        //     backgroundColor: Colors.red,
        //     colorText: Colors.white,
        //     snackPosition: SnackPosition.BOTTOM,
        //     duration: Duration(seconds:4),
        //   );
        // }


        if (responseBody.containsKey('message')) {
          String apiMessage = responseBody['message'];

          print('API Message: $apiMessage');

          if (apiMessage == "Payment Info Already Created") {
            print('API Message: ${responseBody['message']}');
            Get.snackbar(
              // 'Error',
              // 'Payment Info Already Created',
              'Alert',
              'Payment Info Already created',
              // 'API Message: ${responseBody['message']}',
              backgroundColor: Colormanager.darkPrimary,
              borderColor: Colors.white,
              borderWidth: 2,
              colorText: Colors.white,
              snackPosition: SnackPosition.TOP,
              duration: Duration(seconds: 4),
            );
          }
        }


        // API call successful, handle the response as needed
        print('API call successful. Response: ${response.body}');
          print('Selected Payment Type: $selectedPaymentType');
          print('Selected Bank: $selectedBank');
          print('Selected Account: $selectBankAccount');
          print('Selected Data:');
          print('Branch Name: ${branchNameController.text}');
          print('Account Holder Name: ${accountHolderNameController.text}');
          print('Routing Number: ${routingNumberController.text}');
          print('Account Type: ${accountTypeController.text}');
          print('Account Number: ${accountNumberController.text}');
      } else {
        // API call failed, handle the error
        print('API call failed. Status code: ${response.statusCode}, Error: ${response.body}');
      }
    } catch (error) {
      // Exception occurred while making the API call
      print('Error: $error');
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colormanager.darkPrimary,
        title: Text('Add Payment'),
      ),
      body: Container(
        color:Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),

          child: ListView(
            children: [
              DropdownButtonFormField(
                value: selectedPaymentType,
                items: paymentTypes.map((type) {
                  return DropdownMenuItem(
                    value: type,
                    child: Text(type),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedPaymentType = value.toString();
                    selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
                    // selectedAccount = 'Select Account'; // Reset selected account when payment type changes
                  });
                },
                decoration: InputDecoration(
                  labelText: 'Payment Type',
                  labelStyle: TextStyle(color: Colors.black),
                ),
                style: TextStyle(color: Colors.black),
              ),
              SizedBox(height: showBankFields() ? 20 : 0),

              if (showBankFields())
                DropdownButtonFormField(
                  value: selectedBank,
                  items: bankNames.map((bank) {
                    return DropdownMenuItem(
                      value: bank,
                      child: Text(bank, style: TextStyle(color: Colors.black, fontSize: 12)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedBank = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Bank Name',
                  ),
                ),
              SizedBox(height: showBankFields() ? 20 : 0),

              if (showBankFields())
                DropdownButtonFormField(
                  // value: selectAccount,
                  items: BankAccounttype.map((account) {
                    return DropdownMenuItem(
                      value: account,
                      child: Text(account, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectBankAccount = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Bank Account Type',
                  ),
                ),

              SizedBox(height: showBankFields() ? 20 : 0),

              if (showBankFields())
                TextFormField(
                  controller: branchNameController,
                  decoration: InputDecoration(
                    labelText: 'Branch Name',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),

              SizedBox(height: showBankFields() ? 20 : 0),

              if (showBankFields())
                TextFormField(
                  controller: accountHolderNameController,
                  decoration: InputDecoration(
                    labelText: 'Account Holder Name',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              SizedBox(height: 20),

              if (showBankFields())
                TextFormField(
                  controller: routingNumberController,
                  decoration: InputDecoration(
                    labelText: 'Routing Number',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              SizedBox(height: 20),

              if (showBankFields())
                TextFormField(
                  controller: accountNumberController,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),



              if (showAccountTypeAndNumberFields())
                DropdownButtonFormField(
                   value: selectAccount,
                  items: Accounttype.map((account) {
                    return DropdownMenuItem(
                      value: account,
                      child: Text(account, style: TextStyle(color: Colors.black)),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectAccount = value.toString();
                    });
                  },
                  decoration: InputDecoration(
                    labelText: 'Account Type',
                  ),
                ),
              SizedBox(height: 20),


              if (showAccountTypeAndNumberFields())
                TextFormField(
                  controller: accountNumberController,
                  decoration: InputDecoration(
                    labelText: 'Account Number',
                    labelStyle: TextStyle(color: Colors.black),
                  ),
                  style: TextStyle(color: Colors.black),
                ),
              SizedBox(height: 20),


              Container(
                width: MediaQuery.of(context).size.width / 10,
                height: MediaQuery.of(context).size.height / 15,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color:Colormanager.darkPrimary,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: GestureDetector(
                  onTap: () {
                    // addPaymentInfo();
                    addPaymentInfo(
                      selectedPaymentType,
                      selectedBank,
                      branchNameController.text,
                      accountHolderNameController.text,
                      showBankFields() ? selectBankAccount : selectAccount,
                      accountNumberController.text,
                      routingNumberController.text,
                    );
                    // Get.to(HomeView());
                  },
                  child: Center(child: Text('Submit', style: TextStyle(fontSize: 25))),
                ),
              ),
            //   Padding(
            //     padding: const EdgeInsets.only(top:70.0),
            //    child: Column(
            //       children: [
            //         Text("For Payment related any quesries", style: TextStyle(color: Colormanager.darkPrimary, fontSize:20),),
            //   Row(
            //     children: [
            //       Padding(
            //         padding: const EdgeInsets.all(8.0),
            //         child: Text("just contact on 01885958754", style: TextStyle(color: Colormanager.darkPrimary, fontSize:18),),
            //       ),
            //           IconButton(
            //             icon: Icon(Icons.copy),
            //             onPressed: () {
            //               _copyToClipboard('01885958754');
            //             },
            //           ),
            //
            //     ],
            //   ),
            //
            //
            // ],
            //     ),
            //   ),
              // Row(
              //   children: [
              //     GestureDetector(
              //       // onTap: () {
              //       //   _launchDialPad('01885958754');
              //       // },
              //       child: Column(
              //         children: [
              //           Text('  Contact us for any assistance or queries', style: TextStyle(fontSize: 13, color: Colors.white),),
              //           Padding(
              //             padding: const EdgeInsets.all(16.0),
              //             child: Text(
              //               '01885958754',
              //               style: TextStyle(
              //                 color: Colors.blue, // Make the number look like a link
              //                 decoration: TextDecoration.underline,
              //               ),
              //             ),
              //           ),
              //         ],
              //       ),
              //     ),
              //     IconButton(
              //       icon: Icon(Icons.copy),
              //       onPressed: () {
              //         _copyToClipboard('01885958754');
              //       },
              //     ),
              //   ],
              // ),

            ],
          ),
        ),
      ),
    );
  }
}


