import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vie_fashion_week/presentation/login/sign_in.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

import '../../bloc/auth/auth_bloc.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
      /* appBar: AppBar(
        title: const Text("SignUp"),
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
          child: bodyWidget()),
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
                "Sign Up",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            _authenticateWithEmailAndPassword(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.amber,
                          ),
                          child: const Text('Sign Up'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const Text("Already have an account?"),
              OutlinedButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const SignIn()),
                  );
                },
                child: const Text(
                  "Sign In",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _authenticateWithEmailAndPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new event [SignUpRequested].
      BlocProvider.of<AuthBloc>(context).add(
        SignUpRequested(_emailController.text, _passwordController.text),
      );
    }
  }
//
/* void _authenticateWithGoogle(context) {
  BlocProvider.of<AuthBloc>(context).add(
    GoogleSignInRequested(),
  );
} */

}
/*
 const Text("Or"),
                  IconButton(
                    onPressed: () {},
                    icon: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Google_%22G%22_Logo.svg/1200px-Google_%22G%22_Logo.svg.png",
                      height: 30,
                      width: 30,
                    ),
                  ),
 */