import 'package:bookly_app/Features/home/presentation/views/widgets/custom_app_bar_bookdetails.dart';
import 'package:flutter/material.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            BookDetailsCustomAppBar(),
          ],
        ),
      ),
    );
  }
}