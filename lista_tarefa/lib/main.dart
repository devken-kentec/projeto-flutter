import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() => runApp(ListaTarefas());

class ListaTarefas extends StatefulWidget {
  ListaTarefas({Key? key}) : super(key: key);

  @override
  _ListaTarefasState createState() => _ListaTarefasState();
}

class _ListaTarefasState extends State<ListaTarefas> {
  final _textToDoController = TextEditingController();
  List _toDoList = [];

  late Map<String, dynamic> _lastRemoved;
  late int _lastRemovedPosition;

  @override
  void initState() {
    super.initState();
    _readData().then((data) {
      setState(() {
        _toDoList = json.decode(data);
      });
    });
  }

  void _addToDo() {
    setState(() {
      Map<String, dynamic> newToDo = Map();
      newToDo["tarefa"] = _textToDoController.text;
      newToDo["status"] = false;
      _toDoList.add(newToDo);
      _textToDoController.text = "";

      _saveData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lista de Tarefas',
        home: Scaffold(
            appBar: AppBar(
              title: Text('Lista de Tarefas'),
              backgroundColor: Colors.blueAccent,
              centerTitle: true,
            ),
            body: Column(children: <Widget>[
              Container(
                  padding: EdgeInsets.fromLTRB(15.0, 2.0, 7.0, 2.0),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _textToDoController,
                          decoration: InputDecoration(
                              labelText: "Nova Tarefa",
                              labelStyle: TextStyle(color: Colors.blueAccent)),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () => _addToDo(),
                        child: Text('Adicionar'),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple, // background
                          onPrimary: Colors.white,
                        ),
                      )
                    ],
                  )),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: _refresh,
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 10.0),
                      itemCount: _toDoList.length,
                      itemBuilder: buildItem),
                ),
              ),
            ])));
  }

  Widget buildItem(BuildContext context, int index) {
    return Dismissible(
      key: Key(DateTime.now().millisecondsSinceEpoch.toString()),
      background: Container(
        color: Colors.red,
        child: Align(
          alignment: Alignment(-0.9, 0.0),
          child: Icon(Icons.delete, color: Colors.white),
        ),
      ),
      direction: DismissDirection.startToEnd,
      child: CheckboxListTile(
        onChanged: (status) {
          setState(() {
            _toDoList[index]["status"] = status;
            _saveData();
          });
        },
        title: Text(_toDoList[index]["tarefa"]),
        value: _toDoList[index]["status"],
        secondary: CircleAvatar(
          child: Icon(_toDoList[index]["status"] ? Icons.check : Icons.error),
        ),
      ),
      onDismissed: (direction) {
        setState(() {
          _lastRemoved = Map.from(_toDoList[index]);
          _lastRemovedPosition = index;
          _toDoList.removeAt(index);
          _saveData();

          final snack = SnackBar(
              duration: Duration(seconds: 10),
              content: Text("A Tarefa ${_lastRemoved["tarefa"]} foi removida!"),
              action: SnackBarAction(
                label: "Recuperar",
                onPressed: () {
                  setState(() {
                    _toDoList.insert(_lastRemovedPosition, _lastRemoved);
                    _saveData();
                  });
                },
              ));
          Scaffold.of(context).removeCurrentSnackBar();
          Scaffold.of(context).showSnackBar(snack);
        });
      },
    );
  }

  Future<Null> _refresh() async {
    await Future.delayed(Duration(seconds: 1));

    setState(() {
      _toDoList.sort((x, y) {
        if (x["status"] && !y["status"])
          return 1;
        else if (!x["status"] && y["status"])
          return 1;
        else
          return 0;
      });
      _saveData();
    });
    return null;
  }

  Future<File> _getFile() async {
    final directory = await getApplicationDocumentsDirectory();
    return File("${directory.path}/data.json");
  }

  Future<File> _saveData() async {
    String data = json.encode(_toDoList);
    final file = await _getFile();
    return file.writeAsString(data);
  }

  Future<String> _readData() async {
    try {
      final file = await _getFile();
      return file.readAsString();
    } catch (e) {
      return e.toString();
    }
  }
}
