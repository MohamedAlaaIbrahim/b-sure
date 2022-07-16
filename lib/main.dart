// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:b_sure/routes.dart';
import 'package:b_sure/screens/splash/splash_screen.dart';
import 'package:b_sure/theme.dart';

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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      // theme: ThemeData.dark(),
      theme: theme(),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      // home: Scaffold(
      //   floatingActionButton: FloatingActionButton(
      //     onPressed: () => FirebaseFirestore.instance
      //         .collection('testing')
      //         .add({'timestamp': Timestamp.fromDate(DateTime.now())}),
      //     child: const Icon(Icons.add),
      //   ),
      //   body: StreamBuilder(
      //     stream: FirebaseFirestore.instance.collection('testing').snapshots(),
      //     builder: (
      //       context,
      //       AsyncSnapshot<QuerySnapshot> snapshot,
      //     ) {
      //       if (!snapshot.hasData) return const SizedBox.shrink();
      //       return ListView.builder(
      //         itemCount: snapshot.data?.docs.length,
      //         itemBuilder: (context, index) {
      //           final docData = snapshot.data!.docs[index];
      //           final dateTime =
      //               (docData.get('timestamp') as Timestamp).toDate();
      //           return ListTile(
      //             title: Text(dateTime.toString()),
      //           );
      //         },
      //       );
      //     },
      //   ),
      // ),
    );
  }
}
