
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';

class OrderHistoryView extends StatefulWidget {
  final String? trackingId;


  OrderHistoryView({required this.trackingId});

  @override
  _OrderHistoryViewState createState() => _OrderHistoryViewState();
}

class _OrderHistoryViewState extends State<OrderHistoryView> {
  List<Map<String, dynamic>> orderHistory = [];

  @override
  void initState() {
    super.initState();
    fetchOrderHistory();
  }

  Future<void> fetchOrderHistory() async {
    final apiUrl = "http://system.olectra.com.bd/api/order-view";//"http://system.olectra.com.bd/api/order-view";
    final queryParams = {'tracking_id': widget.trackingId};
    final uri = Uri.parse(apiUrl).replace(queryParameters: queryParams);

    try {

      final response = await http.get(
        uri,
        headers: {
          // 'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5In0.eyJhdWQiOiIxMiIsImp0aSI6Ijk1ZDczMWJmMTUxNmFiMmViYTk0YTYxYWNjYTcyNjU1ZjhhNjcyMWNiZWVhMTFhMjUzNzAxMmNiYzQ1MWQ0OTJmM2FkMjlmNTI1YmNkYzA5IiwiaWF0IjoxNzAxNzczOTU1LCJuYmYiOjE3MDE3NzM5NTUsImV4cCI6MTczMzM5NjM1NSwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.f-2-CvsXW7xE_5eUgZPNdVNLZmTGZwrZTqOd9O2XiQXbk7Ke4H9f7X6-bIVnZJhfgzII7RuQB_GNwXuFt7Z_TKG8XuMqHE8jxL0DVA7Ik2zYIwB_xxE0VypvUdcMg7f0PmXkCXw-f9zCtrY5Sm0a6ZAtITd0Mhy6vhWsxOa1aXzI-HY8_DtbNRvkIkqwDN7CFSz7bPMIuTYxsV45-JGrHK0l61pmlv-4XvKZxWzq8bb3lrIsl6ljC3xshI9LIrWQXyixrA8zgdwOJL5rTnYd4HmPMWogvCv45XPoAiAPPitRGHR-5PMo66nlq5Mb_yxhogHzIu91B74DiYGXMGzwPSEDdsntQ8K5PrJQZbpq_8Bm9clijTg77IDvjxa6oWS_yy3GCpxDmKi-q4f6TadxKfAh_edgJ0EkKSGcnAP401EnbDD2ouewbEPVzOhbch638pvv9jXtt1DXAm0YqFC5lhK8X0ob2ar93C7wzW8WNPGj3sniIqq0fehn9lRC0zJgl_SVS0yetBY4CPX93Bch71_a3vNAdyKW7JxMURhPmI6QR2PcaV1GTiZLBbjRQ91kJtOEv5E7wefn-ctZGLSAlLoLxdSzyA72_dn0vudpNFa4toOoAC5ecw6GgYlByXplXKUCjYEykz47g0B_HMlDH1XYZ91gnHePsthaRpBzPIY',
          'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjE0NjI3YmFmODZkOWMxODJiNjIxYzIzYzc3MjA1NzljNzE4OWRlYmJlMDQ1M2Q2NjhhZGViZGI1ZGYwY2I4N2QxYWQ2NDFhMGRjY2FkODI0In0.eyJhdWQiOiIxMiIsImp0aSI6IjE0NjI3YmFmODZkOWMxODJiNjIxYzIzYzc3MjA1NzljNzE4OWRlYmJlMDQ1M2Q2NjhhZGViZGI1ZGYwY2I4N2QxYWQ2NDFhMGRjY2FkODI0IiwiaWF0IjoxNzA0MzYxOTI2LCJuYmYiOjE3MDQzNjE5MjYsImV4cCI6MTczNTk4NDMyNiwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.ZssKsX8XyIy-3a6xUx0kmHmFBXabEkM5Eb20986gRHwYz8eNZwvBL-cpEzoXnJ033vPJBad09iwABhL2W0gKUDczlnSaeKpuzkwJX_8QG3WmKbkQV0tsOo4ONnfaoeEO4WEvLEkteFQbMO3vgvi4IUx6Hi7PBUjIKyzwdKTH14xlvtPtDl1lFd8a6AAMScAZ-0w1V1zeUNurpjFgU7v8xRzZ2sEeb3c-4igYjqe_knifAn4NKaBBm3WKE6FClSpK89mWjI6OoziyHQk7-j5ueevIyj5pZzCEymHHlEkgcEspUIeAALS3gAKgjzo8VsUGWOsBmsCO476o9pFql4HR9hPyKfYmuNP4Ii_9FsJK-aNib6aQNTdK_ZFRHPE0M6QFqwztVYzy3rtHQaPhyzNj7MQdi4fnyJiIUEY1ORwiHcf6i8dyS_UA4wb_Of2VzHMGFNPfGDsveEY2w0T5M7UYtMCwxhvfwzXt0m-aJYPgYZ681129Ap5HpPYtYND8uqPVrSFZsTDhZHEDRImNpY21yDvpDkOI1ba3XHturpOxBMNP_l65tHPHuRVZ2uBP_h5vkf83R_aY5217Cn7a3Y3swGExSUDYgqG3icsgoOtTnwSJd3E6JImnbnlNyCQgSyEiWNN3aZWYNfJnfD1BdtoJvwvVSoWvgJbFz-vujM4nUDQ',

          'Accept': 'application/json'},
      );
      print("API Response: ${response.body}");

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
      appBar: AppBar(
        title: Text("Order History"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Order History for Tracking ID: ${widget.trackingId}",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            SizedBox(height: 20),
            if (orderHistory.isNotEmpty)
              Column(
                children: orderHistory.map((history) {
                  return Card(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Status: ${history['status']}"),
                          Text("Date: ${history['date']}"),
                          Text("Name: ${history['name']}"),
                          Text("Mobile: ${history['mobile']}"),
                        ],
                      ),
                    ),
                  );
                }).toList(),
              )
            else
              Text("No order history available."),
          ],
        ),
      ),
    );
  }
}

