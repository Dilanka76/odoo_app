import 'package:flutter/material.dart';
import 'package:odoo_app/widgets/so%20confirmed%20screen%20widget/so_conf_optionalPro_tab.dart';
import 'package:odoo_app/widgets/so%20confirmed%20screen%20widget/so_conf_orderLine_tab.dart';
import 'package:odoo_app/widgets/so%20confirmed%20screen%20widget/so_conf_otheInfoTab.dart';
import '../../constant/colors.dart';

class SoConfTabBar extends StatefulWidget {
  const SoConfTabBar({super.key});

  @override
  State<SoConfTabBar> createState() => _SoConfTabBarState();
}
class _SoConfTabBarState extends State<SoConfTabBar>  with SingleTickerProviderStateMixin{
  late final TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                labelColor: mainColor,
                tabs: [
                  Tab(child: Text("Order Lines", style: TextStyle(fontSize:15),)),
                  Tab(child: Text("Optional Products", style: TextStyle(fontSize:15),)),
                  Tab(child: Text("Other info", style: TextStyle(fontSize:15),)),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: [
              SoConfOrderlineTab(),
              SoConfOptionalProTab(),
              SoConfOtheinfotab(),
            ],
          ),
        ),
      ),
    );
  }
}

