import 'package:deliveristo_flutter_frontend_coding_challenge/core/network_info/network_info.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/core/remote_data_function/http_methods.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/data/datasources/dogs_remote_data.dart';

import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/data/repositories/dogs_repository_imp.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/repositories/dogs_repository.dart';
import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/usecases/dogs_breed_use_case.dart';

import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/domain/usecases/dogs_info_use_case.dart';

import 'package:deliveristo_flutter_frontend_coding_challenge/home_page/presentation/bloc/home_page_bloc.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future init() async {
  // blocs
  sl.registerFactory(() => HomePageBloc(sl(), sl()));

// Use cases
  sl.registerLazySingleton<DogsBreedUseCase>(
    () => DogsBreedUseCaseImp(
      sl(),
    ),
  );
  sl.registerLazySingleton<DogsImageUseCase>(
    () => DogsImageUseCaseImp(
      sl(),
    ),
  );

// Repository
  sl.registerLazySingleton<DogsRepository>(
    () => DogsRepositoryImp(sl(), sl()),
  );

  // Data sources
  sl.registerLazySingleton<DogsRemoteDataSource>(
    () => DogsRemoteDataSourceImp(sl(), sl()),
  );

//  utils

  sl.registerLazySingleton<NetworkInf>(
    () => NetworkInfImpl(sl()),
  );

  sl.registerLazySingleton<HttpFunctions>(
    () => HttpFunctionsImp(),
  );

 sl.registerLazySingleton(() => CheckInternetConnectivity());
  
 
}
