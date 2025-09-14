// La clase Cuerpo representa un segmento del cuerpo de la serpiente.
// Extiende de GameObject (tiene posición e imagen) e implementa Idisplay (se puede dibujar en pantalla).
class Cuerpo extends GameObject implements Idisplay {
  
  // Constructor: recibe la posición inicial del segmento
  public Cuerpo(PVector posicion){
    super(posicion);               // Llama al constructor de GameObject para inicializar la posición
    img = loadImage("cuerpo.png"); // Imagen por defecto del segmento
  }
  
  // Dibuja el segmento del cuerpo en su posición
  public void display(){
    image(img, posicion.x, posicion.y); 
  }
    
  // Setter para actualizar la posición del segmento
  public void setPosicion(PVector posicion){
    this.posicion = posicion;
  }
  
  // Setter para cambiar la imagen del segmento según el estado del juego
  public void setImg(int estado){
    if(estado == 1){
      img = loadImage("cuerpomuerto.png"); // Imagen cuando la serpiente muere
    } else if(estado == 2){
      img = loadImage("cuerpoganar.png");  // Imagen cuando la serpiente gana
    }
  }
  
  // Getter de la posición actual del segmento
  public PVector getPosicion(){
    return posicion;
  }
}
