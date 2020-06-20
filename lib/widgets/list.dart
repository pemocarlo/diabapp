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

  StreamBuilder<List<int>> _buildFoodList(BuildContext context) {
    final Stream<List<int>> _posts = Stream<List<int>>.fromIterable(
      <List<int>>[
        List<int>.generate(20, (int i) => i),
      ],
    );

    return StreamBuilder(
      stream: _posts,
      builder: (context, AsyncSnapshot<List<int>> snapshot) {
        final tasks = snapshot.data ?? List();

        return ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (_, index) {
            final itemTask = tasks[index];
            return _buildListItem(itemTask);
          },
        );
      },
    );
  }

  Widget _buildListItem(int itemTask) {
    return ListTile(
      title: Text(
        itemTask.toString(),
        style: _biggerFont,
      ),
    );
  }
}
