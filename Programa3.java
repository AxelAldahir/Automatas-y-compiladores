/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package pk1;

import java.io.*;
import java.util.regex.*;
import javax.swing.*;

/**
 *
 * @author gutie
 */

public class Programa3 {
    public static void main(String[] args) {
        int opcion;
        
        do {
            JFileChooser PedirArchivo = new JFileChooser();
            if (PedirArchivo.showOpenDialog(null) != JFileChooser.APPROVE_OPTION) {
                JOptionPane.showMessageDialog(null, "No se selecciono ningun archivo", "Error", JOptionPane.ERROR_MESSAGE);
                return;
            }
            
            File archivo = PedirArchivo.getSelectedFile();
            Pattern numero = Pattern.compile("^[+-]?[0-9]+$");
            Pattern palabra = Pattern.compile("^[a-zA-ZáéíóúÁÉÍÓÚñÑ]+$");
            Pattern combinada = Pattern.compile("^(?=.*[a-zA-Z])(?=.*[0-9]).+$");
            
            int totCaracteres = 0, totSinEspacios = 0, totLexemas = 0;
            int totPalabras = 0, totNumeros = 0, totCombinadas = 0;

            BufferedReader archivoTXT = null;
            try {
                archivoTXT = new BufferedReader(new FileReader(archivo));
                String linea;
                while ((linea = archivoTXT.readLine()) != null) {
                    totCaracteres += linea.length();
                    String[] lexemas = linea.split("\\s+");
                    totLexemas += lexemas.length;
                    
                    for (String lexema : lexemas) {
                        totSinEspacios += lexema.length();
                        if (numero.matcher(lexema).matches()) {
                            totNumeros++;
                        } else {
                            if (palabra.matcher(lexema).matches()) {
                                totPalabras++;
                            } else {
                                if (combinada.matcher(lexema).matches()) {
                                    totCombinadas++;
                                }
                            }
                        }   
                    }
                }
            } catch (IOException e) {
                JOptionPane.showMessageDialog(null, "Error al leer el archivo, intentalo nuevamente, o cambia de archivo", "Error", JOptionPane.ERROR_MESSAGE);
            } finally {
                try {
                    if (archivoTXT != null) {
                        archivoTXT.close();
                    }
                } catch (IOException e) {
                    JOptionPane.showMessageDialog(null, "Error al cerrar el archivo", "Error", JOptionPane.ERROR_MESSAGE);
                }
            }

            JOptionPane.showMessageDialog(null, "Total de caracteres (con espacios): " + totCaracteres + "\n"
                    + "Total de caracteres (sin espacios): " + totSinEspacios + "\n"
                    + "Total de lexemas: " + totLexemas + "\n"
                    + "Total de palabras: " + totPalabras + "\n"
                    + "Total de números: " + totNumeros + "\n"
                    + "Total de combinadas: " + totCombinadas, "Mostrando resultados", JOptionPane.INFORMATION_MESSAGE);
            
            opcion = JOptionPane.showConfirmDialog(null, "¿Deseas procesar otro archivo?", "Repetir", JOptionPane.YES_NO_OPTION);
        } while (opcion == JOptionPane.YES_OPTION);
    }
}

