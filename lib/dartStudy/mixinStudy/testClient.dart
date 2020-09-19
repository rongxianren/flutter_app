

import 'package:flutter_app/dartStudy/mixinStudy/base/animal.dart';
import 'package:flutter_app/dartStudy/mixinStudy/bird.dart';

import 'mammal.dart';

void main(){
  Animal bird = Bird();
  Animal mammal = Mammal();
  if( bird is Bird) {
    bird.fly();
    bird.walk();
  }

  if( mammal is Mammal) {
    mammal.walk();
  }

}