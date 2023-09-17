import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store_checker/store_checker.dart';
import 'package:zest_betting_tips/admin.dart';
import 'package:zest_betting_tips/homepage.dart';
import 'package:get_storage/get_storage.dart';
import 'package:zest_betting_tips/premium_tips.dart';
import 'package:zest_betting_tips/sign_in_screen.dart';
import 'package:zest_betting_tips/welcome.dart';
import 'package:freerasp/freerasp.dart';

import 'autcheck.dart';

const apiKey = "AIzaSyCnOv0A7yf3X1DThIYqF28ZOlkj13sJOzo";
const projectID = "pure-cd74e";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // ThreatCallback(
  //   onAppIntegrity: () => exit(0),
  //   onObfuscationIssues: () => exit(0),
  //   onDebug: () => exit(0),
  //   onDeviceBinding: () => exit(0),
  //   onDeviceID: () => exit(0),
  //   onHooks: () => exit(0),
  //   onPasscode: () => exit(0),
  //   onPrivilegedAccess: () => exit(0),
  //   onSecureHardwareNotAvailable: () => exit(0),
  //   onSimulator: () => exit(0),
  //   onUnofficialStore: () => exit(0),
  // );

  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyCnOv0A7yf3X1DThIYqF28ZOlkj13sJOzo",
      authDomain: "pure-cd74e.firebaseapp.com",
      projectId: "pure-cd74e",
      storageBucket: "pure-cd74e.appspot.com",
      messagingSenderId: "959704722972",
      appId: "1:959704722972:web:4a434e1f94ad6f44b9b9d9",
      measurementId: "G-BT8WLDEQ9H",
    ),
  );

  runApp(MyApp());

  var myFile = new File('pubspec.yaml');
// // assuming a utf8 encoding
//   var numberOfLines = myFile.readAsLinesSync().length;
//   print(numberOfLines);
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String source = "";

  final box = GetStorage();

  // @override
  // void initState() {
  //   super.initState();
  //   checkInstallationSource();
  //   checkcrack();
  // }

  // Future<void> checkInstallationSource() async {
  //   Source installationSource = await StoreChecker.getSource;
  //   setState(() {
  //     switch (installationSource) {
  //       case Source.IS_INSTALLED_FROM_PLAY_STORE:
  //         source = "PlayStore";
  //         break;
  //       case Source.IS_INSTALLED_FROM_PLAY_PACKAGE_INSTALLER:
  //         source = "Google Package installer";
  //         break;
  //       case Source.IS_INSTALLED_FROM_LOCAL_SOURCE:
  //         source = "LocalSource";
  //         break;
  //       case Source.IS_INSTALLED_FROM_AMAZON_APP_STORE:
  //         source = "Amazon Store";
  //         break;
  //       case Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY:
  //         source = "Huawei App Gallery";
  //         break;
  //       case Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE:
  //         source = "Samsung Galaxy Store";
  //         break;
  //       case Source.IS_INSTALLED_FROM_SAMSUNG_SMART_SWITCH_MOBILE:
  //         source = "Samsung Smart Switch Mobile";
  //         break;
  //       case Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS:
  //         source = "Xiaomi Get Apps";
  //         break;
  //       case Source.IS_INSTALLED_FROM_OPPO_APP_MARKET:
  //         source = "Oppo App Market";
  //         break;
  //       case Source.IS_INSTALLED_FROM_VIVO_APP_STORE:
  //         source = "Vivo App Store";
  //         break;
  //       case Source.IS_INSTALLED_FROM_RU_STORE:
  //         source = "RuStore";
  //         break;
  //       case Source.IS_INSTALLED_FROM_OTHER_SOURCE:
  //         source = "Other Source";
  //         break;
  //       case Source.IS_INSTALLED_FROM_APP_STORE:
  //         source = "App Store";
  //         break;
  //       case Source.IS_INSTALLED_FROM_TEST_FLIGHT:
  //         source = "Test Flight";
  //         break;
  //       case Source.UNKNOWN:
  //         source = "Unknown Source";
  //         break;
  //     }
  //   });
  // }

  // void checkcrack() async {
  //   if (source == "PlayStore") {
  //     // print("You are Real");

  //     box.write("checker", source);
  //   } else {
  //     box.write("checker", "noData");
  //     // print("You are Fake");
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Installation Source Checker',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Welcome());
  }
}

// class InstallationSourcePage extends StatefulWidget {
//   @override
//   _InstallationSourcePageState createState() => _InstallationSourcePageState();
// }

// class _InstallationSourcePageState extends State<InstallationSourcePage> {
//   String source = "";

//   final box = GetStorage();

//   @override
//   void initState() {
//     super.initState();
//     checkInstallationSource();
//     print(source);
//     checkcrack();
//   }

//   Future<void> checkInstallationSource() async {
//     Source installationSource = await StoreChecker.getSource;
//     setState(() {
//       switch (installationSource) {
//         case Source.IS_INSTALLED_FROM_PLAY_STORE:
//           source = "PlayStore";
//           break;
//         case Source.IS_INSTALLED_FROM_PLAY_PACKAGE_INSTALLER:
//           source = "Google Package installer";
//           break;
//         case Source.IS_INSTALLED_FROM_LOCAL_SOURCE:
//           source = "LocalSource";
//           break;
//         case Source.IS_INSTALLED_FROM_AMAZON_APP_STORE:
//           source = "Amazon Store";
//           break;
//         case Source.IS_INSTALLED_FROM_HUAWEI_APP_GALLERY:
//           source = "Huawei App Gallery";
//           break;
//         case Source.IS_INSTALLED_FROM_SAMSUNG_GALAXY_STORE:
//           source = "Samsung Galaxy Store";
//           break;
//         case Source.IS_INSTALLED_FROM_SAMSUNG_SMART_SWITCH_MOBILE:
//           source = "Samsung Smart Switch Mobile";
//           break;
//         case Source.IS_INSTALLED_FROM_XIAOMI_GET_APPS:
//           source = "Xiaomi Get Apps";
//           break;
//         case Source.IS_INSTALLED_FROM_OPPO_APP_MARKET:
//           source = "Oppo App Market";
//           break;
//         case Source.IS_INSTALLED_FROM_VIVO_APP_STORE:
//           source = "Vivo App Store";
//           break;
//         case Source.IS_INSTALLED_FROM_RU_STORE:
//           source = "RuStore";
//           break;
//         case Source.IS_INSTALLED_FROM_OTHER_SOURCE:
//           source = "Other Source";
//           break;
//         case Source.IS_INSTALLED_FROM_APP_STORE:
//           source = "App Store";
//           break;
//         case Source.IS_INSTALLED_FROM_TEST_FLIGHT:
//           source = "Test Flight";
//           break;
//         case Source.UNKNOWN:
//           source = "Unknown Source";
//           break;
//       }
//     });
//   }

//   void checkcrack() async {
//     if (source == "PlayStore") {
//       print("No");

//       box.write("checker", "source");
//     } else {
//       box.write("checker", "noData");
//       print("ok");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Installation Source Checker'),
//       ),
//       body: Center(
//         child: Text(
//           'This app was installed from: $source',
//           style: TextStyle(fontSize: 18),
//         ),
//       ),
//     );
//   }
// }
