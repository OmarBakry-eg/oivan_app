import 'package:flutter/material.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';

import 'sof_users_list_tile_widget.dart';

class SOFUsersLocalListWidget extends StatelessWidget {
  const SOFUsersLocalListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (c, i) =>  SOFUserListTileWidget(sofUserEntity: SofUserEntity(userId: 22656,reputation: 1388451,displayName: 'Jon Skeet',profileImage: "https://www.gravatar.com/avatar/6d8ebb117e8d83d74ea95fbdd0f87e13?s=256&d=identicon&r=PG",location: 'Reading, United Kingdom',),), itemCount: 16);
  }
}
