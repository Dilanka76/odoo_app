import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:odoo_app/constant/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constant/sizes.dart';
import '../widgets/reuserble widget/tap_button.dart';
import 'home_page.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}
final PageController controller = PageController();
int currentIndexPage = 0;
class _OnbordingScreenState extends State<OnbordingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Stack(
              children: [
                SizedBox(
                  child: PageView(
                    onPageChanged: (index){
                      currentIndexPage = index;
                    },
                    controller: controller,
                    children: [
                      Container(
                        color: mainColor,
                        child: ClipRect(
                            child: Image.asset(fit: BoxFit.cover,"assets/ab3.jpg")
                        ),
                      ),
                      Container(
                        color: mainColor,
                        child: ClipRect(
                            child: Image.asset(fit: BoxFit.cover,"assets/ob2.jpg")
                        )
                      )
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: TapButton(
                    lable: "Get Started",
                    btnColor: mainColor,
                    fontSize: txtNormal,
                    width: 20,
                    height: 40,
                    onPressed: ()async{
                      currentIndexPage++;
                      if(currentIndexPage <1){
                        controller.animateToPage(
                            currentIndexPage,
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeInOut
                        );
                      }else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      }
                          setState(() {});
                    },
                  ),
                ),
                Positioned(
                  bottom: 150,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: SmoothPageIndicator(
                        controller: controller,
                        count:  2,
                        effect:  WormEffect(
                          dotColor: Colors.white,
                          activeDotColor: Colors.deepPurple
                        ),
                        onDotClicked: (index){
                        }
                    ),
                  ),
                ),


              ],
            ),

          )
        ],
      ),
    );
  }
}
