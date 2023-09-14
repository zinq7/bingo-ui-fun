import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class BingoTile extends StatefulWidget {
  final void Function(BingoTileState) onClickCallback;
  final String text;

  const BingoTile({super.key, required this.text, required this.onClickCallback});

  @override
  State<StatefulWidget> createState() => BingoTileState();
}

class BingoTileState extends State<BingoTile> {
  bool _clicked = false;

  void click() {
    setState(
      () {
        _clicked = !_clicked;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: InkWell(
          onTap: () {
            widget.onClickCallback(this);
            click();
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/BorderedBox.png",
                fit: BoxFit.fill,
                scale: 0.2, // somehow makes it scale, i should know this but i don't so whatever
                opacity: const AlwaysStoppedAnimation(0.7),
              ),
              AutoSizeText(
                widget.text,
                maxLines: (widget.text.length ~/ 15) + 1,
                style: bingoTextStyle,
                textAlign: TextAlign.center,
              ),
              Image.network(
                'https://upload.wikimedia.org/wikipedia/commons/thumb/5/5f/Red_X.svg/1200px-Red_X.svg.png',
                opacity: AlwaysStoppedAnimation(_clicked ? 0.8 : 0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const bingoTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 32,
  fontFamily: "Bombardier",
);
