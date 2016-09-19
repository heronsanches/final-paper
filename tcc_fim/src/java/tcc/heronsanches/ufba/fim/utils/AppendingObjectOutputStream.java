package tcc.heronsanches.ufba.fim.utils;

import java.io.IOException;
import java.io.ObjectOutputStream;
import java.io.OutputStream;


/**It class prevent the error: java.io.StreamCorruptedException: invalid type code: AC. It happens because on each append on a file using 
 {@linkplain ObjectOutputStream} it put characters on the head of file, so when you go to read the file outputs the error!
 The overridden method prevents it resetting the head and rewritten the objects into file calling the reset() method.*/
public class AppendingObjectOutputStream extends ObjectOutputStream {

    
  public AppendingObjectOutputStream(OutputStream out) throws IOException {
    super(out);
  }

  
  @Override
  protected void writeStreamHeader() throws IOException {
    reset();
  }
  

}