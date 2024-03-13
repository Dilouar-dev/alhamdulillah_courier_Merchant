import 'dart:convert';
import 'dart:math';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/order_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_create_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/Create%20order2/create_order_again.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/navigation.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Dashboard_new extends StatefulWidget {
  @override
  _Dashboard_newState createState() => _Dashboard_newState();
}

class _Dashboard_newState extends State<Dashboard_new> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<Color> cardColors = [
    // Colors.red,
    Colors.blue,
    Colors.green,
    // Colors.orange,
    // Add more colors as needed
  ];

  // Color getRandomColor() {
  //   // Generate a random color
  //   return Color.fromARGB(
  //     255,
  //     Random().nextInt(0xffAF7824), // Red
  //     // Random().nextInt(256), // Green
  //     // Random().nextInt(256), // Blue
  //   );
  //   // return Color(0xffAF7824).withAlpha(200 + Random().nextInt(56)); // Random alpha component
  //
  // }


  Color getRandomColor() {
    // Define an array of dark colors
    List<Color> darkColors = [
      Color(0xffAF7824),
      Color(0xff2E4053),
      Color(0xff641E16),
      Color(0xff1B4F72),
      Color(0xff7D6608),
      Color(0xff4A235A),
      Color(0xff154360),
      Color(0xff0E6655),
    ];

    // Generate a random index to select a color from the array
    int randomIndex = Random().nextInt(darkColors.length);

    // Return the selected color
    return darkColors[randomIndex];
  }


  Map<String, dynamic>? responseData;
  String? errorMessage;


  final TextEditingController _textController4 = TextEditingController();
  final TextEditingController _pickupAddressController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _estimatedParcelController = TextEditingController();



  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    final url = 'https://system.alhamdulillahcourierservice.com/api/merchantdashboard';

    // Define your headers here
    // Map<String, String> headers = {
    //   'Accept': 'application/json',
    //   'Content-Type': 'application/json',
    //   // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIn0.eyJhdWQiOiIxNCIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIiwiaWF0IjoxNzA5MTAyNjU4LCJuYmYiOjE3MDkxMDI2NTgsImV4cCI6MTc0MDcyNTA1OCwic3ViIjoiMTA1OCIsInNjb3BlcyI6W119.RcXx6nhqun7lAPZoEdcvXLGdnuFgMBB23RJM4GpY0c3qoM7MGH-iAClD5geVYushfbaVFFdPtUGgQhOEWIeZ8sXqn_7egOYbn6SVlIfltCzTnNKuinN6sMpgzfGOtY_ulwgreVyzSMerqlEtejb-xD5syl8cjFglG5zbPLFQ_faHHpKKsRhNDGiqQMBiMQ_der78KoMDvA5lumhm3oWYVMhM3P9if9KycTdh2ZP-q8Nu3UDvcLQsQWg-bQl6HyNyqj1jcN7YMgy3obrs1cqcpkGVcwSJ8yuWrz46xK-FaRXDK4B7H0ZR-VdyWqSWvNSdoufv9WUdcg0wNfd6huceAIEtgboOHl13jn17dMmd7MGGUYKku8mTvejtWLvwQ45Wh40nyQ2-RjpXY5U3d0Vssa5DYITxJ4YTg34p7dX41LWXwsBVunn1eaAhtYpqh75G7V6h0gGTEY8nkijoc9S5hh1YxWnzACyayeSZ7yz2AwhQdG9FhyEJdY7hMfIlinh611uoiXdlZ8JvhHJZdgPywQs0eOYGdKWApKXd95eTmyMsVDCX3uk3Z5jqOM1eG0xuU20HH8aZhCsicM2yBN1G7L0b8pFe8FZ2FHnbJYAErI5YE-rXCQE25FEzs3MdJCP42kqwe52oF5-M9y2r2MdAkjUCtxs0anrIObCuiEWS7J8'
    //   'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
    //
    // };



    Map<String, String> headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}',
    };


    final response = await http.get(Uri.parse(url), headers: headers);

    if (response.statusCode == 200) {
      final contentType = response.headers['content-type'];
      print('Content-Type: $contentType'); // Print content type in console
      if (contentType != null && contentType.contains('application/json')) {
        setState(() {
          responseData = jsonDecode(response.body);
          errorMessage = null;
        });
        print(response.body); // Print response body in console
      } else {
        setState(() {
          errorMessage = 'Unexpected response format';
        });
        print('Unexpected response format');
        print(response.body); // Print error response body in console
      }
    } else {
      setState(() {
        errorMessage = 'Failed to load data: ${response.statusCode}';
      });
      print('Failed to load data: ${response.statusCode}');
      print(response.body); // Print error response body in console
    }
  }

  // Future<void> fetchData() async {
  //   final url = 'https://system.alhamdulillahcourierservice.com/api/merchantdashboard';
  //
  //   // Fetch authentication token from storage
  //   String? token = StorageHelper.getString(key: 'token');
  //   if (token == null || token.isEmpty) {
  //     setState(() {
  //       errorMessage = 'Authentication token not found';
  //       responseData = null; // Clear any existing response data
  //     });
  //     print('Authentication token not found');
  //     return;
  //   }
  //
  //   // Define headers with authentication token
  //   Map<String, String> headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer $token',
  //   };
  //
  //   final response = await http.get(Uri.parse(url), headers: headers);
  //
  //   if (response.statusCode == 200) {
  //     final contentType = response.headers['content-type'];
  //     print('Content-Type: $contentType'); // Print content type in console
  //     if (contentType != null && contentType.contains('application/json')) {
  //       setState(() {
  //         responseData = jsonDecode(response.body);
  //         errorMessage = null;
  //       });
  //       print(response.body); // Print response body in console
  //     } else {
  //       setState(() {
  //         errorMessage = 'Unexpected response format';
  //       });
  //       print('Unexpected response format');
  //       print(response.body); // Print error response body in console
  //     }
  //   } else if (response.statusCode == 401) {
  //     setState(() {
  //       errorMessage = 'Unauthorized: ${response.statusCode}. Please login again.';
  //       responseData = null; // Clear any existing response data
  //     });
  //     print('Unauthorized: ${response.statusCode}');
  //     print(response.body); // Print error response body in console
  //   } else {
  //     setState(() {
  //       errorMessage = 'Failed to load data: ${response.statusCode}';
  //       responseData = null; // Clear any existing response data
  //     });
  //     print('Failed to load data: ${response.statusCode}');
  //     print(response.body); // Print error response body in console
  //   }
  // }


  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  OrderCreateController orderCreateController = Get.put(OrderCreateController(orderApi: OrderApi()));



  String? _selectedPaymentMethod; // Variable to store the selected payment method
  List<String> paymentTypes = ['Select Payment Type', 'Bkash', 'Rocket', 'Nagad', 'Bank'];

  Future<void> submitpaymethod(BuildContext context) async {
    // Define the data to be passed to the API
    final requestData = {
      'payment_method': _selectedPaymentMethod,
    };

    // Print the requestData before making the HTTP POST request
    print('Request Data: $requestData');

    // Make the HTTP POST request
    final response = await http.post(
      Uri.parse('https://system.parcelpointltd.com/api/payment-request'),
      headers: {
        'Accept': 'application/json',
        // 'Content-type': 'application/x-www-form-urlencoded',
        'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'
      },
      body: requestData,
    );


    // Handle the response
    if (response.statusCode == 200) {
      Navigator.of(context).pop();

      // Request successful, handle the response data10
      print('API request successful');
      print('Response data: ${response.body}');




      // Add logic to handle the response data as needed
    } else {
      // Request failed, handle the error
      print('API request failed with status code: ${response.statusCode}');
      print('${response.statusCode}');


      // Add logic to handle the error as needed
    }

    // Navigator.of(context).pop();

  }

  Future<void> _submitPickupRequest(BuildContext context, String pickupAddress, String note, String estimatedParcel) async {
    try {
      print('pickupAddress: $pickupAddress, note: $note, estimatedParcel: $estimatedParcel');

      final requestData = {
        'pick_up_address': pickupAddress,
        'Note': note,
        'estimated_parcel': estimatedParcel,
      };
      print('Request Data: $requestData');
      final response = await http.post(
        Uri.parse('https://system.parcelpointltd.com/api/pick-up-request'),
        headers: {
          'Accept': 'application/json',
          // 'Content-Type': 'application/json',
          // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIn0.eyJhdWQiOiIxNCIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIiwiaWF0IjoxNzA4NzQ0OTk1LCJuYmYiOjE3MDg3NDQ5OTUsImV4cCI6MTc0MDM2NzM5NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.ZmmMgixvMzkq9z7CdhMJtRyPrrR16hgs4mnoJIEcXtguecHBOLRBHyZI2lqOA4Uo_2niRfXoiD71bqwtXvOctZM1RVGvGQIWtmOx_Ei2hIVuuwULyLfHCdmlhN1L2FLq4effENXw1SiP45dH7vzFvXPsOdI4k98N0ZyH3bYfm7K2aupFG67n2avDisEtTqfIF6V6GkgkGbyjigwsZpyHRUFBDBobbz60VKo9KixgzFevAyUli0sKgntOWWi_1eRJht9KldVvfigI7gSSilqONR258bZj-MsfOlDS6pnXZcmNTDOdPjInDNQhprsZeiz4ALpdp0fxGGg2ogVlAhEBX5B9rrPTzbMWy3A6dUDe45Fx7U2XqGG_mVbqTG7eAEJvLdH3TubMilojCwWh_t00QSLD7trQFWk1tRwSI3GW-LU3Km4yur7qyxGTSlYT-ZC0F3Brt8Ye0dMIYaWizofxukf0pEJiobsnIpPSyd83Nf1WPw3Hpz5bVntsR6A5H543-XFxUYHdNO01I9Afj4vxdsVkvfdbpNauJWJ-iCtZyWgXESxWad5pU9RgK_KwfB90fB9vJ1k6WiWLiMJAANmrH_5QIcG5-Ezbl0lLnLhiu8Q1GssX3gKk4FL-tHQKHH133q4jbtF9QRCnMQA6IxqB7w0CkSW_ipRaKvH83xMKP24'
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}',

        },
        // body: jsonEncode(requestData),
        body: requestData,
      );
      print('Response body: ${response.body}'); // Print the response body


      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.lightBlue,
            content: Text(
              responseData['message'],
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      } else {
        throw Exception('Failed to submit pickup request');
      }
    } catch (error) {
      print('Error submitting pickup request: $error'); // Print the specific error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            'Failed to submit pickup request',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );
    }
  }

  Future<String?> _fetchPickupAddress() async {
    // Make the API call to fetch the pickup address
    final response = await http.get(Uri.parse('http://system.parcelpointltd.com/api/get-merchant-info'),
      headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIn0.eyJhdWQiOiIxNCIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIiwiaWF0IjoxNzA4NzQ0NjQwLCJuYmYiOjE3MDg3NDQ2NDAsImV4cCI6MTc0MDM2NzA0MCwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.Cq7XniYb5IW5CePPEyAstjDQCWeYdYX0lYjkf7GPNcEHAgdg-PkzlAyAG7aw7A7MBq9T3mHfZiw0VXvtQ6_aWONakt95l5PpPdPTlbb1qa0Toig81XdpUUKXLlUOu54wal6TPQn-HWAmJ7s4aMtjMghH54hoPcMkvH0gdUuD7PfWwwTtEVx2b8xoh7wcedxd86EqYkYaPqDsAaFK42eRo8AlB_9f85KtK4ULqfwZBlOXxkqLMLKOwVrwYq2VjWIoXkwrMCezGhsYJAkETRGL5STw8CdGOIwXDIZAWtsin26T2wn6_zEGhWKFuHfLX7CYect37C6WrzuUlncY6F9dSPAVNqkjypg_QcN4HW8b2Ytah1bLkIcEEbPuw3vVq6TRORu20IrKwl7Fa5yI6jsPziG41xnq3LszwVOPFytz7zzQFwvHAefNCKCktdu3TyVuAmmL1xYBfq7TcqGWdIY4ApGRWWYk-KTgjo9Rc52EllXgV4ExTQmuRcpkE8KQfJqYfT2ZJtuRkr9BB7CXei0Z5sr0JzxyU70kH2KzZcIWCvB6VhTjMiZDVT681INGHeT9Kd953yJPEsnRoqWlH8CAwDH7_HfTsZT5eDKLd2RlsubukVRJcNErRT1mU_dTfdzeJlU0XhVnM-gqaDfg-oiCU8mi0SxiJWGmZbZisZv3Nwc'

      },);

    if (response.statusCode == 200) {
      final responseData = jsonDecode(response.body);
      // return responseData['data']['pickup_address'];
      final pickupAddress = responseData['merchant_info'];

      print('Pickup address fetched successfully: $pickupAddress');
      return pickupAddress;
    } else {
      final errorMessage = jsonDecode(response.body)['message'];
      print('API error: $errorMessage');
      throw Exception('API error: $errorMessage');
    }
  }

  @override

