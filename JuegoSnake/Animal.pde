// La clase Animal representa un objeto de comida en el tablero.
// Extiende de GameObject (tiene posición e imagen) e implementa la interfaz Idisplay (debe poder dibujarse en pantalla).
class Animal extends GameObject implements Idisplay {
  // Atributos propios de un Animal
  private int puntos;       // Valor en puntos que otorga al ser comido
  private String nombre;    // Nombre identificador del animal
  private float tiempo;     // Tiempo en el que fue recogido por la serpiente (si aplica)
  
  // Constructor: recibe la posición, la imagen, los puntos y el nombre
  public Animal(PVector posicion, PImage img, int puntos, String nombre){
    super(posicion, img);   // Llama al constructor de GameObject para inicializar posición e imagen
    this.puntos = puntos;   // Asigna valor en puntos
    this.nombre = nombre;   // Asigna nombre
    tiempo = 0;             // Inicializa tiempo en 0 (sin haber sido recogido aún)
  }
  
  // Método display(): dibuja al animal en pantalla en su posición
  public void display(){
    image(img, posicion.x, posicion.y); 
  }
 
  // Método toString(): devuelve un texto con información del animal
  public String toString() {
    return tiempo + " : " + nombre + 
           " en " + (int)round(posicion.x) + ", " + (int)round(posicion.y) + 
           " - Puntos: " + puntos;
  }

  // Getter de la posición (utilizado para verificar colisiones)
  public PVector getPosicion(){
    return posicion;
  }
  
  // Getter de puntos (para sumarlos al puntaje al ser comido)
  public int getPuntos(){
    return puntos;
  }
 
  // Setter del tiempo en el que fue recogido
  public void setTiempo(float tiempo){
    this.tiempo = tiempo;
  }
}
