import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:myapp/page-1/nuovogruppo.dart';
import 'gestionegruppo.dart';
import 'homepage.dart';
import 'utils.dart';
import 'data/circledataservice.dart';

class GroupPage extends StatefulWidget {
  @override
  _GroupPageState createState() => _GroupPageState();
}

class _GroupPageState extends State<GroupPage> {
  final CirclesDataService circlesDataService = CirclesDataService();
  List<Circles> circles = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      final circlesList = await circlesDataService.fetchPkAndNameOnly(context);
      setState(() {
        circles = circlesList;
      });
    } catch (e) {
      print('Error fetching Gruppi data: $e');
    }
  }

  Future<void> fetchPkAndNameOnly() async {
    try {
      final circlesList = await circlesDataService.fetchPkAndNameOnly(context);
      setState(() {
        circles = circlesList;
        for (var circle in circles) {
          print('Dossier PK: ${circle.pk}');
          print('Name: ${circle.name}');
          print('\n'); // Add a new line for better readability
          // ... print other attributes as needed
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
          backgroundColor: Color(0xffb5c638),
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
                // gruppiGUB (1:3)
                padding:
                    EdgeInsets.fromLTRB(0 * fem, 0 * fem, 0 * fem, 39 * fem),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xfff9f9f9),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      // gruppibodyx1Z (1:76)
                      margin: EdgeInsets.fromLTRB(
                          0 * fem, 0 * fem, 0 * fem, 24 * fem),
                      width: double.infinity,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            // gruppiUVh (1:62)
                            margin: EdgeInsets.fromLTRB(
                                12 * fem, 0 * fem, 0 * fem, 10 * fem),
                            child: Text(
                              'GRUPPI\n',
                              style: SafeGoogleFont(
                                'Abel',
                                fontSize: 32 * ffem,
                                fontWeight: FontWeight.w400,
                                height: 1.275 * ffem / fem,
                                color: Color(0xff000000),
                              ),
                            ),
                          ),
                          Container(
                            // rectangle24Lno (1:25)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 0 * fem),
                            width: double.infinity,
                            height: 11 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xff5675a5),
                            ),
                          ),
                          Container(
                            // gruppisection4yh (1:77)
                            margin: EdgeInsets.fromLTRB(
                                12 * fem, 0 * fem, 14 * fem, 301 * fem),
                            width: double.infinity,
                            child: Stack(
                              children: [
                                //here are my circles to fetch with list view
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Container(
                                      // gestionegruppoC4K (1:78)
                                      margin: EdgeInsets.fromLTRB(
                                          0 * fem, 0 * fem, 123 * fem, 2 * fem),
                                      height: 56 * fem,
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Container(
                                            // autogroupipsfmmd (5ciDqjFev6wMr68bRJipSF)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 21 * fem, 0 * fem),
                                            padding: EdgeInsets.fromLTRB(
                                                13 * fem,
                                                7 * fem,
                                                12 * fem,
                                                10 * fem),
                                            height: double.infinity,
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Color(0xff000000)),
                                              color: Color(0x44c0d100),
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      6 * fem),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Color(0x3f000000),
                                                  offset:
                                                      Offset(5 * fem, 8 * fem),
                                                  blurRadius: 0 * fem,
                                                ),
                                              ],
                                            ),
                                            child: GestureDetector(
                                              onTap: () {
                                                // Navigate to the desired page when the image is clicked
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        GruppoGestione(),
                                                  ),
                                                );
                                              },
                                              child: Center(
                                                child: SizedBox(
                                                  width: 42 * fem,
                                                  height: 39 * fem,
                                                  child: Image.asset(
                                                    'assets/page-1/images/kisspng-computer-icons-scalable-vector-graphics-clip-art-p-action-gear-cog-preferences-service-options-5b631755d61188-3.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Container(
                                            // autogroupuxomrgb (5ciDvybuo1hNE6geaauxoM)
                                            margin: EdgeInsets.fromLTRB(0 * fem,
                                                0 * fem, 0 * fem, 1 * fem),
                                            width: 100 * fem,
                                            height: 49 * fem,
                                            child: Stack(
                                              children: [
                                                Positioned(
                                                  // gruppo1z27 (1:34)
                                                  left: 0 * fem,
                                                  top: 0 * fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 78 * fem,
                                                      height: 34 * fem,
                                                      child: Text(
                                                        'Gruppo 1',
                                                        style: SafeGoogleFont(
                                                          'Akshar',
                                                          fontSize: 24 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height:
                                                              1.38 * ffem / fem,
                                                          color:
                                                              Color(0xff000000),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                  // gestiscigruppo2zP (1:37)
                                                  left: 0 * fem,
                                                  top: 28 * fem,
                                                  child: Align(
                                                    child: SizedBox(
                                                      width: 100 * fem,
                                                      height: 21 * fem,
                                                      child: Text(
                                                        'Gestisci Gruppo ',
                                                        style: SafeGoogleFont(
                                                          'Abel',
                                                          fontSize: 16 * ffem,
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          height: 1.275 *
                                                              ffem /
                                                              fem,
                                                          color:
                                                              Color(0xff898989),
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
                                Positioned(
                                  top: 10 * fem,
                                  right: 10 * fem,
                                  child: Stack(
                                    children: [
                                      Icon(
                                        Icons.notifications,
                                        color:
                                            Color.fromARGB(255, 150, 146, 146),
                                        size: 30 * fem,
                                      ),
                                      Positioned(
                                        right: 0,
                                        child: Container(
                                          padding: EdgeInsets.all(2 * fem),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.red,
                                          ),
                                          child: Text(
                                            '1',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12 * fem,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Positioned(
                                  top: 10 * fem,
                                  right: 50 * fem,
                                  child: Icon(
                                    Icons.chat,
                                    color: Color.fromARGB(255, 150, 146, 146),
                                    size: 30 * fem,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            // rectangle29jfq (1:26)
                            margin: EdgeInsets.fromLTRB(
                                0 * fem, 0 * fem, 0 * fem, 5 * fem),
                            width: double.infinity,
                            height: 21 * fem,
                            decoration: BoxDecoration(
                              color: Color(0xff5675a5),
                            ),
                          ),
                          Container(
                            // bottonesX9 (1:81)
                            margin: EdgeInsets.fromLTRB(
                                53 * fem, 0 * fem, 83 * fem, 0 * fem),
                            width: double.infinity,
                            height: 90 * fem,
                            child: Stack(
                              children: [
                                Positioned(
                                  // nuovoprogetto11zrf (1:29)
                                  left: 0 * fem,
                                  top: 0 * fem,
                                  child: Align(
                                    child: SizedBox(
                                      width: 59 * fem,
                                      height: 54 * fem,
                                      child: Image.asset(
                                        'assets/page-1/images/nuovo-progetto1-1.png',
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  // buttonuyd (1:60)
                                  left: 43 * fem,
                                  top: 45 * fem,
                                  child: GestureDetector(
                                    onTap: () {
                                      // Navigate to the desired page when the image is clicked
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                GruppoNuovo()), // Replace YourImage6Page with the actual page you want to navigate to
                                      );
                                    },
                                    child: Container(
                                      width: 196 * fem,
                                      height: 45 * fem,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xff7f7f7f)),
                                        color: Color(0xea5675a5),
                                        borderRadius:
                                            BorderRadius.circular(32 * fem),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Color(0xffffffff),
                                            offset: Offset(-5 * fem, -5 * fem),
                                            blurRadius: 5 * fem,
                                          ),
                                        ],
                                      ),
                                      child: Center(
                                        child: Center(
                                          child: Text(
                                            'Crea gruppo ',
                                            textAlign: TextAlign.center,
                                            style: SafeGoogleFont(
                                              'Alatsi',
                                              fontSize: 23 * ffem,
                                              fontWeight: FontWeight.w400,
                                              height: 1.7391304348 * ffem / fem,
                                              color: Color(0xffffffff),
                                            ),
                                          ),
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
                                  margin: EdgeInsets.fromLTRB(
                                      22 * fem, 0 * fem, 37 * fem, 14 * fem),
                                  width: double.infinity,
                                  height: 74 * fem,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(57 * fem),
                                    border:
                                        Border.all(color: Color(0xff171796)),
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
            )));
  }
}
