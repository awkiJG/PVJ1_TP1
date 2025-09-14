// Variables principales del juego
private Snake snake;         // Objeto que representa la serpiente
private Tablero tablero;     // Objeto que maneja el tablero y los animales
private HUD hud;             // Interfaz de usuario que muestra puntaje y tiempo
private int direccion;       // Dirección actual de movimiento de la serpiente
private boolean iniciarJuego; // Controla si el juego comenzó tras presionar una tecla

// Método de inicialización del juego
public void setup(){
  size(1300,900);                     // Define el tamaño de la ventana
  snake = new Snake();                // Crea la serpiente
  tablero = new Tablero(new PVector()); // Crea el tablero con un animal inicial
  hud = new HUD(new PVector(900,0));  // Crea el HUD en la posición indicada
  frameRate(60);                      // Establece la tasa de actualización
  iniciarJuego=false;                 // El juego comienza pausado
  direccion=0;                        // Dirección inicial (sin movimiento)
}

// Método principal que se ejecuta en cada frame
public void draw(){
  tablero.display();                  // Dibuja el tablero
  snake.dibujarCuerpo();              // Dibuja la serpiente
  tablero.dibujarAnimal();            // Dibuja el animal en pantalla
  snake.moverCuerpo(direccion);       // Mueve la serpiente según la dirección
  hud.display(snake);                 // Muestra el HUD actualizado
  gestorColicion();                   // Gestiona colisiones con animales
  
  // Si el jugador empezó a moverse, se inicia el conteo del tiempo
  if(iniciarJuego){
    hud.calcularTiempo();
  }
  
  // Verifica condiciones de fin del juego
  if(snake.isMuerto() || snake.isGanado()){
    tablero.displayFinDelJuego();     // Muestra mensaje de fin
    noLoop();                         // Detiene el ciclo principal
  }
  
  // Verifica si la serpiente choca consigo misma o con los límites
  if (snake.verificarColisionConCuerpo() || snake.verificarColisionConLimites()) {
    snake.morir();   
  }
  
  // Condición de victoria por tiempo (60 segundos)
  if(hud.getTiempo() >= 60){
    snake.ganar();
  }
}

// Método que gestiona las colisiones entre la serpiente y los animales
public void gestorColicion(){
  boolean colicion = tablero.verificarColicion(snake); // Detecta colisión
  if(colicion){
    // Guarda información del animal comido (con tiempo incluido)
    snake.guardarAnimalComido(tablero.getAnimal(), hud.getTiempo());
    tablero.generarAnimal(snake);     // Genera un nuevo animal en el tablero
    snake.agregarCuerpo();            // La serpiente crece
  }
}

// Manejo de entradas por teclado
public void keyPressed(){
  // Movimiento hacia la derecha (evita movimiento contrario inmediato)
  if(keyCode == RIGHT && direccion!= 2){
    direccion=1;
    iniciarJuego=true;
  }
  // Movimiento hacia la izquierda
  else if(keyCode == LEFT && direccion!=1){
    direccion=2;
    iniciarJuego=true;
  }
  // Movimiento hacia abajo
  else if(keyCode == DOWN && direccion!=4){
    direccion=3; 
    iniciarJuego=true;
  }
  // Movimiento hacia arriba
  else if(keyCode == UP && direccion!=3){
    direccion=4; 
    iniciarJuego=true;
  }
  
  // Si el juego terminó, se reinicia al presionar ENTER
  if(snake.isMuerto() || snake.isGanado()){
    if(keyCode == ENTER){
      setup(); // Reinicia el juego
      loop();  // Reactiva el bucle draw()
    }
  }
}
