import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';
import '../../../../../utils/base/custom_loading_widget.dart';
import 'sof_users_list_tile_widget.dart';

class SOFUsersListWidget extends StatefulWidget {
  const SOFUsersListWidget({super.key});

  @override
  State<SOFUsersListWidget> createState() => _SOFUsersListWidgetState();
}

class _SOFUsersListWidgetState extends State<SOFUsersListWidget>
    with AutomaticKeepAliveClientMixin {
  late final SofUsersCubit sofUsersCubit;
  @override
  void initState() {
    sofUsersCubit = BlocProvider.of<SofUsersCubit>(context);
    sofUsersCubit.setupScrollController();
    sofUsersCubit.getAllLocalUsers();
    sofUsersCubit.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return BlocBuilder<SofUsersCubit, SofUsersState>(
      buildWhen: (p, c) =>
          c is SofUsersLoadingState ||
          c is SofUsersErrorState ||
          c is SofUsersLoadedState,
      bloc: sofUsersCubit,
      builder: (context, state) {
        return state is SofUsersLoadingState
            ? const CustomLoadingWidget()
            : state is SofUsersErrorState
                ? Center(
                    child: CustomBaseText(title: state.message),
                  )
                : ListView.builder(
                    controller: sofUsersCubit.scrollController,
                    itemBuilder: (c, i) {
                      if (state is SofUsersLoadedState) {
                        return i >= state.sofUserEntityList.length
                            ? const Center(
                                child: CustomLoadingWidget(),
                              )
                            : SOFUserListTileWidget(
                                sofUserEntity: state.sofUserEntityList[i],
                              );
                      }
                      return const SizedBox.shrink();
                    },
                    itemCount: state is SofUsersLoadedState
                        ? state.hasReachedMax
                            ? state.sofUserEntityList.length
                            : state.sofUserEntityList.length + 1
                        : 0);
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
