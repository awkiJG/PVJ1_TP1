// Clase auxiliar para calcular el deltaTime.
// Se declara como 'static' porque sus métodos no requieren instanciar objetos.
static class DeltaTime {
  
  // Método estático que devuelve el deltaTime en segundos
  // Recibe como parámetro la cantidad de frames por segundo (fps).
  static float getDeltaTime(float frames){
    int framesPorSegundo = round(frames);   // Redondea los fps a un entero
    float deltaTime = 1.0 / framesPorSegundo; // Calcula cuánto dura cada frame (en segundos)
    return deltaTime; // Retorna el tiempo que tarda un frame
  }
}
