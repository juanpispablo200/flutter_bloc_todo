# Gestor de Tareas

Este es un simple gestor de tareas implementado en Flutter con un patrón de arquitectura BLoC.

## Estructura de Carpetas

- `models`: Contiene el modelo de datos para las tareas.
- `bloc`: Contiene la lógica de negocio utilizando el patrón BLoC.
- `screens`: Contiene las pantallas de la interfaz de usuario.
  
## Archivos de Código

### `task.dart` (models/task.dart)

```dart
class Task {
  final String title;
  final bool isCompleted;

  Task({required this.title, this.isCompleted = false});
}
