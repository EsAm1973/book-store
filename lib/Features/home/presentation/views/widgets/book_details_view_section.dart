import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_bestseller_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bookdetails_action_button.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_book_image.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .18),
          child: const CustomBookImage(
            imageUrl:
                'https://images.unsplash.com/photo-1541963463532-d68292c34b19?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          'The Jungle Book',
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
            'Rudyard Kipling',
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(),
        const SizedBox(
          height: 37,
        ),
        const ButtonAction(),
      ],
    );
  }
}
