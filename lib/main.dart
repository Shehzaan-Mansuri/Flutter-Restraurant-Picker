import 'dart:math';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const NeumorphicApp(
      themeMode: ThemeMode.light,
      theme: NeumorphicThemeData(
        baseColor: Color.fromARGB(255, 214, 213, 213),
        lightSource: LightSource.topLeft,
        depth: 10,
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> restraurants = [
    'McDonad\'s',
    'Burger King',
    'Dominos',
    'Chai Sutta Bar',
    'Bombay Fusion',
    'Pizza Hut',
    'Jumbo',
    'Naaz',
    'Delhi Darbar'
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: NeumorphicAppBar(
        centerTitle: true,
        title: const Text(
          "Restaurant Picker",
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.w600,
            color: Color.fromARGB(255, 20, 20, 20),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: size.width / 1.1,
              child: Neumorphic(
                padding: EdgeInsets.all(size.width / 6),
                style: const NeumorphicStyle(),
                child: Column(
                  children: [
                    Text(
                      "What you have to eat.",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: size.width * 0.050),
                    ),
                    Text(
                      restraurants[currentIndex],
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: size.width / 10),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            ),
            NeumorphicButton(
              style: const NeumorphicStyle(color: Color.fromARGB(255, 240, 240, 240)),
              margin: const EdgeInsets.only(top: 30),
              padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.02, horizontal: size.width / 4),
              child: const Text(
                "Pick a Restraurant",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {
                updateIndex();
              },
            )
          ],
        ),
      ),
    );
  }

  void updateIndex() {
    final random = Random();
    final index = random.nextInt(restraurants.length);

    setState(() {
      currentIndex = index;
    });
  }
}
