import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_bestseller_item.dart';
import 'package:bookly_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        GoRouter.of(context).push(AppRouter.kBookDetails)
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 125,
              child: AspectRatio(
                aspectRatio: 3.0 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: const DecorationImage(
                        image: AssetImage(kTestImage), fit: BoxFit.fill),
                  ),
                ),
              )),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .6,
                child: Text(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  'Harry Potter and the Goblet of Fire',
                  style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text('J.K Rowling', style: Styles.textStyle14),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '19.99 \$',
                    style:
                        Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const BookRating(),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}