import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/dossier.dart';
import 'package:myapp/page-1/terapie.dart';
import 'fasthelp.dart';
import 'gruppi.dart';
import 'settings.dart';
import 'utils.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageScreen createState() => _HomePageScreen();
}

class _HomePageScreen extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double baseWidth = 390;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double fem = MediaQuery.of(context).size.width / screenWidth;
    double ffem = fem * 0.97;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff171796),
        centerTitle: true,
        bottom: PreferredSize(
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                'MyMedBook',
                style: TextStyle(
                  fontSize: 22.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          preferredSize: Size.fromHeight(30.0),
        ),
        leading: IconButton(
          icon: const Icon(Icons.settings),
          iconSize: 30.0,
          tooltip: 'Show Settings',
          color: Colors.white,
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SettingsScreen()),
            );
          },
        ),
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: const Icon(Icons.notifications),
            iconSize: 30.0,
            tooltip: 'Show Notifications',
            onPressed: () {
              // Add your notification logic here
            },
          ),
        ],
      ),
      backgroundColor: Color.fromARGB(224, 255, 255, 255),
      body: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Center(
              child: Container(
                // homepageDJK (1:3)
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xffffffff),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // autogroup1rwmwoy (Ay4WUUyfwfZqzowqJF1rwm)
                      padding: EdgeInsets.fromLTRB(
                          6 * fem, 15 * fem, 0 * fem, 76 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // homescreen59V (1:4)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 33.17 * fem),
                            width: 629 * fem,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  // topsliderCV1 (1:61)
                                  margin: EdgeInsets.fromLTRB(
                                    18 *
                                        MediaQuery.of(context)
                                            .textScaler
                                            .scale(1),
                                    0 *
                                        MediaQuery.of(context)
                                            .textScaler
                                            .scale(1),
                                    0 *
                                        MediaQuery.of(context)
                                            .textScaler
                                            .scale(1),
                                    32 *
                                        MediaQuery.of(context)
                                            .textScaler
                                            .scale(1),
                                  ),
                                  height: screenHeight * 0.055,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12 *
                                        MediaQuery.of(context)
                                            .textScaler
                                            .scale(1)),
                                  ),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      ClipRect(
                                        // dossierSnf (1:68)
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                            sigmaY: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xff7198d7),
                                              borderRadius:
                                                  BorderRadius.circular(15 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1)),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        DossierScreen(),
                                                  ),
                                                );
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Dossier',
                                                  style: TextStyle(
                                                    fontFamily: 'Epilogue',
                                                    fontSize: 17 *
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(0.9),
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.2941176471 *
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(1) /
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(1),
                                                    letterSpacing:
                                                        -0.4079999924 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler
                                                                .scale(1),
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12 *
                                            MediaQuery.of(context)
                                                .textScaler
                                                .scale(1),
                                      ),
                                      ClipRect(
                                        // terapiec4s (1:65)
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                            sigmaY: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.25,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0x8ef09e54),
                                              borderRadius:
                                                  BorderRadius.circular(15 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1)),
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        TerapieScreen(),
                                                  ),
                                                );
                                              },
                                              child: Center(
                                                child: Text(
                                                  'Terapie',
                                                  style: TextStyle(
                                                    fontFamily: 'Epilogue',
                                                    fontSize: 17 *
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(0.9),
                                                    fontWeight: FontWeight.w700,
                                                    height: 1.2941176471 *
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(1) /
                                                        MediaQuery.of(context)
                                                            .textScaler
                                                            .scale(1),
                                                    letterSpacing:
                                                        -0.4079999924 *
                                                            MediaQuery.of(
                                                                    context)
                                                                .textScaler
                                                                .scale(1),
                                                    color: Color(0xffffffff),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 12 *
                                            MediaQuery.of(context)
                                                .textScaler
                                                .scale(1),
                                      ),
                                      ClipRect(
                                        // diarioclinicoqyD (1:62)
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                            sigmaY: 10 *
                                                MediaQuery.of(context)
                                                    .textScaler
                                                    .scale(1),
                                          ),
                                          child: Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.3,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              color: Color(0xfffa97b8),
                                              borderRadius:
                                                  BorderRadius.circular(15 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1)),
                                            ),
                                            child: Center(
                                              child: Text(
                                                'Profilo Sanitario',
                                                style: TextStyle(
                                                  fontFamily: 'Epilogue',
                                                  fontSize: 13 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(0.93),
                                                  fontWeight: FontWeight.w900,
                                                  height: 1.2941176471 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1) /
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1),
                                                  letterSpacing: -0.4079999924 *
                                                      MediaQuery.of(context)
                                                          .textScaler
                                                          .scale(1),
                                                  color: Color(0xffffffff),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  // slidersuu (1:35)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 79 * fem),
                                  width: double.infinity,
                                  height: 176 * fem,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          // familymembersooZ (1:36)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 19 * fem, 0 * fem),
                                          width: 305 * fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // groupjBR (1:37)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Container(
                                                  width: 305 * fem,
                                                  height: 176 * fem,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            26 * fem),
                                                    gradient: LinearGradient(
                                                      begin: Alignment(-1, 1),
                                                      end: Alignment(1, -1),
                                                      colors: <Color>[
                                                        Color(0xff7e99b3),
                                                        Color(0xff7da1ee)
                                                      ],
                                                      stops: <double>[0, 1],
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x334a80f0),
                                                        offset: Offset(
                                                            0 * fem, 10 * fem),
                                                        blurRadius: 17.5 * fem,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    // autogroupdehyW5h (Ay4TaEUgiipuUrUnV8dehy)
                                                    child: SizedBox(
                                                      width: 305 * fem,
                                                      height: 176 * fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/auto-group-dehy.png',
                                                        width: 305 * fem,
                                                        height: 176 * fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse10xTV (1:43)
                                                left: 110 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-10-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse11TQF (1:44)
                                                left: 82 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-13-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse12AZZ (1:45)
                                                left: 54 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-12-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse13hZV (1:46)
                                                left: 26 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-10-bg.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // familymembersE3d (1:47)
                                                left: 24 * fem,
                                                top: 24 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 172 * fem,
                                                    height: 28 * fem,
                                                    child: Text(
                                                      'Family members',
                                                      style: TextStyle(
                                                        fontFamily: 'Epilogue',
                                                        fontSize: 22 * ffem,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.2727272727 *
                                                            ffem /
                                                            fem,
                                                        letterSpacing:
                                                            0.8000000119 * fem,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // nuovoprogetto171JpB (1:48)
                                                left: 188 * fem,
                                                top: 98 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 104 * fem,
                                                    height: 78 * fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/nuovo-progetto17-1.png',
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          // familymembersooZ (1:36)
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              0 * fem, 19 * fem, 0 * fem),
                                          width: 305 * fem,
                                          height: double.infinity,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                // groupjBR (1:37)
                                                left: 0 * fem,
                                                top: 0 * fem,
                                                child: Container(
                                                  width: 305 * fem,
                                                  height: 176 * fem,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            26 * fem),
                                                    gradient: LinearGradient(
                                                      begin: Alignment(-1, 1),
                                                      end: Alignment(1, -1),
                                                      colors: <Color>[
                                                        Color(0x87d663ff),
                                                        Color(0xa5430053)
                                                      ],
                                                      stops: <double>[0, 1],
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color:
                                                            Color(0x3ffb7090),
                                                        offset: Offset(
                                                            0 * fem, 10 * fem),
                                                        blurRadius: 17.5 * fem,
                                                      ),
                                                    ],
                                                  ),
                                                  child: Center(
                                                    // autogroupdehyW5h (Ay4TaEUgiipuUrUnV8dehy)
                                                    child: SizedBox(
                                                      width: 305 * fem,
                                                      height: 176 * fem,
                                                      child: Image.asset(
                                                        'assets/page-1/images/auto-group-dehy.png',
                                                        width: 305 * fem,
                                                        height: 176 * fem,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse10xTV (1:43)
                                                left: 110 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-10.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse11TQF (1:44)
                                                left: 82 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-13.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse12AZZ (1:45)
                                                left: 54 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-12.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // ellipse13hZV (1:46)
                                                left: 26 * fem,
                                                top: 137 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 22 * fem,
                                                    height: 21 * fem,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    13.5 * fem),
                                                        border: Border.all(
                                                            color: Color(
                                                                0xffeff1f5)),
                                                        image: DecorationImage(
                                                          fit: BoxFit.cover,
                                                          image: AssetImage(
                                                            'assets/page-1/images/ellipse-10.png',
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // familymembersE3d (1:47)
                                                left: 24 * fem,
                                                top: 24 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 172 * fem,
                                                    height: 28 * fem,
                                                    child: Text(
                                                      'MyMedNet',
                                                      style: TextStyle(
                                                        fontFamily: 'Epilogue',
                                                        fontSize: 22 * ffem,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 1.2727272727 *
                                                            ffem /
                                                            fem,
                                                        letterSpacing:
                                                            0.8000000119 * fem,
                                                        color:
                                                            Color(0xffffffff),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                // nuovoprogetto171JpB (1:48)
                                                left: 188 * fem,
                                                top: 98 * fem,
                                                child: Align(
                                                  child: SizedBox(
                                                    width: 104 * fem,
                                                    height: 78 * fem,
                                                    child: Image.asset(
                                                      'assets/page-1/images/mymednet.png',
                                                      fit: BoxFit.cover,
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
                                Container(
                                  // bottonicenterAju (1:5)

                                  width: screenWidth,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          child: SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 8.0),
                                                  width: screenWidth * 0.42,
                                                  height: 106.12 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/gruppi.png',
                                                    width: 311.66 * fem,
                                                    height: 212.24 * fem,
                                                  ),
                                                ),
                                                Container(
                                                  width: screenWidth * 0.42,
                                                  height: 106.12 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/contatti.png',
                                                    width: 311.66 * fem,
                                                    height: 212.24 * fem,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                                width: 19.74 *
                                                    fem), // Space between the two columns
                                            Column(
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      bottom: 8.0),
                                                  width: screenWidth * 0.42,
                                                  height: 106.12 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/teleasistenza.png',
                                                    width: 311.66 * fem,
                                                    height: 212.24 * fem,
                                                  ),
                                                ),
                                                Container(
                                                  width: screenWidth * 0.42,
                                                  height: 106.12 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/teleasistenza.png',
                                                    width: 311.66 * fem,
                                                    height: 212.24 * fem,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
      bottomNavigationBar: Container(
        color: Color.fromARGB(255, 255, 255, 255),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05,
            vertical: MediaQuery.of(context).size.height * 0.03,
          ),
          child: GNav(
            backgroundColor: Color.fromARGB(102, 255, 255, 255),
            color: Colors.black,
            activeColor: Colors.white,
            tabBackgroundColor: Color.fromARGB(255, 23, 23, 135),
            iconSize: MediaQuery.of(context).size.width *
                0.08, // adjust the size of the icons
            gap: MediaQuery.of(context).size.width *
                0.03, // adjust the gap between the icons
            onTabChange: (index) {
              print(index);
              switch (index) {
                case 0:
                  Navigator.pushNamed(context, '/calendar');
                  break;
                case 1:
                  // Navigate to Home page
                  Navigator.pushNamed(context, '/home');
                  break;
                case 2:
                  // Handle Chat tab
                  break;
              }
            },
            padding: EdgeInsets.all(
                MediaQuery.of(context).size.width * 0.03), // adjust the padding
            selectedIndex: 1, // Set the index for the "Home" tab
            tabs: const [
              GButton(icon: Icons.calendar_month, text: 'Calendar'),
              GButton(icon: Icons.home, text: 'Home'),
              GButton(icon: Icons.dashboard, text: 'Bacheca'),
              GButton(icon: Icons.message_rounded, text: 'Chat'),
            ],
          ),
        ),
      ),
    );
  }
}
