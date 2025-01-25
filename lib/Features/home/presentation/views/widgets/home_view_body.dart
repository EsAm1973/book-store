import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/bestseller_listview_item.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_listview.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomAppBar(),
            CustomListView(),
            SizedBox(
              height: 50,
            ),
            Text(
              'Best Saller',
              style: Styles.textStyle18,
            ),
            SizedBox(
              height: 20,
            ),
            BestSallerListViewItem(),
          ],
        ),
      ),
    );
  }
}

