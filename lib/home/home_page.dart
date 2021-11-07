import 'package:auto_route/src/router/auto_router_x.dart';
import 'package:auto_route_sample/domain/page_parameter.dart';
import 'package:auto_route_sample/home/home_page_model.dart';
import 'package:auto_route_sample/main.gr.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomePageModel>(
        create: (_) => HomePageModel(),
    child: Scaffold(
            body: Center(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Home page!'),
            ElevatedButton(
                onPressed: () {
                  context.router.navigate(SecondRoute());
                },
                child: Text("次のページへ")),
            SizedBox(),
            //画像を選んで表示させる
            Consumer<HomePageModel>(builder: (context, model, child) {
              return Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        GestureDetector(
                          child: SizedBox(
                            width: 100,
                            height: 160,
                            child: model.fileBytes != null
                                ? Image.memory(model.fileBytes!)
                                : Container(
                              color: Colors.grey,
                            ),
                          ),
                          onTap: () async {
                            print("反応");
                            await model.pickImage2();
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            //追加の処理
                            try {
                              model.startLoading();
                              await model.addImageToStorage2();
                              final snapshot = await FirebaseFirestore.instance
                                  .collection('pages')
                                  .doc('${model.id}')
                                  .get();
                              final PageParameter _pageParameter = PageParameter(snapshot);
                              context.router.navigate(DynamicRoute(id: _pageParameter.id!));
                            } catch (e) {
                              print(e);
                              final snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(e.toString()),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } finally {
                              model.endLoading();
                            }
                          },
                          child: Text("画像URLのページへ"),
                        ),
                      ],
                    ),
                  ),
                  if (model.isLoading)
                    Container(
                      color: Colors.black54,
                      child: Center(
                        child: CircularProgressIndicator(),
                      ),
                    ),
                ],
              );
            }),

            ElevatedButton(
                onPressed: () async {
                  final snapshot = await FirebaseFirestore.instance
                      .collection('pages')
                      .doc('Zv0LLJ69jaAbC40b6IfW')
                      .get();
                  final PageParameter _pageParameter = PageParameter(snapshot);
                  context.router.navigate(DynamicRoute(id: _pageParameter.id!));
                },
                child: Text("「１」のURLのページへ"))
          ],
        )))
    );
  }
}
