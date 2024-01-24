import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'routes/go_router_provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // runApp(
  //   const ProviderScope(
  //     child: MyApp(),
  //   ),
  // );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const ProviderScope(child: MyApp()));
  });
}

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  Widget build(BuildContext context) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      // theme: ThemeData(
      //   brightness: Brightness.light,
      //   /* light theme settings */
      // ),
      // darkTheme: ThemeData(
      //   brightness: Brightness.light,
      //   /* dark theme settings */
      // ),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      routeInformationParser: router.routeInformationParser,
      routeInformationProvider: router.routeInformationProvider,
      routerDelegate: router.routerDelegate,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.lightGreenAccent,
        primaryColorDark: Colors.lightGreenAccent.shade700,
        primaryColorLight: Colors.green,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreenAccent),
        useMaterial3: true,
      ),
    );
  }
}


// void getHome() {
//       if (authenticationState.status == AuthenticationStatus.authenticated) {
//         GoRouter.of(context).go("/$root");
//       } else if (authenticationState.status ==
//           AuthenticationStatus.unauthenticated) {
//         GoRouter.of(context).go("/$auth");
//       }
//     }