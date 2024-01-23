import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/utils.dart';
import 'data/dossierdataservice.dart';
import 'dossiergestione.dart';
import 'dossiernuovo.dart';
import 'homepage.dart';

class DossierScreen extends StatefulWidget {
  @override
  _DossierScreenState createState() => _DossierScreenState();
}

class _DossierScreenState extends State<DossierScreen> {
  final DossierDataService dossierDataService = DossierDataService();
  List<Dossier> dossiers = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final dossierList = await dossierDataService.fetchDossier(context);
      setState(() {
        dossiers = dossierList;
      });
    } catch (e) {
      print('Error fetching dossier data: $e');
    }
  }

  Future<void> fetchTherapies() async {
    try {
      final dossierList = await dossierDataService.fetchDossier(context);
      setState(() {
        dossiers = dossierList;
        for (var dossier in dossiers) {
          print('Dossier PK: ${dossier.pk}');
          print('Name: ${dossier.name}');
          print('Meta Info: ${dossier.metaInfo}');
          // ... print other attributes as needed
          print('\n'); // Add a new line for better readability
        }
      });
    } catch (e) {
      print('Error fetching dossier data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    double baseWidth = 375;
    double fem = MediaQuery.of(context).size.width / baseWidth;
    double ffem = fem * 0.97;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 43, 114, 177),
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
        backgroundColor: Color.fromARGB(224, 255, 255, 255),
        body: SingleChildScrollView(
          physics: NeverScrollableScrollPhysics(),
          child: Container(
            width: double.infinity,
            child: Container(
              // dossierQZH (1:7)
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xfff9f9f9),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    // autogroupodmdoFy (QwMbJdNdYEeU9BvJr9odMd)
                    padding: EdgeInsets.fromLTRB(
                        0 * fem, 17 * fem, 0 * fem, 33 * fem),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                          // searchaddWgB (1:142)
                          margin: EdgeInsets.fromLTRB(
                              6.58 * fem, 0 * fem, 6.54 * fem, 0 * fem),
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                // autogroupxy63eGb (QwMcNgRZx6z3Am9scWxy63)
                                margin: EdgeInsets.fromLTRB(
                                    0 * fem, 0 * fem, 6.13 * fem, 16 * fem),
                                width: 271.92 * fem,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      // dossieraZZ (1:30)
                                      margin: EdgeInsets.fromLTRB(12.27 * fem,
                                          0 * fem, 0 * fem, 9 * fem),
                                      child: Text(
                                        'DOSSIER',
                                        style: SafeGoogleFont(
                                          'Abel',
                                          fontSize: 25 * ffem,
                                          fontWeight: FontWeight.w400,
                                          height: 1.275 * ffem / fem,
                                          color: Color(0xff6d6e72),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      // searchbar3CF (1:23)
                                      padding: EdgeInsets.fromLTRB(
                                          15 * fem, 0 * fem, 15 * fem, 0 * fem),
                                      width: double.infinity,
                                      height: 45 * fem,
                                      decoration: BoxDecoration(
                                        color: Color(0xd3dbdbdb),
                                        borderRadius:
                                            BorderRadius.circular(28 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0x3f000000),
                                            offset: Offset(0 * fem, 4 * fem),
                                            blurRadius: 2 * fem,
                                          ),
                                        ],
                                      ),
                                      child: Container(
                                        // autogroupguovvG3 (QwMcWvgq3Xtcudjg1PGUoV)
                                        padding: EdgeInsets.fromLTRB(0 * fem,
                                            12 * fem, 122.92 * fem, 12 * fem),
                                        width: 204.92 * fem,
                                        height: 48 * fem,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              // statelayerq87 (1:25)
                                              margin: EdgeInsets.fromLTRB(
                                                  0 * fem,
                                                  0.49 * fem,
                                                  15.51 * fem,
                                                  0 * fem),
                                              width: 17.49 * fem,
                                              height: 17.49 * fem,
                                              child: Image.asset(
                                                'assets/page-1/images/state-layer.png',
                                                width: 17.49 * fem,
                                                height: 17.49 * fem,
                                              ),
                                            ),
                                            Text(
                                              // supportingtextLaf (1:28)
                                              'Cerca ',
                                              style: SafeGoogleFont(
                                                'Roboto',
                                                fontSize: 16 * ffem,
                                                fontWeight: FontWeight.w400,
                                                height: 1.5 * ffem / fem,
                                                letterSpacing: 0.5 * fem,
                                                color: Color(0xff3d3d3d),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          DossierNuovoScreen(),
                                    ),
                                  );
                                },
                                child: Container(
                                  // autogroupgnjpT9V (QwMcgAvRYUBPmTfPUnGnJP)
                                  margin: EdgeInsets.fromLTRB(
                                      0 * fem, 25 * fem, 0 * fem, 0 * fem),
                                  padding: EdgeInsets.fromLTRB(25.56 * fem,
                                      25 * fem, 25.56 * fem, 20 * fem),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        'assets/page-1/images/nuovo-progetto10-6-bg.png',
                                      ),
                                    ),
                                  ),
                                  child: Center(
                                    // addbuttoncircle594345j71 (1:139)
                                    child: SizedBox(
                                      width: 32.71 * fem,
                                      height: 32 * fem,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(16 * fem),
                                        child: Image.asset(
                                          'assets/page-1/images/add-button-circle59434-5.png',
                                          fit: BoxFit.cover,
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
                          // dossiercartelleDXy (1:88)
                          margin: EdgeInsets.fromLTRB(
                              15 * fem, 0 * fem, 8 * fem, 373 * fem),
                          width: double.infinity,
                          height: 104 * fem,
                          child: Container(
                            // dossiersfolder9gX (1:141)
                            padding: EdgeInsets.fromLTRB(
                                12 * fem, 9 * fem, 24 * fem, 9 * fem),
                            width: double.infinity,
                            height: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xffffffff),
                              borderRadius: BorderRadius.circular(8 * fem),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x14000000),
                                  offset: Offset(0 * fem, 0 * fem),
                                  blurRadius: 10 * fem,
                                ),
                                BoxShadow(
                                  color: Color(0x3f000000),
                                  offset: Offset(0 * fem, 4 * fem),
                                  blurRadius: 2 * fem,
                                ),
                              ],
                            ),
                            // foreach per ogni dossier
                            child: ListView.builder(
                              itemCount: dossiers.length,
                              itemBuilder: (context, index) {
                                Dossier dossier = dossiers[index];

                                return Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 1 * fem, 14 * fem, 0 * fem),
                                      width: 82 * fem,
                                      height: 77 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/nuovo-progetto10-2.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 5 * fem, 85 * fem, 0 * fem),
                                      width: 100 * fem,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                4 * fem,
                                                0 * fem,
                                                4 * fem,
                                                11 * fem),
                                            width: double.infinity,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      0 * fem,
                                                      6 * fem),
                                                  child: Text(
                                                    dossier
                                                        .name, // Display dossier name
                                                    style: SafeGoogleFont(
                                                      'Rubik',
                                                      fontSize: 18 * ffem,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      height:
                                                          1.185 * ffem / fem,
                                                      letterSpacing:
                                                          -0.3000000119 * fem,
                                                      color: Color(0xff333333),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  dossier.metaInfo ??
                                                      '', // Display dossier metaInfo or an empty string if null
                                                  style: SafeGoogleFont(
                                                    'Rubik',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w300,
                                                    height: 1.185 * ffem / fem,
                                                    letterSpacing:
                                                        -0.3000000119 * fem,
                                                    color: Color(0xff677294),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Container(
                                            width: double.infinity,
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      0 * fem,
                                                      0 * fem,
                                                      3 * fem,
                                                      0 * fem),
                                                  width: 23 * fem,
                                                  height: 23 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/add-button-circle59434-1.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Text(
                                                  'Aggiungi file',
                                                  style: SafeGoogleFont(
                                                    'Rubik',
                                                    fontSize: 14 * ffem,
                                                    fontWeight: FontWeight.w300,
                                                    height: 1.185 * ffem / fem,
                                                    letterSpacing:
                                                        -0.3000000119 * fem,
                                                    color: Color(0xff677294),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      DossierGestioneScreen(),
                                                ),
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.fromLTRB(
                                                  7 * fem,
                                                  0 * fem,
                                                  0 * fem,
                                                  31 * fem),
                                              width: 28 * fem,
                                              height: 28 * fem,
                                              child: Image.asset(
                                                'assets/page-1/images/pngegg-1.png',
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            width: 27 * fem,
                                            height: 27 * fem,
                                            child: Image.asset(
                                              'assets/page-1/images/delete10336423-1.png',
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                        ),
                        Container(
                          // bottombarbLY (202:48)
                          margin: EdgeInsets.fromLTRB(
                              54 * fem, 0 * fem, 0 * fem, 0 * fem),
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
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to the desired page when the image is clicked
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage()), // Replace YourCalendarPage with the actual page you want to navigate to
                                    );
                                  },
                                  child: Image.asset(
                                    'assets/page-1/images/bx-calendar.png',
                                    width: 39.75 * fem,
                                    height: 40 * fem,
                                  ),
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
                                      child: GestureDetector(
                                        onTap: () {
                                          // Navigate to the desired page when the container is clicked
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    HomePage()), // Replace YourNuovoProgettoPage with the actual page you want to navigate to
                                          );
                                        },
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
                                child: GestureDetector(
                                  onTap: () {
                                    // Navigate to the desired page when the image is clicked
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage()), // Replace YourImage6Page with the actual page you want to navigate to
                                    );
                                  },
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
}
