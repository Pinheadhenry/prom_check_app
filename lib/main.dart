import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:prom_check_app/scan_screen.dart';

import 'create_student.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Prom Check App',
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(title: 'Prom Check App'),
        '/scanstudent': (context) => const ScanStudent(),
        '/createstudent': (context) => const CreateStudent(),
      },
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Prom Check App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              child: ElevatedButton(
                child: const Text("Create New Student"),
                onPressed: () {
                  Navigator.pushNamed(context, '/createstudent');
                },
              ),
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            const SizedBox(height: 10),
            Container(
              child: ElevatedButton(
                child: const Text("Scan Student QR Code"),
                onPressed: () {
                  Navigator.pushNamed(context, '/scanstudent');
                },
              ),
              width: MediaQuery.of(context).size.width * 0.65,
            ),
            const SizedBox(height: 10),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

