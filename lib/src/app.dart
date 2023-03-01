import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/core/database/sof_users_database.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import 'di.dart' as di;
import 'utils/ui/routing/routes.dart';

class MyApp extends StatefulWidget {
  final SOFLocalUsersDatabase sofLocalUsersDatabase;
  const MyApp({
    super.key,
    required this.sofLocalUsersDatabase,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void dispose() {
    widget.sofLocalUsersDatabase.closeAllBoxes();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
            value: SofUsersCubit(di.sl(), di.sl(), di.sl(), di.sl(), di.sl())),
      ],
      child: MaterialApp.router(
        routerConfig: AppRoutes.router,
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
