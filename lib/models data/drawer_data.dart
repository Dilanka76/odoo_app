import 'package:flutter/material.dart';
import 'package:odoo_app/models/drawer_model.dart';

class LeftDrawerData {
  List <LeftDrawerModel> leftDrawerDataList =[
    LeftDrawerModel(itemName: "Sales", Icon:Icons.book),
    LeftDrawerModel(itemName: "Orders", Icon:Icons.offline_pin_rounded),
    LeftDrawerModel(itemName: "To Invoice", Icon:Icons.insert_invitation),
    LeftDrawerModel(itemName: "Products", Icon:Icons.production_quantity_limits),
    LeftDrawerModel(itemName: "Reporting", Icon:Icons.report),
    LeftDrawerModel(itemName: "Configuration", Icon:Icons.confirmation_number),
  ];
}

class RightDrawerData {
  List <LeftDrawerModel> rightDrawerDataList =[
    LeftDrawerModel(itemName: "Documentaion", Icon:Icons.document_scanner_sharp),
    LeftDrawerModel(itemName: "Support", Icon:Icons.support),
    LeftDrawerModel(itemName: "Shortcuts", Icon:Icons.support),
    LeftDrawerModel(itemName: "Dark Mood", Icon:Icons.toggle_off_outlined),
    LeftDrawerModel(itemName: "Onboarding", Icon:Icons.navigate_next),
    LeftDrawerModel(itemName: "Configuration", Icon:Icons.confirmation_number),
    LeftDrawerModel(itemName: "My Odoo.com account", Icon:Icons.person),
    LeftDrawerModel(itemName: "Install App", Icon:Icons.install_desktop),
    LeftDrawerModel(itemName: "Log Out", Icon:Icons.logout),
  ];
}