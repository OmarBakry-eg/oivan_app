import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';

class SofUserDetailsListTileWidget extends StatelessWidget {
  const SofUserDetailsListTileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Padding(
        padding: EdgeInsets.only(bottom: 9),
        child: CustomBaseText(
          title: 'Reputation Type : answer_accepted',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      isThreeLine: true,
      subtitle: CustomBaseText(
        title:
            'Change : 10\nCreated At : ${DateFormat.yMMMd().format(DateTime.fromMillisecondsSinceEpoch(1222430705 * 1000))}',
        color: Colors.grey[500],
        fontSize: 13,
      ),
      trailing: const CustomBaseText(
        title: 'Post ID : 121212',
        fontSize: 13,
      ),
    );
  }
}
