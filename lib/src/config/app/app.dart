import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_freends/src/features/edit_screen/presentation/pages/edit_screen.dart';
import 'package:my_freends/src/features/home_screen/domain/repositories/order_repositories/order_repositories.dart';
import 'package:my_freends/src/features/home_screen/presentation/manager/blocs/location_bloc/location_bloc.dart';
import 'package:my_freends/src/features/home_screen/presentation/manager/blocs/order_bloc/order_bloc_bloc.dart';
import 'package:my_freends/src/features/tab_screen/presentation/manager/cubit/tab_cubit.dart';
import 'package:my_freends/src/features/tab_screen/presentation/pages/tab_screen.dart';

import '../../features/home_screen/domain/repositories/location_repositories/location_repositories.dart.dart';
import '../../features/home_screen/domain/service/dio/dio_setttings.dart';

class App extends StatelessWidget {
  const App({Key? key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          RepositoryProvider(create: (context) => DioSettings()),
          RepositoryProvider(
              create: (context) => OrderRepository(
                  dio: RepositoryProvider.of<DioSettings>(context).dio)),
          RepositoryProvider(
            create: (context) => LocationRepositories(
                dio: RepositoryProvider.of<DioSettings>(context).dio),
          ),
        ],
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => TabCubit()),
            BlocProvider(
              create: (context) => LocationBloc(
                locationRepositories:
                    RepositoryProvider.of<LocationRepositories>(context),
              ),
            ),
            BlocProvider(
              create: (context) => OrderBloc(
                orderRepository:
                    RepositoryProvider.of<OrderRepository>(context),
              ),
            )
          ],
          child: const MyApp(),
        ));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:const TabScreen(),
    );
  }
}
