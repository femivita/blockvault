import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ApprovedWithdrawalScreen extends StatefulWidget {
  const ApprovedWithdrawalScreen({super.key});

  @override
  State<ApprovedWithdrawalScreen> createState() => _ApprovedWithdrawalScreenState();
}

class _ApprovedWithdrawalScreenState extends State<ApprovedWithdrawalScreen> {
  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
        backgroundColor: Colors.grey[350],
        appBar: AppBar(
          title: Text(
            'Bitcoinvault',
            style: TextStyle(color: Color.fromRGBO(28, 34, 55, 1)),
          ),
          leading: hasDrawer
              ? IconButton(
                  icon: Icon(Icons.menu),
                  // 4. open the drawer if we have one
                  onPressed:
                      hasDrawer ? () => ancestorScaffold.openDrawer() : null,
                )
              : null,
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: Color.fromRGBO(28, 34, 55, 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, bottom: 50, top: 50),
              child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('withdrawal')
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    print(snapshot.data!.docs.map((e) => e.data()['withdrawal']));
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 700,
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? 900
                            : MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white),
                        child: Container(
                          height: 600,
                          width: ResponsiveWidget.isSmallScreen(context)
                              ? 900
                              : MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.white),
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Column(
                              children: [
                                Text(
                                  'Details',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Container(
                                  color: Color.fromRGBO(28, 34, 55, 1),
                                  height: 70,
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? 900
                                      : MediaQuery.of(context).size.width,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(20.0),
                                        child: Row(
                                          children: [
                                            Container(
                                              width: ResponsiveWidget
                                                      .isSmallScreen(context)
                                                  ? 200
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              child: Text(
                                                'Details',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: ResponsiveWidget
                                                      .isSmallScreen(context)
                                                  ? 200
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              child: Text(
                                                'Amount',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: ResponsiveWidget
                                                      .isSmallScreen(context)
                                                  ? 300
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              child: Text(
                                                'Email',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                            Container(
                                              width: ResponsiveWidget
                                                      .isSmallScreen(context)
                                                  ? 100
                                                  : MediaQuery.of(context)
                                                      .size
                                                      .width,
                                              child: Text(
                                                'Action',
                                                style: TextStyle(
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 550,
                                  width: ResponsiveWidget.isSmallScreen(context)
                                      ? 900
                                      : MediaQuery.of(context).size.width,
                                  child: ListView.builder(
                                      itemCount: snapshot.data!.docs.length,
                                      physics: AlwaysScrollableScrollPhysics(),
                                      itemBuilder: (context, index) {
                                        var data = List.from(snapshot
                                            .data!.docs[index]['withdrawal']);
                                        print('this list $data');
                                        return SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Column(
                                            // crossAxisAlignment:
                                            //     CrossAxisAlignment.start,
                                            children: data.map((element) {
                                              return Column(
                                                children: [
                                                  if (element['status'] == true)
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              20.0),
                                                      child: Row(
                                                        children: [
                                                          Container(
                                                            width: ResponsiveWidget
                                                                    .isSmallScreen(
                                                                        context)
                                                                ? 200
                                                                : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Text(
                                                                  '${element['firstName']} ${element['lastName']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Text(
                                                                  '${element['userName']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                                Text(
                                                                  '${element['email']}',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Container(
                                                            width: ResponsiveWidget
                                                                    .isSmallScreen(
                                                                        context)
                                                                ? 200
                                                                : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Text(
                                                              '\$${element['amount']}',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: ResponsiveWidget
                                                                    .isSmallScreen(
                                                                        context)
                                                                ? 300
                                                                : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Text(
                                                              element['email'],
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: ResponsiveWidget
                                                                    .isSmallScreen(
                                                                        context)
                                                                ? 100
                                                                : MediaQuery.of(
                                                                        context)
                                                                    .size
                                                                    .width,
                                                            child: Container(
                                                              width: 70,
                                                              height: 40,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .green,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              5)),
                                                              child: Center(
                                                                child: Text(
                                                                  'Approved',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .white),
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                ],
                                              );
                                            }).toList(),
                                          ),
                                        );
                                      }),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  } else {
                    return CircularProgressIndicator();
                  }
                },
              ),
            ),
          ],
        ));
  }
}