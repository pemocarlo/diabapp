import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class DataSearch<T> extends SearchDelegate {
  final Function queryDB;
  final Function initialSuggestions;
  final Function title;
  final Function subtitle;
  final Function onTap;

  DataSearch(this.queryDB, this.title, this.subtitle, this.onTap,
      {@required this.initialSuggestions});

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
        builder: (context, AsyncSnapshot<List<T>> snapshot) {
          final tasks = snapshot.data ?? List();

          return ListView.builder(
            itemBuilder: (context, index) => Slidable(
              actionPane: SlidableDrawerActionPane(),
              secondaryActions: <Widget>[
                IconSlideAction(
                  caption: 'Delete',
                  color: Colors.red,
                  icon: Icons.delete,
                  onTap: () {},
                )
              ],
              child: ListTile(
                onTap: () {
                  onTap(tasks, index);
                  this.close(context, null);
                },
                leading: Icon(Icons.restaurant),
                title: Text(title(tasks, index) ?? "undefined"),
                subtitle: Text(subtitle(tasks, index) ?? "Unknown brand"),
              ),
            ),
            itemCount: tasks.length,
          );
        });
  }
}
