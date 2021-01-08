import 'package:flutter/material.dart';
import 'package:flutter_notes_taking_app/db_helper/db_helper.dart';
import 'package:flutter_notes_taking_app/model/notes.dart';

class NoteProvider with ChangeNotifier{

  List _items = [];
  List get items {
    return [..._items];
  }
  Future addOrUpdateNote(int id, String title, String content,
      String imagePath, EditMode editMode) async {
    final note = Note(id, title, content, imagePath);
    if (EditMode.ADD == editMode) {
      _items.insert(0, note);
    } else {
      _items[_items.indexWhere((note) => note.id == id)] = note;
    }
    notifyListeners();
    db_helper.insert(
      {
        'id': note.id,
        'title': note.title,
        'content': note.content,
        'imagePath': note.imagePath,
      },
    );
  }


}

enum EditMode {
  ADD,
  UPDATE,
}