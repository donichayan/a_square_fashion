import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/presentation/dashboard/dashboard.dart';
import 'package:vie_fashion_week/presentation/login/password_reset.dart';
import 'package:vie_fashion_week/presentation/login/sign_up.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../dashboard/dashboard_new_final.dart';
import '../dashboard/new_dashboard.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      /*  appBar: AppBar(
        title: const Text("SignIn"),
      ), */
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment(-0.761, -0.835),
            end: Alignment(0.126, 0.084),
            colors: [Color(0xfff3e091), Color(0xffe4be63)],
            stops: [0.0, 1.0],
          ),
        ),
        child: BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is Authenticated) {
              // Navigating to the dashboard screen if the user is authenticated
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const VieDash()));
            }
            if (state is AuthError) {
              // Showing the error message if the user has entered invalid credentials
              ScaffoldMessenger.of(context)
                  .showSnackBar(SnackBar(content: Text(state.error)));
            }
            if (state is ForgotPassword) {
              //Showing the passowrd reset page after a failed attempt of reset
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const PasswordReset()));
            }
            /* if (state is PasswordRest) {
              Navigator.pop(context);
            } */

            /* if (state is UnAuthenticated) {
              // Navigate to the sign in screen when the user Signs Out
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => const SignIn()),
                (route) => false,
              );
            } */
          },
          child: BlocBuilder<AuthBloc, AuthState>(
            builder: (context, state) {
              if (state is Loading) {
                // Showing the loading indicator while the user is signing in
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                    backgroundColor: Colors.amber,
                  ),
                );
              }
              if (state is UnAuthenticated) {
                final user = FirebaseAuth.instance.currentUser;

                if (user == null) {
                  // Showing the sign in form if the user is not authenticated
                  return _backgroundWidget();
                } else {
                  BlocProvider.of<AuthBloc>(context).add(PreAuthenticated());
                }
              }

              return Container();
            },
          ),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new Event [SignInRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignInRequested(_emailController.text, _passwordController.text),
      );
    }
  }

//
/* void _authenticateWithGoogle(context) {
  BlocProvider.of<AuthBloc>(context).add(
    GoogleSignInRequested(),
  );
} */

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.deepPurpleAccent),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(context,
            MaterialPageRoute(builder: (context) => const PasswordReset())),
      ),
    );
  }

  _backgroundWidget() {
    return Stack(
      children: <Widget>[
        Positioned(
          top: -27.0,
          right: -2.0,
          bottom: -28.0,
          child: Container(
            decoration: BoxDecoration(
              color: const Color(0xff100f0f),
              border: Border.all(width: 1.0, color: const Color(0xff707070)),
            ),
            //margin: EdgeInsets.fromLTRB(0.0, -27.0, -2.0, -28.0),
          ),
        ),
        Positioned(
          right: -2.0,
          bottom: 100.0,
          child: Transform.rotate(
            angle: 3.1416,
            child:
                // Adobe XD layer: 'Rectangle 1' (shape)
                Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(0.0, 1.0),
                  end: Alignment(0.0, -1.0),
                  colors: [Color(0x95dec77d), Color(0x00ffffff)],
                  stops: [0.0, 1.0],
                ),
              ),
              //margin: EdgeInsets.fromLTRB(0.0, 0.0, -2.0, 100.0),
            ),
          ),
        ),
        Positioned(
          left: -182.0,
          top: 84.0,
          right: -185.0,
          bottom: -13.0,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: const AssetImage('assets/images/vie_logo_wm.png'),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.04), BlendMode.dstIn),
              ),
            ),
            // margin: EdgeInsets.fromLTRB(-182.0, 84.0, -185.0, -13.0),
          ),
        ),
        Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment(-0.761, -0.835),
                end: Alignment(0.126, 0.084),
                colors: [Color(0xfff3e091), Color(0xffe4be63)],
                stops: [0.0, 1.0],
              ),
            ),
            child: bodyWidget()),
      ],
    );
  }

  Widget bodyWidget() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: SingleChildScrollView(
          reverse: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign In",
                style: TextStyle(
                  fontSize: 38,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 18,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null &&
                                  !EmailValidator.validate(value)
                              ? 'Enter a valid email'
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        controller: _passwordController,
                        decoration: const InputDecoration(
                          hintText: "Password",
                          border: OutlineInputBorder(),
                        ),
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return value != null && value.length < 6
                              ? "Enter min. 6 characters"
                              : null;
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      forgetPassword(context),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.amber,
                          ),
                          onPressed: () {
                            _authenticateWithEmailAndPassword(context);
                          },
                          child: const Text('Sign In'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Text("Don't have an account?"),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignUp()),
                  );
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
IconButton(
                onPressed: () {},
                icon: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                  height: 30,
                  width: 30,
                ),
              ),
*/ 