// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'informacions_page.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InfoStore on _InfoStore, Store {
  late final _$infosAtom = Atom(name: '_InfoStore.infos', context: context);

  @override
  ObservableList<String> get infos {
    _$infosAtom.reportRead();
    return super.infos;
  }

  @override
  set infos(ObservableList<String> value) {
    _$infosAtom.reportWrite(value, super.infos, () {
      super.infos = value;
    });
  }

  late final _$loadInfosAsyncAction =
      AsyncAction('_InfoStore.loadInfos', context: context);

  @override
  Future<void> loadInfos() {
    return _$loadInfosAsyncAction.run(() => super.loadInfos());
  }

  late final _$saveInfosAsyncAction =
      AsyncAction('_InfoStore.saveInfos', context: context);

  @override
  Future<void> saveInfos() {
    return _$saveInfosAsyncAction.run(() => super.saveInfos());
  }

  late final _$_InfoStoreActionController =
      ActionController(name: '_InfoStore', context: context);

  @override
  void addInfo(String info) {
    final _$actionInfo =
        _$_InfoStoreActionController.startAction(name: '_InfoStore.addInfo');
    try {
      return super.addInfo(info);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeInfo(int index) {
    final _$actionInfo =
        _$_InfoStoreActionController.startAction(name: '_InfoStore.removeInfo');
    try {
      return super.removeInfo(index);
    } finally {
      _$_InfoStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
infos: ${infos}
    ''';
  }
}
