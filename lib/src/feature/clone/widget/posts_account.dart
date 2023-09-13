import 'dart:io';

import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';
import '../../../common/constants/icons.dart';

class PostsAccount extends StatefulWidget {
  final String image;
  final String userName;
  final Widget widget;
  final Widget widgetComment;
  final int likesCount;
  final int time;
  final String comment;
  final Size size;
  final double aspectRatio;

  const PostsAccount({
    required this.aspectRatio,
    required this.size,
    required this.widgetComment,
    required this.time,
    required this.image,
    required this.userName,
    required this.widget,
    required this.likesCount,
    required this.comment,
    super.key,
  });

  @override
  State<PostsAccount> createState() => _PostsAccountState();
}

class _PostsAccountState extends State<PostsAccount> {
  bool isLike = false;
  late int itemLike;
  bool showLike = true;
  bool isSave = false;

  @override
  void initState() {
    super.initState();
    itemLike = widget.likesCount;
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onDoubleTap() {
    if (!isLike) {
      setState(() {
        showLike = false;
        isLike = true;
        itemLike++;
      });
    } else {
      setState(() {
        isLike;
        showLike = true;
      });
    }
    if (showLike) {
      setState(() {
        sleep(const Duration(seconds: 1));
        showLike = true;
      });
    }
  }

  void onTap() {
    setState(() {
      isLike = !isLike;
      isLike ? itemLike++ : itemLike--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            SizedBox(
              width: 390,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  GestureDetector(
                    onDoubleTap: onDoubleTap,
                    child: AspectRatio(
                      aspectRatio: widget.aspectRatio,
                      child: Image(
                        fit: BoxFit.cover,
                        image: NetworkImage(widget.image),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: !showLike,
                    child: const Center(
                      child: Image(
                        width: 80,
                        height: 80,
                        color: AppColor.white,
                        image: AssetImage(AppIcons.icLiked),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              left: 5,
              top: 5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 340,
                    child: Row(
                      children: [
                        widget.widget,
                        const SizedBox(width: 5),
                        Text(
                          widget.userName,
                          style: const TextStyle(
                            color: AppColor.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.more_horiz),
                    color: AppColor.white,
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          width: widget.size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 90,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      InkWell(
                        onTap: onTap,
                        child: Image(
                          image: isLike
                              ? const AssetImage(AppIcons.icLiked)
                              : const AssetImage(AppIcons.icLike),
                          width: 24,
                          height: 24,
                        ),
                      ),
                      const InkWell(
                        child: Image(
                            image: AssetImage(AppIcons.icComment),
                            width: 24,
                            height: 24),
                      ),
                      const InkWell(
                        child: Image(
                          image: AssetImage(AppIcons.icSend),
                          width: 24,
                          height: 24,
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      isSave = !isSave;
                    });
                  },
                  child: !isSave
                      ? const Icon(Icons.bookmark_border_outlined, size: 28)
                      : const Icon(Icons.bookmark, size: 28),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$itemLike Likes",
                style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppColor.black,
                ),
              ),
              SizedBox(
                width: widget.size.width - 30,
                child: RichText(
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                    style: const TextStyle(
                      fontSize: 14,
                      color: AppColor.black,
                    ),
                    children: [
                      TextSpan(
                        text: widget.userName,
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: " ${widget.comment}",
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "View all ${widget.likesCount} comments",
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),
              SizedBox(
                width: 340,
                child: Row(
                  children: [
                    widget.widgetComment,
                    const SizedBox(width: 5),
                    const Text(
                      "Add a comment",
                      style: TextStyle(
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "${widget.time} hours ago",
                style: const TextStyle(
                  color: AppColor.grey,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
