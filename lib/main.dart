import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:vie_fashion_week/bloc/gallery_bloc/gallery_bloc.dart';
import 'package:vie_fashion_week/data/repositories/designer_repository.dart';
import 'package:vie_fashion_week/data/repositories/gallery_repository.dart';
import 'package:vie_fashion_week/presentation/Splash/splash.dart';
import 'package:vie_fashion_week/presentation/login/sign_in.dart';
import '/bloc/auth/auth_bloc.dart';
import 'bloc/designer_bloc/designer_bloc.dart';
import 'bloc/upcoming_events/bloc/upcomingevent_bloc.dart';
import 'data/repositories/auth_repository.dart';
import 'data/repositories/event_repository.dart';
import 'firebase_options.dart';
import 'package:flutter/services.dart';
//import 'presentation/login/login_info.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
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
    final EventsRepository eventsRepository = EventsRepository();
    final GalleryRepository galleryRepository = GalleryRepository();
    final DesignerRepository designerRepository = DesignerRepository();
    final AuthRepository authRepository = AuthRepository();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]); //AuthBloc
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) {
          return UpcomingeventBloc(eventsRepository: eventsRepository);
        }),
        BlocProvider(create: (BuildContext context) {
          return GalleryBloc(galleryRepository: galleryRepository);
        }),
        BlocProvider(create: (BuildContext context) {
          return DesignerBloc(designerRepository: designerRepository);
        }),
        BlocProvider(create: (BuildContext context) {
          return AuthBloc(authRepository: authRepository);
        })
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     return RepositoryProvider(
//       create: (context) => AuthRepository(),
//       child: BlocProvider(
//         create: (context) => AuthBloc(
//           authRepository: RepositoryProvider.of<AuthRepository>(context),
//         ),
//         child: const MaterialApp(
//           home: SignIn(),
//         ),
//       ),
//     );
//   }
// }
