import 'package:dartz/dartz.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/core/error/failures.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/entities/dog_entity.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/repositories/dogs_repository.dart';

abstract class DogsImageUseCase {
  Future<Either<Failure, DogEntity>> fetchDogsInfo(
      String imageNumber, String breed, String? subBreed);
}

class DogsImageUseCaseImp implements DogsImageUseCase {
  final DogsRepository dogsRepository;

  DogsImageUseCaseImp(this.dogsRepository);

  @override
  Future<Either<Failure, DogEntity>> fetchDogsInfo(
      String imageNumber, String breed, String? subBreed) async {
    return await dogsRepository.fetchDogsInfo(imageNumber, breed, subBreed);
  }
}
