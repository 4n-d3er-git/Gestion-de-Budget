import 'package:budget_odc/Page/budget_page/budget_annee/budget_annee.dart';
import 'package:budget_odc/Page/budget_page/budget_mois/budget_mois.dart';
import 'package:budget_odc/Page/budget_page/budget_semaine/budget_semaine.dart';
import 'package:budget_odc/theme/couleur.dart';
import 'package:flutter/material.dart';

class BudgetPage extends StatefulWidget {
  const BudgetPage({super.key});

  @override
  State<BudgetPage> createState() => _BudgetPageState();
}

class _BudgetPageState extends State<BudgetPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  DateTimeRange plageChoisi =
      DateTimeRange(start: DateTime.now(), end: DateTime.now());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Gestion de Budgets",
            ),
            bottom: PreferredSize(
                preferredSize: Size.fromHeight(40),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  child: Container(
                    height: 40,
                    padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      color: vertClaire,
                    ),
                    child: TabBar(
                        indicatorSize: TabBarIndicatorSize.tab,
                        dividerColor: Colors.transparent,
                        indicator: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelColor: noir,
                        unselectedLabelColor: noir,
                        labelStyle: TextStyle(fontWeight: FontWeight.bold),
                        tabs: [
                          Tab(
                            text: "Semaine",
                          ),
                          Tab(
                            text: "Mois",
                          ),
                          Tab(
                            text: "Année",
                          )
                        ]),
                  ),
                )),
          ),
          body: TabBarView(children: [
            BudgetSemaine(),
            BudgetMois(),
            BudgetAnne(),
          ])),
    );
  }
}
