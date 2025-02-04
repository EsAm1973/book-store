part of 'searchcubit_cubit.dart';

sealed class SearchcubitState extends Equatable {
  const SearchcubitState();

  @override
  List<Object> get props => [];
}

final class SearchcubitInitial extends SearchcubitState {}

final class SearchLoading extends SearchcubitState {}

final class SearchEmpty extends SearchcubitState {}

final class SearchSuccess extends SearchcubitState {
  final List<BookModel> booksList;
  const SearchSuccess({required this.booksList});
}

final class SearchFailure extends SearchcubitState {
  final String errorMessage;

  const SearchFailure({required this.errorMessage});
}
