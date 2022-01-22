import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:zombilerdenkac/audio/MusicPlayer.dart';
import 'package:zombilerdenkac/entities/BaseEntity.dart';
import 'package:zombilerdenkac/entities/Enemy.dart';
import 'package:zombilerdenkac/entities/Santa.dart';
import 'package:zombilerdenkac/utils/BaseWidget.dart';

import '../Constants.dart';
import 'PlayerStats.dart';

class GameMaster extends BaseWidget {
  List<BaseEntity> _entities;
  int _santaCount;
  double _speed;
  PlayerStats _playerStats;
  double _speedCap;

  GameMaster() {
    _entities = List<BaseEntity>();
    _speed = 26;
    _speedCap = 10;

    _santaCount = 0;
    _playerStats = PlayerStats();
  }
  @override
  void onTapDown(TapDownDetails detail, Function fn) {
    for (var e in _entities) {
      e.onTapDown(detail);
    }
  }

  @override
  void render(Canvas canvas) {
    for (var e in _entities) {
      e.render(canvas);
    }
    _playerStats.render(canvas);
  }

  @override
  void resize() {
    for (var e in _entities) e.resize();
    _playerStats.resize();
  }

  @override
  void update(double t) {
    _cleanupEntities();
    _spawnNewEntities();
    _updateEntities(t);
  }

  void _cleanupEntities() {
    for (int i = _entities.length - 1; i >= 0; i--) {
      if (_entities.elementAt(i).isDead()) {
        _entities.removeAt(i);
      }
    }
  }

  void _spawnNewEntities() {
    if (_entities.length == 0 || _entities.last.isOnTheScreen()) {
      Random random = new Random();
      // at least 1 maximum 4
      var nrOfEntities = 1;

      // 5 seconds => 1 speed
      if (_speed > 25) {
      } else if (_speed < 25) {
        nrOfEntities += random.nextInt(3);
      } else if (_playerStats.getScore() < 250) {
        nrOfEntities += random.nextInt(4);
      } else {
        nrOfEntities += random.nextInt(5);
      }
      List<int> _offsets = [0, 1, 2, 3];
      _offsets.shuffle();

      for (int i = 0; i < nrOfEntities; i++) {
        if (_santaCount == 0) {
          _santaCount = 7 + random.nextInt(8);
          var e = Santa(
            'santas/0',
            _offsets[i] / 5,
            _playerStats.increaseHp,
            musicPlayer.santaDie,
            _playerStats.decreaseHp,
          );

          e.resize();
          _entities.add(e);
        } else {
          var assetIdx = random.nextInt(3);
          var e = Enemy(
            'enemies/$assetIdx',
            _offsets[i] / 5 + kEnemyStandardGap,
            _playerStats.decreaseHp,
            musicPlayer.candyDie,
            _playerStats.increaseScore,
          );
          e.resize();
          _entities.add(e);
          _santaCount--;
        }
      }
    }
  }

  void _updateEntities(double t) {
    _speed -= t / 4;
    if (_speed < 15) {
      if (_playerStats.getScore() < 400)
        _speed = 15;
      else if (_speed < 10) _speed = 10;
    }

    for (var e in _entities) {
      e.update(t, _speed / 4);
    }
  }

  bool isGameOver() {
    return _playerStats.isGameOver();
  }

  void die() {
    _playerStats.die();
  }
}
