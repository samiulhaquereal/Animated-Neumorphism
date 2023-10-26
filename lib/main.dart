import 'package:animatedneumorphism/NeumorphismButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {

  bool _isElevated = false;
  double turns = 0.0;
  Color customBlackColor = Color.fromARGB(255, 53, 53, 53);
  Color customWhiteColor = Color.fromARGB(255, 237, 237, 237);
  late AnimationController controller;

  @override
  void initState(){
    controller = AnimationController(vsync: this,duration: Duration(milliseconds: 800));
    super.initState();
  }

  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: customWhiteColor,
      body: Center(
        child: AnimatedRotation(
          curve: Curves.easeOutExpo,
          turns: turns,
          duration: Duration(seconds: 1),
          child: GestureDetector(
            onTap: (){
              setState(() {
                if(_isElevated){
                  setState(() {
                    turns -= 1/4;
                    controller.reverse();
                  });
                }else{
                  setState(() {
                    turns += 1/4;
                    controller.forward();
                  });
                }
                _isElevated = !_isElevated;
              });
            },
            child: NeumorphismButton(
              isElevated: _isElevated,
              height: 200,
              width: 200,
              color: Colors.grey[300],
              radius: 50,
              blurRadius: 15,
              TLshadowcolor: Colors.white,
              BRshadowcolor: Colors.grey[500],
              child: Center(
                  child: AnimatedIcon(
                    icon: AnimatedIcons.menu_close,
                    progress: controller,
                    size: 100,
                    color: customBlackColor,)),
            ),
          ),
        ),
      ),
    );
  }
}
