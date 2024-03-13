// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_card.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
//
// class ConfirmOrderView extends GetView<OrderController> {
//   const ConfirmOrderView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const ConfirmOrderHeader(),
//             const SizedBox(
//               height: AppSize.s10,
//             ),
//             Expanded(
//                 child: RefreshIndicator(
//               onRefresh: () async {
//                 await controller.getConfirmOrders();
//               },
//               child: Obx(
//                 () => Get.find<InternetcheckerController>()
//                             .connectionStatus
//                             .value ==
//                         1
//                     ? controller.obx(
//                         (response) => response!.isEmpty
//                             ? EmptyFailureNoInternetView(
//                                 image: ImageAssets.noData,
//                                 title: AppStrings.noData,
//                                 description: AppStrings.noDataMsg,
//                                 buttonText: AppStrings.retry,
//                                 onPressed: () {
//                                   controller.getConfirmOrders();
//                                 },
//                               )
//                             : ListView.builder(
//                                 shrinkWrap: true,
//                                 itemBuilder: (context, index) => OrderCard(
//                                   order: response[index],
//                                 ),
//                                 itemCount: response.length,
//                               ),
//                         onEmpty: EmptyFailureNoInternetView(
//                           image: ImageAssets.noData,
//                           title: AppStrings.noData,
//                           description: AppStrings.noDataMsg,
//                           buttonText: AppStrings.retry,
//                           onPressed: () {
//                             controller.getConfirmOrders();
//                           },
//                         ),
//                         onLoading: const DataLoader(),
//                         onError: (error) => SingleChildScrollView(
//                           physics: const BouncingScrollPhysics(
//                               parent: AlwaysScrollableScrollPhysics()),
//                           child: EmptyFailureNoInternetView(
//                             image: ImageAssets.noData,
//                             title: AppStrings.error,
//                             description: error.toString(),
//                             buttonText: AppStrings.retry,
//                             onPressed: () {
//                               controller.getConfirmOrders();
//                             },
//                           ),
//                         ),
//                       )
//                     : SingleChildScrollView(
//                         physics: const BouncingScrollPhysics(
//                             parent: AlwaysScrollableScrollPhysics()),
//                         child: EmptyFailureNoInternetView(
//                           image: ImageAssets.noInternet,
//                           title: AppStrings.noInternet,
//                           description: AppStrings.checkConnection,
//                           buttonText: AppStrings.retry,
//                           onPressed: () {
//                             controller.getConfirmOrders();
//                           },
//                         ),
//                       ),
//               ),
//             )),
//           ],
//         ),
//       ),
//     );
//   }
// }






