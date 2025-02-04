import 'package:bookly_app/Core/widgets/custom_buttons.dart';
import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonAction extends StatelessWidget {
  const ButtonAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
            child: CustomButton(
          text: 'Free',
          backgroundColor: Colors.white,
          textColor: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
        )),
        Expanded(
            child: CustomButton(
          onPressed: () async {
            Uri _url = Uri.parse(bookModel.volumeInfo!.previewLink!);
            if (await canLaunchUrl(_url)) {
              await launchUrl(_url);
            }
          },
          text: 'Free Preview',
          backgroundColor: const Color(0xffEF8262),
          textColor: Colors.white,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        )),
      ],
    );
  }
}
