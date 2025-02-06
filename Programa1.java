/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package programa1;

/**
 *
 * @author gutie
 */

import java.util.Scanner;

public class Programa1 {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion;

        do {
            
            System.out.println("\n---- Menú ----");
            System.out.println("1) Ingresar una cadena de caracteres para  clasificarla");
            System.out.println("2) Salir");
            System.out.print("Seleccione una opción: ");

            
            while (!scanner.hasNextInt()) {
                System.out.println("Error: Debe ingresar un número válido.");
                scanner.next(); 
                System.out.print("Seleccione una opción: ");
            }
            opcion = scanner.nextInt();
            scanner.nextLine(); 

            switch (opcion) {
                case 1:
                    System.out.print("Ingrese una cadena de caracteres: ");
                    String entrada = scanner.nextLine();
                    String resultado = clasificarCadena(entrada);
                    System.out.println("Clasificación: " + resultado);
                    break;
                case 2:
                    System.out.println("Programa terminado. ¡Hasta luego!");
                    break;
                default:
                    System.out.println("Opción no válida. Intente de nuevo.");
            }

        } while (opcion != 2);

        scanner.close();
    }

    public static String clasificarCadena(String str) {
        if (str.matches("\\d+")) {
            return "Número entero";
        } else if (str.matches("[a-zA-ZáéíóúÁÉÍÓÚñÑ]+")) {
            return "Palabra";
        } else {
            return "Compuesta";
        }
    }
}


