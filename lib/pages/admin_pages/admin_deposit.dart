import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminDepositScreen extends StatefulWidget {
  const AdminDepositScreen({super.key});

  @override
  State<AdminDepositScreen> createState() => _AdminDepositScreenState();
}

class _AdminDepositScreenState extends State<AdminDepositScreen> {
  @override
  Widget build(BuildContext context) {
    final ancestorScaffold = Scaffold.maybeOf(context);
    // 2. check if it has a drawer
    final hasDrawer = ancestorScaffold != null && ancestorScaffold.hasDrawer;
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Bitcoinvault'),
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
              color: Colors.blue,
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.only(left: 20, right: 20, bottom: 50, top: 50),
            child: StreamBuilder(
              stream:
                  FirebaseFirestore.instance.collection('deposit').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  print(snapshot.data!.docs);
                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      height: 700,
                      width: ResponsiveWidget.isSmallScreen(context)
                          ? 800
                          : MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.white),
                      child: Container(
                        height: 600,
                        width: ResponsiveWidget.isSmallScreen(context)
                            ? 800
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
                                color: Colors.blue,
                                height: 70,
                                width: ResponsiveWidget.isSmallScreen(context)
                                    ? 800
                                    : MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(20.0),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Container(
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 300
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
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
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
                                            width:
                                                ResponsiveWidget.isSmallScreen(
                                                        context)
                                                    ? 100
                                                    : MediaQuery.of(context)
                                                        .size
                                                        .width,
                                            child: Text(
                                              'Role',
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
                                    ? 800
                                    : MediaQuery.of(context).size.width,
                                child: ListView.builder(
                                    itemCount: snapshot.data!.docs.length,
                                    physics: AlwaysScrollableScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      var data =
                                          snapshot.data!.docs[index]['deposit'];
                                      return SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: ResponsiveWidget
                                                            .isSmallScreen(
                                                                context)
                                                        ? 300
                                                        : MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Name: ${int.parse(data[index]['transactionId'])}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          'Username: {snapshot.data!.docs[index]}',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                        Text(
                                                          'Wallet:',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.black),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    width: ResponsiveWidget
                                                            .isSmallScreen(
                                                                context)
                                                        ? 300
                                                        : MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Text(
                                                      '{snapshot.data!.docs[index]}',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                  Container(
                                                    width: ResponsiveWidget
                                                            .isSmallScreen(
                                                                context)
                                                        ? 100
                                                        : MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    child: Text(
                                                      'user',
                                                      style: TextStyle(
                                                          color: Colors.black),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
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
      ),
    );
  }
}