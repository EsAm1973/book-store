import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_implementaion.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setupServiceLocator() {
  getIt.registerSingleton<ApiService>(ApiService(dio: Dio()));
  getIt.registerSingleton<HomeRepoImplementaion>(
    HomeRepoImplementaion(getIt.get<ApiService>()),
  );
}
