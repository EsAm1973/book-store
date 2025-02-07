import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomeRepoImplementaion implements HomeRepo {
  final ApiService apiService;

  HomeRepoImplementaion(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchNewestBooks() async {
    try {
      var data = await apiService.get(endpoint: 'volumes?q=computer science');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromMap(item));
      }
      return right(
          books); // Because you use Either so you must return right side;
    } on Exception catch (e) {
      if (e is DioException) {
        return left((ServerFailure.fromDioException(e)));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    try {
      var data = await apiService.get(
          endpoint: 'volumes?q=subject:Programming&Filtering=free-ebooks');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromMap(item));
      }
      return right(
          books); // Because you use Either so you must return right side;
    } on Exception catch (e) {
      if (e is DioException) {
        return left((ServerFailure.fromDioException(e)));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String category}) async {
    try {
      var data = await apiService.get(
          endpoint:
              'volumes?q=computer science&Filtering=free-ebooks&Sorting=relevance');
      List<BookModel> books = [];
      for (var item in data['items']) {
        books.add(BookModel.fromMap(item));
      }
      return right(
          books); // Because you use Either so you must return right side;
    } on Exception catch (e) {
      if (e is DioException) {
        return left((ServerFailure.fromDioException(e)));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
