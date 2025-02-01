import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_bestseller_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bookdetails_action_button.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail,
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          bookModel.volumeInfo!.title!,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
            bookModel.volumeInfo!.authors![0],
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        BookRating(
          count: bookModel.volumeInfo?.ratingsCount ?? 0,
          rating: bookModel.volumeInfo?.averageRating ?? 0,
        ),
        const SizedBox(
          height: 37,
        ),
        const ButtonAction(),
      ],
    );
  }
}
