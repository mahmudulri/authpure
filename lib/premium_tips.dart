import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class PremiumTips extends StatefulWidget {
  String? mylength;
  PremiumTips({
    super.key,
    this.mylength,
  });

  @override
  State<PremiumTips> createState() => _PremiumTipsState();
}

class _PremiumTipsState extends State<PremiumTips> {
  var isLoading = false.obs;

  var tokenloading = false.obs;
  String? serverTokenRange;

  @override
  void initState() {
    fetchDate();
    print("print from" + widget.mylength.toString());
    // fetchTokenrange();
    // mycustomerCheck();

    super.initState();
  }

  var maintime;
  var currentDate;

  bool yourareok = false;

  var maintoken;

  // fetchTokenrange() async {
  //   FirebaseFirestore.instance
  //       .collection('tokenValue')
  //       .doc("mytoken")
  //       .get()
  //       .then((DocumentSnapshot documentSnapshot) {
  //     if (documentSnapshot.exists) {
  //       setState(() {
  //         maintoken = documentSnapshot.data();
  //         serverTokenRange = maintoken["tokenRange"];
  //         print("from fetch " + serverTokenRange.toString());
  //       });
  //     } else {
  //       print('Document does not exist on the database');
  //     }
  //   });
  // }

  // mycustomerCheck() async {
  //   print("from check  " + serverTokenRange.toString());
  //   if (widget.mylength == "hasan") {
  //     print("ok");
  //   } else {
  //     print("no ok");
  //   }
  // }

  fetchDate() {
    isLoading(true);
    print(isLoading);

    FirebaseFirestore.instance
        .collection('PremiumTipsDate')
        .doc("currentDate")
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        setState(() {
          maintime = documentSnapshot.data();
          currentDate = maintime["date"];
        });
      } else {
        print('Document does not exist on the database');
      }
    });
    isLoading(false);
    print(isLoading);
  }

  @override
  Widget build(BuildContext context) {
    final screeHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xff1F2F38),
          title: Text(
            "Premium Tips",
            style: GoogleFonts.lalezar(
              fontSize: screeHeight * 0.038,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        body: Obx(() => isLoading.value == false
            ? widget.mylength == "paid"
                ? Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0xff1F2F38),
                          Color(0xff1B262C),
                        ],
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          flex: 1,
                          child: Container(
                            width: screenWidth,
                            color: Color(0xff0F4C75).withOpacity(0.09),
                            child: Center(
                              child: currentDate == null
                                  ? Text(
                                      "",
                                      style: GoogleFonts.lalezar(
                                        fontSize: screeHeight * 0.025,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    )
                                  : Text(
                                      currentDate.toString(),
                                      style: GoogleFonts.lalezar(
                                        fontSize: screeHeight * 0.025,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 20,
                          child: Container(
                            color: Color(0xff0F4C75).withOpacity(0.09),
                            child: StreamBuilder(
                              stream: FirebaseFirestore.instance
                                  .collection("PremiumTips")
                                  .snapshots(),
                              builder: (context,
                                  AsyncSnapshot<QuerySnapshot> snapshot) {
                                if (snapshot.hasData) {
                                  return ListView.builder(
                                    physics: BouncingScrollPhysics(),
                                    itemCount: snapshot.data!.docs.length,
                                    itemBuilder: (context, i) {
                                      var finalData = snapshot.data!.docs[i];
                                      return tokenloading == false
                                          ? Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: screeHeight * 0.018,
                                                horizontal: 20,
                                              ),
                                              child: SizedBox(
                                                height: screeHeight * 0.130,
                                                width: screenWidth,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: Color(0xff1B262C),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Expanded(
                                                        flex: 2,
                                                        child: Container(
                                                          child: Column(
                                                            children: [
                                                              Text(
                                                                finalData[
                                                                    "legue"],
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      screeHeight *
                                                                          0.020,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                              Divider(
                                                                color: Colors
                                                                    .white,
                                                                thickness: 1,
                                                                endIndent: 10,
                                                                indent: 10,
                                                              ),
                                                              Text(
                                                                finalData[
                                                                    "team"],
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      screeHeight *
                                                                          0.018,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      Expanded(
                                                        flex: 1,
                                                        child: Row(
                                                          children: [
                                                            SizedBox(
                                                              width: 15,
                                                            ),
                                                            Expanded(
                                                              flex: 3,
                                                              child: Text(
                                                                finalData[
                                                                    "score1"],
                                                                style:
                                                                    GoogleFonts
                                                                        .lato(
                                                                  fontSize:
                                                                      screeHeight *
                                                                          0.020,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              flex: 1,
                                                              child: Container(
                                                                width: 200,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .only(
                                                                    bottomLeft:
                                                                        Radius.circular(
                                                                            10),
                                                                    topLeft: Radius
                                                                        .circular(
                                                                            10),
                                                                  ),
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                                child: Center(
                                                                  child: Text(
                                                                    finalData[
                                                                        "score2"],
                                                                    style:
                                                                        GoogleFonts
                                                                            .lato(
                                                                      fontSize:
                                                                          screeHeight *
                                                                              0.020,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Text("No Data");
                                    },
                                  );
                                } else {
                                  return Center(
                                      child: CircularProgressIndicator());
                                }
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                : Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        widget.mylength == "paid"
                            ? Text("Updating Data")
                            : Text("Cracked"),
                        widget.mylength == "paid"
                            ? CircularProgressIndicator()
                            : Text("😈 👿"),
                      ],
                    ),
                  )
            : Text("asdfsd")));
  }
}
