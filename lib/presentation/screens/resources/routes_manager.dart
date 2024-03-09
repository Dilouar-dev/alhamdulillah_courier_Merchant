import 'package:alhamdulillah_courier_service_merchant/presentation/screens/Create%20order2/Dashboard_Api_Screen.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/Dashboard2/dashboard_new.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/incomplete_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/order_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/order_history_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/payment_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/payment_history_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/registration_binding.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/return_history_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/shop_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/bindings/user_info_bindings.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/confirm_orders_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/pickup_time_response.dart';
import 'package:alhamdulillah_courier_service_merchant/data/model/return_history_reponse.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/Executive/executive.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/Order_History/order_history.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/home.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/incative/inactive.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/incomplete/incomplete.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/login/login.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/login/otpverify_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/login/signup_phone_view.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/onboarding/forgot_password/forgot_password.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/onboarding/onboarding.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/component/confirm_order_list.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/confirm_order.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/order/create_order.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment/payment.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment_history/payment_details.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/payment_history/payment_history.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/profile/profile.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/profile/profilescreen.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/registration/registration.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/details_return_history.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/return_history/return_history.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/shop/create_shop.dart';

import 'package:alhamdulillah_courier_service_merchant/presentation/screens/splash/splash.dart';

import '../../../data/bindings/dashboard_bindings.dart';



class Routes {
  static const String initialRoute = '/';
  static const String onboardingRoute = '/onBoarding';
  static const String loginRoute = '/login';
  static const String loginPhoneRoute = '/loginPhone';
  static const String loginPhoneVerifyRoute = '/loginPhoneVerify';
  static const String registerRoute = '/register';
  static const String forgotPasswordRoute = '/forgotPassword';
  static const String homeRoute = '/home';
  static const String inActiveRoute = '/inactive';
  static const String shop = '/shop';
  static const String createOrder = '/createOrder';
  static const String order = '/order';//'/ConfirmOrderList';
  static const String profile = '/profile';
  static const String payment = '/payment';
  static const String executive = '/executive';
  static const String historyOrder = '/historyOrder';
  static const String historyPayment = '/historyPayment';
  static const String incomplete = '/incomplete';
  static const String historyReturn = '/historyReturn';
  static const String historyReturnDetails = '/historyReturnDetails';
  static const String detailsHistoryPayment = '/detailsHistoryPayment';
}

class AppPages {
  AppPages._();

  static final routes = [
    GetPage(
      name: Routes.initialRoute,
      page: () => const SplashView(),
    ),
    GetPage(
      name: Routes.inActiveRoute,
      page: () => const InActiveView(),
    ),
    GetPage(
      name: Routes.onboardingRoute,
      page: () => const OnboardingView(),
    ),
    GetPage(
      name: Routes.loginRoute,
      page: () => const LoginView(),
    ),
    GetPage(
      name: Routes.loginPhoneRoute,
      page: () => const SignupPhoneView(),
    ),
    GetPage(
        name: Routes.incomplete,
        page: () => const IncompleteView(),
        binding: IncompleteBindings()),
    GetPage(
      name: Routes.loginPhoneVerifyRoute,
      page: () => const OtpVerifyView(),
    ),
    GetPage(
        name: Routes.registerRoute,
        page: () => const RegisterView(),
        binding: RegistrationBindings()),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => const ForgotPasswordView(),
    ),
    GetPage(
        name: Routes.homeRoute,
        page: () =>  Dashboard_new(),//Dashboard_apiScreen(),//const HomeView(),
        binding: DashboardBindings()),
    GetPage(
        name: Routes.shop,
        page: () => const CreateShopView(),
        binding: ShopBindings()),
    GetPage(
        name: Routes.createOrder,
        page: () =>   CreateOrderView(),//CreateOrderView(),//CreateOrderTwo(),
        binding: OrderBindings()),
    // GetPage(
    //     name: Routes.order,
    //     // page: () => const ConfirmOrderView(),
    //     binding: OrderBindings(),
    //
    //     page: () => ConfirmOrderView(),),


   // GePage ConfirmOrders
   //  GetPage(
   //    name: Routes.order,
   //    binding: OrderBindings(),
   //    page: () => ConfirmOrderView(
   //      //Order:
   //
   //      Order(), // Provide an actual Order instance here
   //      //rider:
   //      Rider(), // Provide an actual Rider instance here
   //     // pickupTimeResponse:
   //      PickupTime(), // Provide an actual PickupTimeResponse instance here
   //    ),
   //  ),

    GetPage(
      name: Routes.order,
      binding: OrderBindings(),
      page: () => ConfirmOrderScreen(
        //Order:

         Order(), // Provide an actual Order instance here
        // //rider:
         Rider(), // Provide an actual Rider instance here
        // // pickupTimeResponse:
         PickupTime(), // Provide an actual PickupTimeResponse instance here



      ),
    ),

    GetPage(
        name: Routes.profile,
        page: () => ProfileScreen(),//const ProfileView(),
        binding: UserInfoBindings()),
    GetPage(
        name: Routes.payment,
        page: () => const PaymentView(),
        binding: PaymentBindings()),
    GetPage(
        name: Routes.executive,
        page: () => const ExecutiveView(),
        binding: ShopBindings()),
    GetPage(
        name: Routes.historyOrder,
        page: () => OrderHistoryView(Rider(),PickupTime()),
        binding: OrderHistoryBindings()),
    GetPage(
        name: Routes.historyPayment,
        page: () => const PaymentHistoryView(),
        binding: PaymentHistoryBindings()),
    GetPage(
        name: Routes.historyReturn,
        page: () => const ReturnHistoryView(),
        binding: ReturnHistoryBindings()),
    GetPage (
      name: Routes.detailsHistoryPayment,
      page: () => const PaymentDetailHistoryView(),
      //binding: DetailsPaymentHistoryBindings(invoiceId: Get.arguments ?? ''),
    ),
    GetPage(
      name: Routes.historyReturnDetails,
      page: () => const ReturnDetailHistoryView(),
      // binding: DetailsPaymentHistoryBindings(invoiceId: Get.arguments ?? '')
    ),
  ];
}


// class RouteGenerator {
//   static Route<dynamic> getRoute(RouteSettings routeSettings) {
//     switch (routeSettings.name) {
//       case Routes.initialRoute:
//         return MaterialPageRoute(builder: (_) => const SplashView());
//       case Routes.onboardingRoute:
//         return MaterialPageRoute(builder: (_) => const OnboardingView());
//       case Routes.loginRoute:
//         return MaterialPageRoute(builder: (_) => const LoginView());
//       case Routes.registerRoute:
//         return MaterialPageRoute(builder: (_) => const RegisterView());
//       case Routes.forgotPasswordRoute:
//         return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
//       case Routes.homeRoute:
//         return MaterialPageRoute(builder: (_) => const HomeView());
//       case Routes.shop:
//         return MaterialPageRoute(builder: (_) => const CreateShopView());

//       default:
//         return unDefineRoute();
//     }
//   }
  

//   static Route<dynamic> unDefineRoute() {
//     return MaterialPageRoute(
//         builder: (_) => Scaffold(
//               appBar: AppBar(
//                 title: const Text(AppStrings.noRouteFound),
//               ),
//               body: const Center(
//                 child: Text(AppStrings.noRouteFound),
//               ),
//             ));
//   }
// }

