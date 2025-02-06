/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package programa2;

/**
 *
 * @author gutie
 */
import java.util.Scanner;

public class Programa2 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion;

        do {
           
            System.out.println("\n---- Menuj ----");
            System.out.println("1) Ingresar una cadena de caracteres para clasificarla");
            System.out.println("2) Salir");
            System.out.print("Seleccione una opcion: ");

          
            while (!scanner.hasNextInt()) {
                System.out.println("Error: Debe ingresar un numero valido.");
                scanner.next();
                System.out.print("Seleccione una opcion: ");
            }
            opcion = scanner.nextInt();
            scanner.nextLine(); 

            switch (opcion) {
                case 1:
                    System.out.print("Ingrese una o mas palabras separadas por espacios: ");
                    String entrada = scanner.nextLine();

                    
                    String[] palabras = entrada.split("\\s+"); 
                    int numeros = 0, palabrasCount = 0, compuestas = 0;

                    System.out.println("\nResultados:");
                    for (String palabra : palabras) {
                        String tipo = clasificarCadena(palabra);
                        System.out.println(" - " + palabra + " → " + tipo);

                        
                        switch (tipo) {
                            case "Numero entero":
                                numeros++;
                                break;
                            case "Palabra":
                                palabrasCount++;
                                break;
                            case "Compuesta":
                                compuestas++;
                                break;
                        }
                    }

                    
                    System.out.println("\nResumen:");
                    System.out.println(" - Numeros enteros: " + numeros);
                    System.out.println(" - Palabras: " + palabrasCount);
                    System.out.println(" - Compuestas: " + compuestas);
                    break;

                case 2:
                    System.out.println("Programa finalizado");
                    break;

                default:
                    System.out.println("Opcion no valida. Intente de nuevo.");
            }

        } while (opcion != 2);

        scanner.close();
    }

   
    public static String clasificarCadena(String str) {
        if (str.matches("\\d+")) {
            return "Numero entero";
        } else if (str.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ]+")) {
            return "Palabra";
        } else {
            return "Compuesta";
        }
    }
}
