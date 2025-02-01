part of 'similerbooks_cubit.dart';

sealed class SimilerbooksState extends Equatable {
  const SimilerbooksState();

  @override
  List<Object> get props => [];
}

final class SimilerbooksInitial extends SimilerbooksState {}

final class SimilerBooksLoading extends SimilerbooksState {}

final class SimilerBooksSuccess extends SimilerbooksState {
  final List<BookModel> books;
  const SimilerBooksSuccess(this.books);
}

final class SimilerBooksFailure extends SimilerbooksState {
  final String errorMessage;
  const SimilerBooksFailure(this.errorMessage);
}
