// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:bookly_app/Core/errors/failure.dart';
import 'package:bookly_app/Core/models/book_model/book_model.dart';
import 'package:bookly_app/Core/utils/api_service.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:dio/dio.dart';

class SearchRepoImplementation implements SearchRepo {
  ApiService apiService;
  SearchRepoImplementation({
    required this.apiService,
  });
  @override
  Future<Either<Failure, List<BookModel>>> searchedBooks(String query) async {
    try {
      var result = await apiService.get(
          endpoint:
              'https://www.googleapis.com/books/v1/volumes?q=subject:computer science&Filtering=free-ebooks&Sorting=relevance&maxResults=40');
      final items = result['items'] as List<dynamic>;
      if (items.isEmpty) {
        return const Right([]);
      }
      final allBooks = items.map((e) => BookModel.fromMap(e)).toList();
      final filteredBooks = allBooks
          .where((book) => book.volumeInfo!.title!
              .toLowerCase()
              .contains(query.toLowerCase()))
          .toList();
      return Right(filteredBooks);
    } on Exception catch (e) {
      if (e is DioException) {
        return Left(ServerFailure.fromDioException(e));
      }
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
