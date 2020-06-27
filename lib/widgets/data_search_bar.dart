import 'package:diabapp/data/open_food_facts_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:diabapp/main.dart';

class DataSearch extends SearchDelegate<String> {
  final Function queryDB;
  final Function initialSuggestions;
  DataSearch(this.queryDB, {this.initialSuggestions});

  @override
  List<Widget> buildActions(BuildContext context) {
    // Actions for appbar
    return <Widget>[
      query.isNotEmpty
          ? IconButton(
              tooltip: 'Clear',
              icon: const Icon(Icons.clear),
              onPressed: () {
                query = '';
                showSuggestions(context);
              },
            )
          : IconButton(
              icon: const Icon(Icons.mic),
              tooltip: 'Voice input',
              onPressed: () {
                this.query = 'TODO: Get input from voice';
              },
            ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left
    return IconButton(
      tooltip: 'Back',
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        //Take control back to previous page
        this.close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    // show results based on the selection
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches
    final suggestionList =
        query.isEmpty ? initialSuggestions() : queryDB(query);

    return StreamBuilder(
        stream: suggestionList,
        builder: (context, AsyncSnapshot<List<Foodinfo>> snapshot) {
          final tasks = snapshot.data ?? List();

          return ListView.builder(
            itemBuilder: (context, index) => ListTile(
              onTap: () {
                Provider.of<MealItems>(context, listen: false)
                    .addFood(tasks[index]);
                // showResults(context);
                this.close(context, null);
              },
              leading: Icon(Icons.restaurant),
              title: Text(tasks[index].productName ?? "undefined"),
              subtitle: Text(tasks[index].brands ?? "Unknown brand"),
            ),
            itemCount: tasks.length,
          );
        });
  }
}
