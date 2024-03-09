import 'dart:convert';
import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/details_payment_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/data/remote/order_api.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_create_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/navigation.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/create_order.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/routes_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class Dashboard_apiScreen extends StatefulWidget {
  @override
  _Dashboard_apiScreenState createState() => _Dashboard_apiScreenState();
}

class _Dashboard_apiScreenState extends State<Dashboard_apiScreen> {

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();


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
  //   // Define your headers here
  //   Map<String, String> headers = {
  //     'Accept': 'application/json',
  //     'Content-Type': 'application/json',
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIn0.eyJhdWQiOiIxNCIsImp0aSI6IjdkZjE3ZDgzZTYzYWE2MmE2Y2QwZGE1YzNjOGMwZGE2Zjk2NTJkMzQzMmRkMzE4MWNiYjdhNmI2YjkxZDg0MzQ5MWU5ZjdhMzBlZWE2MjcwIiwiaWF0IjoxNzA5MTAyNjU4LCJuYmYiOjE3MDkxMDI2NTgsImV4cCI6MTc0MDcyNTA1OCwic3ViIjoiMTA1OCIsInNjb3BlcyI6W119.RcXx6nhqun7lAPZoEdcvXLGdnuFgMBB23RJM4GpY0c3qoM7MGH-iAClD5geVYushfbaVFFdPtUGgQhOEWIeZ8sXqn_7egOYbn6SVlIfltCzTnNKuinN6sMpgzfGOtY_ulwgreVyzSMerqlEtejb-xD5syl8cjFglG5zbPLFQ_faHHpKKsRhNDGiqQMBiMQ_der78KoMDvA5lumhm3oWYVMhM3P9if9KycTdh2ZP-q8Nu3UDvcLQsQWg-bQl6HyNyqj1jcN7YMgy3obrs1cqcpkGVcwSJ8yuWrz46xK-FaRXDK4B7H0ZR-VdyWqSWvNSdoufv9WUdcg0wNfd6huceAIEtgboOHl13jn17dMmd7MGGUYKku8mTvejtWLvwQ45Wh40nyQ2-RjpXY5U3d0Vssa5DYITxJ4YTg34p7dX41LWXwsBVunn1eaAhtYpqh75G7V6h0gGTEY8nkijoc9S5hh1YxWnzACyayeSZ7yz2AwhQdG9FhyEJdY7hMfIlinh611uoiXdlZ8JvhHJZdgPywQs0eOYGdKWApKXd95eTmyMsVDCX3uk3Z5jqOM1eG0xuU20HH8aZhCsicM2yBN1G7L0b8pFe8FZ2FHnbJYAErI5YE-rXCQE25FEzs3MdJCP42kqwe52oF5-M9y2r2MdAkjUCtxs0anrIObCuiEWS7J8'
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
  //   } else {
  //     setState(() {
  //       errorMessage = 'Failed to load data: ${response.statusCode}';
  //     });
  //     print('Failed to load data: ${response.statusCode}');
  //     print(response.body); // Print error response body in console
  //   }
  // }

