import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import '../../../../../utils/base/custom_base_text.dart';
import 'sof_users_list_tile_widget.dart';

class SOFUsersLocalListWidget extends StatefulWidget {
  const SOFUsersLocalListWidget({super.key});

  @override
  State<SOFUsersLocalListWidget> createState() =>
      _SOFUsersLocalListWidgetState();
}

class _SOFUsersLocalListWidgetState extends State<SOFUsersLocalListWidget>
    with AutomaticKeepAliveClientMixin {
  late final SofUsersCubit sofUsersCubit;
  @override
  void initState() {
    sofUsersCubit = BlocProvider.of<SofUsersCubit>(context);
    sofUsersCubit.getAllLocalUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<SofUsersCubit, SofUsersState>(
      bloc: sofUsersCubit,
      buildWhen: (p, c) => c is SofLocalUsersState || c is SofUsersInitialState,
      builder: (context, state) {
        return state is SofLocalUsersState
            ? state.sofUsersList.isEmpty
                ? const Center(
                    child: CustomBaseText(title: 'No saved users'),
                  )
                : ListView.builder(
                    itemBuilder: (c, i) => SOFUserListTileWidget(
                          sofUserEntity: state.sofUsersList[i],
                        ),
                    itemCount: state.sofUsersList.length)
            : const SizedBox.shrink();
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
