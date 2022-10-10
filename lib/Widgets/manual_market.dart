import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

class ManualMarket extends StatelessWidget {
  const ManualMarket({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      width: size.width,
      height: size.height,
      child: Stack(
        children: [
          Positioned(top: 200, left: 20, child: _bckButton()),
          Center(
            child: Transform.translate(
              offset: Offset(0, -22),
              child: BounceInDown(
                  from: 100,
                  child: Icon(
                    Icons.location_on_rounded,
                    size: 60,
                  )),
            ),
          ),
          Positioned(
              bottom: 200,
              left: 40,
              child: MaterialButton(
                color: Colors.white,
                  minWidth: size.width - 120,
                  child: Text(
                    'Confirmar Destino',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  onPressed: () {}))
        ],
      ),
    );
  }
}

class _bckButton extends StatelessWidget {
  const _bckButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      duration: const Duration(milliseconds: 300),
      child: CircleAvatar(
        maxRadius: 30,
        backgroundColor: Colors.white,
        child: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {},
        ),
      ),
    );
  }
}
