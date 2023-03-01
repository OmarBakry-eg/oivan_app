import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oivan_app/src/features/sof/presentation/cubit/sof_users_cubit.dart';
import 'package:oivan_app/src/utils/base/custom_base_text.dart';
import 'package:oivan_app/src/utils/base/custom_loading_widget.dart';
import 'package:oivan_app/src/utils/ui/my_colors.dart';
import 'package:oivan_app/src/utils/ui/routing/routes.dart';
import 'package:route_detector/route_detector.dart';
import 'sof_user_detail_list_tile_widget.dart';

class SofUserDetailsListWidget extends StatelessWidget {
  final String userID;
  const SofUserDetailsListWidget({super.key, required this.userID});

  @override
  Widget build(BuildContext context) {
    final SofUsersCubit sofUsersCubit = BlocProvider.of<SofUsersCubit>(context);
    return RouteDetector(
      routeObserver: AppRoutes.routeObserver,
      onShowingScreen: () {
        sofUsersCubit.setupScrollDetailsController(userID);
        sofUsersCubit.getUserDetails(userID: userID);
      },
      onLeaveScreen: () {
        sofUsersCubit.clearDataFromUserDetails();
      },
      child: BlocBuilder<SofUsersCubit, SofUsersState>(
        bloc: sofUsersCubit,
        buildWhen: (p, c) =>
            c is SofUsersDetailsLoadingState ||
            c is SofUsersDetailsErrorState ||
            c is SofUsersDetailsLoadedState,
        builder: (context, state) {
          return state is SofUsersDetailsLoadingState
              ? const Center(child: CustomLoadingWidget())
              : state is SofUsersDetailsErrorState
                  ? Center(
                      child: CustomBaseText(title: state.message),
                    )
                  : ListView.separated(
                      controller: sofUsersCubit.scrollControllerDetails,
                      itemBuilder: (c, i) {
                        if (state is SofUsersDetailsLoadedState) {
                          return i >= state.sofUsersDetailsEntityList.length
                              ? const Center(
                                  child: CustomLoadingWidget(),
                                )
                              : SofUserDetailsListTileWidget(
                                  sofUserDetailsEntity:
                                      state.sofUsersDetailsEntityList[i],
                                );
                        }
                        return const SizedBox.shrink();
                      },
                      itemCount: state is SofUsersDetailsLoadedState
                          ? state.hasReachedMax
                              ? state.sofUsersDetailsEntityList.length
                              : state.sofUsersDetailsEntityList.length + 1
                          : 0,
                      separatorBuilder: (c, i) => const Divider(
                        color: MyColors.whiteColor,
                        height: 40,
                        thickness: 1,
                      ),
                    );
        },
      ),
    );
  }
}
