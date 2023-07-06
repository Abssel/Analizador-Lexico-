package dlince;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java_cup.runtime.Symbol;
import java.io.StringReader;

public class PythonLexico {

	
	  public static void main(String[] args) throws IOException {
	    PythonLexer lexer = new PythonLexer(new FileReader("input.py"));
	    Symbol token;
	    do {
	      token = lexer.next_token();
	      System.out.println(token.sym + ": " + token.value);
	    } while (token.sym != sym.EOF);
	  
}
	