import 'package:flutter/material.dart';

import '../constant/colors.dart';
import '../constant/sizes.dart';

class AppBarSection extends StatefulWidget implements PreferredSizeWidget{
  final String topic;
  const AppBarSection({super.key,required this.topic});

  @override
  State<AppBarSection> createState() => _AppBarSectionState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarSectionState extends State<AppBarSection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            onPressed: (){
              Scaffold.of(context).openDrawer();
              setState(() {
              });
            }, icon: Icon(Icons.menu,size: 40,)),
        title: Text(widget.topic,style: TextStyle(fontWeight:FontWeight.w700,fontSize: txtTopic)),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 125,
              child: Row(
                children: [
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.message)
                    ),
                  ),
                  Expanded(
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.alarm)
                    ),
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Scaffold.of(context).openEndDrawer();
                      },
                      child: Container(
                        height: 30,
                        decoration: BoxDecoration(
                          color: mainColor,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child:Center(child: Text("A",style: TextStyle(fontWeight:FontWeight.w700,fontSize: 25),))
                        ,
                      ),
                    )
                  )
                ],
              ),
            ),
          )

        ],
      ),
    );
  }
}

