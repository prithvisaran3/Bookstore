import 'package:appavengers_bookstore/core/api_service.dart';
import 'package:appavengers_bookstore/repository/home/home_repo_impl.dart';
import 'package:appavengers_bookstore/repository/search/search_repo_impl.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

void setupDi() {
  GetIt getIt = GetIt.instance;

  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<HomeRepoImpl>(HomeRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<SearchRepoImpl>(SearchRepoImpl(getIt.get<ApiService>()));
}
