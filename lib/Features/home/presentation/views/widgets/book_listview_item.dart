import 'package:bookly_app/Core/utils/app_router.dart';
import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Core/widgets/custom_loading_indecator.dart';
import 'package:bookly_app/Core/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/book_rating_bestseller_item.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({
    super.key, required this.bookModel,
  });
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {GoRouter.of(context).push(AppRouter.kBookDetails,extra: bookModel)},
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: 125,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                    aspectRatio: 3.0 / 4,
                    child: CachedNetworkImage(
                      imageUrl: bookModel.volumeInfo!.imageLinks!.thumbnail ?? '',
                      fit: BoxFit.fill,
                      placeholder: (context, url) =>
                          const CustomLoadingIndecator(),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error_outline),
                    )),
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
                  bookModel.volumeInfo!.title!,
                  style:
                      Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              Text(bookModel.volumeInfo!.authors![0], style: Styles.textStyle14),
              const SizedBox(
                height: 3,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Free',
                    style: Styles.textStyle20
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                  BookRating(
                    rating: bookModel.volumeInfo!.averageRating ?? 0,
                    count: bookModel.volumeInfo!.ratingsCount ?? 0,
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }
}
