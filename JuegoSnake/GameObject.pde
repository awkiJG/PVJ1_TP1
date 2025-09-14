// Clase abstracta GameObject
// Sirve como clase base para todos los objetos del juego que tienen posición e imagen.
// No se puede instanciar directamente (abstract), solo puede ser extendida por otras clases.
abstract class GameObject {
  
  // Atributos comunes a todos los objetos del juego
  protected PVector posicion; // Posición del objeto en el tablero
  protected PImage img;       // Imagen asociada al objeto (sprite)
 
  // Constructor 1: inicializa solo con posición
  public GameObject(PVector posicion){
    this.posicion = posicion;
  }
  
  // Constructor 2: inicializa con posición e imagen
  public GameObject(PVector posicion, PImage img){
    this.posicion = posicion;
    this.img = img;
  }
}
