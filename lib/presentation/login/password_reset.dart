import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:email_validator/email_validator.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../data/repositories/auth_repository.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.amber,
        backgroundColor: Colors.black,
        title: const Text("Reset Password"),
      ),
      body: BlocListener<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            // Showing the error message if the user has entered invalid credentials
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
          }
          if (state is UnAuthenticated) {
            Navigator.of(context).pop();
          }
          if (state is ResetStatus) {
            // Showing the error message if the user has entered invalid credentials
            /*  BlocProvider(
              create: (context) => AuthBloc(
                authRepository: RepositoryProvider.of<AuthRepository>(context),
              ),
              child: _popUpDialogue(context, state.status, state.email),
            ); */
            BlocProvider.of<AuthBloc>(context)
                .add(PasswordResetNotified(state.status));
            _popUpDialogue(context, state.status, state.email);
            /*  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text("reset successful"),
              backgroundColor: Colors.green,
            )); */
          }
        },
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is Loading) {
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.amber,
              ));
            }
            return Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment(-0.761, -0.835),
                  end: Alignment(0.126, 0.084),
                  colors: [Color(0xfff3e091), Color(0xffe4be63)],
                  stops: [0.0, 1.0],
                ),
              ),
              child: bodyWidget(),
            );
          },
        ),
      ),
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
                "Reset your password",
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: ElevatedButton(
                          onPressed: () {
                            _resetPassword(context);
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            onPrimary: Colors.amber,
                          ),
                          child: const Text('Reset'),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              /* const Text("Already have an account?"),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const SignIn()),
                      );
                    },
                    child: const Text("Sign In"),
                  ), */
            ],
          ),
        ),
      ),
    );
  }

  _popUpDialogue(BuildContext contextBase, bool status, String email) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('User Action Needed!'),
            content: Text(
                "We have send a password reset link to your mail: $email\n Please check your email to reset your Password!"),
            actions: <Widget>[
              MaterialButton(
                  elevation: 5.0,
                  child: const Text('Ok'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }

  void _resetPassword(context) {
    if (_formKey.currentState!.validate()) {
      // If email is valid adding new event [SignUpRequested].
      BlocProvider.of<AuthBloc>(context).add(
        PasswrodResetRequest(_emailController.text),
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