
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/constants/app_color.dart';

class AccountEdit extends StatefulWidget {
  const AccountEdit({Key? key}) : super(key: key);

  @override
  State<AccountEdit> createState() => _AccountEditState();
}

class _AccountEditState extends State<AccountEdit> {
  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 35,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColor.button,
                borderRadius: BorderRadius.all(Radius.circular(3)),
              ),
              child: Center(
                child: Text(
                  "Edit profile",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(width: 5),
        SizedBox(
          width: 35,
          height: 35,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColor.button,
              borderRadius: BorderRadius.all(Radius.circular(3)),
            ),
            child: Center(
              child: Icon(CupertinoIcons.person_add_solid),
            ),
          ),
        ),
      ],
    );
  }
}
