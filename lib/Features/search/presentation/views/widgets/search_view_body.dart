import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/custom_search_textfeild.dart';
import 'package:bookly_app/Features/search/presentation/views/widgets/search_result_listview.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CustomSearchTextFeild(),
          const SizedBox(
            height: 15,
          ),
          Text(
            'Result Books',
            style: Styles.textStyle18.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          const SearchResultListView(),
        ],
      ),
    );
  }
}
