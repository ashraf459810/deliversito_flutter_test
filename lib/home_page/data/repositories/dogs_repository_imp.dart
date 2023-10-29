import 'package:dartz/dartz.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/core/error/app_excepition.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/core/error/failures.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/core/network_info/network_info.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/data/datasources/dogs_remote_data.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/data/models/dog_model.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/entities/breeds_entity.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/repositories/dogs_repository.dart';

class DogsRepositoryImp implements DogsRepository {
  final DogsRemoteDataSource dogsRemoteDataSource;
  final NetworkInf networkInf;

  DogsRepositoryImp(this.dogsRemoteDataSource, this.networkInf);
  @override
  Future<Either<Failure, BreedsEntity>> fetchBreeds() async {
    {
      if (await networkInf.isConnected) {
        try {
          final response = await dogsRemoteDataSource.fetchBreeds();

          return Right(response);
        } catch (e) {
          return Left(ServerFailure(
              e is AppException ? e.message : 'unkown exception'));
        }
      } else {
        return const Left(NetWorkFailure("check your internet"));
      }
    }
  }

  @override
  Future<Either<Failure, DogModel>> fetchDogsInfo(
      String imageNumber, String breed, String? subBreed) async {
    if (await networkInf.isConnected) {
      try {
        final response = await dogsRemoteDataSource.fetchDogsInfo(
            imageNumber, breed, subBreed);

        return Right(response);
      } catch (e) {
        return Left(ServerFailure(
            e is AppException ? e.message : 'unkown exception'));
      }
    } else {
      return const Left(NetWorkFailure("check your internet"));
    }
  }
}
