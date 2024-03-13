// import 'package:flutter/material.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/get_instance/get_instance.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
//
// class Confirm_Order_List extends StatefulWidget {
//   @override
//   _Confirm_Order_ListState createState() => _Confirm_Order_ListState();
// }
//
// class _Confirm_Order_ListState extends State<Confirm_Order_List> {
//   // Initialize a List to store the data
//   confrimorder = controller.getConfirmOrders();
//    // OrderController controller = Get.put(OrderController(orderApi:));
//
//
//   @override
//   void initState() {
//     super.initState();
//     // Call the API method when the screen is initialized
//     controller.getConfirmOrders();
//   }
//
//   // Your existing getConfirmOrders method
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Your Screen Title'),
//       ),
//       body: Center(
//         child:  controller.getConfirmOrders().isNotEmpty
//             ? buildListView()
//             : CircularProgressIndicator(), // Show a loading indicator if data is not yet available
//       ),
//     );
//   }
//
//   Widget buildListView() {
//     return ListView.builder(
//       itemCount: controller.getConfirmOrders().length,
//       itemBuilder: (context, index) {
//         // Customize this part based on your DataItem structure
//         return ListTile(
//           title: Text(
//             'Number of Items: ${controller.getConfirmOrders().length}',
//             style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//           ),//Text(controller.getConfirmOrders()[index].),
//           // Add more widgets to display other properties of DataItem
//         );
//       },
//     );
//   }
// }
//


/// OK CODE


