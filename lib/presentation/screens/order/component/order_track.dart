//
//
//
//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
//
// import '../../../../data/model/confirm_orders_response.dart';
//
// class OrderTrack extends StatefulWidget {
//   const OrderTrack({Key? key, required this.order, required this.rider, required this.pickupTime, this.trackingId}) : super(key: key);
//
//   final Order order;
//   final Rider rider;
//   final PickupTime pickupTime;
//   final String? trackingId;
//
//   @override
//   State<OrderTrack> createState() => _OrderTrackState();
// }
//
// class _OrderTrackState extends State<OrderTrack> {
//
//   List<Map<String, dynamic>> orderHistory = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchOrderHistory();
//   }
//
//   Future<void> fetchOrderHistory() async {
//     final apiUrl = "http://system.olectra.com.bd/api/order-view";//"http://system.olectra.com.bd/api/order-view";
//     final queryParams = {'tracking_id': widget.trackingId};
//     final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
//
//     try {
//
//       final response = await http.get(
//         uri,
//         headers: {
//           'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5In0.eyJhdWQiOiIxMiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5IiwiaWF0IjoxNzAxNzczOTU1LCJuYmYiOjE3MDE3NzM5NTUsImV4cCI6MTczMzM5NjM1NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.f-2-CvsXW7xE_5eUgZPNdVNLZmTGZwrZTqOd9O2XiQXbk7Ke4H9f7X6-bIVnZJhfgzII7RuQB_GNwXuFt7Z_TKG8XuMqHE8jxL0DVA7Ik2zYIwB_xxE0VypvUdcMg7f0PmXkCXw-f9zCtrY5Sm0a6ZAtITd0Mhy6vhWsxOa1aXzI-HY8_DtbNRvkIkqwDN7CFSz7bPMIuTYxsV45-JGrHK0l61pmlv-4XvKZxWzq8bb3lrIsl6ljC3xshI9LIrWQXyixrA8zgdwOJL5rTnYd4HmPMWogvCv45XPoAiAPPitRGHR-5PMo66nlq5Mb_yxhogHzIu91B74DiYGXMGzwPSEDdsntQ8K5PrJQZbpq_8Bm9clijTg77IDvjxa6oWS_yy3GCpxDmKi-q4f6TadxKfAh_edgJ0EkKSGcnAP401EnbDD2ouewbEPVzOhbch638pvv9jXtt1DXAm0YqFC5lhK8X0ob2ar93C7wzW8WNPGj3sniIqq0fehn9lRC0zJgl_SVS0yetBY4CPX93Bch71_a3vNAdyKW7JxMURhPmI6QR2PcaV1GTiZLBbjRQ91kJtOEv5E7wefn-ctZGLSAlLoLxdSzyA72_dn0vudpNFa4toOoAC5ecw6GgYlByXplXKUCjYEykz47g0B_HMlDH1XYZ91gnHePsthaRpBzPIY',
//           'Accept': 'application/json'},
//       );
//       print("API Response: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final apiData = json.decode(response.body);
//         final List<dynamic> orderHistoryData = apiData["order_history"];
//
//
//         setState(() {
//           orderHistory = List<Map<String, dynamic>>.from(orderHistoryData);
//
//
//         });
//
//       } else {
//         print("Failed to fetch order history. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error during HTTP request: $error");
//     }
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0, top: 5),
//             child: Column(
//               children: [
//                 Card(
//                   color: Colormanager.d3,
//                   elevation:3,
//                   shadowColor: Colormanager.d3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(23.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.7),
//                           child: Center(child: Text('Tracking ID: ${widget.order.trackingId}', style: TextStyle(fontWeight: FontWeight.bold, color: Colormanager.white, fontSize:18))),
//                         ),
//                         OrderDetailRow(label: 'Customer\'s Name', value: '${widget.order.customerName}'),
//                         //OrderDetailRow(label: 'Tracking ID', value: '${order.trackingId}'),
//                         OrderDetailRow(label: 'Customer\'s Contact', value: '${widget.order.customerPhone}'),
//                         OrderDetailRow(label: 'Customer\'s address', value: '${widget.order.customerAddress}'),
//
//                         // Add more key-value pairs as needed...
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 10),
//
//                 Padding(
//                   padding: const EdgeInsets.all(2.0),
//                   child: Column(
//                     children: [
//                        Container(color: Colors.transparent,
//                        height: MediaQuery.of(context).size.height/1.5,
//                        width: MediaQuery.of(context).size.height/2,
//
//                    child:   Padding(
//                         padding: const EdgeInsets.all(16.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Text(
//                             //   "Order History for Tracking ID: ${widget.trackingId}",
//                             //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                             // ),
//                             // SizedBox(height: 10),
//                             if (orderHistory.isNotEmpty)
//                               Column(
//                                 children: orderHistory.map((history) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: Row(
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             // Text("Status: ${history['status']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//
//                                             Text("Date: ${history['date']}", style: TextStyle(fontSize: 10, color: Colors.black),),
//
//
//                                             // Text("Name: ${history['name']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//
//                                         // SizedBox(width: 10),
//
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(right:3.0),
//                                               child: Column(
//                                                 children: [
//                                                   Container(
//
//
//                                                       child: CircleAvatar(
//                                                         radius: 8,
//                                                         backgroundColor: Colormanager.d3,
//                                                       ),
//
//
//                                                     // height: MediaQuery.of(context).size.height/10,
//                                                   ),
//                                                   Container(
//                                                     width: 3,
//                                                     height: MediaQuery.of(context).size.height /20,
//                                                     color: Colormanager.d3,
//                                                   ),
//
//                                                   // Dotted line below CircleAvatar
//                                                   // Container(
//                                                   //   width: 2,
//                                                   //   height: MediaQuery.of(context).size.height / 10,
//                                                   //   child: CustomPaint(
//                                                   //     painter: DashedLinePainter(
//                                                   //       color: Colors.white,
//                                                   //       strokeWidth: 2,
//                                                   //       dashWidth: 5,
//                                                   //       dashSpace: 3,
//                                                   //     ),
//                                                   //   ),
//                                                   // ),
//
//
//                                                 ],
//                                               ),
//                                             )
//                                             // Text("Status: ${history['status']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Date: ${history['date']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Name: ${history['name']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//
//
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text("${history['status']}", style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
//                                             // Text("Date: ${history['date']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             Text("${history['name']}", style: TextStyle(fontSize:8, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList(),
//                               )
//                             else
//                               Text("No order history available."),
//                           ],
//                         ),
//                       ),
//                        ),
//
//                     ],
//
//                   ),
//                 ),
//
//
//
//
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
//
//
// class OrderDetailRow extends StatelessWidget {
//   final String label;
//   final String value;
//
//   const OrderDetailRow({Key? key, required this.label, required this.value}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical:3.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('$label:', style: TextStyle(fontWeight: FontWeight.bold, color: Colormanager.white)),
//           Text(value, style: TextStyle(fontWeight: FontWeight.w400, color: Colormanager.white)),
//         ],
//       ),
//     );
//   }
// }
//
// class DashedLinePainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final double dashWidth;
//   final double dashSpace;
//
//   DashedLinePainter({
//     required this.color,
//     required this.strokeWidth,
//     required this.dashWidth,
//     required this.dashSpace,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke;
//
//     double startX = 0;
//     while (startX < size.width) {
//       canvas.drawLine(
//         Offset(startX, 0),
//         Offset(startX + dashWidth, 0),
//         paint,
//       );
//       startX += dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
// }





//Implementing Scroll and search bar


//
// import 'package:flutter/material.dart';
// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
//
// import '../../../../data/model/confirm_orders_response.dart';
//
// class OrderTrack extends StatefulWidget {
//   // const OrderTrack({Key? key, required this.order, required this.rider, required this.pickupTime, this.trackingId}) : super(key: key);
//   const OrderTrack({
//     Key? key,
//     required this.order,
//     required this.rider,
//     required this.pickupTime,
//     required this.trackingId,
//   }) : super(key: key);
//
//   final Order order;
//   final Rider rider;
//   final PickupTime pickupTime;
//   final String? trackingId;
//
//   @override
//   State<OrderTrack> createState() => _OrderTrackState();
// }
//
// class _OrderTrackState extends State<OrderTrack> {
//
//   List<Map<String, dynamic>> orderHistory = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchOrderHistory();
//   }
//
//   Future<void> fetchOrderHistory() async {
//     final apiUrl = "http://system.olectra.com.bd/api/order-view";//"http://system.olectra.com.bd/api/order-view";
//     final queryParams = {'tracking_id': widget.trackingId};
//     final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);
//
//     try {
//
//       final response = await http.get(
//         uri,
//         headers: {
//           // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5In0.eyJhdWQiOiIxMiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5IiwiaWF0IjoxNzAxNzczOTU1LCJuYmYiOjE3MDE3NzM5NTUsImV4cCI6MTczMzM5NjM1NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.f-2-CvsXW7xE_5eUgZPNdVNLZmTGZwrZTqOd9O2XiQXbk7Ke4H9f7X6-bIVnZJhfgzII7RuQB_GNwXuFt7Z_TKG8XuMqHE8jxL0DVA7Ik2zYIwB_xxE0VypvUdcMg7f0PmXkCXw-f9zCtrY5Sm0a6ZAtITd0Mhy6vhWsxOa1aXzI-HY8_DtbNRvkIkqwDN7CFSz7bPMIuTYxsV45-JGrHK0l61pmlv-4XvKZxWzq8bb3lrIsl6ljC3xshI9LIrWQXyixrA8zgdwOJL5rTnYd4HmPMWogvCv45XPoAiAPPitRGHR-5PMo66nlq5Mb_yxhogHzIu91B74DiYGXMGzwPSEDdsntQ8K5PrJQZbpq_8Bm9clijTg77IDvjxa6oWS_yy3GCpxDmKi-q4f6TadxKfAh_edgJ0EkKSGcnAP401EnbDD2ouewbEPVzOhbch638pvv9jXtt1DXAm0YqFC5lhK8X0ob2ar93C7wzW8WNPGj3sniIqq0fehn9lRC0zJgl_SVS0yetBY4CPX93Bch71_a3vNAdyKW7JxMURhPmI6QR2PcaV1GTiZLBbjRQ91kJtOEv5E7wefn-ctZGLSAlLoLxdSzyA72_dn0vudpNFa4toOoAC5ecw6GgYlByXplXKUCjYEykz47g0B_HMlDH1XYZ91gnHePsthaRpBzPIY',
//           'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1In0.eyJhdWQiOiIxMiIsImp0aSI6IjQ4ZjVhYWFjN2VkMzc1NGI3MmJjMTZjYTJmMmJlY2Q2NGQ1MzhkYThhNGZhYmE4YzMwOWFiNWY4MmUzMzEwNDBkNmQ1ZGNiOTlmODgzZTI1IiwiaWF0IjoxNzA0MzQ5NDk5LCJuYmYiOjE3MDQzNDk0OTksImV4cCI6MTczNTk3MTg5OSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.HNTEVpYMooRjxIY10MIWCljG_JuhiLcGfhQghVPnfWdN6FqYOH7AIziqiewtEqg16ZQD4SQQZPXQ0A-4Cs5k6BKku2u1KQ0wL2IVq_k_gGCr2S7svx7iII--BGTw5fbxvLd3YB2-ochNqsb8uA2gd1Ocf6VhThtM8216j0Qa0kYx4ZGAvHsEYaia44gXd93H7mpyoptM7xdHOVXAiFm0kxjU0Hs-xchT0jULGtFFgTuwo2nharMPGO9KJ8plAvrQ8BHtmWVwn39nN6TEVg-fp6dmjDaJRaDyGowhjJUL6jhrfAiKUg4DnWZSCdVoIA0ksTb-t16TMqPo3YpHcOZ2CXfxBKtZvq4sbjcGmP_IwbBR0We-2xoXyVPU3vEjImiJls6cOMCnbKkVp2wcrhHNHMclWPX8cmIn0JlPkyYpKFcfkd_hBNt7rmVDBCZF1pCn8moP9u1Whor0VVyyRQzbTViPciFmjaqMVuPPQBe3uy19NI-lUKJJDqNm1YPe-lSBlrgOyP4OJ8FLR92AUSoAO3zwjfizujtIh42hcx8epvCcU3_D4J4NcunrNhYiV_V0UbuN73z4hDHeZhmWmXS3VyrA8lPj9EQWaQE7x8xLIqXAG9aIv50aeVsMTBID-akKC5IT8J3e-J1PNSgaVw92sLwhbWiB4WbfpqoaYGj8m0M',
//
//           'Accept': 'application/json'},
//       );
//       print("API Response order track: ${response.body}");
//
//       if (response.statusCode == 200) {
//         final apiData = json.decode(response.body);
//         final List<dynamic> orderHistoryData = apiData["order_history"];
//
//
//         setState(() {
//           orderHistory = List<Map<String, dynamic>>.from(orderHistoryData);
//
//
//         });
//
//       } else {
//         print("Failed to fetch order history. Status code: ${response.statusCode}");
//       }
//     } catch (error) {
//       print("Error during HTTP request: $error");
//     }
//   }
//
//
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(bottom: 8.0, top: 5),
//             child: Column(
//               children: [
//                 Card(
//                   color: Colormanager.d3,
//                   elevation:3,
//                   shadowColor: Colormanager.d3,
//                   child: Padding(
//                     padding: const EdgeInsets.all(23.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.only(top: 15.7),
//                           child: Center(child: Text('Tracking ID: ${widget.order.trackingId}', style: TextStyle(fontWeight: FontWeight.bold, color: Colormanager.white, fontSize:18))),
//                         ),
//                         OrderDetailRow(label: 'Customer\'s Name', value: '${widget.order.customerName}'),
//                         //OrderDetailRow(label: 'Tracking ID', value: '${order.trackingId}'),
//                         OrderDetailRow(label: 'Customer\'s Contact', value: '${widget.order.customerPhone}'),
//                         OrderDetailRow(label: 'Customer\'s address', value: '${widget.order.customerAddress}'),
//
//                         // Add more key-value pairs as needed...
//                       ],
//                     ),
//                   ),
//                 ),
//
//                 SizedBox(height: 10),
//
//                 Column(
//                   children: [
//                      Container(color: Colors.transparent,
//                      height: MediaQuery.of(context).size.height/1.5,
//                      width: MediaQuery.of(context).size.height/2,
//
//                  child:   Padding(
//                       padding: const EdgeInsets.all(16.0),
//                       child: SingleChildScrollView(
//                         scrollDirection: Axis.vertical,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             // Text(
//                             //   "Order History for Tracking ID: ${widget.trackingId}",
//                             //   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
//                             // ),
//                             // SizedBox(height: 10),
//                             if (orderHistory.isNotEmpty)
//                               Column(
//                                 children: orderHistory.map((history) {
//                                   return Padding(
//                                     padding: const EdgeInsets.all(3.0),
//                                     child: Row(
//                                       children: [
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             // Text("Status: ${history['status']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//
//                                             Text("Date: ${history['date']}", style: TextStyle(fontSize: 10, color: Colors.black),),
//
//
//                                             // Text("Name: ${history['name']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//
//                                         // SizedBox(width: 10),
//
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Padding(
//                                               padding: const EdgeInsets.only(right:3.0),
//                                               child: Column(
//                                                 children: [
//                                                   Container(
//
//
//                                                       child: CircleAvatar(
//                                                         radius: 8,
//                                                         backgroundColor: Colormanager.d3,
//                                                       ),
//
//
//                                                     // height: MediaQuery.of(context).size.height/10,
//                                                   ),
//                                                   Container(
//                                                     width: 3,
//                                                     height: MediaQuery.of(context).size.height /20,
//                                                     color: Colormanager.d3,
//                                                   ),
//
//                                                   // Dotted line below CircleAvatar
//                                                   // Container(
//                                                   //   width: 2,
//                                                   //   height: MediaQuery.of(context).size.height / 10,
//                                                   //   child: CustomPaint(
//                                                   //     painter: DashedLinePainter(
//                                                   //       color: Colors.white,
//                                                   //       strokeWidth: 2,
//                                                   //       dashWidth: 5,
//                                                   //       dashSpace: 3,
//                                                   //     ),
//                                                   //   ),
//                                                   // ),
//
//
//                                                 ],
//                                               ),
//                                             )
//                                             // Text("Status: ${history['status']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Date: ${history['date']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Name: ${history['name']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//
//
//                                         Column(
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text("${history['status']}", style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
//                                             // Text("Date: ${history['date']}", style: TextStyle(fontSize: 4, color: Colors.black),),
//                                             Text("${history['name']}", style: TextStyle(fontSize:8, color: Colors.black),),
//                                             // Text("Mobile: ${history['mobile']}",style: TextStyle(fontSize: 4, color: Colors.black),),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   );
//                                 }).toList(),
//                               )
//                             else
//                               Text("No order history available."),
//                           ],
//                         ),
//                       ),
//                     ),
//                      ),
//
//                   ],
//
//                 ),
//
//
//
//
//               ],
//             ),
//           ),
//
//         ],
//       ),
//     );
//   }
// }
//
//
//
//
//
// class OrderDetailRow extends StatelessWidget {
//   final String label;
//   final String value;
//
//   const OrderDetailRow({Key? key, required this.label, required this.value}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical:3.0),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text('$label:', style: TextStyle(fontWeight: FontWeight.bold, color: Colormanager.white)),
//           Text(value, style: TextStyle(fontWeight: FontWeight.w400, color: Colormanager.white)),
//         ],
//       ),
//     );
//   }
// }
//
// class DashedLinePainter extends CustomPainter {
//   final Color color;
//   final double strokeWidth;
//   final double dashWidth;
//   final double dashSpace;
//
//   DashedLinePainter({
//     required this.color,
//     required this.strokeWidth,
//     required this.dashWidth,
//     required this.dashSpace,
//   });
//
//   @override
//   void paint(Canvas canvas, Size size) {
//     Paint paint = Paint()
//       ..color = color
//       ..strokeWidth = strokeWidth
//       ..style = PaintingStyle.stroke;
//
//     double startX = 0;
//     while (startX < size.width) {
//       canvas.drawLine(
//         Offset(startX, 0),
//         Offset(startX + dashWidth, 0),
//         paint,
//       );
//       startX += dashWidth + dashSpace;
//     }
//   }
//
//   @override
//   bool shouldRepaint(CustomPainter oldDelegate) {
//     return false;
//   }
 //}






import 'package:alhamdulillah_courier_service_merchant/data/local/storage_healper.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';

import '../../../../data/model/confirm_orders_response.dart';

class OrderTrack extends StatefulWidget {

  // const OrderTrack({
  //   Key? key,
  // required this.order, required this.rider, required this.pickupTime, this.trackingId, required this.order_as_list,
  // }) : super(key: key);
  //
  //
  //
  // final Order order;
  // final Rider rider;
  // final PickupTime pickupTime;
  // final String? trackingId;
  // final List<Map<String, dynamic>> order_as_list;

  const OrderTrack({
    Key? key,
    required this.order,
    required this.rider,
    required this.pickupTime,
    this.trackingId,
    required this.order_as_list,
  }) : super(key: key);

  final Order order;
  final Rider rider;
  final PickupTime pickupTime;
  final String? trackingId;
  final List<Map<String, dynamic>> order_as_list;


  @override
  State<OrderTrack> createState() => _OrderTrackState();
}

class _OrderTrackState extends State<OrderTrack> {
  List<Map<String, dynamic>> orderHistory = [];

  @override
  void initState() {
    super.initState();
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    final apiUrl = "https://system.alhamdulillahcourierservice.com/api/order-view";
    final queryParams = {'tracking_id': widget.trackingId};
    // final queryParams = {'tracking_id': int.parse(widget.order_as_list['tracking_id']!.toString())};


    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    try {
      final response = await http.get(
        uri,
        headers: {
          // 'Authorization': 'YourAuthorizationTokenHere',
          'Authorization': 'Bearer ${StorageHelper.getString(key: 'token')}', // Retrieve token from StorageHelper

      'Accept': 'application/json',
        },
      );
      print("API Response order track: ${response.body}");

      if (response.statusCode == 200) {
        final apiData = json.decode(response.body);
        final List<dynamic> orderHistoryData = apiData["order_history"];

        setState(() {
          orderHistory = List<Map<String, dynamic>>.from(orderHistoryData);
        });
      } else {
        print("Failed to fetch order history. Status code: ${response.statusCode}");
      }
    } catch (error) {
      print("Error during HTTP request: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0, top: 5),
            child: Column(
              children: [
                Card(
                  color: Colormanager.d3,
                  elevation: 3,
                  shadowColor: Colormanager.d3,
                  child: Padding(
                    padding: const EdgeInsets.all(23.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 15.7),
                          child: Center(
                            child: Text(
                              // 'Tracking ID: ${widget.order.trackingId}',
                              'Tracking ID: ${widget.order.trackingId}',

                              // 'Tracking ID: OE7702401145860',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colormanager.white,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        OrderDetailRow(label: 'Customer\'s Name', value: '${widget.order.customerName}'),
                        OrderDetailRow(label: 'Customer\'s Contact', value: '${widget.order.customerPhone}'),
                        OrderDetailRow(label: 'Customer\'s address', value: '${widget.order.customerAddress}'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Container(
                      color: Colors.transparent,
                      height: MediaQuery.of(context).size.height / 1.5,
                      width: MediaQuery.of(context).size.height / 2,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (orderHistory.isNotEmpty)
                                Column(
                                  children: orderHistory.map((history) {
                                    return Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("Date: ${history['date']}", style: TextStyle(fontSize: 10, color: Colors.black),),
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: const EdgeInsets.only(right: 3.0),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      child: CircleAvatar(
                                                        radius: 8,
                                                        backgroundColor: Colormanager.d3,
                                                      ),
                                                    ),
                                                    Container(
                                                      width: 3,
                                                      height: MediaQuery.of(context).size.height / 20,
                                                      color: Colormanager.d3,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text("${history['status']}", style: TextStyle(fontSize: 10, color: Colors.black, fontWeight: FontWeight.bold),),
                                              Text("${history['name']}", style: TextStyle(fontSize: 8, color: Colors.black),),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList(),
                                )
                              else
                                Text("No order history available."),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OrderDetailRow extends StatelessWidget {
  final String label;
  final String value;

  const OrderDetailRow({Key? key, required this.label, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('$label:', style: TextStyle(fontWeight: FontWeight.bold, color: Colormanager.white)),
          Text(value, style: TextStyle(fontWeight: FontWeight.w400, color: Colormanager.white)),
        ],
      ),
    );
  }
}
