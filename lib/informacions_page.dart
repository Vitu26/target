import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'informacions_page.g.dart';


class InfoStore = _InfoStore with _$InfoStore;

abstract class _InfoStore with Store {
  @observable
  ObservableList<String> infos = ObservableList<String>();

  @action
  void addInfo(String info) {
    infos.add(info);
    saveInfos();
  }

  @action
  void removeInfo(int index) {
    infos.removeAt(index);
    saveInfos();
  }

  @action
  Future<void> loadInfos() async {
    final prefs = await SharedPreferences.getInstance();
    infos = ObservableList.of(prefs.getStringList('infos') ?? []);
  }

  @action
  Future<void> saveInfos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('infos', infos.toList());
  }
}

class InfoPage extends StatefulWidget {
  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final InfoStore store = InfoStore();
  final TextEditingController infoController = TextEditingController();
  final FocusNode focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    store.loadInfos();
    focusNode.requestFocus();
  }

  void _saveInfo() {
    if (infoController.text.isNotEmpty) {
      store.addInfo(infoController.text);
      infoController.clear();
      focusNode.requestFocus();
    }
  }

  void _confirmDelete(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmação'),
          content: Text('Deseja excluir esta informação?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text('Excluir'),
              onPressed: () {
                store.removeInfo(index);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Captura de Informações')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Observer(
                builder: (_) => ListView.builder(
                  itemCount: store.infos.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(store.infos[index]),
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () => _confirmDelete(index),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            TextField(
              controller: infoController,
              focusNode: focusNode,
              decoration: InputDecoration(labelText: 'Digite seu texto'),
              onSubmitted: (_) => _saveInfo(),
            ),
            ElevatedButton(
              onPressed: _saveInfo,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
