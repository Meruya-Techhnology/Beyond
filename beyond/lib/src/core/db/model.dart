import 'dart:mirrors';

import '../../utils/data_util.dart';
import '../../utils/mirror_util.dart';
import 'base_model.dart';

class Model implements BaseModel {
  MirrorUtil get _mirror => MirrorUtil(this);

  @override
  Map<String, dynamic> toMap() {
    Map<String, dynamic> payload = {};
    for (var variable in _mirror.variables) {
      /// Get field metadata
      final field = _mirror.getField(variable);
      if (!(field?.isHidden ?? false)) {
        /// Construct variable name from field metadata (key), if its empty the
        /// default name will be the class variable name it self.
        final variableName = field?.key ??
            MirrorSystem.getName(
              variable.simpleName,
            );

        /// Construct variable value
        final variableValue = _mirror.instanceMirror.getField(
          variable.simpleName,
        );

        /// Check if the value is eligible to put in json / map
        if (DataUtil.isJsonAble(variableValue)) {
          payload[variableName] = variableValue.reflectee;
        }
      }
    }
    return payload;
  }
}
