// Clase Tablero que extiende GameObject e implementa la interfaz Idisplay.
class Tablero extends GameObject implements Idisplay {
    private Animal animal; // Variable para almacenar el animal presente en el tablero.
    private PImage finDelJuego; // Imagen que se muestra al finalizar el juego.

    // Constructor de la clase Tablero que recibe una posición como PVector.
    public Tablero(PVector posicion) {
        super(posicion);
        img = loadImage("tablero.png"); // Carga la imagen del tablero.
        finDelJuego = loadImage("findeljuego.png"); // Carga la imagen de fin del juego.
        generarAnimal(new Snake()); // Inicializa un animal en el tablero con una serpiente.
    }

    // Método para mostrar la imagen del tablero en su posición.
    public void display() {
        image(img, posicion.x, posicion.y);
    }

    // Método para mostrar la imagen de fin del juego en una posición desplazada.
    public void displayFinDelJuego() {
        image(finDelJuego, posicion.x + 100, posicion.y + 100);
    }

    // Método para verificar si la cabeza de la serpiente colisiona con el animal.
    public boolean verificarColicion(Snake snake) {
        PVector cabezaPos = snake.getCuerpos().get(0).getPosicion(); // Obtiene la posición de la cabeza de la serpiente.
        PVector animalPos = animal.getPosicion(); // Obtiene la posición del animal.
        if (cabezaPos.equals(animalPos)) { // Compara si las posiciones son iguales.
            return true;
        } else {
            return false;
        }
    }

    // Método para generar un nuevo animal en una posición válida en el tablero.
    public void generarAnimal(Snake snake) {
        PVector nuevaPosicion;
        boolean posicionValida;
        do {
            nuevaPosicion = new PVector((int) random(0, 18) * 50, (int) random(0, 18) * 50); // Genera una posición aleatoria en una cuadrícula de 18x18.
            
            posicionValida = true; // Inicializa la bandera de posición válida.
            if (animal != null && nuevaPosicion.equals(animal.getPosicion())) { // Verifica si la nueva posición coincide con la del animal actual.
                posicionValida = false;
            }
            for (Cuerpo cuerpo : snake.getCuerpos()) { // Itera sobre los cuerpos de la serpiente.
                if (nuevaPosicion.equals(cuerpo.getPosicion())) { // Verifica si la nueva posición coincide con algún cuerpo.
                    posicionValida = false;
                    break;
                }
            }
        } while (!posicionValida); // Repite hasta encontrar una posición válida.
        int tipo = (int) random(1, 4); // Genera un número aleatorio para determinar el tipo de animal.
        if (tipo == 1) {
            animal = new Animal(nuevaPosicion, loadImage("insecto.png"), 3, "insecto"); // Crea un animal de tipo insecto.
        } else if (tipo == 2) {
            animal = new Animal(nuevaPosicion, loadImage("raton.png"), 1, "raton"); // Crea un animal de tipo ratón.
        } else if (tipo == 3) {
            animal = new Animal(nuevaPosicion, loadImage("pajaro.png"), 2, "pajaro"); // Crea un animal de tipo pájaro.
        }
    }

    // Método para dibujar el animal en el tablero.
    public void dibujarAnimal() {
        animal.display();
    }

    // Método getter para obtener el animal actual.
    public Animal getAnimal() {
        return animal;
    }

    // Método setter para establecer un nuevo animal.
    public void setAnimal(Animal animal) {
        this.animal = animal;
    }
}