  @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text('API Response Demo'),
  //     ),
  //     body: errorMessage != null
  //         ? Center(
  //       child: Text(errorMessage!),
  //     )
  //         : responseData == null
  //         ? Center(
  //       child: CircularProgressIndicator(),
  //     )
  //         : SingleChildScrollView(
  //       child: Padding(
  //         padding: const EdgeInsets.all(16.0),
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.stretch,
  //           children: [
  //             for (var entry in responseData!['data'].entries)
  //               Padding(
  //                 padding: const EdgeInsets.symmetric(vertical: 8.0),
  //                 child: Card(
  //                   elevation: 3,
  //                   child: Padding(
  //                     padding: const EdgeInsets.all(8.0),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           '${entry.key}',
  //                           style: TextStyle(
  //                             fontWeight: FontWeight.bold,
  //                             fontSize: 16,
  //                           ),
  //                         ),
  //                         SizedBox(height: 8),
  //                         Text(
  //                           '${entry.value}',
  //                           style: TextStyle(fontSize: 14),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 ),
  //               ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
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
      Uri.parse('https://system.alhamdulillahcourierservice.com/api/payment-request'),
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
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIn0.eyJhdWQiOiIxNCIsImp0aSI6IjczMWU0YzFkYzY4NDQ2ZTRjYWVmNjNiZmY5ZmYzN2I5ZjAxNWIxOTI2N2Q2MTMwNGE0MmFkMzExMGJkZjYyZDYyZGU5YjdhYzA4OWI4YjcxIiwiaWF0IjoxNzA4NzQ0OTk1LCJuYmYiOjE3MDg3NDQ5OTUsImV4cCI6MTc0MDM2NzM5NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.ZmmMgixvMzkq9z7CdhMJtRyPrrR16hgs4mnoJIEcXtguecHBOLRBHyZI2lqOA4Uo_2niRfXoiD71bqwtXvOctZM1RVGvGQIWtmOx_Ei2hIVuuwULyLfHCdmlhN1L2FLq4effENXw1SiP45dH7vzFvXPsOdI4k98N0ZyH3bYfm7K2aupFG67n2avDisEtTqfIF6V6GkgkGbyjigwsZpyHRUFBDBobbz60VKo9KixgzFevAyUli0sKgntOWWi_1eRJht9KldVvfigI7gSSilqONR258bZj-MsfOlDS6pnXZcmNTDOdPjInDNQhprsZeiz4ALpdp0fxGGg2ogVlAhEBX5B9rrPTzbMWy3A6dUDe45Fx7U2XqGG_mVbqTG7eAEJvLdH3TubMilojCwWh_t00QSLD7trQFWk1tRwSI3GW-LU3Km4yur7qyxGTSlYT-ZC0F3Brt8Ye0dMIYaWizofxukf0pEJiobsnIpPSyd83Nf1WPw3Hpz5bVntsR6A5H543-XFxUYHdNO01I9Afj4vxdsVkvfdbpNauJWJ-iCtZyWgXESxWad5pU9RgK_KwfB90fB9vJ1k6WiWLiMJAANmrH_5QIcG5-Ezbl0lLnLhiu8Q1GssX3gKk4FL-tHQKHH133q4jbtF9QRCnMQA6IxqB7w0CkSW_ipRaKvH83xMKP24'
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
        // 'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIn0.eyJhdWQiOiIxNCIsImp0aSI6ImY4ZjNlYzY1NmM4Yzc1MTQ3OTdhN2RjMzM0NmVmM2I5NTVkMDVhYTNlMGUyMmQ3YWUwZjVmZTFkMDI1OTQ3MzEwNDljOWRjZjJhMTgzNDJkIiwiaWF0IjoxNzA4NzQ0NjQwLCJuYmYiOjE3MDg3NDQ2NDAsImV4cCI6MTc0MDM2NzA0MCwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.Cq7XniYb5IW5CePPEyAstjDQCWeYdYX0lYjkf7GPNcEHAgdg-PkzlAyAG7aw7A7MBq9T3mHfZiw0VXvtQ6_aWONakt95l5PpPdPTlbb1qa0Toig81XdpUUKXLlUOu54wal6TPQn-HWAmJ7s4aMtjMghH54hoPcMkvH0gdUuD7PfWwwTtEVx2b8xoh7wcedxd86EqYkYaPqDsAaFK42eRo8AlB_9f85KtK4ULqfwZBlOXxkqLMLKOwVrwYq2VjWIoXkwrMCezGhsYJAkETRGL5STw8CdGOIwXDIZAWtsin26T2wn6_zEGhWKFuHfLX7CYect37C6WrzuUlncY6F9dSPAVNqkjypg_QcN4HW8b2Ytah1bLkIcEEbPuw3vVq6TRORu20IrKwl7Fa5yI6jsPziG41xnq3LszwVOPFytz7zzQFwvHAefNCKCktdu3TyVuAmmL1xYBfq7TcqGWdIY4ApGRWWYk-KTgjo9Rc52EllXgV4ExTQmuRcpkE8KQfJqYfT2ZJtuRkr9BB7CXei0Z5sr0JzxyU70kH2KzZcIWCvB6VhTjMiZDVT681INGHeT9Kd953yJPEsnRoqWlH8CAwDH7_HfTsZT5eDKLd2RlsubukVRJcNErRT1mU_dTfdzeJlU0XhVnM-gqaDfg-oiCU8mi0SxiJWGmZbZisZv3Nwc'
        'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}'


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


  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,

      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
        title: Text('Dashboard', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
    // leading: IconButton(
    // icon: Icon(Icons.menu),
    // onPressed: () {
    // // Handle menu icon tap
    //   Get.to(NavigationBarDrawer());
    // },
    // ),
          actions: [
            IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                // Handle plus icon tap
                Get.to(CreateOrderView());
              },
            ),
          ],
        ),
      drawer:NavigationBarDrawer(),

      body: errorMessage != null
          ? Center(
        child: Text(errorMessage!),
      )
          : responseData == null
          ? Center(
        child: CircularProgressIndicator(),
      )
          : SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: AppSize.s24,
            ),



            Row(
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
                    height: MediaQuery.of(context).size.width / 5.8,
                    width: MediaQuery.of(context).size.width / 3.3,
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
                      height: MediaQuery.of(context).size.width / 5.8,
                      width: MediaQuery.of(context).size.width / 3.3,
                      decoration: BoxDecoration(
                        color: Colormanager.darkPrimary,
                        borderRadius: BorderRadius.all(Radius.circular(5)), // Replace ; with ,
                      ),
                      child:Center(child: Text('Payment Request',
                        style: TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold),
                      ))

                  ),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (var i = 0; i < responseData!['data'].length && i < 18; i += 2)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                color: Colormanager.darkPrimary,
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _getDisplayText(responseData!['data'].keys.elementAt(i)),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                            color: Colors.white

                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '${responseData!['data'].values.elementAt(i)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                            color: Colors.white

                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          for (var i = 1; i < responseData!['data'].length && i < 18; i += 2)
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Card(
                                color: Colormanager.darkPrimary,
                                elevation: 3,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        _getDisplayText(responseData!['data'].keys.elementAt(i)),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                            color: Colors.white

                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Text(
                                        '${responseData!['data'].values.elementAt(i)}',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.white
                                        ),
                                      ),
                                    ],
                                  ),
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

          ],
        ),
      ),
      // drawer:  const NavigationBarDrawer(),
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
        return 'Today Delivery Amount';
      case 'total_dalivery_amount':
        return 'Total Delivery Amount';
      case 'total_delivery_unsuccess_ratio':
        return 'Total Delivery Unsuccessful Ratio';
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
        return 'Today Hold Reschedule';
      case 'to_hold_reschedule':
        return 'Total Hold Reschedule';
      case 'paymentProcessing':
        return 'Payment Processing';
      case 'paymentComplete':
        return 'Payment Complete';
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



class TopSection extends StatelessWidget {
  const TopSection({
    Key? key,
    required this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            if (scaffoldKey.currentState != null) { // Add null check here
              if (scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openEndDrawer();
              } else {
                scaffoldKey.currentState!.openDrawer();
              }
            }
          },
          child: GestureDetector(
            onTap: (){
              NavigationBarDrawer();
            },
            child: Container(
              margin: const EdgeInsets.all(AppPadding.p12),
              child: Icon(
                Icons.menu,
                color: Colormanager.darkblue,
                size: AppSize.s40,

              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.homeRoute);
          },
          child: Container(
            height: AppSize.s100,
            child: Center(
              child: Text(
                'Dashboard',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Get.toNamed(Routes.createOrder);
          },
          child: Container(
            margin: const EdgeInsets.all(AppPadding.p12),
            child: Icon(
              Icons.add,
              color: Colormanager.darkblue,
              size: AppSize.s40,
            ),
          ),
        )
      ],
    );
  }
}



