import 'package:flutter_app/dartStudy/mixinStudy/feature/Flyer.dart';
import 'package:flutter_app/dartStudy/mixinStudy/feature/Walker.dart';

import 'base/animal.dart';

class Bird extends Animal with Flyer, Walker {}
