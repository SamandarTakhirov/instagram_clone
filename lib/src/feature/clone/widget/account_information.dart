import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/src/common/constants/app_color.dart';

class AccountInformation extends StatefulWidget {
  final String accountName;
  final void Function()? openHashtag;
  final void Function()? openLink;
  final String? bio;
  final String? bioHashtag;
  final String? category;
  final String? link;

  const AccountInformation({
    required this.accountName,
    this.openLink,
    this.bioHashtag,
    this.openHashtag,
    this.bio,
    this.category,
    this.link,
    super.key,
  });

  @override
  State<AccountInformation> createState() => _AccountInformationState();
}

class _AccountInformationState extends State<AccountInformation> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.accountName,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 15,
          ),
        ),
        widget.category != null ?  Text(
         widget.category!,
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 13,
            color: AppColor.grey,
          ),
        ) : SizedBox(),
        widget.bio != null ? RichText(
          text: TextSpan(
            style: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 14,
              color: AppColor.black,
            ),
            children: [
              TextSpan(text: widget.bio),
              TextSpan(
                recognizer: TapGestureRecognizer()..onTap = widget.openHashtag,
                text: widget.bioHashtag,
                style: const TextStyle(
                  color: AppColor.blue,
                ),
              ),
            ],
          ),
        ) : SizedBox(),
        widget.link != null ? GestureDetector(
          onTap: widget.openLink,
          child: Text(
            widget.link!,
            style: const TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: AppColor.blue,
            ),
          ),
        ) :SizedBox(),
      ],
    );
  }
}
