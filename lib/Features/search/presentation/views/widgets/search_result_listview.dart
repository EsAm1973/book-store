import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:bookly_app/Features/search/presentation/manager/SearchCubit/searchcubit_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchcubitCubit, SearchCubitState>(
      builder: (context, state) {
        if (state is SearchLoading) {
          return const Expanded(child: CustomLoadingIndecator());
        } else if (state is SearchFailure) {
          return Expanded(
              child: CustomErrorWidget(errorMessage: state.errorMessage));
        } else if (state is SearchSuccess) {
          final books = state.booksList;
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.zero,
              itemCount: books.length,
              itemBuilder: (context, index) {
                final book = books[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: BookListViewItem(bookModel: book),
                );
              },
            ),
          );
        } else if (state is SearchEmpty) {
          return const Expanded(child: Center(child: Text('No books found')));
        } else {
          return const Expanded(
              child: Center(child: Text('Start searching for books')));
        }
      },
    );
  }
}
