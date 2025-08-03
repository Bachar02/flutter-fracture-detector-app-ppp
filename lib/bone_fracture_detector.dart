import 'dart:io';
import 'package:tflite_v2/tflite_v2.dart';

class ModelHelper {
  static bool _isModelLoaded = false;

  static Future<void> loadModel() async {
    if (!_isModelLoaded) {
      await Tflite.loadModel(
        model: "assets/model_unquant.tflite",
        labels: "assets/labels.txt",
      );
      _isModelLoaded = true;
    }
  }

  static Future<void> closeModel() async {
    if (_isModelLoaded) {
      await Tflite.close();
      _isModelLoaded = false;
    }
  }
}

Future<String> detectImage(File image) async {
  try {
    await ModelHelper.loadModel();

    var recognitions = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

    print('Recognitions: $recognitions');

    if (recognitions != null && recognitions.isNotEmpty) {
      String label = recognitions[0]['label'];
      print('Detected label: $label');
      return label.contains('fractured') ? 'fractured bone' : 'intact bone';
    } else {
      return "Error: No recognition results.";
    }
  } catch (e) {
    return "Error: $e";
  }
}
