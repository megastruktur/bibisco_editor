import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'book.dart';
import 'dart:developer';
import 'editable.dart';
import 'globals.dart' as globals;
import 'package:flutter_html/flutter_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
import 'package:provider/provider.dart';
import 'scene.dart';

void main() {
  runApp(BibiscoEditor());
}


class BibiscoEditor extends StatefulWidget {

  const BibiscoEditor({Key? key}) : super(key: key);

  @override
  _BibiscoEditorState createState() => _BibiscoEditorState();
}

class _BibiscoEditorState extends State<BibiscoEditor> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoadBookPage(),
    );
  }
}


// LoadBookPage
class LoadBookPage extends StatefulWidget {
  const LoadBookPage({Key? key}) : super(key: key);

  @override
  _LoadBookPageState createState() => _LoadBookPageState();
}

class _LoadBookPageState extends State<LoadBookPage> {

  @override
  void initState() {

    // @todo This is run async somehow so make sure it loads before UI.
    if (globals.bookFilePath != '') {
      loadBookToGlobals().then((value) => globals.book = value);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pick a file'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // File picker button
            ElevatedButton(
              onPressed: () async {
                FilePickerResult? result = await FilePicker.platform.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['json'],
                );

                if (result != null) {
                  File file = File(result.files.single.path!);
                  globals.bookFilePath = file.path;
                  loadBookToGlobals().then((value) => globals.book = value);
                } else {
                  // User canceled the picker
                }
              },
              child: Text('Pick a file'),
            ),

            ElevatedButton(
              child: Text('Load Book'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookChapters(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text('Save JSON'),
              onPressed: () => globals.book.save(),
            ),
            // Text(globals.book != null ? globals.book.project.name : 'No book loaded'),
          ],
        ),

      ),
    );
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }

}


// Chapters Screen
class BookChapters extends StatefulWidget {

  const BookChapters({Key? key}) : super(key: key);

  @override
  _BookChaptersState createState() => _BookChaptersState();
}

class _BookChaptersState extends State<BookChapters> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chapters'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _getChaptersWidget(),
        ),
      )
    );
  }

  _getChaptersWidget() {
    return globals.book.chapters?.map<ExpansionTile>((chapter) {
      return ExpansionTile(
          title: Text(chapter.title),
          children: _getScenesInChapter(chapter.$loki)?.map<Widget>((scene) {
            return ListTile(
              title: Text(scene.title),
              // Icon with view
              trailing: const Icon(Icons.visibility),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Viewer(editable: scene),
                  ),
                );
              },
            );
          }).toList(),
      );
    }).toList();
  }

  _getScenesInChapter(int chapterId) {
    // @todo Check the order!!!
    return globals.book.scenes?.where((scene) => scene.chapterid == chapterId);
  }
}

class Editor extends StatefulWidget {

  final Editable editable;
  const Editor({Key? key, required this.editable}) : super(key: key);

  @override
  _EditorState createState() => _EditorState();
}

class _EditorState extends State<Editor> {

  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editable.getTextName() ?? 'No name'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Viewer(editable: widget.editable),
                    ),
                  );
                },
                child: const Icon(
                  Icons.visibility,
                  size: 26.0,
                )
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: 50.0),
            child: GestureDetector(
                onTap: () {
                  controller.getText().then((value) =>
                  {
                    widget.editable.setTextEditField(value),
                    globals.book.save(),
                    Navigator.of(context).push(
                      MaterialPageRoute(
                      builder: (context) => Viewer(editable: widget.editable),
                      ),
                    ),
                  });
                },
                child: const Icon(
                  Icons.save,
                  size: 26.0,
                )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            HtmlEditor(
              controller: controller,
              htmlEditorOptions: HtmlEditorOptions(
                initialText: widget.editable.getTextEditField(),
                hint: 'Enter text here...',
              ),
              // Get the text from the editor
              // onShowSource: () async {
              //   final text = await _controller.getText();
              //   print(text);
              // },
              // Get the HTML from the editor
              // onShowHtml: (context) async {
              //   final html = await _controller.getHtml();
              //   print(html);
              // },
            )
          ],
        ),
      ),
    );
  }
}

class Viewer extends StatefulWidget {

  final Editable editable;
  const Viewer({Key? key, required this.editable}) : super(key: key);

  @override
  _ViewerState createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {

  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editable.getTextName() ?? 'No name'),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) => Editor(editable: widget.editable),
                    ),
                  );
                },
                child: const Icon(
                  Icons.edit,
                  size: 26.0,
                )
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SelectableHtml(
              data: widget.editable.getTextEditField(),
            )
          ],
        ),
      ),
    );
  }
}
