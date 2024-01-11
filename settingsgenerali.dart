import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/utils.dart';
import 'package:shimmer/shimmer.dart';
import 'data/profiledataservice.dart';

class SettingsGeneraliScreen extends StatefulWidget {
  @override
  _SettingsGeneraliScreen createState() => _SettingsGeneraliScreen();
}

class _SettingsGeneraliScreen extends State<SettingsGeneraliScreen> {
  final ProfileDataService profileDataService = ProfileDataService();
  late Profile profileData; // Use 'late' to indicate non-null

  @override
  void initState() {
    super.initState();
    fetchProfileData(context);
  }

  Future<void> fetchProfileData(context) async {
    try {
      final profile = await profileDataService.fetchProfileData(context);
      setState(() {
        profileData = profile;
      });
    } catch (e) {
      print('Error fetching Tdee data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;

    final ProfileDataService profileDataService = ProfileDataService();
    Profile? profileData;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff171796),
          centerTitle: true, // Center horizontally
          bottom: PreferredSize(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                padding: const EdgeInsets.only(
                    bottom: 8.0), // Adjust the padding as needed
                child: Text(
                  'MyMedBook',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white), // Adjust the style as needed
                ),
              ),
            ),
            preferredSize:
                Size.fromHeight(30.0), // Adjust the preferredSize as needed
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              tooltip: 'Show Snackbar',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('This is a snackbar')),
                );
              },
            ),
          ],
        ),
        backgroundColor: Color.fromARGB(133, 255, 255, 255),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Container(
              // settingsgeneralisYp (290:628)
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xb7ffffff),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupnavsKhe (XB7PqAkat7vjGHWsRLnaVS)
                    padding: EdgeInsets.fromLTRB(
                        12 * fem, 7 * fem, 18 * fem, 15 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          // autogroupccjyqfz (XB7NWHo1xa5edE2EL8CCJY)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 15 * fem, 14 * fem),
                          width: 298 * fem,
                          height: 60 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // nuovoprogetto21xEp (290:644)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 58 * fem,
                                    height: 60 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/nuovo-progetto2-1-9Yx.png',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // informazionigenerali4oe (298:74)
                                left: 90 * fem,
                                top: 18 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 189 * fem,
                                    height: 30 * fem,
                                    child: Text(
                                      'Informazioni generali   ',
                                      style: SafeGoogleFont(
                                        'Abel',
                                        fontSize: 22 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3636363636 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle36xe8 (298:75)
                                left: 62 * fem,
                                top: 15 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 230 * fem,
                                    height: 32 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15 * fem),
                                        border: Border.all(
                                            color: Color(0x00ffffff)),
                                        color: Color(0x11000000),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // group3639n (304:251)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 2.13 * fem),
                          width: double.infinity,
                          height: 44.87 * fem,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15 * fem),
                          ),
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle39MwA (304:252)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 345 * fem,
                                    height: 39.98 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15 * fem),
                                        border: Border.all(
                                            color: Color(0x00a31c23)),
                                        color: Color(0xfff4f5fb),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 20 * fem,
                                top: 3.263671875 * fem,
                                child: FutureBuilder<Profile>(
                                  future: profileDataService
                                      .fetchProfileData(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      // Shimmer effect
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Text(
                                          'Loading...',
                                          style: TextStyle(
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3636363636 * ffem / fem,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      // Display an error message
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final profileData = snapshot.data!;
                                      final nameText =
                                          profileData.firstName != null
                                              ? '${profileData.firstName!}'
                                              : 'Inserisci il tuo nome';

                                      return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 279.5 * fem,
                                              height: 30 * fem,
                                              child: Text(
                                                'Nome: $nameText',
                                                style: SafeGoogleFont(
                                                  'Abel',
                                                  fontSize: 22 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      1.3636363636 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                // Handle the onTap event, e.g., show an alert dialog
                                                _showAddWeightDialog(
                                                    context, 'name');
                                              },
                                              child: Icon(
                                                  Icons.add_circle_outline,
                                                  color: Colors.blue),
                                            ),
                                          ]);
                                    } else {
                                      // No data available
                                      return Text('No data available');
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogrouphhm68Ke (XB7NexDFUJ4eLALALiHhm6)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 6.61 * fem),
                          width: double.infinity,
                          height: 179.45 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // rectangle14FfA (290:639)
                                left: 0 * fem,
                                top: 46 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 345 * fem,
                                    height: 40 * fem,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(15 * fem),
                                        border: Border.all(
                                            color: Color(0x00a31c23)),
                                        color: Color(0xfff4f5fb),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                // rectangle37k68 (304:230)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Align(
                                  child: SizedBox(
                                    width: 345 * fem,
                                    height: 132 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/rectangle-37.png',
                                      width: 345 * fem,
                                      height: 132 * fem,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 19 * fem,
                                top: 5 * fem,
                                child: FutureBuilder<Profile>(
                                  future: profileDataService
                                      .fetchProfileData(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      // Shimmer effect
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Text(
                                          'Loading...',
                                          style: TextStyle(
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3636363636 * ffem / fem,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      // Display an error message
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final profileData = snapshot.data!;
                                      final lastNameText =
                                          profileData.lastName != null
                                              ? '${profileData.lastName!}'
                                              : 'Inserisci il tuo cognome';

                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 281 * fem,
                                            height: 30 * fem,
                                            child: Text(
                                              'Cognome: $lastNameText',
                                              style: SafeGoogleFont(
                                                'Abel',
                                                fontSize: 22 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3636363636 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Handle the onTap event, e.g., show an alert dialog
                                              _showAddWeightDialog(
                                                  context, 'surname');
                                            },
                                            child: Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      );
                                    } else {
                                      // No data available
                                      return Text('No data available');
                                    }
                                  },
                                ),
                              ),
                              Positioned(
                                left: 20 * fem,
                                top: 50 * fem,
                                child: FutureBuilder<Profile>(
                                  future: profileDataService
                                      .fetchProfileData(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      // Shimmer effect
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Text(
                                          'Loading...',
                                          style: TextStyle(
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3636363636 * ffem / fem,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      // Display an error message
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final profileData = snapshot.data!;
                                      final sexText = profileData.sex != null
                                          ? '${profileData.sex!}'
                                          : 'Inserisci il tuo sesso';

                                      return Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: 281 * fem,
                                            height: 30 * fem,
                                            child: Text(
                                              'Sesso: $sexText',
                                              style: SafeGoogleFont(
                                                'Abel',
                                                fontSize: 22 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height:
                                                    1.3636363636 * ffem / fem,
                                                color: Color(0xff000000),
                                              ),
                                            ),
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              // Handle the onTap event, e.g., show an alert dialog
                                              _showAddWeightDialog(
                                                  context, 'sex');
                                            },
                                            child: Icon(
                                                Icons.add_circle_outline,
                                                color: Colors.blue),
                                          ),
                                        ],
                                      );
                                    } else {
                                      // No data available
                                      return Text('No data available');
                                    }
                                  },
                                ),
                              ),
                              Positioned(
                                // group35eqi (304:239)
                                left: 0 * fem,
                                top: 91.4936523438 * fem,
                                child: Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0 * fem, 0 * fem, 0 * fem, 0 * fem),
                                  width: 345 * fem,
                                  height: 82.96 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(15 * fem),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(20 * fem,
                                            5.53 * fem, 20 * fem, 4.45 * fem),
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Color(0x00a31c23)),
                                          color: Color(0xfff4f5fb),
                                          borderRadius:
                                              BorderRadius.circular(15 * fem),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Color(0x3f000000),
                                              offset: Offset(0 * fem, 4 * fem),
                                              blurRadius: 2 * fem,
                                            ),
                                          ],
                                        ),
                                        child: FutureBuilder<Profile>(
                                          future: profileDataService
                                              .fetchProfileData(context),
                                          builder: (context, snapshot) {
                                            if (snapshot.connectionState ==
                                                ConnectionState.waiting) {
                                              // Shimmer effect
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey[300]!,
                                                highlightColor:
                                                    Colors.grey[100]!,
                                                child: Text(
                                                  'Loading...',
                                                  style: TextStyle(
                                                    fontSize: 22 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3636363636 *
                                                        ffem /
                                                        fem,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              );
                                            } else if (snapshot.hasError) {
                                              // Display an error message
                                              return Text(
                                                  'Error: ${snapshot.error}');
                                            } else if (snapshot.hasData) {
                                              final profileData =
                                                  snapshot.data!;
                                              final birthdayText = profileData
                                                          .birthday !=
                                                      null
                                                  ? '${profileData.birthday!}'
                                                  : 'Inserisci la tua data di nascita';

                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    'Data di Nascita: $birthdayText',
                                                    style: SafeGoogleFont(
                                                      'Abel',
                                                      fontSize: 22 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.3636363636 *
                                                          ffem /
                                                          fem,
                                                      color: Color(0xff000000),
                                                    ),
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Handle the onTap event, e.g., show an alert dialog
                                                      _showAddWeightDialog(
                                                          context, 'birthday');
                                                    },
                                                    child: Icon(
                                                        Icons
                                                            .add_circle_outline,
                                                        color: Colors.blue),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              // No data available
                                              return Text('No data available');
                                            }
                                          },
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          margin: EdgeInsets.fromLTRB(0 * fem,
                                              5 * fem, 0 * fem, 0 * fem),
                                          // autogroupnngkGcC (XB7NrSt6dcxrD8nBjoNnGk)
                                          padding: EdgeInsets.fromLTRB(20 * fem,
                                              5.53 * fem, 20 * fem, 4.45 * fem),
                                          width: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0x00a31c23)),
                                            color: Color(0xfff4f5fb),
                                            borderRadius:
                                                BorderRadius.circular(15 * fem),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                offset:
                                                    Offset(0 * fem, 4 * fem),
                                                blurRadius: 2 * fem,
                                              ),
                                            ],
                                          ),
                                          child: FutureBuilder<Profile>(
                                            future: profileDataService
                                                .fetchProfileData(context),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.waiting) {
                                                // Shimmer effect
                                                return Shimmer.fromColors(
                                                  baseColor: Colors.grey[300]!,
                                                  highlightColor:
                                                      Colors.grey[100]!,
                                                  child: Text(
                                                    'Loading...',
                                                    style: TextStyle(
                                                      fontSize: 22 * ffem,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.3636363636 *
                                                          ffem /
                                                          fem,
                                                      color: Colors.grey,
                                                    ),
                                                  ),
                                                );
                                              } else if (snapshot.hasError) {
                                                // Display an error message
                                                return Text(
                                                    'Error: ${snapshot.error}');
                                              } else if (snapshot.hasData) {
                                                final profileData =
                                                    snapshot.data!;
                                                final emailText = profileData
                                                            .email !=
                                                        null
                                                    ? '${profileData.email!}'
                                                    : 'Inserisci il tuo indirizzo email';

                                                return Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      'E-mail: $emailText',
                                                      style: SafeGoogleFont(
                                                        'Abel',
                                                        fontSize: 22 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.3636363636 *
                                                            ffem /
                                                            fem,
                                                        color:
                                                            Color(0xff000000),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        // Handle the onTap event, e.g., show an alert dialog
                                                        _showAddWeightDialog(
                                                            context, 'email');
                                                      },
                                                      child: Icon(
                                                          Icons
                                                              .add_circle_outline,
                                                          color: Colors.blue),
                                                    ),
                                                  ],
                                                );
                                              } else {
                                                // No data available
                                                return Text(
                                                    'No data available');
                                              }
                                            },
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          // autogroupdxk888c (XB7NwCFBon2m2ffHMpDXk8)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 10.74 * fem),
                          width: double.infinity,
                          height: 84.2 * fem,
                          child: Stack(
                            children: [
                              Positioned(
                                // group34Fj2 (304:238)
                                left: 0 * fem,
                                top: 0 * fem,
                                child: Container(
                                  width: 345 * fem,
                                  height: 45.32 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(15 * fem),
                                  ),
                                  child: Stack(
                                    children: [
                                      Positioned(
                                        // rectangle39Bsa (304:232)
                                        left: 0 * fem,
                                        top: 0 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 345 * fem,
                                            height: 39.98 * fem,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15 * fem),
                                                border: Border.all(
                                                    color: Color(0x00a31c23)),
                                                color: Color(0xfff4f5fb),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Color(0x3f000000),
                                                    offset: Offset(
                                                        0 * fem, 4 * fem),
                                                    blurRadius: 2 * fem,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        // domiciliogZS (304:236)
                                        left: 20 * fem,
                                        top: 3.7114257812 * fem,
                                        child: Align(
                                          child: SizedBox(
                                            width: 304.5 * fem,
                                            height: 30 * fem,
                                            child: FutureBuilder<Profile>(
                                              future: profileDataService
                                                  .fetchProfileData(context),
                                              builder: (context, snapshot) {
                                                if (snapshot.connectionState ==
                                                    ConnectionState.waiting) {
                                                  // Shimmer effect
                                                  return Shimmer.fromColors(
                                                    baseColor:
                                                        Colors.grey[300]!,
                                                    highlightColor:
                                                        Colors.grey[100]!,
                                                    child: Text(
                                                      'Loading...',
                                                      style: TextStyle(
                                                        fontSize: 22 * ffem,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        height: 1.3636363636 *
                                                            ffem /
                                                            fem,
                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  );
                                                } else if (snapshot.hasError) {
                                                  // Display an error message
                                                  return Text(
                                                      'Error: ${snapshot.error}');
                                                } else if (snapshot.hasData) {
                                                  final profileData =
                                                      snapshot.data!;
                                                  final addressText = profileData
                                                              .address !=
                                                          null
                                                      ? '${profileData.address!}'
                                                      : 'Inserisci il tuo domicilio';

                                                  return Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        'Domicilio: $addressText',
                                                        style: SafeGoogleFont(
                                                          'Abel',
                                                          fontSize: 22 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.3636363636 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle the onTap event, e.g., show an alert dialog
                                                          _showAddWeightDialog(
                                                              context,
                                                              'adress');
                                                        },
                                                        child: Icon(
                                                            Icons
                                                                .add_circle_outline,
                                                            color: Colors.blue),
                                                      ),
                                                    ],
                                                  );
                                                } else {
                                                  // No data available
                                                  return Text(
                                                      'No data available');
                                                }
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Positioned(
                                left: 0 * fem,
                                top: 44.2175292969 * fem,
                                child: FutureBuilder<Profile>(
                                  future: profileDataService
                                      .fetchProfileData(context),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      // Shimmer effect
                                      return Shimmer.fromColors(
                                        baseColor: Colors.grey[300]!,
                                        highlightColor: Colors.grey[100]!,
                                        child: Container(
                                          width: 345 * fem,
                                          height: 39.98 * fem,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15 * fem),
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                19 * fem,
                                                3.72 * fem,
                                                19 * fem,
                                                6.26 * fem),
                                            width: double.infinity,
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0x00a31c23)),
                                              color: Color(0xfff4f5fb),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      15 * fem),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x3f000000),
                                                  offset:
                                                      Offset(0 * fem, 4 * fem),
                                                  blurRadius: 2 * fem,
                                                ),
                                              ],
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'Altezza: Loading...',
                                                  style: SafeGoogleFont(
                                                    'Abel',
                                                    fontSize: 22 * ffem,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.3636363636 *
                                                        ffem /
                                                        fem,
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    _showAddWeightDialog(
                                                        context, 'height');
                                                  },
                                                  child: Icon(
                                                      Icons.add_circle_outline,
                                                      color: Colors.blue),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    } else if (snapshot.hasError) {
                                      // Display an error message
                                      return Text('Error: ${snapshot.error}');
                                    } else if (snapshot.hasData) {
                                      final profileData = snapshot.data!;
                                      final heightText = profileData.height !=
                                              null
                                          ? '${profileData.height!.toStringAsFixed(2)}'
                                          : 'Inserisci il tuo altezza';

                                      return Container(
                                        width: 345 * fem,
                                        height: 39.98 * fem,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(15 * fem),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(19 * fem,
                                              3.72 * fem, 19 * fem, 6.26 * fem),
                                          width: double.infinity,
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Color(0x00a31c23)),
                                            color: Color(0xfff4f5fb),
                                            borderRadius:
                                                BorderRadius.circular(15 * fem),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Color(0x3f000000),
                                                offset:
                                                    Offset(0 * fem, 4 * fem),
                                                blurRadius: 2 * fem,
                                              ),
                                            ],
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Altezza: $heightText',
                                                style: SafeGoogleFont(
                                                  'Abel',
                                                  fontSize: 22 * ffem,
                                                  fontWeight: FontWeight.w400,
                                                  height:
                                                      1.3636363636 * ffem / fem,
                                                  color: Color(0xff000000),
                                                ),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  // Handle the onTap event, e.g., show an alert dialog
                                                  _showAddWeightDialog(
                                                      context, 'height');
                                                },
                                                child: Icon(
                                                    Icons.add_circle_outline,
                                                    color: Colors.blue),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } else {
                                      // No data available
                                      return Text('No data available');
                                    }
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 5 * fem),
                          child: FutureBuilder<Profile>(
                            future:
                                profileDataService.fetchProfileData(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Shimmer effect
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        19 * fem, 1 * fem, 19 * fem, 1 * fem),
                                    width: double.infinity,
                                    height: 40 * fem,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0x00a31c23)),
                                      color: Color(0xfff4f5fb),
                                      borderRadius:
                                          BorderRadius.circular(15 * fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0 * fem, 4 * fem),
                                          blurRadius: 2 * fem,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Peso: Loading...',
                                          style: SafeGoogleFont(
                                            'Abel',
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3636363636 * ffem / fem,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        Icon(Icons.add_circle_outline,
                                            color: Colors.blue),
                                      ],
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                // Display an error message
                                return Text(
                                    'Failed to load profile data. Please try again.');
                              } else if (snapshot.hasData) {
                                final profileData = snapshot.data!;
                                final weight = profileData.weight;

                                return GestureDetector(
                                  onTap: () {
                                    _showAddWeightDialog(context, 'weight');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.fromLTRB(
                                        19 * fem, 1 * fem, 19 * fem, 1 * fem),
                                    width: double.infinity,
                                    height: 40 * fem,
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0x00a31c23)),
                                      color: Color(0xfff4f5fb),
                                      borderRadius:
                                          BorderRadius.circular(15 * fem),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Color(0x3f000000),
                                          offset: Offset(0 * fem, 4 * fem),
                                          blurRadius: 2 * fem,
                                        ),
                                      ],
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Peso: ${weight == null ? "Inserisci il tuo peso" : weight?.toStringAsFixed(2)}',
                                          style: SafeGoogleFont(
                                            'Abel',
                                            fontSize: 22 * ffem,
                                            fontWeight: FontWeight.w400,
                                            height: 1.3636363636 * ffem / fem,
                                            color: Color(0xff000000),
                                          ),
                                        ),
                                        Icon(Icons.add_circle_outline,
                                            color: Colors.blue),
                                      ],
                                    ),
                                  ),
                                );
                              } else {
                                // No data available
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 6 * fem),
                          padding: EdgeInsets.fromLTRB(
                              17 * fem, 3 * fem, 17 * fem, 3 * fem),
                          width: double.infinity,
                          height: 40 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x00a31c23)),
                            color: Color(0xfff4f5fb),
                            borderRadius: BorderRadius.circular(15 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: FutureBuilder<Profile>(
                            future:
                                profileDataService.fetchProfileData(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Shimmer effect
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontSize: 22 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3636363636 * ffem / fem,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                // Display an error message
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final profileData = snapshot.data!;
                                final bmiText = profileData.bmi != null
                                    ? '${profileData.bmi!}'
                                    : 'Inserisci il tuo BMI';

                                return Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'BMI: $bmiText',
                                      style: SafeGoogleFont(
                                        'Abel',
                                        fontSize: 22 * ffem,
                                        fontWeight: FontWeight.w400,
                                        height: 1.3636363636 * ffem / fem,
                                        color: Color(0xff000000),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        // Handle the onTap event, e.g., show an alert dialog
                                        _showAddWeightDialog(context, 'bmi');
                                      },
                                      child: Icon(Icons.add_circle_outline,
                                          color: Colors.blue),
                                    ),
                                  ],
                                );
                              } else {
                                // No data available
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                        Container(
                          // autogroupywj41n4 (XB7PFSDnxGmFy5gEXyYwJ4)
                          margin: EdgeInsets.fromLTRB(
                              0 * fem, 0 * fem, 0 * fem, 40 * fem),
                          padding: EdgeInsets.fromLTRB(
                              17 * fem, 3 * fem, 17 * fem, 3 * fem),
                          width: double.infinity,
                          height: 40 * fem,
                          decoration: BoxDecoration(
                            border: Border.all(color: Color(0x00a31c23)),
                            color: Color(0xfff4f5fb),
                            borderRadius: BorderRadius.circular(15 * fem),
                            boxShadow: [
                              BoxShadow(
                                color: Color(0x3f000000),
                                offset: Offset(0 * fem, 4 * fem),
                                blurRadius: 2 * fem,
                              ),
                            ],
                          ),
                          child: FutureBuilder<Profile>(
                            future:
                                profileDataService.fetchProfileData(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                // Shimmer effect
                                return Shimmer.fromColors(
                                  baseColor: Colors.grey[300]!,
                                  highlightColor: Colors.grey[100]!,
                                  child: Text(
                                    'Loading...',
                                    style: TextStyle(
                                      fontSize: 22 * ffem,
                                      fontWeight: FontWeight.w400,
                                      height: 1.3636363636 * ffem / fem,
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              } else if (snapshot.hasError) {
                                // Display an error message
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasError) {
                                // Display an error message
                                return Text('Error: ${snapshot.error}');
                              } else if (snapshot.hasData) {
                                final profileData = snapshot.data!;
                                final phoneNumberText =
                                    profileData.phoneNumber != null
                                        ? '${profileData.phoneNumber!}'
                                        : 'Inserisci il tuo numero di telefono';

                                return Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Telefono: $phoneNumberText',
                                        style: SafeGoogleFont(
                                          'Abel',
                                          fontSize: 22 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.3636363636 * ffem / fem,
                                          color: Color(0xff000000),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          // Handle the onTap event, e.g., show an alert dialog
                                          _showAddWeightDialog(
                                              context, 'phone');
                                        },
                                        child: Icon(Icons.add_circle_outline,
                                            color: Colors.blue),
                                      ),
                                    ]);
                              } else {
                                // No data available
                                return Text('No data available');
                              }
                            },
                          ),
                        ),
                        Container(
                          // bottombarbLY (202:48)
                          margin: EdgeInsets.fromLTRB(
                              40 * fem, 0 * fem, 0 * fem, 0 * fem),
                          padding: EdgeInsets.fromLTRB(
                              6.63 * fem, 0 * fem, 0 * fem, 0 * fem),
                          width: double.infinity,
                          height: 98 * fem,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                // bxcalendartaY (202:51)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 21.63 * fem, 20 * fem),
                                width: 39.75 * fem,
                                height: 40 * fem,
                                child: Image.asset(
                                  'assets/page-1/images/bx-calendar.png',
                                  width: 39.75 * fem,
                                  height: 40 * fem,
                                ),
                              ),
                              Container(
                                // autogrouppjhaoBi (QAswB9BXYCwryhDkcVpJha)
                                width: 138 * fem,
                                height: double.infinity,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      // nuovoprogetto34wHv (202:55)
                                      margin: EdgeInsets.fromLTRB(22 * fem,
                                          0 * fem, 37 * fem, 14 * fem),
                                      width: double.infinity,
                                      height: 74 * fem,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(57 * fem),
                                        border: Border.all(
                                            color: Color(0xff171796)),
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                            'assets/page-1/images/nuovo-progetto-3-4-bg.png',
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                // autogroupgd3rDWL (QAswLJavkgcxF7CeAMGD3r)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 20 * fem, 0 * fem, 35 * fem),
                                height: double.infinity,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: AssetImage(
                                      'assets/page-1/images/image-3-bg-N6G.png',
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color(0x3f000000),
                                      offset: Offset(0 * fem, 4 * fem),
                                      blurRadius: 2 * fem,
                                    ),
                                  ],
                                ),
                                child: Center(
                                  // image6WVS (202:54)
                                  child: SizedBox(
                                    width: 60 * fem,
                                    height: 43 * fem,
                                    child: Image.asset(
                                      'assets/page-1/images/image-6.png',
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
                ],
              ),
            ),
          ),
        ));
  }

  void _showAddWeightDialog(BuildContext context, String dataType) {
    String placeholder = '';

    switch (dataType) {
      case 'name':
        placeholder = 'Inserisci il tuo nome';
        break;
      case 'surname':
        placeholder = 'Inserisci il tuo cognome';
        break;
      case 'sex':
        placeholder = 'Inserisci il tuo sesso';
        break;
      case 'birthday':
        placeholder = 'Inserisci il tuo data di nascita';
        break;
      case 'email':
        placeholder = 'Inserisci il tuo email';
        break;
      case 'adress':
        placeholder = 'Inserisci il tuo domicilio';
        break;
      case 'height':
        placeholder = 'Inserisci il tuo altezza';
        break;
      case 'weight':
        placeholder = 'Inserisci il tuo peso';
        break;
      case 'bmi':
        placeholder = 'Inserisci il tuo BMI';
        break;
      case 'phone':
        placeholder = 'Inserisci il tuo numero di telefono';
        break;
      default:
        placeholder = 'Inserisci Dato';
        break;
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Informazioni di Utente'),
          content: Container(
            height: 100,
            width: 150, // Adjust the height as needed
            child: Column(
              children: [
                TextField(
                  keyboardType: dataType == 'phone'
                      ? TextInputType.phone
                      : TextInputType.number,
                  decoration: InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: placeholder,
                  ),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Perform the action based on dataType
                // You can access the entered data using the controller of the TextField
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}
