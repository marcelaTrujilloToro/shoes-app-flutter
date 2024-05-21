import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/helpers/helpers.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/widgets/custom_widgets.dart';

class ShoeDescriptionPage extends StatelessWidget {
  const ShoeDescriptionPage({super.key});

  @override
  Widget build(BuildContext context) {
    changeStatusLigth();
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              const Hero(
                tag: 'shoe_1',
                child: ShoeSizePrevew(fullScreen: true),
              ),

              //
              Positioned(
                  top: 80,
                  left: 10,
                  child: FloatingActionButton(
                    onPressed: () {
                      changeStatusDark();
                      Navigator.pop(context);
                    },
                    backgroundColor: Colors.transparent,
                    highlightElevation: 0,
                    elevation: 0,
                    child: const Icon(
                      Icons.chevron_left_rounded,
                      color: Colors.white,
                      size: 60,
                    ),
                  ))
            ],
          ),

          //
          const Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  ShoeDescription(
                    title: 'Nike Air Max 720',
                    description:
                        "The Nike Air Max 720 goes bigger than ever before with Nike's taller Air unit yet, offering more air underfoot for unimaginable, all-day comfort. Has Air Max gone too far? We hope so.",
                  ),

                  //
                  _AmountBuyNow(),

                  //Colores y mas
                  _ColorsAndMore(),

                  //
                  _OtherButtons()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _OtherButtons extends StatelessWidget {
  const _OtherButtons();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const _ButtonWithShadow(
            Icon(
              Icons.star,
              color: Colors.red,
              size: 25,
            ),
          ),
          _ButtonWithShadow(
            Icon(
              Icons.shopping_cart,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          ),
          _ButtonWithShadow(
            Icon(
              Icons.settings,
              color: Colors.grey.withOpacity(0.4),
              size: 25,
            ),
          )
        ],
      ),
    );
  }
}

class _ButtonWithShadow extends StatelessWidget {
  final Icon icon;
  const _ButtonWithShadow(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: -5,
              blurRadius: 20,
              offset: Offset(0, 10),
            ),
          ]),
      child: icon,
    );
  }
}

class _ColorsAndMore extends StatelessWidget {
  const _ColorsAndMore();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Positioned(
                    left: 90,
                    child: _ColorButton(
                        Color(0xffc6d642), 4, 'assets/imgs/verde.png')),
                Positioned(
                    left: 60,
                    child: _ColorButton(
                        Color(0xffffad29), 3, 'assets/imgs/amarillo.png')),
                Positioned(
                    left: 30,
                    child: _ColorButton(
                        Color(0xff2099f1), 2, 'assets/imgs/azul.png')),
                _ColorButton(Color(0xff364d56), 1, 'assets/imgs/negro.png'),
              ],
            ),
          ),

          //
          OrangeButton(
            text: 'More related items',
            height: 30,
            width: 170,
            color: Color(0xffffc675),
          )
        ],
      ),
    );
  }
}

class _ColorButton extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImage;

  const _ColorButton(this.color, this.index, this.urlImage);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: index * 100),
      duration: const Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final shoeModel = Provider.of<ShoeModel>(context, listen: false);
          shoeModel.assetImage = urlImage;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  const _AmountBuyNow();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 15, bottom: 20),
        child: Row(
          children: [
            const Text(
              '\$180.0',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const Spacer(),
            Bounce(
              delay: const Duration(seconds: 1),
              from: 8,
              child: const OrangeButton(
                text: 'Buy now',
                width: 120,
                height: 40,
              ),
            )
          ],
        ),
      ),
    );
  }
}
