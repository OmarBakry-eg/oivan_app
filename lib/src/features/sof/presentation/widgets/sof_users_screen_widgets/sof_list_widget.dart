import 'package:flutter/material.dart';
import 'sof_users_list_tile_widget.dart';

class SOFUsersListWidget extends StatelessWidget {
  const SOFUsersListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (c, i) => const SOFUserListTileWidget(), itemCount: 16);
  }
}
