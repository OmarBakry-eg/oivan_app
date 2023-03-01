import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_details_entity.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';

class SofUserDetailsListTileWidget extends StatelessWidget {
  final SofUserDetailsEntity sofUserDetailsEntity;
  const SofUserDetailsListTileWidget(
      {super.key, required this.sofUserDetailsEntity});

  @override
  Widget build(BuildContext context) {
    final SofUsersCubit sofUsersCubit =
        BlocProvider.of<SofUsersCubit>(context, listen: false);
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.only(bottom: 9),
        child: CustomBaseText(
          title:
              'Reputation Type : ${sofUserDetailsEntity.reputationHistoryType}',
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      isThreeLine: true,
      subtitle: CustomBaseText(
        title:
            'Change : ${sofUserDetailsEntity.reputationChange}\nCreated At : ${sofUsersCubit.dateConverterForDetails(sofUserDetailsEntity.creationDate)}',
        color: Colors.grey[500],
        fontSize: 13,
      ),
      trailing: CustomBaseText(
        title: 'Post ID : ${sofUserDetailsEntity.postId}',
        fontSize: 13,
      ),
    );
  }
}
