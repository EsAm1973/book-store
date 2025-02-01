import 'package:bloc/bloc.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'similerbooks_state.dart';

class SimilerbooksCubit extends Cubit<SimilerbooksState> {
  SimilerbooksCubit() : super(SimilerbooksInitial());
}
