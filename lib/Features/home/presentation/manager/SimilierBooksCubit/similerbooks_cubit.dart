import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similerbooks_state.dart';

class SimilerbooksCubit extends Cubit<SimilerbooksState> {
  SimilerbooksCubit(this.homeRepo) : super(SimilerbooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchSimilerBooks({required String category}) async {
    emit(SimilerBooksLoading());
    var result = await homeRepo.fetchSimilarBooks(category: category);
    result.fold(
      (Failure) =>
          emit(SimilerBooksFailure(errorMessage: Failure.errorMessage)),
      (books) => emit(SimilerBooksSuccess(books: books)),
    );
  }
}
