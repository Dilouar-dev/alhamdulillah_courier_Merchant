// // import 'package:flutter/foundation.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:alhamdulillah_courier_service_merchant/data/model/branch_response.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/controller/registration_controller.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/gb_widgets/user_input_fields.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/fonts_manager.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/string_manager.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';
// // import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/values_manager.dart';
// //
// // class RegisterView extends GetView<RegistrationController> {
// //   const RegisterView({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: <Widget>[
// //             InkWell(
// //               onTap: () => Get.back(),
// //               child: Padding(
// //                 padding: const EdgeInsets.all(AppPadding.p14),
// //                 child: Row(
// //                   children: [
// //                     const SizedBox(
// //                       width: AppSize.s10,
// //                     ),
// //                     Icon(
// //                       Icons.arrow_back_ios,
// //                       color: Colormanager.black,
// //                       semanticLabel: AppStrings.back,
// //                       size: AppSize.s22,
// //                     ),
// //                     Text(
// //                       AppStrings.back,
// //                       style: getSemiBoldStyle(
// //                           color: Colormanager.black, fontSize: FontSize.s18),
// //                     )
// //                   ],
// //                 ),
// //               ),
// //             ),
// //             Expanded(
// //               child: controller.obx(
// //                 (branchList) => RefreshIndicator(
// //                   onRefresh: () async {
// //                     controller.getBranchs();
// //                   },
// //                   child: Form(
// //                     key: controller.key,
// //                     autovalidateMode: AutovalidateMode.onUserInteraction,
// //                     child: SingleChildScrollView(
// //                       padding: const EdgeInsets.symmetric(
// //                           horizontal: AppPadding.p20),
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.center,
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: <Widget>[
// //                           const SizedBox(
// //                             height: 50,
// //                           ),
// //                           Column(
// //                             children: <Widget>[
// //                               UserInputFields(
// //                                 controller: controller.businessNameController,
// //                                 histsName: AppStrings.enterBusinessName,
// //                                 iconData: Icons.business,
// //                                 lavelName: AppStrings.businessName,
// //                                 validateFunction: (value) =>
// //                                     controller.validFields(value),
// //                                 press: () {},
// //                               ),
// //                               UserInputFields(
// //                                 controller: controller.nameController,
// //                                 histsName: AppStrings.enterOwnerName,
// //                                 iconData: Icons.person,
// //                                 lavelName: AppStrings.ownerNme,
// //                                 validateFunction: (value) =>
// //                                     controller.validFields(value),
// //                                 press: () {},
// //                               ),
// //                               buildTypes(controller, branchList),
// //                               UserInputFields(
// //                                 controller: controller.addressController,
// //                                 histsName: AppStrings.enterAddres,
// //                                 iconData: Icons.location_on,
// //                                 lavelName: AppStrings.address,
// //                                 textInputType: TextInputType.streetAddress,
// //                                 maxLines: AppIntValue.i3,
// //                                 validateFunction: (value) =>
// //                                     controller.validFields(value),
// //                                 press: () {},
// //                               ),
// //                               UserInputFields(
// //                                 controller: controller.emailController,
// //                                 histsName: AppStrings.enterEmail,
// //                                 iconData: Icons.email,
// //                                 lavelName: AppStrings.email,
// //                                 textInputType: TextInputType.emailAddress,
// //                                 validateFunction: (value) =>
// //                                     controller.validateEmail(value),
// //                                 press: () {},
// //                               ),
// //                               UserInputFields(
// //                                 controller: controller.phoneController,
// //                                 histsName: AppStrings.enterMobile,
// //                                 iconData: Icons.mobile_friendly,
// //                                 lavelName: AppStrings.mMobile,
// //                                 textInputType: TextInputType.phone,
// //                                 validateFunction: (value) =>
// //                                     controller.validatePhone(value),
// //                                 press: () {},
// //                               ),
// //                               Obx(() => UserInputFields(
// //                                     controller: controller.passwordController,
// //                                     histsName: AppStrings.hPassword,
// //                                     iconData: controller.obscureText.value
// //                                         ? Icons.visibility_off
// //                                         : Icons.visibility,
// //                                     lavelName: AppStrings.password,
// //                                     obscureText: controller.obscureText.value,
// //                                     textInputType:
// //                                         TextInputType.visiblePassword,
// //                                     validateFunction: (value) =>
// //                                         controller.validPassword(value),
// //                                     press: () {
// //                                       controller.obscureText.value =
// //                                           !controller.obscureText.value;
// //                                       if (kDebugMode) {
// //                                         print(controller.obscureText.value);
// //                                       }
// //                                     },
// //                                   )),
// //                             ],
// //                           ),
// //                           const SizedBox(
// //                             height: AppSize.s20,
// //                           ),
// //                           InkWell(
// //                             onTap: () {
// //                               controller.getformValidation();
// //                             },
// //                             child: Container(
// //                               width: MediaQuery.of(context).size.width,
// //                               padding: const EdgeInsets.symmetric(
// //                                 vertical: AppSize.s16,
// //                               ),
// //                               alignment: Alignment.center,
// //                               decoration: BoxDecoration(
// //                                 borderRadius: const BorderRadius.all(
// //                                   Radius.circular(
// //                                     AppSize.s14,
// //                                   ),
// //                                 ),
// //                                 boxShadow: <BoxShadow>[
// //                                   BoxShadow(
// //                                     color: Colormanager.white,
// //                                     offset: const Offset(
// //                                       AppSize.s2,
// //                                       AppSize.s4,
// //                                     ),
// //                                     blurRadius: AppSize.s5,
// //                                     spreadRadius: AppSize.s2,
// //                                   )
// //                                 ],
// //                                 gradient: LinearGradient(
// //                                   begin: Alignment.centerLeft,
// //                                   end: Alignment.centerRight,
// //                                   colors: [
// //                                     Colormanager.darkPrimary,
// //                                     Colormanager.primary,
// //                                   ],
// //                                 ),
// //                               ),
// //                               child: Text(
// //                                 AppStrings.registerNow,
// //                                 style: getBoldStyle(
// //                                     color: Colormanager.white,
// //                                     fontSize: FontSize.s17),
// //                               ),
// //                             ),
// //                           ),
// //                           const SizedBox(
// //                             height: AppSize.s28,
// //                           ),
// //                           InkWell(
// //                             onTap: () {
// //                               Get.back();
// //                             },
// //                             child: Container(
// //                               margin: const EdgeInsets.symmetric(
// //                                 vertical: AppMargin.m14,
// //                               ),
// //                               padding: const EdgeInsets.all(AppPadding.p14),
// //                               alignment: Alignment.bottomCenter,
// //                               child: Row(
// //                                 mainAxisAlignment: MainAxisAlignment.center,
// //                                 children: <Widget>[
// //                                   Text(
// //                                     AppStrings.alreadyHaveAccount,
// //                                     style: getBoldStyle(
// //                                         color: Colormanager.black,
// //                                         fontSize: FontSize.s16),
// //                                   ),
// //                                   const SizedBox(
// //                                     width: AppSize.s10,
// //                                   ),
// //                                   Text(
// //                                     AppStrings.login,
// //                                     style: getBoldStyle(
// //                                         color: Colormanager.darkPrimary,
// //                                         fontSize: FontSize.s16),
// //                                   ),
// //                                 ],
// //                               ),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Column buildTypes(
// //       RegistrationController controller, List<Branch>? branchList) {
// //     return Column(
// //       mainAxisAlignment: MainAxisAlignment.start,
// //       crossAxisAlignment: CrossAxisAlignment.start,
// //       children: [
// //         Text.rich(
// //           TextSpan(
// //             children: [
// //               TextSpan(
// //                 text: AppStrings.branch,
// //                 style: getSemiBoldStyle(
// //                     color: Colormanager.darkGrey, fontSize: AppSize.s14),
// //               ),
// //               TextSpan(
// //                 text: AppStrings.star,
// //                 style: getSemiBoldStyle(
// //                     color: Colormanager.red, fontSize: AppSize.s14),
// //               ),
// //             ],
// //           ),
// //         ),
// //         const SizedBox(
// //           height: AppSize.s4,
// //         ),
// //         // Selecttor in Branch
// //         Container(
// //           padding: const EdgeInsets.all(AppPadding.p4),
// //           decoration: BoxDecoration(
// //             shape: BoxShape.rectangle,
// //             border: Border.all(width: AppSize.s1_5, color: Colormanager.grey),
// //             borderRadius: const BorderRadius.all(
// //               Radius.circular(AppSize.s8),
// //             ),
// //           ),
// //           child: Obx(
// //             () => DropdownButton<Branch>(
// //               //isDense: true,
// //               hint: controller.slectedbranch.value.isNotEmpty
// //                   ? Text(
// //                       controller.slectedbranch.value,
// //                       style: getSemiBoldStyle(
// //                         color: Colormanager.black,
// //                       ),
// //                     )
// //                   : Text(
// //                       AppStrings.selectBranch,
// //                       style: getSemiBoldStyle(
// //                         color: Colormanager.black,
// //                       ),
// //                     ),
// //               value: controller.selectedBranch,
// //
// //               icon: Padding(
// //                 padding: const EdgeInsets.only(left: AppPadding.p14),
// //                 child: Icon(
// //                   Icons.arrow_drop_down,
// //                   color: Colormanager.darkGrey,
// //                 ),
// //               ),
// //               iconSize: AppSize.s28,
// //               elevation: AppIntValue.i16,
// //               isExpanded: true,
// //               style: const TextStyle(
// //                 color: Colors.black,
// //               ),
// //               underline: Container(
// //                 height: 0,
// //               ),
// //               onChanged: (Branch? newValue) {
// //                 controller.selectedBranch = newValue;
// //                 controller.slectedbranch.value = newValue!.name.toString();
// //               },
// //               items: branchList!.map<DropdownMenuItem<Branch>>((Branch? value) {
// //                 return DropdownMenuItem<Branch>(
// //                   value: value,
// //                   child: Text(
// //                     '${value!.name}',
// //                     style: getSemiBoldStyle(
// //                         color: Colormanager.black, fontSize: FontSize.s14),
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// // }
//
//
//
// // import 'package:flutter/material.dart';
// // import 'package:webview_flutter/webview_flutter.dart';
//
//
//
//
// // class MyApp extends StatefulWidget {
// //   @override
// //   State<MyApp> createState() => _MyAppState();
// // }
// //
// // class _MyAppState extends State<MyApp> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'WebView Example',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: WebViewExample(url: 'https://system.olectraexpress.com/merchant-registration'),
// //     );
// //   }
// // }
// //
// // class WebViewExample extends StatefulWidget {
// //   final String url;
// //
// //   WebViewExample({required this.url});
// //
// //   @override
// //   _WebViewExampleState createState() => _WebViewExampleState();
// // }
// //
// // class _WebViewExampleState extends State<WebViewExample> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text('WebView Example'),
// //       ),
// //       body: WebView(
// //         initialUrl: widget.url,
// //         javascriptMode: JavascriptMode.unrestricted,
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
// import 'package:flutter/material.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
// import 'package:webview_flutter/webview_flutter.dart';
//
// class RegisterView extends StatefulWidget {
//   const RegisterView({Key? key}) : super(key: key);
//
//   @override
//   State<RegisterView> createState() => _RegisterViewState();
// }
//
// class _RegisterViewState extends State<RegisterView> {
//   late WebViewController controller;
//
//   @override
//   void initState() {
//     super.initState();
//
//     // Instantiating WebViewController
//     controller = WebViewController()
//       ..setJavaScriptMode(JavaScriptMode.unrestricted)
//       ..setBackgroundColor(Colors.white)
//       ..setNavigationDelegate(
//         NavigationDelegate(
//           onProgress: (int progress) {
//             // Update loading bar.
//           },
//           onPageStarted: (String url) {
//             // Handle page started event.
//           },
//           onPageFinished: (String url) {
//             // Handle page finished event.
//           },
//           onWebResourceError: (WebResourceError error) {
//             // Handle web resource error.
//           },
//           onNavigationRequest: (NavigationRequest request) {
//             if (request.url.startsWith('https://system.olectraexpress.com/merchant-registration')) {
//               return NavigationDecision.prevent;
//             }
//             return NavigationDecision.navigate;
//           },
//         ),
//       );
//
//     // Load the initial URL
//     controller.loadRequest(Uri.parse('https://system.olectraexpress.com/merchant-registration'));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Olectra Express Merchants'),
//         backgroundColor: Colormanager.darkPrimary,
//       ),
//       body:  WebViewWidget(controller: controller),
//     );
//   }
// }


import 'dart:convert';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/home/home.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/login/login.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/style_manager.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  _RegisterViewState createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final TextEditingController businessNameController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  // String? selectedBranch;
  List<String> branches = []; // List to store branch names
  String selectedBranch = ''; // Currently selected branch
  List<String> options = [];
  int? _selectedDistrictId;
  TextEditingController _selectedDistrictController = TextEditingController();
  TextEditingController _selectedDistrictIdController = TextEditingController();
  TextEditingController _selectedAreaController = TextEditingController();
  TextEditingController _selectedAreaIdController = TextEditingController();

  List<dynamic> _areas = [];

  List<dynamic> _districts = [];


  @override
  void initState() {
    super.initState();
    _fetchDistricts();
    _loadAreas();
  }

  Future<void> _fetchDistricts() async {
    final response = await http.get(Uri.parse('http://system.olectraexpress.com/api/distList'));
    if (response.statusCode == 200) {
      setState(() {
        _districts = json.decode(response.body)['data'];
      });
    }
  }
  void _showDistrictSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (_districts.isEmpty) {
          return Center(
            child: Text('No data'),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: _districts.map<Widget>((district) {
                return ListTile(
                  title: Text(district['name']),
                  onTap: () {
                    _selectedDistrictController.text = district['name'];
                    _selectedDistrictIdController.text = district['id'].toString();
                    // _selectedDistrictController.text = district['id'].toString();
                    print("Selected District ID: ${_selectedDistrictIdController.text}"); // Printing selected district id


                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }

  Future<void> _loadAreas() async {
    final response = await http.get(Uri.parse('https://system.olectraexpress.com/api/coverage-area'));

    if (response.statusCode == 200) {
      List<dynamic> areas = jsonDecode(response.body)['data'];
      setState(() {
        _areas = areas;
      });
    } else {
      throw Exception('Failed to load areas');
    }
  }

  void _showAreaSelector(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        if (_areas.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return SingleChildScrollView(
            child: Column(
              children: _areas.map<Widget>((area) {
                return ListTile(
                  title: Text(area['area']),
                  onTap: () {
                    _selectedAreaController.text = area['area'];
                    _selectedAreaIdController.text = area['id'].toString();
                    print("Selected Area ID: ${_selectedAreaIdController.text}");
                    Navigator.of(context).pop();
                  },
                );
              }).toList(),
            ),
          );
        }
      },
    );
  }



  // Fetch district data from API
  Future<void> fetchDistricts() async {
    final response = await http.get(Uri.parse('http://system.olectraexpress.com/api/distList'));
    if (response.statusCode == 200) {
      setState(() {
        _districts = json.decode(response.body)['data'];
      });
    } else {
      // Show error message in the bottom sheet if data cannot be fetched
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Failed to fetch district list'),
            ),
          );
        },
      );
    }
  }

  // Future<void> fetchBranchList() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('http://system.olectraexpress.com/api/distList'),
  //       headers: {'Accept': 'application/json'},
  //     );
  //
  //     if (response.statusCode == 200) {
  //       final List<dynamic> branchList = json.decode(response.body);
  //       setState(() {
  //         // Update the state with the fetched branch names
  //         branches = branchList.map((branch) => branch['name'] as String).toList();
  //       });
  //     } else {
  //       print('Failed to fetch branch list: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching branch list: $e');
  //   }
  // }




  // Future<void>
  // Future<List<String>> fetchBranches() async {
  //
  //   try {
  //     final response = await http.get(
  //       Uri.parse('http://system.olectraexpress.com/api/distList'),
  //       headers: {
  //         'Accept': 'application/json',
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Parse the JSON response
  //       List<String> fetchedBranches = List<String>.from(json.decode(response.body)['branches']);
  //       // Update the dropdown items
  //       setState(() {
  //         branches = fetchedBranches;
  //       });
  //       print('Fetched branches: $branches'); // Print the fetched branches
  //     } else {
  //       print('Failed to fetch branches: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     print('Error fetching branches: $e');
  //   }
  // }



  // Future<List<String>> fetchBranches() async {
  //   try {
  //     final response = await http.get(
  //       Uri.parse('http://system.olectraexpress.com/api/distList'),
  //       headers: {
  //         'Accept': 'application/json',
  //         'Authorization':'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjQzZDVjMzdiZDI4NDYyYjg2ZmI4NDI3YjU3YjFlNGE0ZTZlYmEyYWU1ZTYxNGY2YWRiNzE5MmQwZDk5ZGYxYzY1NGZiN2I3MjMzMWJhMmZmIn0.eyJhdWQiOiIyMiIsImp0aSI6IjQzZDVjMzdiZDI4NDYyYjg2ZmI4NDI3YjU3YjFlNGE0ZTZlYmEyYWU1ZTYxNGY2YWRiNzE5MmQwZDk5ZGYxYzY1NGZiN2I3MjMzMWJhMmZmIiwiaWF0IjoxNzA0NTMwMzkyLCJuYmYiOjE3MDQ1MzAzOTIsImV4cCI6MTczNjE1Mjc5Miwic3ViIjoiNzcwIiwic2NvcGVzIjpbXX0.VWhoPg-cb-Y1NKbb4EWcEOnnEUhwUuF2BbeqW5S3Zx-RAAQUuD7zyPARWrohQeF5m-TbuD6WSF3yMadJqxzYSXbP5kq6cQ_Oa7pskuSexHeHC4D3sX7pn77MdYaxNE9G9cmf2NXDUaMio0xM7hOquOW7H3Pj7xSpKUOer_K_BM5a0841hbHJo8d-J6kpADEduTCO0Am0UEtJ6W0hBRp5cprZT_X12N8pkGVvyxXMLme6K0q06IJ29oI5HH6ZMN4m3xWr2jPJNq2hX6awIaIu5OEt179dT964lLp_soj47SagUMMDETixw0AeuzlXt27QQfOLGkkCnhPzE2jWDol7mFb_LZqjq44q-ZCy6EHI8SbkxUVa8GkaviSBaSKm6StczlTcOsxFG15UYGv6_w_iBRSBWbDb0iGkZ861ZpWQ9pi68BrMI7pp1-Qtun7yu9KkRNUOtBW8zd-M4fOZ8jXDNfuyJ66wV0f-dmTScBSzXXEngYU3Pf8rK3IGwGv8KDL5276JfVQSUKhIpAle0cwn75J4jsEja-4uLKvlt4GioSboLYY25X4fY-P27utTgk-laypRbkFjjp8-5-OXmfJ0xR3LoJOzAJvqqF56Y-1oxdrpF20BEljaoHXEKrHeqewN2S3j7qaLxJZ6MIAebQrIiPNbqTLuqF1lUaWAXC1SzVg'
  //       },
  //     );
  //
  //     if (response.statusCode == 200) {
  //       // Parse the JSON response
  //       List<String> fetchedBranches = List<String>.from(json.decode(response.body)['branches']);
  //       // Update the dropdown items
  //       setState(() {
  //         branches = fetchedBranches;
  //       });
  //       print('Fetched branches: $branches'); // Print the fetched branches
  //       return fetchedBranches; // Return the fetched branches
  //     } else {
  //       print('Failed to fetch branches: ${response.statusCode}');
  //       return []; // Return an empty list in case of failure
  //     }
  //   } catch (e) {
  //     print('Error fetching branches: $e');
  //     return []; // Return an empty list in case of error
  //   }
  // }




  Future<List<String>> fetchBranches() async {
    try {
      final response = await http.get(
        Uri.parse('http://system.olectraexpress.com/api/distList'),
        headers: {
          'Accept': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        // Check if response body is not null
        if (response.body != null) {
          // Parse the JSON response
          final decodedData = json.decode(response.body);
          if (decodedData['branches'] != null) {
            // Extract branches list
            List<String> fetchedBranches = List<String>.from(decodedData['branches']);
            // Update the dropdown items
            setState(() {
              branches = fetchedBranches;
            });
            print('Fetched branches: $branches');
            return branches;
          } else {
            throw Exception('Branches data not found in response');
          }
        } else {
          throw Exception('Response body is null');
        }
      } else {
        throw Exception('Failed to fetch branches: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching branches: $e');
      throw Exception('Error fetching branches: $e');
    }
  }



  void _showOptionsModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200, // Adjust the height as needed
          child: ListView.builder(
            itemCount: branches.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(branches[index]),
                onTap: () {
                  // Handle selection logic here
                  // For example, you can update the value of nameController
                  nameController.text = branches[index];
                  Navigator.pop(context); // Close the bottom sheet
                },
              );
            },
          ),
        );
      },
    );
  }





  // Future<void> registerMerchant() async {
  //   const String url = 'http://system.olectraexpress.com/api/register-merchant';
  //   final Map<String, String> headers = {
  //     'Accept': 'application/json',
  //   'Content-type':'application/x-www-form-urlencoded',
  //
  //   // 'Authorization':
  //     // 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjU1MzcwMDA0NmRlMWMzZGVhZjgwMWI1NThmZTAwOTg4YzBiODdmZmY4YWExYmQ0OGIxNTRmOGZmNWI5Mjc3Mjg4NjQ5NDNhMzk3MTYyZTYxIn0.eyJhdWQiOiIyNCIsImp0aSI6IjU1MzcwMDA0NmRlMWMzZGVhZjgwMWI1NThmZTAwOTg4YzBiODdmZmY4YWExYmQ0OGIxNTRmOGZmNWI5Mjc3Mjg4NjQ5NDNhMzk3MTYyZTYxIiwiaWF0IjoxNzA2NTg1OTIxLCJuYmYiOjE3MDY1ODU5MjEsImV4cCI6MTczODIwODMyMSwic3ViIjoiMTEwNSIsInNjb3BlcyI6W119.cXeAQtroZpxSD3B_OIpwF6gmKztJCOjXZ2CV2gFU5x2ir_uN4gK_ZYu4lWGgdYwYAZkARdrRCDyJCHisLRF3uTHLQBGK_LPqJort7FoomzNcGza9b4ECyrqKizrhAFnFHzTlJx7pchGvMZeyPXaP3eJcMHWy6Kkh9023c0QebmjBLAvrQecTamxmyGkN4z1nmLQsGliZlA9XBfp-LR0FbR71gsTiqUo6cxoviqJERRgtOKeMZWVhAlGKrQh7V4AD-zqE4MYwfgow22fCmRpz_-m_lcTBtO42JnkO9kzcI3HlMjPYE5sNxr57Zob0ULfWyNXFxPRJg4fAw2Q0NXDpCzN1SYFnXENSkAieLk_77g4NGqefJU7dKQliUgsQjjXlYagWDaHVExMPHG0fzQFB-3dLsSgCEgE-fTOdJbCrzDpg7gCY_Dz7WQ1aNARTdvDTS_OLorUt7IB9WtKqRvrPA4Dnst2VgLArKT9A_DOdKNk0Wk-wnksaU5mgoquS8Sg81DGlX9pJfA70sGXawZh9c5Gyk5UK_-Y-wzfKAYRM_vu6YFlJ0X7p_qwqw7XHCztogrhnIrUt7gduJpmIBkePdSvGEHV4SWuga-fw7Q9jSEY-uJ7ExkuNOmCzv-wbXJtU89E_rV-Wt2OSERowvXAJyNBY0RnS58ThbXmuKXQ11qE'
  //     'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjdmNmVhYzk3ZjYzYTg2ZWE2YWY5ZDRiYzcwOGZkYWMwMDgzOTA0NGYzY2UyYTU0MDBhYTJlNDBkNjhkYTdiMjcyNmIyNzliYWJjZjJlM2ExIn0.eyJhdWQiOiIyNCIsImp0aSI6IjdmNmVhYzk3ZjYzYTg2ZWE2YWY5ZDRiYzcwOGZkYWMwMDgzOTA0NGYzY2UyYTU0MDBhYTJlNDBkNjhkYTdiMjcyNmIyNzliYWJjZjJlM2ExIiwiaWF0IjoxNzA3OTc0NDIwLCJuYmYiOjE3MDc5NzQ0MjAsImV4cCI6MTczOTU5NjgyMCwic3ViIjoiMTE1NiIsInNjb3BlcyI6W119.DDYMmDsWCj3xA7V42n3SMwEgUOC2NE0hkEVdKCfPrN6udR7uwCAMzW-NJ9dvalVkryE8NVFK8rNHbFW7VzcYdq7ThOmtZ7eNtv8FyDMw_I7gDvqXv8QZnE8Hj7nn5CgBtp1pREjiVu_cXLL8YsObd-s_QLlH1dgZFaprf1VY_hZaE9WwodKl3TrS0zlOXOBha8i__fQsfD78W18wDEmdIS1FBslGMybUf37UloiZYTzzo6qn47Z1VP5lyUmV_AzsnWI0VNLHJME0cCH48TXMxvSkfVbS0dIqq_8cwyZG-K8oT-3hqwYWKKFGtJ3J5UYXYTdBWDb3KsOoUBNXZF3Xu1BH-tWjqAB5pJLP6DqlwcikD0NITgMQbeMB4NQ4hd9VaSLYcoRvMGkFYsdwLTWhwEpfwm2mXzXdVAFJmQY-StDb7lN9zgQrFTURLhV7UbSLa9fz9CHMoTb6qCspQK_H0w1ghRwlFAwqJxaN5iWCGPKtvxMZltshwgEvx6-BZrqZoBu0QmnokbGeAwyHwZpPWL2XYRHOlRpVQ3SIBPch9BVb4HsJw9VoGuDJkFAwrk2YGNnM6e9aY_S1En_rx07giStQxjCcaQRsrIYP69DbX_FgyCw1YDlfjAfXJ3G1yDdDrVO4_dVy9Mj6Nu3efa6fJLgcc6MzI4Exu1nZpFhfbKI'
  //   };
  //
  //   // final Map<String, String> body = {
  //   final Map<String, String> body = {
  //
  //     'name': 'lotto',//businessNameController.text,
  //     'business_name': 'lotto',//nameController.text,
  //     'area': '123',//passwordController.text,//selectedBranch ?? '',
  //     'address': 'dhaka',//addressController.text,
  //     'email': 'lotto@gmail.com',//emailController.text,
  //     'mobile': '018767676656',//phoneController.text,
  //     'password': '123456',//passwordController.text,
  //     'district': '27'//passwordController.text,
  //   };
  //   // Print the body data before making the request
  //   print('Request Body: $body');
  //
  //
  //   try {
  //     final response = await http.post(Uri.parse(url), headers: headers, body: body);
  //     if (response.statusCode == 200) {
  //       // Successful registration
  //       // You can handle the response here
  //       print('Merchant registered successfully!');
  //     } else {
  //       // Registration failed
  //       // You can handle error cases here
  //       print('Failed to register merchant. Status code: ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     // Exception occurred
  //     // You can handle exceptions here
  //     print('Exception during registration: $e');
  //   }
  // }
  Future<void> submitData() async {
    // Define the data to be passed to the API
    final requestData = {
      'name': businessNameController.text,
      'email': emailController.text,
      'mobile':  phoneController.text,
      'address':  addressController.text,
      'password':  passwordController.text,
      'business_name':  nameController.text,
      'area': _selectedAreaIdController.text,//'212', // passwordController.text,//selectedBranch ?? '',
      'district': _selectedDistrictIdController.text//'47' // passwordController.text,
    };

    // Print the requestData before making the HTTP POST request
    print('Request Data: $requestData');

    // Make the HTTP POST request
    final response = await http.post(
      Uri.parse('http://system.olectraexpress.com/api/register-merchant'),
      headers: {
        'Accept': 'application/json',
        'Content-type': 'application/x-www-form-urlencoded',
      },
      body: requestData,
    );


    // Handle the response
    if (response.statusCode == 200) {
      // Request successful, handle the response data10
      print('API request successful');
      print('Response data: ${response.body}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Text(
            'Registration done successfully',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      // Navigator.of(context).pop();
      Get.to(LoginView());

      // Add logic to handle the response data as needed
    } else {
      // Request failed, handle the error
      print('API request failed with status code: ${response.statusCode}');
      print('${response.statusCode}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.lightBlue,
          content: Text(
            'Registration failed',
            style: TextStyle(color: Colors.white),
          ),
        ),
      );

      // Add logic to handle the error as needed
    }

    Navigator.of(context).pop();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colormanager.darkPrimary,
        title: const Text('Merchant Registration'),
      ),
      body: Container(
        color: Colors.white,

        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Business Name', style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: businessNameController,
                  decoration: const InputDecoration(labelText: 'Business Name'),
                ),
              ),
              Text('Name', style: TextStyle(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
              ),
              // DropDownButton for selecting branch
              // Assuming branches are fetched from somewhere
              // You need to implement this
              // For simplicity, I'm using a simple TextFormField for demonstration
              Text('Branch', style: TextStyle(fontSize: 20),),


              Padding(
                padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    onTap: (){
                      _showDistrictSelector(context);

                    },
                    controller: _selectedDistrictController,
                    decoration: InputDecoration(
                      hintText: 'Select District',
                      suffixIcon: IconButton(
                        icon: Icon(Icons.arrow_drop_down),
                        onPressed: () => _showDistrictSelector(context),
                      ),
                    ),
                    readOnly: true,
                  ),
              ),

              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: DropdownButtonFormField<String>(
              //     value: selectedBranch.isNotEmpty ? selectedBranch : null,
              //     onChanged: (String? value) {
              //       setState(() {
              //         selectedBranch = value ?? ''; // If value is null, assign an empty string
              //       });
              //     },
              //     items: branches.map((String branch) {
              //       return DropdownMenuItem<String>(
              //         value: branch,
              //         child: Text(branch),
              //       );
              //     }).toList(),
              //     decoration: InputDecoration(
              //       labelText: 'Branch',
              //       border: OutlineInputBorder(),
              //     ),
              //   ),
              // ),


              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: FutureBuilder<List<String>>(
              //     future: fetchBranches(),
              //     builder: (context, snapshot) {
              //       if (snapshot.connectionState == ConnectionState.waiting) {
              //         return CircularProgressIndicator(); // Show loading indicator while fetching data
              //       } else if (snapshot.hasError) {
              //         return Text('Error: ${snapshot.error}');
              //       } else {
              //         // DropdownButtonFormField to display the fetched branches
              //         return DropdownButtonFormField<String>(
              //           value: selectedBranch.isNotEmpty ? selectedBranch : null,
              //           onChanged: (String? value) {
              //             setState(() {
              //               selectedBranch = value ?? ''; // If value is null, assign an empty string
              //             });
              //           },
              //           items: snapshot.data!.map((branch) {
              //             return DropdownMenuItem<String>(
              //               value: branch,
              //               child: Text(branch),
              //             );
              //           }).toList(),
              //           decoration: InputDecoration(
              //             labelText: 'Branch',
              //             border: OutlineInputBorder(),
              //           ),
              //         );
              //       }
              //     },
              //   ),
              // ),





              // Padding(
              //   padding: const EdgeInsets.all(8.0),
              //   child: TextFormField(
              //     controller: TextEditingController(text: selectedBranch),
              //     readOnly: true,
              //     onTap: () {
              //       // Implement branch selection logic here
              //       // You can use a dialog or a dropdown menu
              //     },
              //     decoration: const InputDecoration(labelText: 'Branch'),
              //   ),
              // ),

              Text('Area', style: TextStyle(fontSize: 20),),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                      controller: _selectedAreaController,
                      decoration: InputDecoration(
                        labelText: 'Selected Area',
                        suffixIcon: IconButton(
                          icon: Icon(Icons.arrow_drop_down),
                          onPressed: () {
                            _showAreaSelector(context);
                          },
                        ),
                      ),
                      readOnly: true,
                    ),


              ),
              Text('Address', style: TextStyle(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(labelText: 'Address'),
                ),
              ),
              Text('Email', style: TextStyle(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: const InputDecoration(labelText: 'Email'),
                ),
              ),
              Text('Mobile no', style: TextStyle(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(labelText: 'Mobile'),
                ),
              ),
              Text('Password', style: TextStyle(fontSize: 20),),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: 'Password'),
                ),
              ),
              const SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: submitData,//registerMerchant,
                  child: const Text('Register', style: TextStyle(color: Colors.white, fontSize: 20),),
                ),
              ),

            ],),
        ),
      ),

    );
  }
}
