import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:oivan_app/src/core/database/sof_users_database.dart';
import 'package:oivan_app/src/features/sof/data/repo/data_repo.dart';
import 'package:oivan_app/src/features/sof/data/source/local_source.dart';
import 'package:oivan_app/src/features/sof/data/source/remote_source.dart';
import 'package:oivan_app/src/features/sof/domain/repo/domain_repo.dart';
import 'core/dio/dio_client.dart';
import 'core/internet/internet_info.dart';
import 'features/sof/domain/usecase/remote_usecases/get_all_users.dart';
import 'features/sof/domain/usecase/remote_usecases/get_user_details.dart';

final sl = GetIt.instance;
Future<void> init() async {
  // BLOC

  // USECASES
  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUserDetails(sl()));

  //REPO
  sl.registerLazySingleton<SOFDomainRepo>(
      () => SOFDataRepoImpl(sofRemoteSourceImpl: sl(),sofLocalSourceImpl: sl()));

  //DATA
  sl.registerLazySingleton<SOFRemoteSource>(
      () => SOFRemoteSourceImpl(dioClient: sl()));

  sl.registerLazySingleton<SOFLocalSource>(() => SOFLocalSourceImpl(sl()));

  //CORE
  final SOFLocalUsersDatabase sofDatabase = await SOFLocalUsersDatabase.init();

  sl.registerLazySingleton(() => sofDatabase);

  sl.registerLazySingleton(() => DioClient(sl()));

  sl.registerLazySingleton<InternetInfo>(() => InternetInfoImpl(sl()));

  sl.registerLazySingleton(() => InternetConnectionChecker());
}
