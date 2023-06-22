import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/presentation/common_widgets/widgets.dart';
import 'package:vie_fashion_week/presentation/login/sign_in.dart';
import 'package:vie_fashion_week/presentation/upcoming_events/final_upcoming.dart';

import '../../bloc/auth/auth_bloc.dart';

import '../../iPhone1312ProMax3.dart';
import '../../iPhone1312ProMax4.dart';
import '../gallery/gallery.dart';
//import '../upcoming_events/upcoming_events.txt';
import 'dashboard_new_final.dart';
import 'new_dashboard.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Getting the user from the FirebaseAuth Instance
    final user = FirebaseAuth.instance.currentUser;

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color(0xff373636),
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is UnAuthenticated) {
            // Navigate to the sign in screen when the user Signs Out
            Navigator.of(context).pushAndRemoveUntil(
              MaterialPageRoute(builder: (context) => const SignIn()),
              (route) => false,
            );
          }
        },
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.761, -0.835),
              end: Alignment(0.126, 0.084),
              colors: [Color(0xfff3e091), Color(0xffe4be63)],
              stops: [0.0, 1.0],
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(25, 3, 25, 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.green,
                    margin: const EdgeInsets.fromLTRB(0, 15, 0, 5),
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'User:  ${user?.email ?? 'email not available'}',
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  user?.photoURL != null
                      ? Image.network("${user?.photoURL}")
                      : Container(),
                  user?.displayName != null
                      ? Text("${user?.displayName}")
                      : Container(),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Upcoming Event'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const UpcomingEvents()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 25))),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Gallery'),
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const GalleryScreen()));
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.blueAccent),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.fromLTRB(0, 15, 0, 15)),
                        textStyle: MaterialStateProperty.all(
                            const TextStyle(fontSize: 25))),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Sign Out'),
                    onPressed: () {
                      // Signing out the user
                      context.read<AuthBloc>().add(SignOutRequested());
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('Test 1'),
                    onPressed: () {
                      // Signing out the user
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VieDashboard()));
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    child: const Text('vieDash'),
                    onPressed: () {
                      // Signing out the user
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const VieDash()));
                    },
                  ),
                  //VieDash
                  /*
                  ElevatedButton(
                    child: const Text('Test 2'),
                    onPressed: () {
                      // Signing out the user
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const IPhone1312ProMax4()));
                    },
                  ), */
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: SizedBox(
        height: MediaQuery.of(context).size.height * 0.06,
        child: VieWidgets.appFooter(),
      ),
    ));
  }
}
