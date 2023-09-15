import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:animate_do/animate_do.dart';

class SlideInfo {
  final String title;
  final String caption;
  final String imgUrl;

  SlideInfo(this.title, this.caption, this.imgUrl);
}

final slides = <SlideInfo>[
  SlideInfo(
      'Busca la comida',
      'Eiusmod et ullamco excepteur aute culpa laborum cupidatat aute sunt consectetur.',
      'assets/1.png'),
  SlideInfo(
      'Entrega Rapida',
      'Sint Lorem duis Lorem fugiat dolore laboris Lorem deserunt.',
      'assets/2.png'),
  SlideInfo(
      'Disfruta la comida',
      'Irure nisi deserunt aliquip laborum consequat occaecat.',
      'assets/3.png'),
];

class AppTutorialScreen extends StatefulWidget {
  static const name = 'tutorial_screen';

  const AppTutorialScreen({Key? key}) : super(key: key);

  @override
  State<AppTutorialScreen> createState() => _AppTutorialScreenState();
}

class _AppTutorialScreenState extends State<AppTutorialScreen> {
  final PageController pageViewController = PageController();
  bool endReach = false;
  @override
  void initState() {
    super.initState();
    pageViewController.addListener(() {
      final page = pageViewController.page ?? 0;
      if(!endReach && page >=(slides.length - 1.5)){
        setState(() {
          endReach = true;
        });
      }
     
    });
  }
  @override
  void dispose() {
   pageViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            PageView(
              controller: pageViewController,
              physics: const BouncingScrollPhysics(),
              children: slides
                  .map((slideData) => _Slide(
                        title: slideData.title,
                        caption: slideData.caption,
                        imgUrl: slideData.imgUrl,
                      ))
                  .toList(),
            ),
            Positioned(
                top: 20,
                right: 10,
                child: TextButton(
                  onPressed: () => context.pop(),
                  child: const Text('Skip'),
                )),
            endReach
                ? Positioned(
                    bottom: 30,
                    right: 30,
                    child: FadeInRight(
                      from:15,
                      delay: const Duration(seconds: 1),
                      child: FilledButton(
                        child: const Text('Comenzar'),
                        onPressed: () => context.pop(),
                      ),
                    ),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final String title;
  final String caption;
  final String imgUrl;
  const _Slide(
      {required this.title, required this.caption, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    final captionStyle = Theme.of(context).textTheme.bodySmall;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(image: AssetImage(imgUrl)),
            const SizedBox(height: 20),
            Text(title, style: titleStyle),
            const SizedBox(height: 20),
            Text(caption, style: captionStyle),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
