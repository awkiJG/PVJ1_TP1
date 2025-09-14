// Clase Snake
// Representa a la serpiente controlada por el jugador.
// Maneja el movimiento, colisiones, crecimiento, estados (muerto/ganado) y registro de animales comidos.
class Snake {
  
  // Atributos principales
  private int puntuacion;                        // Puntaje acumulado por los animales comidos
  private float tiempo;                          // Controla el intervalo de movimiento
  private boolean muerto;                        // Indica si la serpiente ha muerto
  private boolean ganado;                        // Indica si la serpiente ha ganado
  private ArrayList<Cuerpo> cuerpos = new ArrayList<Cuerpo>();        // Segmentos que componen la serpiente
  private ArrayList<Animal> animalesComidos = new ArrayList<Animal>(); // Registro de animales comidos
  
  // Constructor: inicializa la serpiente con una cabeza en el centro aproximado
  public Snake(){
    cuerpos.add(new Cuerpo(new PVector(width/2-250, height/2))); // Posición inicial de la cabeza
    puntuacion = 0;   // Puntaje inicial
    tiempo = 0;       // Temporizador para el movimiento
  }
 
  // Método que mueve la serpiente en función de la dirección actual
  public void moverCuerpo(int direccion) {
    tiempo += DeltaTime.getDeltaTime(frameRate); // Acumula tiempo con DeltaTime
    if(tiempo >= 0.2){ // Controla la velocidad (un movimiento cada 0.2 seg aprox.)
      
      // Los segmentos siguen la posición del anterior, de atrás hacia adelante
      for (int i = cuerpos.size() - 1; i >= 1; i--) {
        cuerpos.get(i).setPosicion(cuerpos.get(i - 1).getPosicion());
      }

      // Copia la posición de la cabeza para actualizarla según la dirección
      PVector cabezaPos = cuerpos.get(0).getPosicion().copy();
      
      // Movimiento de la cabeza según dirección
      switch (direccion) {
        case 1: // Derecha
          if(direccion != 2){ 
            cabezaPos.add(new PVector(50, 0));
            break;
          }
        case 2: // Izquierda
          if(direccion != 1){
            cabezaPos.add(new PVector(-50, 0));
            break;
          }
        case 3: // Abajo
          cabezaPos.add(new PVector(0, 50));
          break;
        case 4: // Arriba
          cabezaPos.add(new PVector(0, -50));
          break;
      }

      // Actualiza la posición de la cabeza
      cuerpos.get(0).setPosicion(cabezaPos);
      tiempo = 0; // Reinicia el temporizador
    }
  }
  
  // Verifica si la cabeza colisiona con el cuerpo (a partir del tercer segmento)
  public boolean verificarColisionConCuerpo() {
    if (cuerpos.size() < 2) {
      return false; 
    }
    for (int i = 2; i < cuerpos.size(); i++) {
      if (cuerpos.get(0).getPosicion().equals(cuerpos.get(i).getPosicion())) {
        return true;   
      }  
    }
    return false; 
  }

  // Verifica si la cabeza está fuera de los límites del tablero
  public boolean verificarColisionConLimites() {
    PVector posicionCabeza = cuerpos.get(0).getPosicion();
    
    if (posicionCabeza.x < 0 || posicionCabeza.x >= 900 || 
        posicionCabeza.y < 0 || posicionCabeza.y >= 900) {
      return true; 
    }
    return false;
  }

  // Cambia las imágenes del cuerpo al estado de "muerto" y marca el estado
  public void morir(){
    for(Cuerpo cuer : cuerpos){
      cuer.setImg(1); 
      muerto = true;
    } 
  }
 
  // Cambia las imágenes del cuerpo al estado de "ganador" y marca el estado
  public void ganar(){
    for(Cuerpo cuer : cuerpos){
      cuer.setImg(2); 
      ganado = true;
    } 
  }
 
  // Registra un animal comido: se guarda, se anota el tiempo y se suman sus puntos
  public void guardarAnimalComido(Animal animal, float tiempo){
    animalesComidos.add(animal);
    animal.setTiempo(tiempo = round(tiempo * 1000) / 1000.0); // Redondea el tiempo a 3 decimales
    puntuacion += animal.getPuntos();
  }
 
  // Agrega un nuevo segmento al final del cuerpo (cuando se come un animal)
  public void agregarCuerpo(){
    cuerpos.add(new Cuerpo(cuerpos.get(cuerpos.size()-1).getPosicion()));
  }
 
  // Dibuja todos los segmentos de la serpiente
  public void dibujarCuerpo(){
    for(Cuerpo cuer : cuerpos){
      cuer.display();
    }
  }
 
  // Getters
  public ArrayList<Cuerpo> getCuerpos(){
    return cuerpos; 
  }
 
  public ArrayList<Animal> getAnimalesComidos(){
    return animalesComidos; 
  }
 
  public int getPuntuacion(){
    return puntuacion;
  }
 
  public boolean isMuerto(){
    return muerto; 
  }
 
  public boolean isGanado(){
    return ganado; 
  }
}
