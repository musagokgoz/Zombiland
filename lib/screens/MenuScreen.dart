import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:share/share.dart';
import 'package:zombilerdenkac/utils/Background.dart';
import 'package:zombilerdenkac/utils/BaseWidget.dart';
import 'package:zombilerdenkac/utils/StaticEntity.dart';

import '../Constants.dart';
import 'ScreenManager.dart';
import 'ScreenState.dart';

class MenuScreen extends BaseWidget {
  BaseWidget _bg;
  StaticEntity _logo;
  StaticEntity _candyBar;

  // Buttons
  StaticEntity _startButton;
  StaticEntity _shareButton;
  //StaticEntity _rankingButton;
  StaticEntity _infoButton;
  //StaticEntity _settingsButton;

  MenuScreen() {
    _bg = Background('common/common_bg.png');

    _logo = StaticEntity('menu/logo.png');
    _candyBar = StaticEntity('menu/candy_bar.png');
    _startButton = StaticEntity('menu/1_start.png');
    _shareButton = StaticEntity('menu/2_share.png');
    //_rankingButton = StaticEntity('menu/3_ranking.png');
    _infoButton = StaticEntity('menu/4_info.png');
    //_settingsButton = StaticEntity('menu/5_settings.png');
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    _logo.onTapDown(detail, null);
    _startButton.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kPlayScreen);
    });
    _infoButton.onTapDown(detail, () {
      screenManager.switchScreen(ScreenState.kInfoScreen);
    });
    _shareButton.onTapDown(detail, _shareOnMedia);
  }

  @override
  void render(Canvas canvas) {
    _bg.render(canvas);
    _logo.render(canvas);
    _candyBar.render(canvas);
    _startButton.render(canvas);
    _shareButton.render(canvas);
    //_rankingButton.render(canvas);
    _infoButton.render(canvas);
    //_settingsButton.render(canvas);
  }

  @override
  void resize() {
    _bg.resize();
    _logo.resize(
      wR: kMenuLogoWidthRatio,
      hR: kMenuLogoHeightRatio,
      xR: kMenuLogoXRatio,
      yR: kMenuLogoYRatio,
    );

    _candyBar.resize(
      wR: kMenuCandyBarWidthRatio,
      hR: kMenuCandyBarHeightRatio,
      xR: kMenuCandyBarXRatio,
      yR: kMenuCandyBarYRatio,
    );

    _startButton.resize(
      wR: kMenuButtonWidthRatio,
      hR: kMenuButtonHeightRatio,
      xR: kMenuStartButtonXRatio,
      yR: kMenuStartButtonYRatio,
    );
    _shareButton.resize(
      wR: kMenuButtonWidthRatio,
      hR: kMenuButtonHeightRatio,
      xR: kMenuShareButtonXRatio,
      yR: kMenuShareButtonYRatio,
    );

    //_rankingButton.resize(
    //  wR: kMenuButtonWidthRatio,
    //  hR: kMenuButtonHeightRatio,
    //  xR: kMenuRankingButtonXRatio,
    //  yR: kMenuRankingButtonYRatio,
    //);

    _infoButton.resize(
      wR: kMenuButtonWidthRatio,
      hR: kMenuButtonHeightRatio,
      xR: kMenuInfoButtonXRatio,
      yR: kMenuInfoButtonYRatio,
    );

    //  _settingsButton.resize(
    //  wR: kMenuButtonWidthRatio,
    // hR: kMenuButtonHeightRatio,
    //xR: kMenuSettingsButtonXRatio,
    //yR: kMenuSettingsButtonYRatio,
    //);
  }

  @override
  void update(double t) {}

  void _shareOnMedia() {
    try {
      String msg = 'help me get rid of zombies:\n';
      Share.share(
        msg +
            "\nhttps://play.google.com/store/apps/details?id=com.musagokgoz.zombiland",
      );
    } catch (ex) {
      print(ex);
    }
  }
}
