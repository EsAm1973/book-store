import 'package:bookly_app/Core/widgets/custom_error_widget.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/Features/home/presentation/manager/NewestBooksCubit/newest_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewestListView extends StatelessWidget {
  const NewestListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
          return Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.zero,
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: BookListViewItem(
                      imageUrl:
                          state.books[index].volumeInfo!.imageLinks!.thumbnail,
                      title: state.books[index].volumeInfo!.title,
                      author: state.books[index].volumeInfo!.authors![0],
                      rating: state.books[index].volumeInfo!.averageRating,
                      count: state.books[index].volumeInfo!.ratingsCount,
                    ),
                  );
                }),
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndecator();
        }
      },
    );
  }
}
