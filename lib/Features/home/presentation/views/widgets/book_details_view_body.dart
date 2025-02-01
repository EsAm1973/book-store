import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_bookdetails.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similer_books_view_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return  CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Material(
              type: MaterialType.transparency,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      const BookDetailsCustomAppBar(),
                      BookDetailsSection(bookModel: bookModel,),
                      const Expanded(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      const SimilerBooksSection(),
                      const SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ),
              ),
            )),
      ],
    );
  }
}
