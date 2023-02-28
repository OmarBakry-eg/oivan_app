import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oivan_app/src/core/database/sof_users_database.dart';
import 'package:oivan_app/src/features/sof/data/repo/data_repo.dart';
import 'package:oivan_app/src/features/sof/data/source/remote_source.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';
import 'package:oivan_app/src/features/sof/domain/usecase/get_all_users.dart';
import 'package:oivan_app/src/features/sof/domain/usecase/get_user_details.dart';

import 'core/dio/dio_client.dart';
import 'core/internet/internet_info.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // BLOC

  // USECASES
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUserDetails(sl()));

  //REPO
  sl.registerLazySingleton<SOFDomainRepo>(
      () => SOFDataRepoImpl(sofRemoteSourceImpl: sl()));

  //DATA
  sl.registerLazySingleton<SOFRemoteSource>(
      () => SOFRemoteSourceImpl(dioClient: sl()));

  //CORE
  final SOFLocalUsers sofDatabase = await SOFLocalUsers.init();

  sl.registerLazySingleton(() => sofDatabase);

  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
