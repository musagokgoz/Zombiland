import 'dart:ui';

import 'package:flame/components/component.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/gestures.dart';
import 'package:zombilerdenkac/common/ScreenSize.dart';

import 'BaseWidget.dart';

class Background extends BaseWidget {
  SpriteComponent _bg;
  Background(String src) {
    _bg = new SpriteComponent.fromSprite(0, 0, Sprite(src));
  }

  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    // TODO: implement onTapDown
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
  }

  @override
  void resize() {
    _bg.width = screenSize.width;
    _bg.height = screenSize.height;
  }

  @override
  void update(double t) {
    // TODO: implement update
  }
}
