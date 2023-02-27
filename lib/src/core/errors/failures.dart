// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final num? statusCode;
  const Failure({
    required this.message,
    this.statusCode,
  });
}

class OfflineFailure extends Failure {
  const OfflineFailure({required super.message,super.statusCode});

  @override
  List<Object?> get props => [];
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message,super.statusCode});

  @override
  List<Object?> get props => [];
}

class EmptyCacheFailure extends Failure {
  const EmptyCacheFailure({required super.message,super.statusCode});

  @override
  List<Object?> get props => [];
}
