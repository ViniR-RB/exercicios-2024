import 'package:chuva/app/core/widgets/app_bar_custom.dart';
import 'package:chuva/app/features/activities/controller/activities_controller.dart';
import 'package:chuva/app/features/activities/states/activites_page_state.dart';
import 'package:chuva/app/features/activities/widgets/calendar_widget.dart';
import 'package:chuva/app/features/activities/widgets/card_activite.dart';
import 'package:flutter/material.dart';

class ActivitePage extends StatefulWidget {
  final ActivitiesController controller;
  const ActivitePage({super.key, required this.controller});

  @override
  State<ActivitePage> createState() => _ActivitePageState();
}

class _ActivitePageState extends State<ActivitePage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      widget.controller.getAllActivities().then((value) =>
          widget.controller.filtiringActivitesByDay(DateTime.now().day));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          actions: [],
        ),
        body: SafeArea(
          child: ListenableBuilder(
            listenable: widget.controller.pageStore.changeNotifier,
            child: CalendarWidget(
              onDaySelected: widget.controller.filtiringActivitesByDay,
            ),
            builder: (_, child) {
              return switch (widget.controller.pageStore.state) {
                ActivitesPageInitialState() => const SizedBox.shrink(),
                ActivitesPageLoadingState() => const Center(
                    child: CircularProgressIndicator(),
                  ),
                ActivitesPageEmptyState() => Column(
                    children: [
                      child!,
                      const Text("Nenhuma atividade encontrada")
                    ],
                  ),
                ActivitesPageLoadedState(activities: final activities) =>
                  Column(
                    children: [
                      child!,
                      Expanded(
                        child: ListView.builder(
                          itemCount: activities.length,
                          itemBuilder: (context, index) {
                            final activite = activities[index];
                            return CardActivite(
                              type: activite.type,
                              title: activite.title,
                              backGroundColor:
                                  activite.activiteCategory.backGroundColor,
                              colorType: activite.activiteCategory.color,
                              subTitle: activite.activiteCategory.title,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ActivitesPageErrorState(:final message) => Center(
                    child: Text(message),
                  ),
              };
            },
          ),
        ));
  }
}
