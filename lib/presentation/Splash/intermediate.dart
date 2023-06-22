import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/auth/auth_bloc.dart';
import '../../data/repositories/auth_repository.dart';
import '../login/sign_in.dart';

class FashionApp extends StatelessWidget {
  const FashionApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => AuthRepository(),
      child: BlocProvider(
        create: (context) => AuthBloc(
          authRepository: RepositoryProvider.of<AuthRepository>(context),
        ),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SignIn(),
        ),
      ),
    );
  }
}