///// .................MAIN CODE .................................................



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_card.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
//
// class ConfirmOrderView extends GetView<OrderController> {
//   const ConfirmOrderView({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             const ConfirmOrderHeader(),
//             const SizedBox(
//               height: AppSize.s10,
//             ),
//             Expanded(
//               child: RefreshIndicator(
//                 onRefresh: () async {
//                   await controller.getConfirmOrders();
//                 },
//                 child: Obx(
//                       () => Get.find<InternetcheckerController>()
//                       .connectionStatus
//                       .value ==
//                       1
//                       ? controller.obx(
//                         (response) => response!.isEmpty
//                         ? EmptyFailureNoInternetView(
//                       image: ImageAssets.noData,
//                       title: AppStrings.noData,
//                       description: AppStrings.noDataMsg,
//                       buttonText: AppStrings.retry,
//                       onPressed: () {
//                         controller.getConfirmOrders();
//                       },
//                     )
//                         : ListView.builder(
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) => OrderCard(
//                         order: response[index],
//                       ),
//
//                       itemCount: response.length,
//                     ),
//                     onEmpty: EmptyFailureNoInternetView(
//                       image: ImageAssets.noData,
//                       title: AppStrings.noData,
//                       description: AppStrings.noDataMsg,
//                       buttonText: AppStrings.retry,
//                       onPressed: () {
//                         controller.getConfirmOrders();
//                       },
//                     ),
//                     onLoading: const DataLoader(),
//                     onError: (error) => SingleChildScrollView(
//                       physics: const BouncingScrollPhysics(
//                           parent: AlwaysScrollableScrollPhysics()),
//                       child: EmptyFailureNoInternetView(
//                         image: ImageAssets.noData,
//                         title: AppStrings.error,
//                         description: error.toString(),
//                         buttonText: AppStrings.retry,
//                         onPressed: () {
//                           controller.getConfirmOrders();
//                         },
//                       ),
//                     ),
//                   )
//                       : SingleChildScrollView(
//                     physics: const BouncingScrollPhysics(
//                         parent: AlwaysScrollableScrollPhysics()),
//                     child: EmptyFailureNoInternetView(
//                       image: ImageAssets.noInternet,
//                       title: AppStrings.noInternet,
//                       description: AppStrings.checkConnection,
//                       buttonText: AppStrings.retry,
//                       onPressed: () {
//                         controller.getConfirmOrders();
//                       },
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




// .............MY Added Code //////////////////////////////////

//............MAIN CODE.................
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
// import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_card.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
//
// class ConfirmOrderView extends GetView<OrderController> {
//   final Order order;
//   final Rider rider;
//   final PickupTime pickupTime;
//
//
//   ConfirmOrderView(this.order, this.rider, this.pickupTime, {super.key});
//
//   final ScrollController _scrollController = ScrollController();
//   final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
//
//   // final ScrollController scrollController;
//   bool isScrolling = false;
//
//   @override
//   Widget build(BuildContext context) {
//
//     final ButtonStyle style =
//     ElevatedButton.styleFrom( );
//
//     return Scaffold(
//       key: _scaffoldKey,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           physics: const AlwaysScrollableScrollPhysics(),
//           child: Column(
//             children: [
//               const ConfirmOrderHeader(),
//               const SizedBox(
//                 height: AppSize.s10,
//               ),
//               LayoutBuilder(
//                 builder: (BuildContext context, BoxConstraints constraints) {
//                 return Expanded(
//                   child: Column(
//                     children: [
//                       RefreshIndicator(
//                         onRefresh: () async {
//                           await controller.getConfirmOrders();
//                         },
//                         child: Obx(
//                               () => Get.find<InternetcheckerController>().connectionStatus.value == 1
//                               ? controller.obx(
//                                 (response) => response!.isEmpty
//                                 ? EmptyFailureNoInternetView(
//                               image: ImageAssets.noData,
//                               title: AppStrings.noData,
//                               description: AppStrings.noDataMsg,
//                               buttonText: AppStrings.retry,
//                               onPressed: () {
//                                 controller.getConfirmOrders();
//                               },
//                             )
//                                 : ListView.builder(
//                               shrinkWrap: true,
//                               itemBuilder: (context, index) => OrderCard(
//                                 order: response[index], pickuptime: pickupTime, rider: rider,
//
//                               ),
//                               itemCount: 4,//response.length,
//
//
//
//
//                             ),
//                             onEmpty: EmptyFailureNoInternetView(
//                               image: ImageAssets.noData,
//                               title: AppStrings.noData,
//                               description: AppStrings.noDataMsg,
//                               buttonText: AppStrings.retry,
//                               onPressed: () {
//                                 controller.getConfirmOrders();
//                               },
//                             ),
//                             onLoading: const DataLoader(),
//                             onError: (error) => SingleChildScrollView(
//                               physics: const BouncingScrollPhysics(
//                                   parent: AlwaysScrollableScrollPhysics()),
//                               child: EmptyFailureNoInternetView(
//                                 image: ImageAssets.noData,
//                                 title: AppStrings.error,
//                                 description: error.toString(),
//                                 buttonText: AppStrings.retry,
//                                 onPressed: () {
//                                   controller.getConfirmOrders();
//                                 },
//                               ),
//                             ),
//                           )
//                               : SingleChildScrollView(
//                             physics: const BouncingScrollPhysics(
//                                 parent: AlwaysScrollableScrollPhysics()),
//                             child: EmptyFailureNoInternetView(
//                               image: ImageAssets.noInternet,
//                               title: AppStrings.noInternet,
//                               description: AppStrings.checkConnection,
//                               buttonText: AppStrings.retry,
//                               onPressed: () {
//                                 controller.getConfirmOrders();
//                               },
//                             ),
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 20),
//
//
//
//
//
//                     ],
//                   ),
//                 );
//                 }
//               ),
//             ],
//           ),
//         ),
//       ),
//       // floatingActionButton: FloatingActionButton(
//       //   onPressed: () {
//       //     WidgetsBinding.instance.addPostFrameCallback((_) {
//       //       if (_scrollController.hasClients) {
//       //         _scrollController.animateTo(
//       //           _scrollController.position.maxScrollExtent,
//       //           duration: const Duration(milliseconds: 500),
//       //           curve: Curves.fastOutSlowIn,
//       //         );
//       //       }
//       //     });
//       //   },
//       //   child: const Icon(Icons.arrow_downward),
//       // ),
//
//     );
//   }
// }
//
//
//
//



