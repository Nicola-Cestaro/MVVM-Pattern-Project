import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:mvvm/cat_list/models/cat_fact_model.dart';
import 'package:mvvm/cat_list/view_models/cat_facts_view_model.dart';
import 'package:provider/provider.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {

  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  bool showCards = false;

  @override
  void initState() {
    super.initState();
//you can use anything you like or not use anything here. I call it just to have a content on the screen rather than having a blank screen
  }

  @override
  Widget build(BuildContext context) {

    Size screenSize = MediaQuery.of(context).size;

    CatFactsViewModel catFactsViewModel = context.watch<CatFactsViewModel>();

    return Scaffold(
        appBar: AppBar(
            title: Text("MVVM Example")
        ),
        body: SingleChildScrollView(
          child: _ui(catFactsViewModel),
        )

    );
  }

  _ui(CatFactsViewModel catFactsViewModel) {
    List<Datum> listCatFacts = catFactsViewModel.catFactsListModel[0].data;
    Size screenSize = MediaQuery.of(context).size;
    if(catFactsViewModel.loading) {
      return Center(
        child: CircularProgressIndicator(),
      );
    }
    return Wrap(
      direction: Axis.horizontal,
      spacing: 8,
      runSpacing: 12,
      alignment: WrapAlignment.spaceEvenly,
      runAlignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      children: catFactsViewModel.catFactsListModel[0].data.map((catFact) => Container(
        width: screenSize.width * 0.45,
        height: screenSize.width * 0.45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(catFact.picURL),
                fit: BoxFit.cover
            )
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              child: SizedBox(
                width: screenSize.width * 0.45,
                height: screenSize.width * 0.23,
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                  child: Container(
                    decoration: BoxDecoration(color: Colors.white.withOpacity(0.0)),
                  ),
                ),
              ),
            ),
            Container(
              width: screenSize.width * 0.7,
              child: Text(
                catFact.fact.toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.roboto(
                    fontSize: 20,
                    color: Colors.black87,
                    fontWeight: FontWeight.w900
                ),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }
}