import 'package:flutter/material.dart';
import './page_indicator.dart';
import './page_body.dart';

class StepForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _StepFormState();
  }
}

class _StepFormState extends State<StepForm> {
  final _stepFormController = PageController();
  int _page = 0;

  List _pagesList = [
    pageBody('https://logowik.com/content/uploads/images/flutter5786.jpg',
     'Flutter',
    'Flutter é uma ferramenta que nos permite criar aplicações multi-plataforma.',),
    pageBody('https://upload.wikimedia.org/wikipedia/commons/7/7e/Dart-logo.png',
     'DURT',
    'Dart é uma linguagem de programação desenvolvida pelo google.',),
    pageBody('https://w7.pngwing.com/pngs/344/331/png-transparent-iphone-7-android-operating-systems-android-logo-computer-wallpaper-grass.png',
     'MULTI-PLATAFORMA',
    'Usando o flutter, nós podemos desenvolver aplicações que rodam tanto no android quanto no ios.',),
  ];

  void _changeStep(bool nextPage) {
    if (_page < 2 && nextPage) {
      setState(() {
        _page++;
      });

      _stepFormController.nextPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    } else if (_page > 0 && !nextPage) {
      setState(() {
        _page--;
      });

      _stepFormController.previousPage(
          duration: Duration(milliseconds: 300), curve: Curves.easeIn);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Step App Page'),
      ),
      body: PageView.builder(
          controller: _stepFormController,
          physics: NeverScrollableScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return _pagesList[index];
          }),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            onPressed: () => _changeStep(false),
            child: Text('Anterior'),
          ),
          pageIndicator(_page == 0),
          pageIndicator(_page == 1),
          pageIndicator(_page == 2),
          TextButton(
            onPressed: () => _changeStep(true),
            child: Text('Próximo'),
          ),
        ],
      ),
    );
  }
}