//
//
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_track.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/internetchecker_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/controller/order_controller.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/no_internet/internetchecker_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/data_loader.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_header.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/order_card.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/assets_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';


class ConfirmOrderView extends GetView<OrderController> {
  final Order order;
  final Rider rider;
  final PickupTime pickupTime;

  ConfirmOrderView(this.order, this.rider, this.pickupTime, {super.key});

  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isScrolling = false;

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom();

    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Column(
          children: [
            const ConfirmOrderHeader(),
            const SizedBox(
              height: AppSize.s10,
            ),
            Expanded(
              child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
                  return RefreshIndicator(
                    onRefresh: () async {
                      await controller.getConfirmOrders();
                    },
                    child: Obx(
                          () => Get.find<InternetcheckerController>().connectionStatus.value == 1
                          ? controller.obx(
                            (response) => response!.isEmpty ? Text("Loading")
                        //     ? EmptyFailureNoInternetView(
                        //   image: ImageAssets.noData,
                        //   title: AppStrings.noData,
                        //   description: AppStrings.noDataMsg,
                        //   buttonText: AppStrings.retry,
                        //   onPressed: () {
                        //     controller.getConfirmOrders();
                        //   },
                        //
                        // )
                            : ListView.builder(
                          shrinkWrap: true,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: (){
                              print('clicked');
                              // OrderTrack(order: Order(), pickupTime: PickupTime(), rider: Rider(), order_as_list: [],trackingId:trackingId,);
                            },
                            child: OrderCard(
                              order: response[index],

                              rider: rider, pickuptime: pickupTime,
                            ),
                          ),

                          itemCount: response.length,
                        ),
                        onEmpty: EmptyFailureNoInternetView(
                          image: ImageAssets.noData,
                          title: AppStrings.noData,
                          description: AppStrings.noDataMsg,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getConfirmOrders();
                          },
                        ),
                        onLoading: const DataLoader(),
                        onError: (error) => SingleChildScrollView(
                          physics: const BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: EmptyFailureNoInternetView(
                            image: ImageAssets.noData,
                            title: AppStrings.error,
                            description: error.toString(),
                            buttonText: AppStrings.retry,
                            onPressed: () {
                              controller.getConfirmOrders();
                            },
                          ),
                        ),
                      )
                          : SingleChildScrollView(
                        physics: const BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        child: EmptyFailureNoInternetView(
                          image: ImageAssets.noInternet,
                          title: AppStrings.noInternet,
                          description: AppStrings.checkConnection,
                          buttonText: AppStrings.retry,
                          onPressed: () {
                            controller.getConfirmOrders();
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
