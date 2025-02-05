import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:bookly_app/Core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/search/data/repos/search_repo.dart';
import 'package:equatable/equatable.dart';

part 'searchcubit_state.dart';

class SearchcubitCubit extends Cubit<SearchCubitState> {
  SearchcubitCubit(this.searchRepo) : super(SearchcubitInitial());
  final SearchRepo searchRepo;
  Timer? debounce;

  void search(String query) {
    if (debounce?.isActive ?? false) {
      debounce!.cancel();
    }
    debounce = Timer(Duration(milliseconds: 500), () async {
      if (query.isEmpty) {
        emit(SearchcubitInitial());
        return;
      }
      emit(SearchLoading());
      final result = await searchRepo.searchedBooks(query);
      result.fold(
          (failure) => emit(SearchFailure(errorMessage: failure.errorMessage)),
          (books) {
        if (books.isEmpty) {
          emit(SearchEmpty());
        } else {
          emit(SearchSuccess(booksList: books));
        }
      });
    });
  }

  @override
  Future<void> close() {
    debounce?.cancel();
    return super.close();
  }
}
