import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoes_app/src/models/shoe_model.dart';
import 'package:shoes_app/src/pages/show_desc_page.dart';

class ShoeSizePrevew extends StatelessWidget {
  final bool fullScreen;

  const ShoeSizePrevew({
    super.key,
    this.fullScreen = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!fullScreen) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const ShoeDescriptionPage(),
            ),
          );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: (fullScreen) ? 5 : 30,
          vertical: (fullScreen) ? 3 : 0,
        ),
        child: Container(
          width: double.infinity,
          height: fullScreen ? 470 : 480,
          decoration: BoxDecoration(
            color: Colors.amberAccent.shade100,
            borderRadius: (fullScreen)
                ? const BorderRadius.only(
                    bottomLeft: Radius.circular(50),
                    bottomRight: Radius.circular(50),
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  )
                : BorderRadius.circular(50),
          ),
          child: Column(
            children: [
              //zapato con sombra
              _ShoeWithShadow(),

              //tallas
              if (!fullScreen) const _ShoeSize()
            ],
          ),
        ),
      ),
    );
  }
}

class _ShoeSize extends StatelessWidget {
  const _ShoeSize();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _SizeShoeBox(7),
          _SizeShoeBox(7.5),
          _SizeShoeBox(8),
          _SizeShoeBox(8.5),
          _SizeShoeBox(9),
          _SizeShoeBox(9.5),
        ],
      ),
    );
  }
}

class _SizeShoeBox extends StatelessWidget {
  final double size;

  const _SizeShoeBox(this.size);

  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    final bool isSelected;

    if (shoeModel.size == size) {
      isSelected = true;
    } else {
      isSelected = false;
    }

    return GestureDetector(
      onTap: () {
        final shoeModel = Provider.of<ShoeModel>(context, listen: false);
        shoeModel.size = size;
      },
      child: Container(
        alignment: Alignment.center,
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: isSelected ? Colors.amber.shade600 : Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            if (isSelected)
              const BoxShadow(
                  color: Color(0xfff1a23a),
                  blurRadius: 10,
                  offset: Offset(0, 5)),
          ],
        ),
        child: Text(
          size.toString().replaceAll('.0', ''),
          style: TextStyle(
            color: isSelected ? Colors.white : const Color(0xfff1a23a),
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class _ShoeWithShadow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final shoeModel = Provider.of<ShoeModel>(context);

    return Padding(
      padding: const EdgeInsets.all(50),
      child: Stack(
        children: [
          //sombra
          const Positioned(bottom: 15, right: 0, child: _ShoeShadow()),

          //imagen
          Image(image: AssetImage(shoeModel.assetImage)),
        ],
      ),
    );
  }
}

class _ShoeShadow extends StatelessWidget {
  const _ShoeShadow();

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 280,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: const [
            BoxShadow(color: Color(0xffeaa14e), blurRadius: 40),
          ],
        ),
      ),
    );
  }
}
