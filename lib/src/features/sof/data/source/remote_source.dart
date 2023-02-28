import 'package:oivan_app/src/core/dio/dio_client.dart';
import 'package:oivan_app/src/core/dio/result.dart';
import 'package:oivan_app/src/core/errors/exceptions.dart';
import 'package:oivan_app/src/features/sof/data/models/sof_users_details_model.dart';
import 'package:oivan_app/src/features/sof/data/models/sof_users_model.dart';

abstract class SOFRemoteSource {
  Future<SofUsersModel> getAllUsers(
      {String page = '1', String pageSize = '30'});
  Future<SofUsersDetailsModel> getUserDetails(
      {String page = '1', String pageSize = '30', required String userID});
}

class SOFRemoteSourceImpl implements SOFRemoteSource {
  final DioClient _dioClient;

  const SOFRemoteSourceImpl({required DioClient dioClient})
      : _dioClient = dioClient;

  @override
  Future<SofUsersModel> getAllUsers(
      {String page = '1', String pageSize = '30'}) async {
    Result result = await _dioClient.get('', queryParameters: {
      'page': page,
      'pagesize': pageSize,
      'site': 'stackoverflow'
    });
    if (result is SuccessState) {
      return SofUsersModel.fromJson(result.value);
    } else if (result is ErrorState) {
      throw ServerException(message: result.msg.toString());
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SofUsersDetailsModel> getUserDetails(
      {String page = '1',
      String pageSize = '30',
      required String userID}) async {
    Result result = await _dioClient.get('/$userID/reputation-history',
        queryParameters: {
          'page': page,
          'pagesize': pageSize,
          'site': 'stackoverflow'
        });
    if (result is SuccessState) {
      return SofUsersDetailsModel.fromJson(result.value);
    } else if (result is ErrorState) {
      throw ServerException(message: result.msg.toString());
    } else if (result is NetworkErrorState) {
      throw OfflineException(message: result.msg.toString());
    } else {
      throw ServerException();
    }
  }
}
