import 'package:flutter/material.dart';
import 'HistDetails.dart';
import 'HistoryModel.dart';

class ListEdit extends StatelessWidget {
  final HistoryModel item;
  final Animation<double> animation;
  final VoidCallback? onClicked;
  final VoidCallback? onClicked2;

  const ListEdit({
    required this.item,
    required this.animation,
    required this.onClicked,
    required this.onClicked2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => SizeTransition(
        sizeFactor: animation,
        child: Building(),
      );

  Widget Building() => Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(16),
        title: Text(
          item.date.toString(),
          style: TextStyle(fontSize: 20, color: Colors.black),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: onClicked,
                icon: Icon(Icons.delete, color: Colors.red, size: 32)),
            IconButton(
                onPressed: onClicked2,
                icon: Icon(Icons.arrow_forward, color: Colors.grey, size: 32)),
          ],
        ),
      ));
}
