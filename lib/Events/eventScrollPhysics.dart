import 'package:flutter/physics.dart';
import 'package:flutter/material.dart';

class eventScrollPhysics extends ScrollPhysics {

  const eventScrollPhysics({ScrollPhysics parent}) : super(parent: parent);

  @override
  eventScrollPhysics applyTo(ScrollPhysics ancestor) {
    return eventScrollPhysics(parent: buildParent(ancestor));
  }

  double getTarget(pos) {
    
    double difference;
    print(pos);
    if (pos % 140 != 0) {
          difference = (pos % 141);
          if (difference >= 70) {
            double target = (pos + difference);
            return target;
          } else {
            double target = (pos - difference) ;
            return target;
          }
        }else{
          return pos;
        }
  }

  @override
  Simulation createBallisticSimulation(
      ScrollMetrics position, double velocity,) {
      double pos = position.pixels;
      double target = getTarget(pos);
   
        if ((velocity <= 0.0 && position.pixels <= position.minScrollExtent) ||
            (velocity >= 0.0 && position.pixels >= position.maxScrollExtent))
          return super.createBallisticSimulation(position, velocity);
        final Tolerance tolerance = this.tolerance;
    
        if (target != pos || target != null) {
          return ScrollSpringSimulation(spring, pos, target, velocity,
              tolerance: tolerance);
        }
        return null;
      }
    
      @override
      bool get allowImplicitScrolling => true;
    
      
}