//
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_track.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../../../data/model/confirm_orders_response.dart';
//
// class ConfirmOrderScreen extends StatefulWidget {
//   final Order order;
//   final Rider rider;
//   final PickupTime pickupTime;
//
//
//   @override
//   _ConfirmOrderScreenState createState() =>
//       _ConfirmOrderScreenState(order, rider, pickupTime);
//   @override
//   // _ConfirmOrderScreenState createState() => _ConfirmOrderScreenState();
//   ConfirmOrderScreen(this.order, this.rider, this.pickupTime);
// }
//
// class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
//   List<Map<String, dynamic>> confirmedOrderList = [];
//   final Order order;
//   final Rider rider;
//   final PickupTime pickupTime;
//
//
//   //
//   //
//   _ConfirmOrderScreenState(this.order, this.rider, this.pickupTime);
//
//   // @override
//   // void initState() {
//   //   super.initState();
//   //   getConfirmOrders();
//   // }
//
//   // Future<void> getConfirmOrders() async {
//   //   final apiUrl = 'https://system.olectraexpress.com/api/confirm-orders-list';
//   //   final response = await http.get(
//   //     Uri.parse(apiUrl),
//   //     headers: <String, String>{
//   //       'Accept': 'application/json; charset=UTF-8',
//   //       // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdlNGY4MDNkZjhhNTY0Mzg0NDk4NjMxN2Q2ZDIyOGQ1MzFlMTJkNGEwNjc3ZDk2OWJlNjY4Y2YyMWE4NWFlZDUwYTA2YWYyZjI2ZGQyNGU2In0.eyJhdWQiOiIyNCIsImp0aSI6IjdlNGY4MDNkZjhhNTY0Mzg0NDk4NjMxN2Q2ZDIyOGQ1MzFlMTJkNGEwNjc3ZDk2OWJlNjY4Y2YyMWE4NWFlZDUwYTA2YWYyZjI2ZGQyNGU2IiwiaWF0IjoxNzA1MjE0ODE0LCJuYmYiOjE3MDUyMTQ4MTQsImV4cCI6MTczNjgzNzIxNCwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.fvqBevgcROuZlsclyoaim4eRJeXWUyBcZZ7Jh-UQG2Wx9n8vpvBSbCiFdGeio6pFaGYjOMMh5_RrgvXah86ctpd-KHG3O-deGdEQWQYZ_ry2KvvZXbMFwsyfR-MxzePRul5tayFFs2qdLHFRvZQ6wk30yfG-WTICCkLZ-_95io2Weeb_90sytQqf50a5JKtve4aLQ1hkgGSPx67M92bQ99nfXgFjhsuZzeibYxlmSmMKBH2AtFselwf_xt684c0kx0306hLipOQC2KZS7neVNk2GEMUAwHbXIraRQZCQIEQO4FDbVG0ClWgn7zLO3ULB3vfka7btbZxHQx9X3fo1mN7ZWDZ3SAwwCYuJCyu0-iqsh2UQ44QQb0IH9iI4bZ3OOE6-gLHyacVtjpGyHuY36wzPBIvfOZmP8umc92Uht9pRchoMJJHlfAH6zTU-iSdUVai0FTLwh45VtHoD3_4ABmfdjnrGWLtVkjpx6mp_zUft0QU655ZgLyqnGJF-OUT4egMwAyjmy-ZT9aHRVX2l4o8NOeRE6fB5EuCFOJUhJUdK23U7KPoa4rdQEfcBe-028jb6QtllXwX6z2hwgS4596jMfY9PDz__l1pt5JDhCmAcZuV30rsE8UYsw5_DYCgcrgHpXn8vtZelfYYvZgnnH1Px-EC-7lHZpca9ovwo2HM'
//   //       // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE1NzZmY2JmYmM4YWIyZGQ4NTM3YzNlMDFjZGJiYTJiNjFmNGRjMTI0OTEwN2IwYzhmYzZhNGFjZDg1OTEzZjM4NDlmMmZkODJiMjc4ZDU3In0.eyJhdWQiOiIyNCIsImp0aSI6IjE1NzZmY2JmYmM4YWIyZGQ4NTM3YzNlMDFjZGJiYTJiNjFmNGRjMTI0OTEwN2IwYzhmYzZhNGFjZDg1OTEzZjM4NDlmMmZkODJiMjc4ZDU3IiwiaWF0IjoxNzA1MjkzMzg4LCJuYmYiOjE3MDUyOTMzODgsImV4cCI6MTczNjkxNTc4OCwic3ViIjoiMTA1NSIsInNjb3BlcyI6W119.QPtO7q3WbaA42H6CVD6ZCe0OIbx9JOmFcpv07iFMHOm8t-EJuLX1nFXRxyJoE7BOxwnTqjuCNinU9iP8KetMfE6eY2_uKQZY6UQLhesbG_TOWkc8jtI14j9iBYqdmPiN7OFfF30rEay0doJpWgGlUrXmUb8nQ_DhWeMWaQpzG4sz1OiWaCAXNLOFDIfD_kSo35W4YzSLIKxlj9S42t7YLIwBRft3jyUnKA5kzIPAPnGC8-ACSRjcaai74-LN41kqDdnJLFI1hvG_7M4aQXrzpt7RCDBZ0RGSyI7nRTKNkcOfM9mmDYGFbZpMSZ6JQdVY1tXtKYsCE_cR_gsg75TXt7DZnSsNKUb7r0D1HQEZgFKYoqHgN-veS6UhTDRlVytfLHpw6RjypMH0cy5udBeEHwPVO2AoJAFFTU8dqON_IqyY0h2UU3-eGTUxBiVeaH4X4luhQZZw9REa46IAvI4HoYEwOPAt241wORFd0yLpleDe7xpy_TJazyGG_aBcDKlCbN92h4_lZ2eyowNUvNhGEXmx6Ry09glHoAhU43aRaq74uq_CtqTK4hipH9bLppODQkHJRSe3XJewLptijibm5_VBJZi5SaVjo2M8DGTFXYHacXmeK-NnqYKjKPkaf9zF70cC6ZnMY7_5y_Mv-o88OP2IYqClYLMdn-n26ZiFUZg'
//   //     },
//   //   );
//   //
//   //   if (response.statusCode == 200) {
//   //     final Map<String, dynamic> data = json.decode(response.body);
//   //     final List<Map<String, dynamic>> orders = List.from(data['confirmed_order_list']);
//   //     setState(() {
//   //       confirmedOrderList = orders;
//   //     });
//   //   } else {
//   //     // Handle the error
//   //     print('Failed to fetch confirm order data: ${response.statusCode}');
//   //   }
//   // }
//
//
//
//   @override
//   void initState() {
//     super.initState();
//     authenticateAndFetchData();
//   }
//
//   Future<void> authenticateAndFetchData() async {
//     final token = await authenticateUser(); // Your authentication logic here
//
//     if (token != null) {
//       await getConfirmOrders(token);
//     } else {
//       print('Authentication failed');
//     }
//   }
//
//   Future<String?> authenticateUser() async {
//     // Your authentication logic here
//     // This could be a login request where you get the token
//     // You can use SharedPreferences to store and retrieve the token
//
//     // Example using SharedPreferences
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? token = prefs.getString('token');
//
//     if (token == null) {
//       // Perform login and get the token
//       // Example: token = await performLogin();
//       // Save the token to SharedPreferences
//       // prefs.setString('token', token);
//     }
//
//     return token;
//   }
//
//   Future<void> getConfirmOrders(String? token) async {
//     try {
//       final apiUrl = 'https://system.olectraexpress.com/api/confirm-orders-list';
//       final response = await http.get(
//         Uri.parse(apiUrl),
//         headers: <String, String>{
//           'Accept': 'application/json; charset=UTF-8',
//           'Authorization': 'Bearer $token',
//         },
//       );
//
//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//         final List<Map<String, dynamic>> orders =
//         List.from(data['confirmed_order_list']);
//         setState(() {
//           confirmedOrderList = orders;
//         });
//       } else {
//         print('Failed to fetch confirm order data: ${response.statusCode}');
//       }
//     } catch (error) {
//       print('Error fetching confirm order data: $error');
//     }
//   }
//
// // ... The rest of your code
// }
//
//
//
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//
//       appBar:AppBar(
//         title: Text('Confirmed Orders'),
//         backgroundColor:Colormanager.darkPrimary,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: SafeArea(
//         child: confirmedOrderList.isEmpty
//       ? Center(
//       child: Text(
//         'No Data',
//         style: TextStyle(
//           fontSize: FontSize.s16,
//           color: Colormanager.darkGrey,
//           fontWeight: FontWeight.bold,
//         ),
//       ),
//     )
//         : ListView.builder(
//           itemCount: confirmedOrderList.length,
//           itemBuilder: (context, index) {
//             final orderlist = confirmedOrderList[index];
//
//             //MAIN CARD
//
//             // return Card(
//             //   margin: EdgeInsets.all(8.0),
//             //   child: ListTile(
//             //     title: Text('Order ID: ${order['tracking_id']}'),
//             //     subtitle: Text('Customer Name: ${order['customer_name']}'),
//             //     // Add more ListTile properties to display other order details
//             //   ),
//             // );
//
//             return Card(
//               elevation: AppSize.s10,
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(5.0),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.all(15.0),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           orderlist['tracking_id'].toString(),
//                           style: getBoldStyle(
//                             color: Colormanager.black,
//                             fontSize: FontSize.s15,
//                           ),
//                         ),
//                         Text(
//                           'IV ${orderlist['collection']} TK',
//                           style: getBoldStyle(
//                             color: Colormanager.black,
//                             fontSize: FontSize.s15,
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             AppStrings.customer,
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s15,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             AppStrings.mobile,
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s15,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s4),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             orderlist['customer_name'].toString(),
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s15,
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             orderlist['customer_phone'].toString(),
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s15,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s12),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: AppPadding.p14),
//                           child: Icon(
//                             Icons.circle,
//                             color: Colormanager.primary,
//                             size: AppSize.s10,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             '${orderlist['area']}, ${orderlist['customer_address']}',
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s8),
//                     if (orderlist['isPartial'] == 1)
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(right: AppPadding.p14),
//                             child: Icon(
//                               Icons.circle,
//                               color: Colormanager.darkblue,
//                               size: AppSize.s10,
//                             ),
//                           ),
//                           Expanded(
//                             child: Text(
//                               'Partially Order',
//                               style: getSemiBoldStyle(
//                                 color: Colormanager.darkGrey,
//                                 fontSize: FontSize.s14,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     const SizedBox(height: AppSize.s8),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: AppPadding.p14),
//                           child: Icon(
//                             Icons.circle,
//                             color: Colormanager.darkblue,
//                             size: AppSize.s10,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             '${orderlist['status']}',
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(right: AppPadding.p14),
//                           child: Icon(
//                             Icons.circle,
//                             color: Colormanager.darkblue,
//                             size: AppSize.s10,
//                           ),
//                         ),
//                         Expanded(
//                           child: Text(
//                             '${orderlist['collect']} TK Collect',
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: AppSize.s18),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Expanded(
//                           child: Text(
//                             orderlist['created_at'].toString(),
//                             style: getSemiBoldStyle(
//                               color: Colormanager.darkGrey,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             color: Colormanager.primaryOpacity70,
//                             borderRadius: BorderRadius.circular(AppSize.s4),
//                           ),
//                           padding: const EdgeInsets.all(AppPadding.p4),
//                           child: Text(
//                             orderlist['type'].toString().toUpperCase() == 'URGENT'
//                                 ? 'EXPRESS'
//                                 : orderlist['type'].toString().toUpperCase(),
//                             style: getSemiBoldStyle(
//                               color: Colormanager.white,
//                               fontSize: FontSize.s14,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     // Divider(
//                     //   height: 20,
//                     //   thickness: 3,
//                     // ),
//                     // Row(
//                     //   mainAxisAlignment: MainAxisAlignment.end,
//                     //   children: [
//                     //     Text(
//                     //       'Order History',
//                     //       style: TextStyle(fontWeight: FontWeight.bold),
//                     //     ),
//                     //     Spacer(),
//                     //     ElevatedButton(
//                     //       style: ElevatedButton.styleFrom(
//                     //         foregroundColor: Colors.white,
//                     //         backgroundColor: Colormanager.d3,
//                     //       ),
//                     //       child: const Icon(Icons.arrow_forward),
//                     //       onPressed: () {
//                     //         // Navigator.push(
//                     //         //   context,
//                     //         //   MaterialPageRoute(
//                     //         //     builder: (context) => OrderTrack(
//                     //         //       order: order,
//                     //         //        order_as_list: confirmedOrderList,
//                     //         //       trackingId: orderlist['tracking_id'].toString(),
//                     //         //       pickupTime: pickupTime, //order['pickup_time'].toString(),
//                     //         //       rider:rider //order['name'].toString(),
//                     //         //     ),
//                     //         //   ),
//                     //         // );
//                     //       },
//                     //     ),
//                     //   ],
//                     // ),
//                   ],
//                 ),
//               ),
//             );
//
//           },
//         ),
//       ),
//     );
//   }
// }





import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_track.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../data/model/confirm_orders_response.dart';

class ConfirmOrderScreen extends StatefulWidget {
  final Order order;
  final Rider rider;
  final PickupTime pickupTime;

  ConfirmOrderScreen(this.order, this.rider, this.pickupTime);

  @override
  _ConfirmOrderScreenState createState() =>
      _ConfirmOrderScreenState(order, rider, pickupTime);
}

class _ConfirmOrderScreenState extends State<ConfirmOrderScreen> {
  List<Map<String, dynamic>> confirmedOrderList = [];
  final Order order;
  final Rider rider;
  final PickupTime pickupTime;

  _ConfirmOrderScreenState(this.order, this.rider, this.pickupTime);

  @override
  void initState() {
    super.initState();
    authenticateAndFetchData();
  }

  Future<void> authenticateAndFetchData() async {
    final token = await authenticateUser();

    if (token != null) {
      await getConfirmOrders(token);
    } else {
      print('Authentication failed');
    }
  }

  Future<String?> authenticateUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');

    // If the token is null, perform login and get the token
    if (token == null) {
      // Replace the following line with your actual login logic
      // token = await performLogin();
      // Save the token to SharedPreferences
      // prefs.setString('token', token);
    }

    return token;
  }

  Future<void> getConfirmOrders(String? token) async {
    try {
      final apiUrl = 'https://system.alhamdulillahcourierservice.com/api/confirm-orders-list';
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: <String, String>{
          'Accept': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        final List<Map<String, dynamic>> orders =
        List.from(data['confirmed_order_list']);
        setState(() {
          confirmedOrderList = orders;
        });
      } else {
        print('Failed to fetch confirm order data: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching confirm order data: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Confirmed Orders'),
        backgroundColor: Colormanager.darkPrimary,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: confirmedOrderList.isEmpty
            ? Center(
          child: Text(
            'Loading',
            style: TextStyle(
              fontSize: FontSize.s16,
              color: Colormanager.darkGrey,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
        //     : ListView.builder(
        //   itemCount: confirmedOrderList.length,
        //   itemBuilder: (context, index) {
        //     final orderlist = confirmedOrderList[index];
        //
        //     return Card(
        //       elevation: AppSize.s10,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(5.0),
        //       ),
        //       child: Padding(
        //         padding: const EdgeInsets.all(15.0),
        //         child: Column(
        //           children: [
        //             // Your card content here
        //           ],
        //         ),
        //       ),
        //     );
        //   },
        // ),
                : ListView.builder(
          itemCount: confirmedOrderList.length,
          itemBuilder: (context, index) {
            final orderlist = confirmedOrderList[index];

            //MAIN CARD

            // return Card(
            //   margin: EdgeInsets.all(8.0),
            //   child: ListTile(
            //     title: Text('Order ID: ${order['tracking_id']}'),
            //     subtitle: Text('Customer Name: ${order['customer_name']}'),
            //     // Add more ListTile properties to display other order details
            //   ),
            // );

            return GestureDetector(
              onTap: (){
                print('clicked');
                Get.to(OrderTrack(order: Order(), pickupTime: PickupTime(), rider: Rider(), order_as_list: [],trackingId:orderlist['tracking_id'].toString(),));
              },
              child: Card(
                elevation: AppSize.s10,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            orderlist['tracking_id'].toString(),
                            style: getBoldStyle(
                              color: Colormanager.black,
                              fontSize: FontSize.s15,
                            ),
                          ),
                          Text(
                            'IV ${orderlist['collection']} TK',
                            style: getBoldStyle(
                              color: Colormanager.black,
                              fontSize: FontSize.s15,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              AppStrings.customer,
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s15,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              AppStrings.mobile,
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              orderlist['customer_name'].toString(),
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s15,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              orderlist['customer_phone'].toString(),
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s15,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p14),
                            child: Icon(
                              Icons.circle,
                              color: Colormanager.primary,
                              size: AppSize.s10,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              // '${orderlist['area']}, ${orderlist['customer_address']}',
                              '${orderlist['customer_address']}',

                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s8),
                      if (orderlist['isPartial'] == 1)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: AppPadding.p14),
                              child: Icon(
                                Icons.circle,
                                color: Colormanager.darkblue,
                                size: AppSize.s10,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Partially Order',
                                style: getSemiBoldStyle(
                                  color: Colormanager.darkGrey,
                                  fontSize: FontSize.s14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      const SizedBox(height: AppSize.s8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p14),
                            child: Icon(
                              Icons.circle,
                              color: Colormanager.darkblue,
                              size: AppSize.s10,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${orderlist['status']}',
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: AppPadding.p14),
                            child: Icon(
                              Icons.circle,
                              color: Colormanager.darkblue,
                              size: AppSize.s10,
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '${orderlist['collect']} TK Collect',
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: AppSize.s18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            // child: Text(
                            //   orderlist['created_at'].toString(),
                            //   style: getSemiBoldStyle(
                            //     color: Colormanager.darkGrey,
                            //     fontSize: FontSize.s14,
                            //   ),
                            // ),
                            child:Text(
                              DateFormat.yMd().add_jm().format(
                                DateTime.parse(orderlist['created_at']),
                              ),
                              style: getSemiBoldStyle(
                                color: Colormanager.darkGrey,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colormanager.primaryOpacity70,
                              borderRadius: BorderRadius.circular(AppSize.s4),
                            ),
                            padding: const EdgeInsets.all(AppPadding.p4),
                            child: Text(
                              orderlist['type'].toString().toUpperCase() == 'URGENT'
                                  ? 'EXPRESS'
                                  : orderlist['type'].toString().toUpperCase(),
                              style: getSemiBoldStyle(
                                color: Colormanager.white,
                                fontSize: FontSize.s14,
                              ),
                            ),
                          ),
                        ],
                      ),
                      // Divider(
                      //   height: 20,
                      //   thickness: 3,
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.end,
                      //   children: [
                      //     Text(
                      //       'Order History',
                      //       style: TextStyle(fontWeight: FontWeight.bold),
                      //     ),
                      //     Spacer(),
                      //     ElevatedButton(
                      //       style: ElevatedButton.styleFrom(
                      //         foregroundColor: Colors.white,
                      //         backgroundColor: Colormanager.d3,
                      //       ),
                      //       child: const Icon(Icons.arrow_forward),
                      //       onPressed: () {
                      //         // Navigator.push(
                      //         //   context,
                      //         //   MaterialPageRoute(
                      //         //     builder: (context) => OrderTrack(
                      //         //       order: order,
                      //         //        order_as_list: confirmedOrderList,
                      //         //       trackingId: orderlist['tracking_id'].toString(),
                      //         //       pickupTime: pickupTime, //order['pickup_time'].toString(),
                      //         //       rider:rider //order['name'].toString(),
                      //         //     ),
                      //         //   ),
                      //         // );
                      //       },
                      //     ),
                      //   ],
                      // ),
                    ],
                  ),
                ),
              ),
            );

          },
        ),


      ),
    );
  }
}

