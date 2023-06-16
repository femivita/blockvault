import 'package:blockvault_investment_flutter/database/database.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/responsive.dart';
import 'package:flutter/material.dart';

class ReduceFundScreen extends StatefulWidget {
  const ReduceFundScreen({super.key});

  @override
  State<ReduceFundScreen> createState() => _ReduceFundScreenState();
}

class _ReduceFundScreenState extends State<ReduceFundScreen> {
  String? dropdownGenderValue;
  TextEditingController amountController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  bool isLoading = false;

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
              child: Container(
                width: ResponsiveWidget.isSmallScreen(context)
                    ? 900
                    : MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Reduce Fund',
                        style: TextStyle(color: Colors.black),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Divider(
                        color: Colors.black,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Enter email",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                        style: const TextStyle(
                            color: Color.fromRGBO(39, 39, 39, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: const Color.fromRGBO(237, 239, 245, 1),
                              ),
                            ),
                            hintText: "Enter email",
                            hintStyle: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey),
                            filled: true,
                            fillColor: Colors.white),
                        controller: emailController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Select wallet type",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 56,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: const Color.fromRGBO(255, 255, 255, 1),
                          borderRadius: BorderRadius.circular(3),
                          border: Border.all(
                            color: Colors.black,
                          ),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: dropdownGenderValue,
                                icon: Icon(
                                  Icons.keyboard_arrow_down_outlined,
                                  color: Color.fromRGBO(159, 159, 159, 1),
                                ),
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                                hint: Text(
                                  'Select wallet type',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.grey),
                                ),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    dropdownGenderValue = newValue!;
                                  });
                                },
                                items: <String>[
                                  'Profit',
                                  'Wallet',
                                ].map<DropdownMenuItem<String>>((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(
                                      value,
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Color.fromRGBO(39, 39, 39, 1)),
                                    ),
                                  );
                                }).toList(),
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Enter Amount",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        cursorColor: const Color.fromRGBO(39, 39, 39, 1),
                        style: const TextStyle(
                            color: Color.fromRGBO(39, 39, 39, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: const Color.fromRGBO(237, 239, 245, 1),
                            ),
                          ),
                          hintText: "\$",
                          hintStyle: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey),
                        ),
                        controller: amountController,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () async {
                          setState(() {
                            isLoading = true;
                          });
                          var database = DataBase();
                          dropdownGenderValue == 'Wallet'
                              ? database.subtractBalance(emailController.text,
                                  int.parse(amountController.text))
                              : database.substractProfitBalance(
                                  emailController.text,
                                  int.parse(amountController.text));
                          setState(() {
                            isLoading = false;
                          });
                        },
                        child: Container(
                          width: 120,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(
                            child: Text(
                              isLoading == true ? 'Loading...' : "Reduce Fund",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
