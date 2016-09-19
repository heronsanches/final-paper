package tcc.heronsanches.ufba.fim.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.DecimalFormat;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.core.Instance;
import weka.core.Instances;

/**These methods was based on examples of use of MultilayerPerceptron from http://www.lac.inpe.br/~rafael.santos/Docs/TreinamentoCTI2010/JavaDMVis.pdf */
public class MultilayerPerceptronWeka {
    
    
    private static final String PATH_CLASSIFIER = "classifier.mlp";
    
    
    /**@param pathToArffFile : path where is the arrf file training*/
    public static void trainingNetwork(String pathToArffFile){
        
        ObjectOutputStream oos = null;
        
        try {
            
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances (reader);
            instancies.setClassIndex (6);
            
            //creates classifier based on Multilayer Perceptrons
            MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.5);
            mlp.setMomentum (0.2);
            mlp.setTrainingTime (200000);
            mlp.setHiddenLayers ("5");
            
            //training network .
            mlp.buildClassifier(instancies);
            
            //saves classifier to use in other moment
            oos = new ObjectOutputStream (new FileOutputStream(MultilayerPerceptronWeka.PATH_CLASSIFIER));
            oos.writeObject(mlp);
            oos.close();
            
        } catch (IOException ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                oos.close();
            } catch (IOException ex) {
                Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
    }
    
    
    /**@param pathToArffFile : path where is the arrf file testing*/
    public static String testingNetwork(String pathToArffFile) throws Exception{
        
       ObjectInputStream ois = null;
       String resultTesting = "";
       
        try {
            
            ois = new ObjectInputStream (new FileInputStream(MultilayerPerceptronWeka.PATH_CLASSIFIER));
            MultilayerPerceptron mlp2 = (MultilayerPerceptron) ois.readObject();
            ois.close ();
            
            FileReader reader2 = new FileReader (pathToArffFile);
            Instances instancies2 = new Instances(reader2);
            instancies2.setClassIndex(6);
            
            int tse = 0; //true side effect
            int tnse = 0; //true no side effect
            int fse = 0; //false side effect
            int fnse = 0; //false no side effect
            
            int qttInstacies = instancies2.numInstances();
            Instance instance2;
            int ic; //instance class
            
            //classifying
            for (int i =0; i < instancies2.numInstances(); i++){
                
                // Recuperamos cada uma das instâncias.
                instance2 = instancies2.instance(i);
                
                // Classificamos esta instância.
                ic = (int)mlp2.classifyInstance(instance2);
                
                if (ic == (int)instance2.classValue()){ //true classification
                    
                    if((int)instance2.classValue() == 1) //siddeEffect
                        tse++;
                    else
                        tnse++;
                    
                }else{ //false classification
                    
                    if((int)instance2.classValue() == 1)
                        fse++;
                    else
                        fnse++;
                    
                }
                
            }   
            
            DecimalFormat df = new DecimalFormat("#.####");
            
            /*measurements
                precision = tp/tp+fp
                recall = tp/tp+fn
                accuracy = tp+tn/tp+tn+fp+fn
            */
                
            resultTesting += "number of instancies: "+qttInstacies+"\n"
                    + "true side effect: "+tse+"\n"
                    + "true no side effect: "+tnse+"\n"
                    + "false side effect: "+fse+"\n"
                    + "false no side effect: "+fnse+"\n\n"
                    + "precision: "+df.format( ((double)tse / (tse+fse)) * 100)+"%\n"
                    + "recall: "+df.format(((double)tse / (tse+fnse)) * 100)+"%\n"
                    + "accuracy: "+df.format( (((double)tse+tnse) / (tse+tnse+fse+fnse)) * 100)+"%\n";
            
        } catch (IOException ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } finally {
            try {
                ois.close();
            } catch (IOException ex) {
                Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        return resultTesting;
        
    }
    
    
    /**@param pathToArffFile : path where is the arrf file testing*/
    public static boolean isSideEffect(String pathToArffFile){ 
                
        try {
        
            ObjectInputStream ois = null;
            ois = new ObjectInputStream (new FileInputStream(MultilayerPerceptronWeka.PATH_CLASSIFIER));
            MultilayerPerceptron mlp = (MultilayerPerceptron) ois.readObject();
            ois.close ();

            Instances instancies = new Instances(new FileReader (pathToArffFile));
            instancies.setClassIndex(6);

            int isSideEffect_ = (int)mlp.classifyInstance(instancies.instance(0));
            
            if(isSideEffect_ == 1)
                return true;
            
        } catch (IOException ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(MultilayerPerceptronWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
        
    }

    
}