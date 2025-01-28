import 'package:bookly_app/Features/home/presentation/views/widgets/book_details_view_section.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_bookdetails.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/similer_books_view_section.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        SliverFillRemaining(
            hasScrollBody: false,
            child: Material(
              type: MaterialType.transparency,
              child: SafeArea(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  child: Column(
                    children: [
                      BookDetailsCustomAppBar(),
                      BookDetailsSection(),
                      Expanded(
                        child: SizedBox(
                          height: 50,
                        ),
                      ),
                      SimilerBooksSection(),
                      SizedBox(
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