// Widget build(BuildContext context) {
//   return Scaffold(
//     key: _scaffoldKey,
//
//     backgroundColor: Colors.white,
//     appBar: AppBar(
//       backgroundColor: Colors.white,
//       title: Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
//       // leading: IconButton(
//       // icon: Icon(Icons.menu),
//       // onPressed: () {
//       // // Handle menu icon tap
//       //   Get.to(NavigationBarDrawer());
//       // },
//       // ),
//       actions: [
//         IconButton(
//           icon: Icon(Icons.add),
//           onPressed: () {
//             // Handle plus icon tap
//             Get.to(CreateOrderView());
//           },
//         ),
//       ],
//     ),
//     drawer:NavigationBarDrawer(),
//
//     body: errorMessage != null
//         ? Center(
//       child: Text(errorMessage!),
//     )
//         : responseData == null
//         ? Center(
//       child: CircularProgressIndicator(),
//     )
//         : SingleChildScrollView(
//       child: Column(
//         children: [
//           const SizedBox(
//             height: AppSize.s24,
//           ),
//
//
//
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//
//               GestureDetector(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//
//                       _fetchPickupAddress().then((pickupAddress) {
//                         // Fill the pickup address TextField with the fetched address
//                         _pickupAddressController.text = pickupAddress ?? '';
//                       }).catchError((error) {
//                         print('Error fetching pickup address: $error');
//                       });
//
//
//                       return AlertDialog(
//                         key: _formKey,
//
//                         backgroundColor: Colors.white,
//                         title: Text('Enter Text'),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             Text('Pickup Address'),
//                             TextField(
//                               readOnly: true,
//                               controller: _pickupAddressController,
//                               decoration: InputDecoration(
//                                   hintText: 'Pickup Address',
//                                   hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
//                             ),
//                             SizedBox(height: 15),
//                             Text('Note'),
//
//                             TextField(
//                               controller: _noteController,
//                               decoration: InputDecoration(labelText: 'Note'),
//                             ),
//                             SizedBox(height: 15),
//                             Text('Estimated Parcel'),
//
//                             TextField(
//                               controller: _estimatedParcelController,
//                               decoration: InputDecoration(labelText: 'Estimated Parcel'),
//                             ),
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context); // Close the dialog
//                             },
//                             child: Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // Do something with the entered text
//                               print('Text 1: ${_pickupAddressController.text}');
//                               print('Text 2: ${_noteController.text}');
//                               print('Text3: ${_estimatedParcelController.text}');
//
//                               String pickupAddress = _pickupAddressController.text;
//                               String note = _noteController.text;
//                               String estimatedParcel = _estimatedParcelController.text;
//
//                               _submitPickupRequest(context, pickupAddress, note, estimatedParcel);
//                               // _submitPickupRequest(context, _pickupAddressController.text, _noteController.text, _estimatedParcelController.text);
//
//
//                               // _submitPickupRequest();
//
//                               Navigator.pop(context); // Close the dialog
//                             },
//                             child: Text('Submit'),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 child: Container(
//                   height: MediaQuery.of(context).size.width / 5.8,
//                   width: MediaQuery.of(context).size.width / 3.3,
//                   decoration: BoxDecoration(
//                     color: Colormanager.darkPrimary,
//                     borderRadius: BorderRadius.all(Radius.circular(5)),
//                   ),
//                   child: Center(
//                     child: Text(
//                       'Pickup Request',
//                       style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//
//
//               SizedBox(width: 30,),
//               GestureDetector(
//                 onTap: () {
//                   showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//
//
//
//                       return AlertDialog(
//                         backgroundColor: Colors.white,
//                         title: Text('Payment Request'),
//                         content: Column(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // TextField(
//                             //   readOnly: true,
//                             //   controller: _textController4,
//                             //   decoration: InputDecoration(labelText: 'Current Payment Method'),
//                             //   onTap: () {
//                             //     print('tapped');
//                             //     String? _selectedPaymentMethod; // Variable to store the selected payment method
//                             //
//                             //     String _selectedOption = 'Option 1';
//                             //     // Initially set to the first option
//                             //     DropdownButtonFormField(
//                             //       value: _selectedPaymentMethod,
//                             //       items: paymentTypes.map((
//                             //           type) {
//                             //         return DropdownMenuItem(
//                             //           value: type,
//                             //           child: Text(type),
//                             //         );
//                             //       }).toList(),
//                             //       onChanged: (value) {
//                             //         _selectedPaymentMethod =
//                             //             value.toString();
//                             //         // selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
//                             //         // selectedAccount = 'Select Account'; // Reset selected account when payment type changes
//                             //
//                             //       },
//                             //       decoration: InputDecoration(
//                             //         labelText: 'Payment Type',
//                             //         labelStyle: TextStyle(
//                             //             color: Colors.black),
//                             //       ),
//                             //     );
//                             //
//                             //
//                             //
//                             //
//                             //     },),
//
//
//                             DropdownButtonFormField(
//                               value: _selectedPaymentMethod,
//                               dropdownColor: Colors.white,
//                               items: paymentTypes.map((
//                                   type) {
//                                 return DropdownMenuItem(
//                                   value: type,
//                                   child: Text(type, style: TextStyle(color: Colors.black),),
//                                 );
//                               }).toList(),
//                               onChanged: (value) {
//                                 _selectedPaymentMethod =
//                                     value.toString();
//
//                               },
//
//                               decoration: InputDecoration(
//                                 labelText: 'Payment Method',
//                                 labelStyle: TextStyle(
//                                     color: Colors.black),
//                               ),
//                             ),
//
//
//                           ],
//                         ),
//                         actions: [
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context); // Close the dialog
//                             },
//                             child: Text('Cancel'),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               // Do something with the entered text
//
//                               print('Text4: ${_textController4.text}');
//
//                               Navigator.pop(context); // Close the dialog
//                             },
//                             child: GestureDetector(
//                                 onTap:(){
//                                   submitpaymethod(context);
//
//                                   // Navigator.pop(context); // Close the dialog after submit
//
//
//
//                                 },
//
//                                 child: Text('Submit')),
//                           ),
//                         ],
//                       );
//                     },
//                   );
//                 },
//                 child: Container(
//                     height: MediaQuery.of(context).size.width / 5.8,
//                     width: MediaQuery.of(context).size.width / 3.3,
//                     decoration: BoxDecoration(
//                       color: Colormanager.darkPrimary,
//                       borderRadius: BorderRadius.all(Radius.circular(5)), // Replace ; with ,
//                     ),
//                     child:Center(child: Text('Payment Request',
//                       style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
//                     ))
//
//                 ),
//               ),
//
//             ],
//           ),
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         for (var i = 0; i < responseData!['data'].length && i < 18; i += 2)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Card(
//                               color: Colormanager.darkPrimary,
//                               elevation: 3,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       _getDisplayText(responseData!['data'].keys.elementAt(i)),
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                           color: Colors.white
//
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       '${responseData!['data'].values.elementAt(i)}',
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white
//
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.stretch,
//                       children: [
//                         for (var i = 1; i < responseData!['data'].length && i < 18; i += 2)
//                           Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 8.0),
//                             child: Card(
//                               color: Colormanager.darkPrimary,
//                               elevation: 3,
//                               child: Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       _getDisplayText(responseData!['data'].keys.elementAt(i)),
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                           color: Colors.white
//
//                                       ),
//                                     ),
//                                     SizedBox(height: 8),
//                                     Text(
//                                       '${responseData!['data'].values.elementAt(i)}',
//                                       style: TextStyle(
//                                           fontSize: 14,
//                                           color: Colors.white
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     ),
//     // drawer:  const NavigationBarDrawer(),
//   );
// }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Dashboard',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Get.to(CreateOrderView());
            },
          ),
        ],
      ),
      drawer: NavigationBarDrawer(),
      body: RefreshIndicator(
        onRefresh: () => fetchData(),

        child: errorMessage != null
            ? Center(
          child: Text(errorMessage!),
        )
            : responseData == null
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SingleChildScrollView(
          // child: Column(
          //   children: [
          //
          //
          //     Padding(
          //       padding: const EdgeInsets.all(8.0),
          //       child: Container(
          //                   child: Row(
          //                               mainAxisAlignment: MainAxisAlignment.center,
          //                               children: [
          //
          //                                 GestureDetector(
          //                                   onTap: () {
          //                                     showDialog(
          //                                       context: context,
          //                                       builder: (BuildContext context) {
          //
          //                   _fetchPickupAddress().then((pickupAddress) {
          //                     // Fill the pickup address TextField with the fetched address
          //                     _pickupAddressController.text = pickupAddress ?? '';
          //                   }).catchError((error) {
          //                     print('Error fetching pickup address: $error');
          //                   });
          //
          //
          //                   return AlertDialog(
          //                     key: _formKey,
          //
          //                     backgroundColor: Colors.white,
          //                     title: Text('Enter Text'),
          //                     content: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                         Text('Pickup Address'),
          //                         TextField(
          //                           readOnly: true,
          //                           controller: _pickupAddressController,
          //                           decoration: InputDecoration(
          //                               hintText: 'Pickup Address',
          //                               hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
          //                         ),
          //                         SizedBox(height: 15),
          //                         Text('Note'),
          //
          //                         TextField(
          //                           controller: _noteController,
          //                           decoration: InputDecoration(labelText: 'Note'),
          //                         ),
          //                         SizedBox(height: 15),
          //                         Text('Estimated Parcel'),
          //
          //                         TextField(
          //                           controller: _estimatedParcelController,
          //                           decoration: InputDecoration(labelText: 'Estimated Parcel'),
          //                         ),
          //                       ],
          //                     ),
          //                     actions: [
          //                       TextButton(
          //                         onPressed: () {
          //                           Navigator.pop(context); // Close the dialog
          //                         },
          //                         child: Text('Cancel'),
          //                       ),
          //                       TextButton(
          //                         onPressed: () {
          //                           // Do something with the entered text
          //                           print('Text 1: ${_pickupAddressController.text}');
          //                           print('Text 2: ${_noteController.text}');
          //                           print('Text3: ${_estimatedParcelController.text}');
          //
          //                           String pickupAddress = _pickupAddressController.text;
          //                           String note = _noteController.text;
          //                           String estimatedParcel = _estimatedParcelController.text;
          //
          //                           _submitPickupRequest(context, pickupAddress, note, estimatedParcel);
          //                           // _submitPickupRequest(context, _pickupAddressController.text, _noteController.text, _estimatedParcelController.text);
          //
          //
          //                           // _submitPickupRequest();
          //
          //                           Navigator.pop(context); // Close the dialog
          //                         },
          //                         child: Text('Submit'),
          //                       ),
          //                     ],
          //                   );
          //                                       },
          //                                     );
          //                                   },
          //                                   child: Container(
          //                                     height: MediaQuery.of(context).size.width / 5.8,
          //                                     width: MediaQuery.of(context).size.width / 3.3,
          //                                     decoration: BoxDecoration(
          //                                       color: Colormanager.darkPrimary,
          //                                       borderRadius: BorderRadius.all(Radius.circular(5)),
          //                                     ),
          //                                     child: Center(
          //                                       child: Text(
          //                   'Pickup Request',
          //                   style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
          //                                       ),
          //                                     ),
          //                                   ),
          //                                 ),
          //
          //
          //                                 SizedBox(width: 30,),
          //                                 GestureDetector(
          //                                   onTap: () {
          //                                     showDialog(
          //                                       context: context,
          //                                       builder: (BuildContext context) {
          //
          //
          //
          //                   return AlertDialog(
          //                     backgroundColor: Colors.white,
          //                     title: Text('Payment Request'),
          //                     content: Column(
          //                       mainAxisSize: MainAxisSize.min,
          //                       children: [
          //                         // TextField(
          //                         //   readOnly: true,
          //                         //   controller: _textController4,
          //                         //   decoration: InputDecoration(labelText: 'Current Payment Method'),
          //                         //   onTap: () {
          //                         //     print('tapped');
          //                         //     String? _selectedPaymentMethod; // Variable to store the selected payment method
          //                         //
          //                         //     String _selectedOption = 'Option 1';
          //                         //     // Initially set to the first option
          //                         //     DropdownButtonFormField(
          //                         //       value: _selectedPaymentMethod,
          //                         //       items: paymentTypes.map((
          //                         //           type) {
          //                         //         return DropdownMenuItem(
          //                         //           value: type,
          //                         //           child: Text(type),
          //                         //         );
          //                         //       }).toList(),
          //                         //       onChanged: (value) {
          //                         //         _selectedPaymentMethod =
          //                         //             value.toString();
          //                         //         // selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
          //                         //         // selectedAccount = 'Select Account'; // Reset selected account when payment type changes
          //                         //
          //                         //       },
          //                         //       decoration: InputDecoration(
          //                         //         labelText: 'Payment Type',
          //                         //         labelStyle: TextStyle(
          //                         //             color: Colors.black),
          //                         //       ),
          //                         //     );
          //                         //
          //                         //
          //                         //
          //                         //
          //                         //     },),
          //
          //
          //                         DropdownButtonFormField(
          //                           value: _selectedPaymentMethod,
          //                           dropdownColor: Colors.white,
          //                           items: paymentTypes.map((
          //                               type) {
          //                             return DropdownMenuItem(
          //                               value: type,
          //                               child: Text(type, style: TextStyle(color: Colors.black),),
          //                             );
          //                           }).toList(),
          //                           onChanged: (value) {
          //                             _selectedPaymentMethod =
          //                                 value.toString();
          //
          //                           },
          //
          //                           decoration: InputDecoration(
          //                             labelText: 'Payment Method',
          //                             labelStyle: TextStyle(
          //                                 color: Colors.black),
          //                           ),
          //                         ),
          //
          //
          //                       ],
          //                     ),
          //                     actions: [
          //                       TextButton(
          //                         onPressed: () {
          //                           Navigator.pop(context); // Close the dialog
          //                         },
          //                         child: Text('Cancel'),
          //                       ),
          //                       TextButton(
          //                         onPressed: () {
          //                           // Do something with the entered text
          //
          //                           print('Text4: ${_textController4.text}');
          //
          //                           Navigator.pop(context); // Close the dialog
          //                         },
          //                         child: GestureDetector(
          //                             onTap:(){
          //                               submitpaymethod(context);
          //
          //                               // Navigator.pop(context); // Close the dialog after submit
          //
          //
          //
          //                             },
          //
          //                             child: Text('Submit')),
          //                       ),
          //                     ],
          //                   );
          //                                       },
          //                                     );
          //                                   },
          //                                 ),
          //                       ],),
          //                 ),
          //     ),
          //
          //
          //     Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: Container(
          //         color: Colors.black,
          //         child: Padding(
          //           padding: const EdgeInsets.all(16.0),
          //           child: Row(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Expanded(
          //                 child: Padding(
          //                   padding: const EdgeInsets.symmetric(
          //                       horizontal: 8.0),
          //                   child: Column(
          //                     crossAxisAlignment:
          //                     CrossAxisAlignment.stretch,
          //                     children: [
          //                       for (var i = 0;
          //                       i < responseData!['data'].length &&
          //                           i < 18;
          //                       i += 2)
          //                         Padding(
          //                           padding: const EdgeInsets.symmetric(
          //                               vertical: 8.0),
          //                           child: Container(
          //                             width: MediaQuery.of(context).size.width * 0.3,
          //                             child: Card(
          //
          //                               color: Colormanager.darkPrimary,
          //                               elevation: 3,
          //                               child: Padding(
          //                                 padding: const EdgeInsets.all(8.0),
          //                                 child: Row(
          //                                   crossAxisAlignment:
          //                                   CrossAxisAlignment.start,
          //                                   children: [
          //                                     _buildKeyValueWidget(
          //                                       responseData!['data']
          //                                           .keys
          //                                           .elementAt(i),
          //                                       responseData!['data']
          //                                           .values
          //                                           .elementAt(i),
          //                                     ),
          //                                     if (i + 1 <
          //                                         responseData!['data']
          //                                             .length)
          //                                       SizedBox(height: 8),
          //                                     if (i + 1 <
          //                                         responseData!['data']
          //                                             .length)
          //                                       _buildKeyValueWidget(
          //                                         responseData!['data']
          //                                             .keys
          //                                             .elementAt(i + 1),
          //                                         responseData!['data']
          //                                             .values
          //                                             .elementAt(i + 1),
          //                                       ),
          //                                   ],
          //                                 ),
          //                               ),
          //                             ),
          //                           ),
          //                         ),
          //                     ],
          //                   ),
          //                 ),
          //               ),
          //             ],
          //           ),
          //         ),
          //       ),
          //     ),
          //
          //   ],
          // ),

          // child: Column(
          //     children: [
          //
          //       Padding(
          //         padding: const EdgeInsets.all(18.0),
          //         child: SingleChildScrollView(
          //           child: Container(
          //             color: Colors.black,
          //             child: Column(
          //               children: [
          //                 Container(
          //                   color: Colors.black,
          //                   child: Padding(
          //                     padding: const EdgeInsets.only(top:30.0),
          //                     child: Row(
          //                       crossAxisAlignment: CrossAxisAlignment.start,
          //                       children: [
          //
          //                         Expanded(
          //                           child: Padding(
          //                             padding: const EdgeInsets.symmetric(horizontal: 8.0),
          //                             child: Column(
          //                               crossAxisAlignment: CrossAxisAlignment.stretch,
          //                               children: [
          //
          //
          //                                 for (var i = 0; i < responseData!['data'].length && i < 18; i += 2)
          //                                   Padding(
          //                                     padding: const EdgeInsets.symmetric(vertical: 8.0),
          //                                     child: Container(
          //                                       width: MediaQuery.of(context).size.width * 0.3,
          //                                       child: Card(
          //                                         color: Colormanager.darkPrimary,
          //                                         elevation: 3,
          //                                         child: Padding(
          //                                           padding: const EdgeInsets.all(8.0),
          //                                           child: Row(
          //                                             crossAxisAlignment: CrossAxisAlignment.start,
          //                                             children: [
          //                                               _buildKeyValueWidget(
          //                                                 responseData!['data'].keys.elementAt(i),
          //                                                 responseData!['data'].values.elementAt(i),
          //                                               ),
          //                                               if (i + 1 < responseData!['data'].length) SizedBox(height: 8),
          //                                               if (i + 1 < responseData!['data'].length)
          //                                                 _buildKeyValueWidget(
          //                                                   responseData!['data'].keys.elementAt(i + 1),
          //                                                   responseData!['data'].values.elementAt(i + 1),
          //                                                 ),
          //                                             ],
          //                                           ),
          //                                         ),
          //                                       ),
          //                                     ),
          //                                   ),
          //                               ],
          //                             ),
          //                           ),
          //                         ),
          //                       ],
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),


          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {

                              _fetchPickupAddress().then((pickupAddress) {
                                // Fill the pickup address TextField with the fetched address
                                _pickupAddressController.text = pickupAddress ?? '';
                              }).catchError((error) {
                                print('Error fetching pickup address: $error');
                              });


                              return AlertDialog(
                                key: _formKey,

                                backgroundColor: Colors.white,
                                title: Text('Enter Text'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text('Pickup Address'),
                                    TextField(
                                      readOnly: true,
                                      controller: _pickupAddressController,
                                      decoration: InputDecoration(
                                          hintText: 'Pickup Address',
                                          hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                                    ),
                                    SizedBox(height: 15),
                                    Text('Note'),

                                    TextField(
                                      controller: _noteController,
                                      decoration: InputDecoration(labelText: 'Note'),
                                    ),
                                    SizedBox(height: 15),
                                    Text('Estimated Parcel'),

                                    TextField(
                                      controller: _estimatedParcelController,
                                      decoration: InputDecoration(labelText: 'Estimated Parcel'),
                                    ),
                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Do something with the entered text
                                      print('Text 1: ${_pickupAddressController.text}');
                                      print('Text 2: ${_noteController.text}');
                                      print('Text3: ${_estimatedParcelController.text}');

                                      String pickupAddress = _pickupAddressController.text;
                                      String note = _noteController.text;
                                      String estimatedParcel = _estimatedParcelController.text;

                                      _submitPickupRequest(context, pickupAddress, note, estimatedParcel);
                                      // _submitPickupRequest(context, _pickupAddressController.text, _noteController.text, _estimatedParcelController.text);


                                      // _submitPickupRequest();

                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: Text('Submit'),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width / 4.8,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            color: Colormanager.darkPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              'Pickup Request',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      GestureDetector(
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {

                              _fetchPickupAddress().then((pickupAddress) {
                                // Fill the pickup address TextField with the fetched address
                                _pickupAddressController.text = pickupAddress ?? '';
                              }).catchError((error) {
                                print('Error fetching pickup address: $error');
                              });


                              // return AlertDialog(
                              //   key: _formKey,
                              //
                              //   backgroundColor: Colors.white,
                              //   title: Text('Enter Text'),
                              //   content: Column(
                              //     mainAxisSize: MainAxisSize.min,
                              //     children: [
                              //       Text('Pickup Address'),
                              //       TextField(
                              //         readOnly: true,
                              //         controller: _pickupAddressController,
                              //         decoration: InputDecoration(
                              //             hintText: 'Pickup Address',
                              //             hintStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
                              //       ),
                              //       SizedBox(height: 15),
                              //       Text('Note'),
                              //
                              //       TextField(
                              //         controller: _noteController,
                              //         decoration: InputDecoration(labelText: 'Note'),
                              //       ),
                              //       SizedBox(height: 15),
                              //       Text('Estimated Parcel'),
                              //
                              //       TextField(
                              //         controller: _estimatedParcelController,
                              //         decoration: InputDecoration(labelText: 'Estimated Parcel'),
                              //       ),
                              //     ],
                              //   ),
                              //   actions: [
                              //     TextButton(
                              //       onPressed: () {
                              //         Navigator.pop(context); // Close the dialog
                              //       },
                              //       child: Text('Cancel'),
                              //     ),
                              //     TextButton(
                              //       onPressed: () {
                              //         // Do something with the entered text
                              //         print('Text 1: ${_pickupAddressController.text}');
                              //         print('Text 2: ${_noteController.text}');
                              //         print('Text3: ${_estimatedParcelController.text}');
                              //
                              //         String pickupAddress = _pickupAddressController.text;
                              //         String note = _noteController.text;
                              //         String estimatedParcel = _estimatedParcelController.text;
                              //
                              //         _submitPickupRequest(context, pickupAddress, note, estimatedParcel);
                              //         // _submitPickupRequest(context, _pickupAddressController.text, _noteController.text, _estimatedParcelController.text);
                              //
                              //
                              //         // _submitPickupRequest();
                              //
                              //         Navigator.pop(context); // Close the dialog
                              //       },
                              //       child: Text('Submit'),
                              //     ),
                              //   ],
                              // );


                              return AlertDialog(
                                backgroundColor: Colors.white,
                                title: Text('Payment Request'),
                                content: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    // TextField(
                                    //   readOnly: true,
                                    //   controller: _textController4,
                                    //   decoration: InputDecoration(labelText: 'Current Payment Method'),
                                    //   onTap: () {
                                    //     print('tapped');
                                    //     String? _selectedPaymentMethod; // Variable to store the selected payment method
                                    //
                                    //     String _selectedOption = 'Option 1';
                                    //     // Initially set to the first option
                                    //     DropdownButtonFormField(
                                    //       value: _selectedPaymentMethod,
                                    //       items: paymentTypes.map((
                                    //           type) {
                                    //         return DropdownMenuItem(
                                    //           value: type,
                                    //           child: Text(type),
                                    //         );
                                    //       }).toList(),
                                    //       onChanged: (value) {
                                    //         _selectedPaymentMethod =
                                    //             value.toString();
                                    //         // selectedBank = 'Select Bank'; // Reset selected bank when payment type changes
                                    //         // selectedAccount = 'Select Account'; // Reset selected account when payment type changes
                                    //
                                    //       },
                                    //       decoration: InputDecoration(
                                    //         labelText: 'Payment Type',
                                    //         labelStyle: TextStyle(
                                    //             color: Colors.black),
                                    //       ),
                                    //     );
                                    //
                                    //
                                    //
                                    //
                                    //     },),


                                    DropdownButtonFormField(
                                      value: _selectedPaymentMethod,
                                      dropdownColor: Colors.white,
                                      items: paymentTypes.map((
                                          type) {
                                        return DropdownMenuItem(
                                          value: type,
                                          child: Text(type, style: TextStyle(color: Colors.black),),
                                        );
                                      }).toList(),
                                      onChanged: (value) {
                                        _selectedPaymentMethod =
                                            value.toString();

                                      },

                                      decoration: InputDecoration(
                                        labelText: 'Payment Method',
                                        labelStyle: TextStyle(
                                            color: Colors.black),
                                      ),
                                    ),


                                  ],
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      // Do something with the entered text

                                      print('Text4: ${_textController4.text}');

                                      Navigator.pop(context); // Close the dialog
                                    },
                                    child: GestureDetector(
                                        onTap:(){
                                          submitpaymethod(context);

                                          // Navigator.pop(context); // Close the dialog after submit



                                        },

                                        child: Text('Submit')),
                                  ),
                                ],
                              );


                            },
                          );
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.width / 4.8,
                          width: MediaQuery.of(context).size.width / 2.5,
                          decoration: BoxDecoration(
                            color: Colormanager.darkPrimary,
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          ),
                          child: Center(
                            child: Text(
                              'Payment Request',
                              style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      for (var i = 0; i < responseData!['data'].length; i +=4)
                                        if (responseData!['data'].keys.elementAt(i) != 'total_delivery_unsuccess_ratio' && responseData!['data'].keys.elementAt(i) != 'paymentProcessing')

                                          Padding(
                                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                Expanded(
                                                  child: Card(
                                                    // color: Colormanager.darkPrimary,
                                                    color: getRandomColor(),//cardColors[i % cardColors.length], // Use colors from the list

                                                    elevation: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text('Today', style: TextStyle(color: Colors.white, fontSize: 10),),

                                                              Text('Total', style: TextStyle(color: Colors.white, fontSize: 10),),

                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment: MainAxisAlignment.center,
                                                            children: [

                                                              _buildKeyValueWidget(
                                                                responseData!['data'].keys.elementAt(i),
                                                                responseData!['data'].values.elementAt(i),
                                                              ),
                                                              if (i + 1 < responseData!['data'].length)
                                                                SizedBox(height: 8),
                                                              if (i + 1 < responseData!['data'].length)
                                                                _buildKeyValueWidget(
                                                                  // responseData!['data'].keys.elementAt(i + 1),
                                                                  '',
                                                                  responseData!['data'].values.elementAt(i + 1),
                                                                ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(width: 8), // Adjust spacing between cards
                                                if (i + 2 < responseData!['data'].length)
                                                  Expanded(
                                                    child: Card(
                                                      // color: Colormanager.darkPrimary,
                                                      color: getRandomColor(),//cardColors[(i + 2) % cardColors.length], // Use colors from the list

                                                      elevation: 3,
                                                      child: Padding(
                                                        padding: const EdgeInsets.all(8.0),
                                                        child: Column(
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                              children: [
                                                                Text('Today', style: TextStyle(color: Colors.white, fontSize: 10),),

                                                                Text('Total', style: TextStyle(color: Colors.white, fontSize: 10),),

                                                              ],
                                                            ),
                                                            Row(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              children: [
                                                                _buildKeyValueWidget(
                                                                  responseData!['data'].keys.elementAt(i + 2),
                                                                  responseData!['data'].values.elementAt(i + 2),
                                                                ),
                                                                if (i + 3 < responseData!['data'].length)
                                                                  SizedBox(height: 8),
                                                                if (i + 3 < responseData!['data'].length)
                                                                  _buildKeyValueWidget(
                                                                    // responseData!['data'].keys.elementAt(i + 3),
                                                                    '',
                                                                    responseData!['data'].values.elementAt(i + 3),
                                                                  ),





                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                  ),
                                              ],
                                            ),
                                          ),
                                      Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height/7.6,
                                                  width: MediaQuery.of(context).size.width/2.2,


                                                  child: Card(
                                                    color: getRandomColor(),//Colormanager.darkPrimary,
                                                    elevation: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: _buildpayWidget(
                                                        'payment processing', // Key for which you want to display the value

                                                        responseData!['data']['paymentProcessing'].toString(), // Value corresponding to the key
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context).size.height/7.6,
                                                  width: MediaQuery.of(context).size.width/2.2,


                                                  child: Card(
                                                    color: getRandomColor(),//Colormanager.darkPrimary,
                                                    elevation: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: _buildpayWidget(
                                                        'Payment Complete', // Key for which you want to display the value

                                                        responseData!['data']['paymentComplete'].toString(), // Value corresponding to the key
                                                      ),
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),
                                            SizedBox(height:10),
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,

                                              children: [
                                                Container(
                                                  height: MediaQuery.of(context).size.height/7.6,
                                                  width: MediaQuery.of(context).size.width/2.2,

                                                  child: Card(
                                                    color: getRandomColor(),//Colormanager.darkPrimary,
                                                    elevation: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: _buildpayWidget(
                                                        'Delivery Unsuccessful', // Key for which you want to display the value

                                                        responseData!['data']['total_delivery_unsuccess_ratio'].toString(), // Value corresponding to the key
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  height: MediaQuery.of(context).size.height/7.6,
                                                  width: MediaQuery.of(context).size.width/2.2,


                                                  child: Card(
                                                    color: getRandomColor(),//Colormanager.darkPrimary,
                                                    elevation: 3,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all(8.0),
                                                      child: _buildpayWidget(
                                                        'Delivery Successful', // Key for which you want to display the value

                                                        responseData!['data']['total_delivery_success_ratio'].toString(), // Value corresponding to the key
                                                      ),
                                                    ),
                                                  ),
                                                )

                                              ],
                                            ),

                                          ],
                                        ),
                                      ),



                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),


                    ],
                  ),
                ),
              ),
            ],
          ),


        ),
      ),

    );

  }



  String fetchValueForKey(String key) {
    // This is a placeholder method. You should replace it with your actual logic to fetch the value for the given key.
    // For demonstration purposes, I'm just returning some hardcoded values based on the key.
    switch (key) {
      case 'Corresponding Method':
        return 'Value for corresponding method';
    // Add more cases for other keys if needed
      default:
        return 'Unknown'; // Return a default value if the key is not found
    }
  }


  Widget _buildpaymentWidget(String key) {
    final value = fetchValueForKey(key); // Fetch the value for the given key
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          key,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  Widget _buildpayWidget(String key, String value) {
    return Column(
      children: [
        Text(
          // value,
          value.toString(), // Convert value to string
          style: TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.white

          ),
        ),

        SizedBox(height: 10,),

        Text(
          '$key ',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),

      ],
    );
  }



  Widget _buildKeyValueWidget(String key, dynamic value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      // mainAxisAlignment: MainAxisAlignment.center,


      children: [
        Text(
          '$value',
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),

        SizedBox(height: 8),

        Text(
          _getDisplayText(key),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 13,
            color: Colors.white,
          ),
        ),

      ],
    );
  }


  String _getDisplayText(String key) {
    switch (key) {
      case 'today_order':
        return 'Order';
      case 'total_order':
        return 'Total Order';
      case 'todayorderTransit':
        return 'Today Transit';
      case 'totalorderTransit':
        return 'Total Transit';
      case 'today_dalivery_amount':
        return 'Delivery Amount';
      case 'total_dalivery_amount':
        return 'Total Delivery Amount';
      case 'total_delivery_unsuccess_ratio':
      // return 'Total Delivery Unsuccessful Ratio';
        return 'Delivery Unsuccessful';

      case 'total_delivery_success_ratio':
        return 'Total Delivery Successful Ratio';
      case 't_dalivery':
        return 'Today Delivery';
      case 'to_dalivery':
        return 'Total Delivery';
      case 't_cancel':
        return 'Today Cancel';
      case 'to_cancel':
        return 'Total Cancel';
      case 't_return':
        return 'Today Return';
      case 'to_return':
        return 'Total Return';
      case 't_hold_reschedule':
        return 'Hold - Reschedule';
      case 'to_hold_reschedule':
        return 'Total Hold Reschedule';

      default:
        return key;
    }
  }


  Future<String?> showAlertCuperutino(BuildContext context,
      String msg, [
        String? title,
      ]) async {
    final ok = CupertinoDialogAction(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: const Text("OK"),
    );

    final alert = CupertinoAlertDialog(
      title: title != null ? Text(title) : null,
      content: Text(msg),
      actions: [ok],
    );

    return showDialog(
      context: context,
      builder: (BuildContext context) => alert,
    );
  }
}