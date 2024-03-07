import 'package:aqarmap_task/core/framework/bloc_observer.dart';
import 'package:aqarmap_task/core/framework/responsive.dart';
import 'package:aqarmap_task/features/popular_movies/presentation_layer/screens/popular_movies_screen.dart';
import 'package:aqarmap_task/injection/injectable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MResponsiveWrapper(
      child: MaterialApp(
        title: 'Aqarmap Task',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MResponsiveWrapper.wrapper(
            child: child!,
            context: context,
          );
        },
        home: PopularMoviesScreen(),
      ),
    );
  }
}
