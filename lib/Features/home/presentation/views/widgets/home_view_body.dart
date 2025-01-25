import 'package:bookly_app/Core/utils/styles.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:bookly_app/Features/home/presentation/views/widgets/custom_listview.dart';
import 'package:bookly_app/constants.dart';
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

class BestSallerListViewItem extends StatelessWidget {
  const BestSallerListViewItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Column(children: [
          SizedBox(
            width: MediaQuery.of(context).size.width * .6,
            child: Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              'Harry Potter and the Goblet of Fire',
              style: Styles.textStyle20.copyWith(fontWeight: FontWeight.w600),
            ),
          )
        ])
      ],
    );
  }
}
