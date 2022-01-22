import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart' as STL;
import 'package:zombilerdenkac/ads/AdsManager.dart';
import 'package:zombilerdenkac/data/UserData.dart';
import 'package:zombilerdenkac/utils/Background.dart';
import 'package:zombilerdenkac/utils/BaseWidget.dart';
import 'package:zombilerdenkac/utils/StaticEntity.dart';
import 'package:zombilerdenkac/utils/StaticText.dart';

import '../Constants.dart';
import 'ScreenManager.dart';
import 'ScreenState.dart';

class EndScreen extends BaseWidget {
  Background _bg;
  StaticEntity _frame;
  StaticText _curScore;
  StaticText _bestScore;

  StaticEntity _play;
  StaticEntity _home;

  EndScreen() {
    _bg = Background('common/common_bg.png');
    _frame = StaticEntity('end/frame.png');
    _curScore = StaticText(
      STL.Colors.red,
      STL.Colors.black,
      kEndCurScoreFontRatio,
      kEndCurScoreCenterXRatio,
      kEndCurScoreCenterYRatio,
      align: WidgetAlign.Centered,
    );

    _bestScore = StaticText(
      STL.Colors.red,
      STL.Colors.black,
      kEndBestScoreFontRatio,
      kEndBestScoreCenterXRatio,
      kEndBestScoreCenterYRatio,
      align: WidgetAlign.Centered,
    );

    _play = StaticEntity('end/start.png');
    _home = StaticEntity('end/home.png');
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _play.onTapDown(detail, () {
      AdsManager.instance.playNewAd(() {
        screenManager.switchScreen(ScreenState.kPlayScreen);
      });
    });
    _home.onTapDown(detail, () {
      AdsManager.instance.playNewAd(() {
        screenManager.switchScreen(ScreenState.kMenuScreen);
      });
    });
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _frame.render(canvas);
    _curScore.render(canvas);
    _bestScore.render(canvas);

    _play.render(canvas);
    _home.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _frame.resize(
      wR: kEndFrameWidthRatio,
      hR: kEndFrameHeightRatio,
      xR: kEndFrameXRatio,
      yR: kEndFrameYRatio,
    );

    _curScore.resize();
    _bestScore.resize();

    _play.resize(
      wR: kEndButtonWidthRatio,
      hR: kEndButtonHeightRatio,
      xR: kEndPlayButtonXRatio,
      yR: kEndPlayButtonYRatio,
    );
    _home.resize(
      wR: kEndButtonWidthRatio,
      hR: kEndButtonHeightRatio,
      xR: kEndHomeButtonXRatio,
      yR: kEndHomeButtonYRatio,
    );

    _curScore.update("CURRENT: " + userData.getCurrentScore().toString());
    _bestScore.update("BEST: " + userData.getBestScore().toString());
  }

  @override
  void update(double t) {}
}
