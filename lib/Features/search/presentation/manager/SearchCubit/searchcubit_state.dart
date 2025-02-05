part of 'searchcubit_cubit.dart';

sealed class SearchCubitState extends Equatable {
  const SearchCubitState();

  @override
  List<Object> get props => [];
}

final class SearchcubitInitial extends SearchCubitState {}

final class SearchLoading extends SearchCubitState {}

final class SearchEmpty extends SearchCubitState {}

final class SearchSuccess extends SearchCubitState {
  final List<BookModel> booksList;
  const SearchSuccess({required this.booksList});
}

final class SearchFailure extends SearchCubitState {
  final String errorMessage;

  const SearchFailure({required this.errorMessage});
}
