import 'package:bookly_app/Features/home/presentation/views/widgets/book_listview_item.dart';
import 'package:flutter/material.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: 10,
          itemBuilder: (context, index) {
            // return const Padding(
            //   padding: EdgeInsets.symmetric(vertical: 10),
            //   child: BookListViewItem(),
            // );
          }),
    );
  }
}
