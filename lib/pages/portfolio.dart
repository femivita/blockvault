import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class PortFolioPage extends StatefulWidget {
  const PortFolioPage({super.key});

  @override
  State<PortFolioPage> createState() => _PortFolioPageState();
}

class _PortFolioPageState extends State<PortFolioPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(
            "Portfolio"
          )
        ],
      ),
    );
  }
}