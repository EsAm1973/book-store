import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_bookdetails.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const BookDetailsCustomAppBar(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * .18),
              child: const CustomBookImage(),
            ),
            const SizedBox(
              height: 43,
            ),
            const DefaultTextStyle(
              style: Styles.textStyle30,
              child: Text('The Jungle Book'),
            ),
            const SizedBox(
              height: 6,
            ),
            Opacity(
              opacity: 0.8,
              child: DefaultTextStyle(
                style: Styles.textStyle18.copyWith(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.w500,
                ),
                child: const Text('Rudyard Kipling'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
