import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String apiUrl = "https://example.com/api"; // Reemplaza esto con la URL base de tu API

  // Función para obtener la información del usuario y el trabajo del día
  Future<Map<String, dynamic>> obtenerInformacion(String usuarioId) async {
    final response = await http.get(Uri.parse('$apiUrl/usuarios/$usuarioId'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Error al obtener la información del usuario y el trabajo del día');
    }
  }
}
