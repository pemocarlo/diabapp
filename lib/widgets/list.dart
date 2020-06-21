import 'package:diabapp/data/open_food_facts_database.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Foods extends StatefulWidget {
  const Foods({
    Key key,
  }) : super(key: key);

  @override
  _FoodsState createState() => _FoodsState();
}

class _FoodsState extends State<Foods> {
  final _biggerFont = const TextStyle(
    fontSize: 18.0,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return _buildFoodList(context);
  }

  StreamBuilder<List<Foodinfo>> _buildFoodList(BuildContext context) {
    final database = Provider.of<OpenFoodFactsDataBase>(context);


    return StreamBuilder(
      stream: database.watchAllTasks(),
      builder: (context, AsyncSnapshot<List<Foodinfo>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Foodinfo itemTask, OpenFoodFactsDataBase database) {
    return ListTile(
      title: Text(
        itemTask.productName,
        style: _biggerFont,
      ),
    );
  }
}
