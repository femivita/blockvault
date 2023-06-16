import 'package:blockvault_investment_flutter/controllers/auth_controller.dart';
import 'package:blockvault_investment_flutter/dashboard.dart';
import 'package:blockvault_investment_flutter/pages/authentication/admin/admin_app_menu.dart';
import 'package:blockvault_investment_flutter/pages/authentication/landingpage.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/app_menu.dart';
import 'package:blockvault_investment_flutter/pages/authentication/widgets/split_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';

class Root extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => (controller.user != null) ? MyApp() : LandingPage());
  }
}

class MyApp extends ConsumerStatefulWidget {
  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {

  @override
  Widget build(BuildContext context) {
    // 3. watch selectedPageBuilderProvider
    final selectedPageBuilder = ref.watch(selectedPageBuilderProvider);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      // just return `FirstPage` for now. We'll change this later
      home: SplitView(
        menu: AppMenu(),
        content: selectedPageBuilder(context),
      ),
    );
  }
}
