// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

String islem = "Herhangi bir tuşa basılmadı";
int renkNo = 0;
List<Color> renkler = [
  Colors.redAccent,
  Colors.purpleAccent,
  Colors.blueAccent,
  Colors.greenAccent,
  Colors.yellowAccent,
  Colors.orangeAccent
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Extra Projects',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData.dark(),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  //---------------------------------------------------------------------------
  //  SnackBar her tıklama işleminde ayrı ayrı yazmak yerine bir fonksiyon(void)
  //  içerisinde oluşturduk. Bu fonksiyona bir parametre göndermemiz gerekiyor.
  //  Fonksiyonu çağırdığımız zaman yani örneğin onTap olayında snackbar görünmesini
  //  istediğimizde fonksiyona verdiğimiz ismi yazıyoruz yani -> showSnack("resme tıklandı")
  //  parametre string türünde olmalı! parametre göndermezsek hata verir çalışmaz!
  //---------------------------------------------------------------------------
  void showSnack(String GelenYazi) {
    SnackBar bilgiCubugu = SnackBar(
      content: Text(GelenYazi),
      duration: Duration(milliseconds: 250),
    );
    //SnackBar nesnesi oluşturduk. adını bilgiCubugu koyduk. Gösterilecek yazıyı GelenYazi, süresini de çeyrek saniye yaptık.
    ScaffoldMessenger.of(context).showSnackBar(bilgiCubugu);
    //ScaffoldMessenger ile yukarıda oluşturduğumuz bilgiCubugu adlı değişkeni show yaptık
  }
  //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------
  //---------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Extra Project - 1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //---------------------------------------------------------------------------
            Text(
              "Gesture Detector Kullanımı",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            //---------------------------------------------------------------------------
            Text(
              "Aşağıdaki tüm wigdetlara dokunduğunuzda bir işlem yapmasını sağlayabilirsiniz.",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200, fontStyle: FontStyle.italic),
            ),
            //---------------------------------------------------------------------------
            SizedBox(
              height: 30,
            ),
            //---------------------------------------------------------------------------
            // GestureDetector 'un onTap ve onDoubleTap işlemlerinde farklı işlemler yaptırabilirsiniz.
            // FlutterLogo derslerde kullanılan basit bir widget'tir.(sadece flutter logosu koyar.)
            //---------------------------------------------------------------------------
            GestureDetector(
                child: FlutterLogo(
                  size: 50,
                ),
                onTap: (() {
                  setState(() {
                    islem = "Logoya 1 kez tıklandı";
                    //---------------------------------------------------------------------------
                    //  Aşağıda if/else li yapı container yapısındaki rengi değiştirmek için
                    //  renkNo adlı değişkeni artırıyor.
                    //  renkler listesindeki renkNo'lu elemanı container rengi olarak ayarlıyor.
                    //  renkler listesi 5 elemandan oluştuğu için 5 den sonra tekrar 0 a döndürüyoruz.
                    //---------------------------------------------------------------------------
                    if (renkNo == 5) {
                      renkNo = 0;
                    } else {
                      renkNo++;
                    }
                  });
                  showSnack("Logoya 1 kez tıklandı");
                }),
                onDoubleTap: (() {
                  setState(() {
                    islem = "Logoya 2 kez tıklandı";
                  });
                  showSnack("Logoya 2 kez tıklandı");
                })),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            GestureDetector(
                child: Text("Merhaba"),
                onTap: (() {
                  setState(() {
                    islem = "Merhaba Yazısına 1 kez tıklandı";
                    if (renkNo == 5) {
                      renkNo = 0;
                    } else {
                      renkNo++;
                    }
                  });
                  showSnack("Merhaba Yazısına 1 kez tıklandı");
                }),
                onDoubleTap: (() {
                  setState(() {
                    islem = "Merhaba Yazısına 2 kez tıklandı";
                  });
                  showSnack("Merhaba Yazısına 2 kez tıklandı");
                })),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            GestureDetector(
              onTap: (() {
                setState(() {
                  islem = "Gif e 1 kez tıklandı";
                  if (renkNo == 5) {
                    renkNo = 0;
                  } else {
                    renkNo++;
                  }
                });
                showSnack("Gif e 1 kez tıklandı");
              }),
              onDoubleTap: (() {
                setState(() {
                  islem = "Gif e 2 kez tıklandı";
                });
                showSnack("Gif e 2 kez tıklandı");
              }),
              child: Image.network(
                'https://docs.flutter.dev/assets/images/dash/dash-fainting.gif',
                height: 100,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            GestureDetector(
                onTap: (() {
                  setState(() {
                    islem = "Icon'a 1 kez tıklandı";
                    if (renkNo == 5) {
                      renkNo = 0;
                    } else {
                      renkNo++;
                    }
                  });
                  showSnack("Icon'a 1 kez tıklandı");
                }),
                onDoubleTap: (() {
                  setState(() {
                    islem = "Icon'a 2 kez tıklandı";
                  });
                  showSnack("Icon'a 2 kez tıklandı");
                }),
                child: Icon(
                  Icons.school,
                  size: 50,
                )),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            GestureDetector(
                onTap: (() {
                  setState(() {
                    islem = "Yazıya 1 kez tıklandı";
                    if (renkNo == 5) {
                      renkNo = 0;
                    } else {
                      renkNo++;
                    }
                  });
                  showSnack("Yazıya 1 kez tıklandı");
                }),
                onDoubleTap: (() {
                  setState(() {
                    islem = "Yazıya 2 kez tıklandı";
                  });
                  showSnack("Yazıya 2 kez tıklandı");
                }),
                child: Text(
                  "GestureDetector uygulaması örnek yazısı",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(
              height: 15,
            ),
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //-----------Aşağıdaki kodlar yapılan işlemin bilgisini verme amaçlıdır------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            //---------------------------------------------------------------------------
            Spacer(),
            //---------------------------------------------------------------------------
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: renkler[renkNo],
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Text(
                islem,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            //---------------------------------------------------------------------------
            SizedBox(
              height: 50,
            ),

            //---------------------------------------------------------------------------
          ],
        ),
      ),
    );
  }
}
