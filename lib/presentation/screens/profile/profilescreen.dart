// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
//
// class ProfileController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//
//   @override
//   void onInit() {
//     // Retrieve initial values (you can fetch from a service or shared preferences)
//     nameController.text = "Name";
//     contactController.text = "Contact NO";
//     super.onInit();
//   }
//
//   void updateProfile() {
//     // Implement logic to update the profile (save to server or local storage)
//     String name = nameController.text;
//     String contact = contactController.text;
//     // Add your logic to update the profile with 'name' and 'contact'
//     print("Updated profile: Name - $name, Contact - $contact");
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colormanager.darkPrimary,
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               // Save the updated profile when the save button is pressed
//               profileController.updateProfile();
//               // Show a snackbar or perform any other action on save
//               Get.snackbar('Profile Updated', 'Your profile has been updated!');
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Name:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: profileController.nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 40,
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Contact Number:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: profileController.contactController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your contact number',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 40,
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Save the updated profile when the save button is pressed
//                 profileController.updateProfile();
//                 // Show a snackbar or perform any other action on save
//                 Get.snackbar('Profile Updated', 'Your profile has been updated!');
//               },
//               child: Center(child: Text('Submit', style: TextStyle(color: Colors.black),)),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
//



// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
//
// class ProfileController extends GetxController {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController contactController = TextEditingController();
//
//   @override
//   void onInit() {
//     // Retrieve initial values (you can fetch from a service or shared preferences)
//     nameController.text = "Name";
//     contactController.text = "Contact NO";
//     super.onInit();
//   }
//
//   void updateProfile() {
//     // Implement logic to update the profile (save to server or local storage)
//     String name = nameController.text;
//     String contact = contactController.text;
//     // Add your logic to update the profile with 'name' and 'contact'
//     print("Updated profile: Name - $name, Contact - $contact");
//   }
// }
//
// class ProfileScreen extends StatelessWidget {
//   final ProfileController profileController = Get.put(ProfileController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colormanager.darkPrimary,
//         title: Text('Profile'),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.save),
//             onPressed: () {
//               // Save the updated profile when the save button is pressed
//               profileController.updateProfile();
//               // Show a snackbar or perform any other action on save
//               Get.snackbar('Profile Updated', 'Your profile has been updated!');
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(
//               'Name:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: profileController.nameController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 40,
//                   child: IconButton(
//                     icon: Icon(
//                       Icons.edit,
//                       color: Colors.grey,
//                     ),
//                     onPressed: () {
//                       // Save the edited name when the edit icon is pressed
//                       profileController.updateProfile();
//                       // Show a snackbar or perform any other action on save
//                       Get.snackbar('Profile Updated', 'Your profile has been updated!');
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Contact Number:',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     controller: profileController.contactController,
//                     decoration: InputDecoration(
//                       hintText: 'Enter your contact number',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   width: 40,
//                   child: Icon(
//                     Icons.edit,
//                     color: Colors.grey,
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () {
//                 // Save the updated profile when the save button is pressed
//                 profileController.updateProfile();
//                 // Show a snackbar or perform any other action on save
//                 Get.snackbar('Profile Updated', 'Your profile has been updated!');
//               },
//               child: Center(child: Text('Submit', style: TextStyle(color: Colors.black))),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:alhamdulillah_courier_service_merchant/presentation/screens/resources/color_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactController = TextEditingController();

  @override
  void onInit() async {
    // Retrieve initial values from SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    nameController.text = prefs.getString('name') ?? "Name";
    contactController.text = prefs.getString('contact') ?? "Contact NO";
    super.onInit();
  }

  void updateProfile() async {
    // Save updated profile to SharedPreferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', nameController.text);
    prefs.setString('contact', contactController.text);

    // Add your logic to update the profile with 'name' and 'contact'
    print("Updated profile: Name - ${nameController.text}, Contact - ${contactController.text}");
  }
}

class ProfileScreen extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colormanager.darkPrimary,
        title: Text('Profile'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              // Save the updated profile when the save button is pressed
              profileController.updateProfile();
              // Show a snackbar or perform any other action on save
              Get.snackbar('Profile Updated', 'Your profile has been updated!');
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Name:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: profileController.nameController,
                    decoration: InputDecoration(
                      hintText: 'Enter your name',
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  child: IconButton(
                    icon: Icon(
                      Icons.edit,
                      color: Colors.grey,
                    ),
                    onPressed: () {
                      // Save the edited name when the edit icon is pressed
                      profileController.updateProfile();
                      // Show a snackbar or perform any other action on save
                      Get.snackbar('Profile Updated', 'Your profile has been updated!');
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Contact Number:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Expanded(
                  child: TextFormField(
                    controller: profileController.contactController,
                    decoration: InputDecoration(
                      hintText: 'Enter your contact number',
                    ),
                  ),
                ),
                Container(
                  width: 40,
                  child: Icon(
                    Icons.edit,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                // Save the updated profile when the save button is pressed
                profileController.updateProfile();
                // Show a snackbar or perform any other action on save
                Get.snackbar('Profile Updated', 'Your profile has been updated!');
              },
              child: Center(child: Text('Submit', style: TextStyle(color: Colors.black))),
            ),
          ],
        ),
      ),
    );
  }
}
