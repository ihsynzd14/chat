ListView.builder(
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
                            )
