import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/core/errors/logger.dart';
import 'package:oivan_app/src/features/sof/domain/entities/sof_users_entity.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';
import 'package:oivan_app/src/utils/ui/consts.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import 'package:oivan_app/src/utils/ui/routing/route_strings.dart';
import 'package:intl/intl.dart' as intl;

class SOFUserListTileWidget extends StatelessWidget {
  final SofUserEntity sofUserEntity;
  const SOFUserListTileWidget({super.key, required this.sofUserEntity});

  @override
  Widget build(BuildContext context) {
    final SofUsersCubit sofUsersCubit = BlocProvider.of<SofUsersCubit>(context);

    return ListTile(
        onTap: () => Constants.navigateTo(RouteStrings.sofUserDetailsPageString,
            extra: sofUserEntity.userId.toString()),
        leading: CircleAvatar(
          backgroundImage: sofUserEntity.profileImage == null
              ? null
              : CachedNetworkImageProvider(sofUserEntity.profileImage!),
          backgroundColor:
              sofUserEntity.profileImage == null ? MyColors.purpleColor : null,
          radius: 25,
        ),
        title: CustomBaseText(title: sofUserEntity.displayName),
        isThreeLine: true,
        subtitle: CustomBaseText(
          title:
              'Reputation : ${intl.NumberFormat.compact().format(sofUserEntity.reputation).toLowerCase()}\n${sofUserEntity.location}',
          color: Colors.grey[500],
          fontSize: 13,
        ),
        trailing: IconButton(
          onPressed: () {
            sofUsersCubit.bookmarkFunc(sofUserEntity);
          },
          icon: BlocConsumer<SofUsersCubit, SofUsersState>(
            listener: (p, c) => logWarning("c is $c"),
            bloc: sofUsersCubit,
            buildWhen: (p, c) =>
                c is SofLocalUsersState ||
                c is SofLocalUsersErrorState ||
                c is SofLocalNewState,
            builder: (context, state) {
              return Icon(
                sofUsersCubit.isItemFound(sofUserEntity)
                    ? Icons.bookmark
                    : Icons.bookmark_outline,
                size: 26,
                color: MyColors.orangeColor,
              );
            },
          ),
        ));
  }
}
