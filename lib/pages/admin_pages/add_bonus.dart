import 'package:flutter/material.dart';

class AddBonusScreen extends StatefulWidget {
  const AddBonusScreen({super.key});

  @override
  State<AddBonusScreen> createState() => _AddBonusScreenState();
}

class _AddBonusScreenState extends State<AddBonusScreen> {
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
    );
  }
}