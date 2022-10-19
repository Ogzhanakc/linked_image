import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _key = GlobalKey();
  double glassesSizeH = 0;
  double overDressH = 0;
  double underWearH=0;
  double shoeH=0;
  double sizeW = 0;

  Future wait2Second() async {
    return Future.delayed(Duration(seconds: 2), () {
      sizeW = _key.currentContext!.size!.width / 2.25;
      glassesSizeH = _key.currentContext!.size!.height / 10;
      overDressH = _key.currentContext!.size!.height / 5;
      underWearH = _key.currentContext!.size!.height / 1.95;
      shoeH = _key.currentContext!.size!.height /1.22;
    });
  }

  @override
  Widget build(BuildContext context) {
    wait2Second();
    return Scaffold(
        appBar: AppBar(
          title: Text("APPBAR"),
        ),
        body: Stack(
          children: [
            Image.asset(
              "assets/images/product_model_image.jpg",
              key: _key,
            ),
            FutureBuilder(
                future: Future.delayed(Duration(seconds: 2), () => "1"),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                   return Stack(
                     children: [
                       //GLASSES
                       Positioned(
                         left: sizeW,
                         top: glassesSizeH,
                         child: GestureDetector(
                           onTap: (){
                             print("GLASSES");
                           },
                           child: Container(
                             color: const Color(0xFF0E3311).withOpacity(0.1),
                             width: 50,
                             height: 25,
                           ),
                         ),
                       ),
                       //OVERDRESS
                       Positioned(
                         left: sizeW,
                         top: overDressH,
                         child: GestureDetector(
                           child: Container(
                             color: const Color(0xFF0E3311).withOpacity(0.1),
                             width: 75,
                             height: underWearH-overDressH,
                           ),
                           onTap: (){
                             print("OVERDRESS");
                           },
                         ),
                       ),
                       //UNDERWEAR
                       Positioned(
                         left: sizeW,
                         top: underWearH,
                         child: GestureDetector(
                           onTap: (){
                             print("Underwear");
                           },
                           child: Container(
                             color: const Color(0xFF0E3311).withOpacity(0.1),
                             width: 75,
                             height: 180,
                           ),
                         ),
                       ),
                       //SHOE
                       Positioned(
                         left: sizeW,
                         top: shoeH,
                         child: GestureDetector(
                           onTap: (){
                             print("SHOE");
                           },
                           child: Container(
                             color: const Color(0xFF0E3311).withOpacity(0.01),
                             width: 100,
                             height: 100,
                           ),
                         ),
                       ),
                     ],
                   );
                  } else if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ));
  }

 Stack stack(){

    return Stack();
 }
}
