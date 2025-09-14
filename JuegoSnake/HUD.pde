// La clase HUD representa la interfaz gráfica que muestra al jugador la información del juego.
// Extiende de GameObject porque tiene posición e imagen de fondo (HUD.png).
class HUD extends GameObject {
  
  // Atributo que guarda el tiempo transcurrido desde que inicia el juego
  private float tiempo;
 
  // Constructor: inicializa posición, imagen y tiempo
  public HUD(PVector posicion){
    super(posicion);              // Asigna la posición usando el constructor de GameObject
    img = loadImage("HUD.png");   // Carga la imagen del HUD
    tiempo = 0;                   // Inicializa el tiempo en cero
  }
  
  // Método que dibuja el HUD en pantalla
  // Recibe como parámetro la serpiente, para acceder a su puntaje y animales comidos
  public void display(Snake snake){
    image(img, posicion.x, posicion.y); // Dibuja la imagen de fondo del HUD
    
    // Configuración de texto
    fill(#352d00);   // Color marrón oscuro
    textSize(50);    // Tamaño grande para valores principales
    
    // Muestra la puntuación actual de la serpiente
    text(snake.getPuntuacion(), 1100, 212);
    
    // Muestra el tiempo transcurrido
    text(tiempo, 1100, 165);
    
    // Muestra la lista de animales comidos con sus datos
    textSize(20);   // Texto más pequeño para detalles
    int posY = 290; // Posición inicial en Y para la lista
    
    // Recorre la lista de animales comidos y los muestra uno debajo del otro
    for(int i = 0; i < snake.getAnimalesComidos().size(); i++){
      text(snake.getAnimalesComidos().get(i).toString(), 910, posY);
      posY += 25; // Desplaza la posición vertical para el siguiente texto
    }
  }
  
  // Método para calcular el tiempo transcurrido usando DeltaTime
  public void calcularTiempo(){
    tiempo += DeltaTime.getDeltaTime(frameRate);
  }
  
  // Getter del tiempo actual
  public float getTiempo(){
    return tiempo;
  }
}
