import 'dart:io';
import 'package:flutter/material.dart';
import 'book.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'editable.dart';
import 'globals.dart' as globals;
import 'package:flutter_html/flutter_html.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:file_picker/file_picker.dart';
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
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''), // English, no country code
        Locale('ru', ''), // Russian, no country code
      ],
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
        title: Text(AppLocalizations.of(context)!.pickFile),
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
              child: Text(AppLocalizations.of(context)!.pickFile),
            ),

            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.loadBook),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BookChapters(),
                  ),
                );
              },
            ),
            ElevatedButton(
              child: Text(AppLocalizations.of(context)!.saveJSON),
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
        title: Text(AppLocalizations.of(context)!.chapters),
        // Add icons to the app bar
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: AppLocalizations.of(context)!.addNewScene,
            onPressed: () {
              // Navigate to creator screen
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Creator(
                    editable: ArticleDataScene.empty(),
                  ),
                ),
              );
              // Refresh the UI
              setState(() {});
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: _getChaptersWidget(),
        ),
      )
    );
  }

  _getChaptersWidget() {

    List<Widget>? chapters = globals.book.chapters?.map<ExpansionTile>(
            (chapter) {
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

    // Add Uncategorized scenes with chapter.$loki = 0
    chapters?.add(ExpansionTile(
      title: Text(AppLocalizations.of(context)!.uncategorized),
      children: _getScenesInChapter(0)?.map<Widget>((scene) {
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
    ));

    return chapters;
  }

  /// Get scenes in chapter.
  /// Order by Position.
  /// @todo Optimize sorting, on JSON load maybe?
  _getScenesInChapter(int chapterId) {
    // Order by position
    List? scenes = globals.book.scenes?.where((scene) => scene.chapterid ==
        chapterId).toList();
    scenes?.sort((a, b) => a.position.compareTo(b.position));
    return scenes;
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
        title: Text(widget.editable.getTextName() ?? AppLocalizations.of
          (context)!.noName),
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
                    // @todo Change all of book saves to listeners
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
                hint: AppLocalizations.of(context)!.enterTextHere,
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

class Creator extends StatefulWidget {

  final Editable editable;
  const Creator({Key? key, required this.editable}) : super(key: key);

  @override
  _CreatorState createState() => _CreatorState();
}

class _CreatorState extends State<Creator> {

  HtmlEditorController controller = HtmlEditorController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.editable.getTextName() ?? AppLocalizations.of
          (context)!.noName),
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
                    widget.editable.create(),
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
                hint: AppLocalizations.of(context)!.enterTextHere,
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
        title: Text(widget.editable.getTextName() ?? AppLocalizations.of
          (context)!.noName),
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
