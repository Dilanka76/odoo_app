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
bool isGetsartedPage = false;
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
                      isGetsartedPage = index ==1 ?true : false;
                      setState(() {});
                    },
                    controller: controller,
                    children: [
                      Container(
                        color: mainColor,
                        child: Column(
                          children: [
                            Image.asset("assets/loginImage.png"),
                            Image.asset("assets/oa6.jpg"),
                          ],
                        ),
                      ),
                      Container(
                        color: mainColor,
                        child: Column(
                          children: [
                            Image.asset("assets/loginImage.png"),
                            Image.asset("assets/oa7.jpg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 0,
                  right: 0,
                  child: isGetsartedPage ?  TapButton(
                    lable:"Get Started",
                    btnColor: mainColor,
                    fontSize: txtNormal,
                    width: 20,
                    height: 40,
                    onPressed: ()async{
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyHomePage()),
                      );
                    },
                  ): TapButton(
                    lable: "Next",
                    btnColor: mainColor,
                    fontSize: txtNormal,
                    width: 20,
                    height: 40,
                    onPressed: ()async{
                      controller.animateToPage(
                        controller.page!.toInt()+1,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOut);
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
