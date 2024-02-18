import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_track.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/confirm_order.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';

import '../../../../data/model/confirm_orders_response.dart';


class OrderCard extends StatelessWidget {
  final  Order order;
  final  rider;
   final PickupTime pickuptime;




  OrderCard({super.key, required this.order, required this.rider, required this.pickuptime, });




  final ScrollController _scrollController = ScrollController();
 // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isScrolling = false;

  @override
  Widget build(BuildContext context) {
    var response;
    var index;
    return Card(
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
                  order.trackingId.toString(),
                  style: getBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s15),
                ),
                Text(
                  'IV ${order.collection} TK',
                  style: getBoldStyle(
                      color: Colormanager.black, fontSize: FontSize.s15),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    AppStrings.customer,
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    AppStrings.mobile,
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s4,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.customerName.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
                Expanded(
                  child: Text(
                    order.customerPhone.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s15),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s12,
            ),

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
                    // '${order.area}, ${order.customerAddress}',
                    '${order.customerAddress}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s8,
            ),
            if (order.isPartial == 1)
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
                          color: Colormanager.darkGrey, fontSize: FontSize.s14),
                    ),
                  ),
                ],
              ),
            const SizedBox(
              height: AppSize.s8,
            ),
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
                    '${order.status}',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
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
                    '${order.collect} TK Collect',
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: AppSize.s18,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    order.createdAt.toString(),
                    style: getSemiBoldStyle(
                        color: Colormanager.darkGrey, fontSize: FontSize.s14),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colormanager.primaryOpacity70,
                      borderRadius: BorderRadius.circular(AppSize.s4)),
                  padding: const EdgeInsets.all(AppPadding.p4),
                  child: Text(
                    order.type!.toUpperCase() == 'URGENT'
                        ? 'EXPRESS'
                        : order.type!.toUpperCase(),
                    style: getSemiBoldStyle(
                        color: Colormanager.white, fontSize: FontSize.s14),
                  ),






                ),
              ],
            ),

            // Row(
            //   children: [
            //
            //     Text('Tracking'),
            //     ElevatedButton(
            //       style: ElevatedButton.styleFrom(
            //         foregroundColor: Colors.white,
            //         backgroundColor: Colormanager.d3,
            //       ),
            //
            //       onPressed: () {
            //         WidgetsBinding.instance.addPostFrameCallback((_) {
            //         //  final ScrollController scrollController = Get.find<ConfirmOrderView>().scrollController;
            //
            //           if (_scrollController.hasClients && !isScrolling) {
            //             isScrolling = true;
            //
            //             _scrollController.animateTo(
            //               _scrollController.position.maxScrollExtent + 7000, // Adjust the value as needed
            //               duration: const Duration(milliseconds: 5000),
            //               curve: Curves.fastOutSlowIn,
            //             ).whenComplete(() {
            //               isScrolling = false;
            //             });
            //           } else {
            //             // If the button is pressed again, set isScrolling to false
            //             isScrolling = false;
            //           }
            //         });
            //       },
            //       child: const Icon(Icons.arrow_downward),
            //     ),
            //   ],
            // ),

            Divider(height:20,
            thickness:3),


            Row(
              mainAxisAlignment: MainAxisAlignment.end, // Align children to the end (right side)
              children: [
                Text('Order History', style: TextStyle(fontWeight: FontWeight.bold),),
                Spacer(), // Spacer widget to occupy available space
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colormanager.d3,
                  ),
                  child: const Icon(Icons.arrow_forward),
                  // onPressed: () {
                  //   WidgetsBinding.instance.addPostFrameCallback((_) {
                  //     if (_scrollController.hasClients && !isScrolling) {
                  //       isScrolling = true;
                  //
                  //       _scrollController.animateTo(
                  //         _scrollController.position.maxScrollExtent + 7000,
                  //         duration: const Duration(milliseconds: 5000),
                  //         curve: Curves.fastOutSlowIn,
                  //       ).whenComplete(() {
                  //         isScrolling = false;
                  //       });
                  //     } else {
                  //       isScrolling = false;
                  //     }
                  //   });
                  // },
                  onPressed: () {
                  //   Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //       builder: (context) =>OrderTrack(
                  //         order:order,
                  //         trackingId: order.trackingId,
                  //         pickupTime: pickuptime,
                  //         rider: rider,)),//OrderTrack(order: order, rider: rider),),//OrderTrack(trackingId: order.trackingId)),
                  // );
                    },

                  // child: OrderCard(
                  //   order: response[index],
                  // ),



                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}
