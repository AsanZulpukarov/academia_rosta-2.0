import 'package:academia_rosta_diplom/core/error/failure.dart';
import 'package:academia_rosta_diplom/features/home/data/models/subject_model.dart';
import 'package:academia_rosta_diplom/features/profile/data/datasources/remote/profile_remote_data_source.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/edit_password_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/mark_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/entities/user_info_entity.dart';
import 'package:academia_rosta_diplom/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRemoteDataSource profileRemoteDataSource;
  ProfileRepositoryImpl({required this.profileRemoteDataSource});

  @override
  Future<Either<Failure,  Map<String,MarkEntity>>> getMyStatistic(int id) async {
    try {
      return Right(await profileRemoteDataSource.getMyStatistic(id));
    } on Exception {
    throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, UserInfoEntity>> getUserInfo() async {
    try {
      return Right(await profileRemoteDataSource.getUserInfo());
    } on Exception {
    throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, void>> logoutAccount() {
    // TODO: implement logoutAccount
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> changePassword(EditPasswordEntity editPasswordEntity) async {
    try {
      return Right(await profileRemoteDataSource.editPassword(editPasswordEntity));
    } on Exception {
      throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, bool>> updateUserInfo(UserInfoEntity userInfoEntity) async {
    try {
      return Right(await profileRemoteDataSource.updateUserInfo(userInfoEntity));
    } on Exception {
    throw ServerFailure();
    }
  }

  @override
  Future<Either<Failure, List<SubjectModel>>> getMySubjects() async {
    try {
      return Right(await profileRemoteDataSource.getMySubjects());
    } on Exception {
    throw ServerFailure();
    }
  }
}
