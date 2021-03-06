// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter_architecture_samples/flutter_architecture_samples.dart';
import 'package:fire_redux_sample/actions/actions.dart';
import 'package:fire_redux_sample/models/models.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:fire_redux_sample/presentation/add_edit_screen.dart';

class AddTodo extends StatelessWidget {
  AddTodo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new StoreConnector<AppState, OnSaveCallback>(
      converter: (Store<AppState> store) {
        return (task, note) {
          store.dispatch(new AddTodoAction(new Todo(
            task,
            note: note,
          )));
        };
      },
      builder: (BuildContext context, OnSaveCallback onSave) {
        return new AddEditScreen(
          key: ArchSampleKeys.addTodoScreen,
          onSave: onSave,
          isEditing: false,
        );
      },
    );
  }
}
