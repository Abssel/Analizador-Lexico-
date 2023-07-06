package dlince;

import java.io.File;

public class Generador {

	public static void main(String[] args) {
		
		String path ="C:\\LP3\\EXAMEN FINAL\\src\\dlince";
	    String archivo = path +"Lenguaje.lex";
	    
	    
	    File file =new File(archivo);
	    jflex.Main.generate(file);
	    
	}

}
