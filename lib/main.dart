import 'package:appavengers_bookstore/core/consts.dart';
import 'package:appavengers_bookstore/repository/home/home_repo_impl.dart';
import 'package:appavengers_bookstore/view_model/home/featured_books_cubit/featured_books_cubit.dart';
import 'package:appavengers_bookstore/view_model/home/newest_books_cubit/newest_book_cubit.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/depandancy_injection.dart';
import 'core/routes_config.dart';

void main() {
  setupDi();
  runApp(DevicePreview(
    tools: const [...DevicePreview.defaultTools],
    enabled: false,
    builder: (BuildContext _) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FeaturedBooksCubit>(
            create: (BuildContext context) => FeaturedBooksCubit(
                  GetIt.instance.get<HomeRepoImpl>(),
                )..fetchData()),
        BlocProvider<NewestBookCubit>(
            create: (BuildContext context) => NewestBookCubit(
                  GetIt.instance.get<HomeRepoImpl>(),
                )..fetchBooks())
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: AppConsts.kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
