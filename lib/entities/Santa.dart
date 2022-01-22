import 'AnimatedEntity.dart';

class Santa extends AnimatedEntity {
  Santa(
    String aniPath,
    double yOffset,
    Function onComplete,
    Function onHit,
    Function onDie,
  ) : super(
          aniPath,
          15,
          0.05,
          15,
          0.05,
          yOffset,
          onComplete,
          onHit,
          onDie,
        );

  @override
  void completed() {
    // TODO: implement completed
  }

  @override
  void die() {
    // TODO: implement die
  }
}
