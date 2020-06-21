import 'package:flutter/material.dart';

class Searching extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search App Bar"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          )
        ],
      ),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    "Algiers",
    "Tirana",
    "Bogota",
    "Berlin",
    "Viena",
    "Rome",
    "Madrid",
    "Paris",
    "Tokyo",
    "Sydney",
    "Beijng",
    "Auckland",
    "Baku",
    "Prague",
    "Ankara",
  ];

  final recentCities = [
    "Madrid",
    "Paris",
  ];

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
    return Center(
      child: Center(
        child: Text(query)
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // show when someone searches
    final suggestionList = query.isEmpty
        ? recentCities
        : cities.where((p) => p.startsWith(query)).toList();

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
          this.query = suggestionList[index];
          showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: Text(suggestionList[index]),
      ),
      itemCount: suggestionList.length,
    );
  }
}
