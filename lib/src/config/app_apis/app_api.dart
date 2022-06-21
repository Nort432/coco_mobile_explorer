class AppApi {
  static const Map<String, dynamic> headers = {
    "Content-Type": "application/json",
    "Accept": 'application/json'
  };
  static const String urlBase = 'https://us-central1-open-images-dataset.cloudfunctions.net';
  static const String urlCoco = '/coco-dataset-bigquery';
}