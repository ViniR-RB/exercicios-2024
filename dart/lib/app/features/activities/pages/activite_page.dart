import 'package:chuva/app/core/widgets/app_bar_custom.dart';
import 'package:chuva/app/features/activities/controller/activities_controller.dart';
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
    /*  widget.controller.getAllActivities(); */
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppBarCustom(
          actions: [],
        ),
        body: Column(
          children: [
            CalendarWidget(
              onDaySelected: (_) {},
            ),
            /* ListenableBuilder(
              listenable: widget.controller.store.changeNotifier,
              builder: (context, child) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: widget.controller.store.state.length,
                    itemBuilder: (_, index) {
                      final activie = widget.controller.store.state[index];
                      return CardActivite(
                        title: activie.title,
                        backGroundColor:
                            activie.activiteCategory.backGroundColor,
                        colorType: activie.activiteCategory.color,
                        subTitle: activie.activiteCategory.title,
                      );
                    },
                  ),
                );
              },
            ) */
            Expanded(
              child: ListView(
                children: const [
                  CardActivite(
                    title: "A Física dos Buracos Negros\nSupermassivos",
                    subTitle: "Stephen William Hawking",
                    colorType: Colors.orange,
                    backGroundColor: Colors.white60,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
