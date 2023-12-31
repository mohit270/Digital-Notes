import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:digital_note/app_style.dart';
import 'package:flutter/material.dart';

Widget noteCard(
    Function()? onTap, Function()? onLongPressed, DocumentSnapshot? user) {
  return InkWell(
    onTap: onTap,
    onLongPress: onLongPressed,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: App_Style.cardsColor[int.parse(user!['color_id'])],
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          user['note_titile'],
          style: App_Style.mainTitle,
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user['creation_date'],
          style: App_Style.dateTitle,
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          user['note_content'],
          style: App_Style.mainContent,
          overflow: TextOverflow.ellipsis,
          maxLines: 4,
        ),
      ]),
    ),
  );
}
