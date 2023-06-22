import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/data/repositories/auth_repository.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../common_widgets/widgets.dart';

class OfferPage extends StatefulWidget {
  const OfferPage({Key? key}) : super(key: key);

  @override
  State<OfferPage> createState() => _OfferPageState();
}

class _OfferPageState extends State<OfferPage> {
  final AuthRepository authRepository = AuthRepository();
  @override
  Widget build(BuildContext context) {
    return _bodyOffers(context);
    /*  return BlocProvider<AuthBloc>(
      create: (context) => AuthBloc(authRepository: authRepository),
      child: _bodyOffers(context),
    );
  } */
  }

  Widget _bodyOffers(BuildContext context) {
    // final user = FirebaseAuth.instance.currentUser;
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.761, -0.835),
            end: Alignment(0.126, 0.084),
            colors: [Color(0xfff3e091), Color(0xffe4be63)],
            stops: [0.0, 1.0],
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 32,
            ),
            VieWidgets.vieAppBar('Offers', 'from Sponsors'),
            SizedBox(height: size.height * 0.4),
            Center(
              child: Text("Sorry, no offers Yet!!",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  )),
            ),
            const SizedBox(
              height: 120,
            ),
            /* SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.black,
                  onPrimary: Colors.amber,
                ),
                onPressed: () {
                  context.read<AuthBloc>().add(SignOutRequested());
                },
                child: const Text('Sign Out'),
              ),
            ) */
          ],
        ),
      ),
    );
  }
}
