package tcc.heronsanches.ufba.fim.utils;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import weka.classifiers.functions.MultilayerPerceptron;
import weka.classifiers.meta.Decorate;
import weka.core.Instance;
import weka.core.Instances;
import weka.core.converters.ConverterUtils.DataSource;


/**These methods was based on examples of using of MultilayerPerceptron from http://www.lac.inpe.br/~rafael.santos/Docs/TreinamentoCTI2010/JavaDMVis.pdf
and using of cross-validation from here https://weka.wikispaces.com/Generating+cross-validation+folds+(Java+approach) and using a classifier to classifying a unlabeled instance from
here https://weka.wikispaces.com/Use+Weka+in+your+Java+code*/
public class ClassificationWeka {
    
    private static final String PATH_CLASSIFIER = "classifier.mlp";
    public static String listPrecisions = "";
    public static String listRecalls = "";
    public static String listAccuracies = "";
    public static String listPrecisionsDev = "";
    public static String listRecallsDev = "";
    public static String listAccuraciesDev = "";
    
    
    /**@param pathToArffFile : path where is the arff file testing*/
    public static String testingNetwork(String pathToArffFile) throws Exception{
        
       ObjectInputStream ois = null;
       String resultTesting = "";
       
        try {
            
            //get the salved classifier
            ois = new ObjectInputStream (new FileInputStream(ClassificationWeka.PATH_CLASSIFIER));
            MultilayerPerceptron mlp = (MultilayerPerceptron) ois.readObject();
            ois.close ();
            
            //get the instancies on arff
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances(reader);
            instancies.setClassIndex(instancies.numAttributes() - 1);
            
            int tse = 0; //true side effect
            int tnse = 0; //true no side effect
            int fse = 0; //false side effect
            int fnse = 0; //false no side effect
            
            int qttInstacies = instancies.numInstances();
            Instance instance;
            int ic; //class by classifier
            int iClass; //instance class
            
            //classifying
            for (int i =0; i < instancies.numInstances(); i++){
                
                //Recovery the instance
                instance = instancies.instance(i);
                
                iClass = (int)instance.classValue();
                
                //Classifies the instance
                ic = (int)mlp.classifyInstance(instance);
                
                if (ic == iClass){ //true classification
                    
                    if(instance.classAttribute().value(iClass).contentEquals("yes")) //siddeEffect
                        tse++;
                    else
                        tnse++;
                    
                }else{ //false classification
                    
                    if(instance.classAttribute().value(iClass).contentEquals("yes"))
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
            
        } catch (IOException | ClassNotFoundException | NullPointerException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultTesting;
        
    }
    
    
    /**@param pathToArffFile : path where is the arff file to classify*/
    public static boolean isSideEffect(String pathToArffFile){ 
                
        try {
        
            ObjectInputStream ois = null;
            ois = new ObjectInputStream (new FileInputStream(ClassificationWeka.PATH_CLASSIFIER));
            Decorate dec = (Decorate) ois.readObject();
            ois.close ();
            
            // load unlabeled data and set class attribute 
            Instances unlabeled = DataSource.read(pathToArffFile); 
            unlabeled.setClassIndex(unlabeled.numAttributes() - 1); 

            // create copy 
            Instances labeled = new Instances(unlabeled);

             // label instances 
            int clsLabel = (int)dec.classifyInstance(unlabeled.instance(0)); 
            labeled.instance(0).setClassValue(clsLabel); 
            
            if(labeled.instance(0).classAttribute().value(clsLabel).contentEquals("yes"))
                return true;
            
        } catch (IOException | ClassNotFoundException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
        
    }
    
    
    /**@param pathToArffFile : path where is the arff file training*/
    public static boolean trainingNetwork(String pathToArffFile){
        
        ObjectOutputStream oos = null;
        
        try {
            
            FileReader reader = new FileReader(pathToArffFile);
            Instances instancies = new Instances(reader);
            instancies.setClassIndex(instancies.numAttributes() - 1);
            Random rand1 = new Random(79);
            Instances randData1 = new Instances(instancies);
            randData1.randomize(rand1);
            randData1 = new Instances(randData1, 0, 45);
            
            //creates classifier based on Multilayer Perceptrons
            /*MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.3);
            mlp.setTrainingTime (4000);*/
            
            //A string with a comma seperated list of numbers. Each number is the number of nodes to be on a hidden layer.
            //mlp.setHiddenLayers ("5");
            Decorate dec = new Decorate();
            dec.setDesiredSize(14);

            //training network
            dec.buildClassifier(randData1);

            //saves classifier to use in other moment
            oos = new ObjectOutputStream (new FileOutputStream(ClassificationWeka.PATH_CLASSIFIER));
            oos.writeObject(dec);
            oos.close();
            
            return true;
                        
        } catch (IOException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
                
    }
    

    public static long numRand = 1;
    public static double acc = 0;
    public static double rec = 0;
    public static double prec = 0;

    /**@param pathToArffFile : path where is the arff file dataset
     @returns the statical results. Added: max and min and, standard deviation, when compared with the stratifiedKCrossvalidation*/
    public static String stratifiedKCrossvalidation2(String pathToArffFile, int quantityToValidate ){
        
        String resultTesting = "";
        String individualTesting = "";
        DecimalFormat df = new DecimalFormat("#.##");
        int datasetSize;
        
        try {
            
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances (reader);
            instancies.setClassIndex (instancies.numAttributes() - 1);
            //datasetSize = instancies.numInstances();
            
            //choosing a limited randomic amount of data to validate
            //int quantityToValidate = instancies.numInstances();
            //Random rand1 = new Random(System.currentTimeMillis());
            Random rand1 = new Random(numRand);
            Instances randData1 = new Instances(instancies);
            randData1.randomize(rand1);
            randData1 = new Instances(randData1, 0, quantityToValidate);
            datasetSize = randData1.numInstances();
            
            //creates classifier based on Multilayer Perceptrons
            /*MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.3);
            mlp.setTrainingTime (4000);*/
           
            //A string with a comma seperated list of numbers. Each number is the number of nodes to be on a hidden layer.
            //mlp.setHiddenLayers ("0"); 
            
            Decorate dec = new Decorate();
            dec.setDesiredSize(14);
            
            int tse; //true side effect
            int tnse; //true no side effect
            int fse; //false side effect
            int fnse; //false no side effect
            int qttInstacies;
            double meanPrecision;
            double meanRecall;
            double meanAccuracy;
            int ttse = 0; //total true side effect
            int ttnse = 0; //total true no side effect
            int tfse = 0; //total false side effect
            int tfnse = 0; //total false no side effect
            int tQttInstacies = 0; //total 
            double tMeanPrecision = 0; //total mean
            double tMeanRecall = 0; //total mean
            double tMeanAccuracy = 0; //total mean
            double auxPrecision;
            double auxAccuracy;
            double auxRecall;
            
            /**max. and min. of each run*/
            double maxP = 0; //P: Precision
            double maxR = 0; //R: Recall
            double maxA = 0; //A: Accuracy
            double minP = 0;
            double minR = 0;
            double minA = 0;
            
            /**max. and min. of the means of all runs*/
            double maxPa = 0;
            double maxRa = 0;
            double maxAa = 0;
            double minPa = 0;
            double minRa = 0;
            double minAa = 0;
            
            double auxVarPrecision;
            double auxVarRecall;
            double auxVarAccuracy;
            double meanDevPrecision;
            double meanDevRecall;
            double meanDevAccuracy;
            int ic; //instance class generated by the classifier
            int iClass; //instance class
            
            int seed;
            int folds = 10; //TODO enhancement: passes it how a parameter
            int runs = 10; //TODO enhancement: passes it how a parameter
            
            //sometimes accuracy and/or precision can be null divisions and must not be computed
            int pf; //precision folds considered on computation
            int rf; //recall folds considered on computation
            
            ArrayList<Double> lPrecision = new ArrayList<>(folds);
            ArrayList<Double> lRecall = new ArrayList<>(folds);
            ArrayList<Double> lAccuracy = new ArrayList<>(folds);
            
            ArrayList<Double> lmPrecision = new ArrayList<>(runs);
            ArrayList<Double> lmRecall = new ArrayList<>(runs);
            ArrayList<Double> lmAccuracy = new ArrayList<>(runs);    
            
            for(int i=0; i < runs; i++){ //repeats "runs" times the stratifyed-cross-validation
            
                seed = i + 1;
                Random rand = new Random(seed);
                Instances randData = new Instances(randData1);
                randData.randomize(rand);
                randData.stratify(folds);
                
                qttInstacies = 0;
                meanPrecision = 0;
                meanRecall = 0;
                meanAccuracy = 0;
                auxVarAccuracy = 0;
                auxVarPrecision = 0;
                auxVarRecall = 0;
                meanDevPrecision = 0;
                meanDevRecall = 0;
                meanDevAccuracy = 0;
                pf = folds;
                rf = folds;
                lAccuracy.clear();
                lPrecision.clear();
                lRecall.clear();
                
                for(int n=0; n < folds; n++){ //stratifyed-cross-validation
                    
                    Instances train = randData.trainCV(folds, n);
                    Instances test = randData.testCV(folds, n);
                    
                    //training network
                    //mlp.buildClassifier(train);
                    
                    dec.buildClassifier(train);
                    
                    qttInstacies += test.numInstances();
                    Instance instanceTest;
                    tse = 0; 
                    tnse = 0;
                    fse = 0; 
                    fnse = 0;
                    auxAccuracy = 0;
                    auxPrecision = 0;
                    auxRecall = 0;

                    for(int j =0; j < test.numInstances(); j++){ //classifying
                        
                        instanceTest = test.instance(j); //recovery the instance
                        //ic = (int)mlp.classifyInstance(instanceTest); //classifies the instance
                        ic = (int)dec.classifyInstance(instanceTest);
                        iClass = (int)instanceTest.classValue();

                        if (ic == iClass){ //true classification

                            if(instanceTest.classAttribute().value(iClass).contentEquals("yes")) //siddeEffect
                                tse++;
                            else
                                tnse++;

                        }else{ //false classification

                            if(instanceTest.classAttribute().value(iClass).contentEquals("yes"))
                                fse++;
                            else
                                fnse++;

                        }

                    }
                    
                    ttse += tse;
                    ttnse += tnse;
                    tfse += fse;
                    tfnse += fnse;
                    
                    /*measurements
                        precision = tp/(tp+fp)
                        recall or true positive rate = tp/(tp+fn)
                        false positive rate (fpr) = fp/(fp+tn)
                        accuracy = (tp+tn)/(tp+tn+fp+fn)
                        standard deviation = squareRoot(variance)
                    */
                    
                    auxAccuracy = ((double)tse+tnse) / (tse+tnse+fse+fnse);
                    auxPrecision = (double)tse / (tse+fse);
                    auxRecall = (double)tse / (tse+fnse);
                            
                    meanAccuracy += (auxAccuracy / folds);
                    lAccuracy.add(auxAccuracy);
                            
                    if(!Double.isNaN(auxPrecision)){
                        
                        meanPrecision += auxPrecision;
                        lPrecision.add(auxPrecision);
                        
                    }else
                        pf--;
                    
                    if(!Double.isNaN(auxRecall)){
                        
                        meanRecall += auxRecall;
                        lRecall.add(auxRecall);
                        
                    }else
                        rf--; 
                    
                    if(n == 0){
                        
                        maxA = auxAccuracy;
                        minA = auxAccuracy;
                        maxP = auxPrecision;
                        minP = auxPrecision;
                        maxR = auxRecall;
                        minR = auxRecall;
                        
                    }else{

                        if(!Double.isNaN(auxPrecision)){
                            
                            if(maxP < auxPrecision)
                                maxP = auxPrecision;
                            
                            if(minP > auxPrecision)
                                minP = auxPrecision;
                            
                        }
                        
                        if(maxA < auxAccuracy)
                            maxA = auxAccuracy;

                        if(minA > auxAccuracy)
                           minA = auxAccuracy;
                            
                        if(!Double.isNaN(auxRecall)){
                            
                            if(maxR < auxRecall)
                                maxR = auxRecall;

                            if(minR > auxRecall)
                                minR = auxRecall;
                            
                        }

                    }
                    
                }
                
                //calculates the mean of recall e precision for each repeatition
                meanPrecision /= pf;
                meanRecall /= rf;
                
                for(Double d: lAccuracy)
                    auxVarAccuracy += Math.pow(d-meanAccuracy, 2);
                
                for(Double d: lPrecision)
                    auxVarPrecision += Math.pow(d-meanPrecision, 2);
                
                for(Double d: lRecall)
                    auxVarRecall += Math.pow(d-meanRecall, 2);

                auxVarAccuracy /= (folds); 
                meanDevAccuracy = Math.sqrt(auxVarAccuracy);
                
                auxVarPrecision /= (pf); 
                meanDevPrecision = Math.sqrt(auxVarPrecision);
                
                auxVarRecall /= (rf); 
                meanDevRecall = Math.sqrt(auxVarRecall);

                tQttInstacies += qttInstacies;
                tMeanAccuracy += (meanAccuracy / runs);
                tMeanPrecision += (meanPrecision / runs);
                tMeanRecall += (meanRecall / runs);
                    
                /*individualTesting += "number of instancies: "+qttInstacies+"\n"
                    + "mean precision: "+df.format( meanPrecision * 100)+"%\n"
                    + "mean recall: "+df.format(meanRecall * 100)+"%\n"
                    + "mean accuracy: "+df.format( meanAccuracy * 100)+"%\n"
                    + "\nstandard deviation precision: "+df.format(meanDevPrecision * 100)+"%"
                        + "\nmaximum precision: "+df.format(maxP * 100)+"%"
                        + "\nminimum precision: "+df.format(minP * 100)+"%"
                    + "\n\nstandard deviation recall: "+df.format(meanDevRecall * 100)+"%"
                        + "\nmaximum recall: "+df.format(maxR * 100)+"%"
                        + "\nminimum recall: "+df.format(minR * 100)+"%"
                    + "\n\nstandard deviation accuracy: "+df.format(meanDevAccuracy * 100)+"%"
                        + "\nmaximum accuracy: "+df.format(maxA * 100)+"%"
                        + "\nminimum accuracy: "+df.format(minA * 100)+"%"
                    + "\n************************************************\n\n";*/
                
                lmAccuracy.add(meanAccuracy);
                lmPrecision.add(meanPrecision);
                lmRecall.add(meanRecall);
                
                if(i == 0){
                    
                    maxAa = meanAccuracy;
                    minAa = meanAccuracy;
                    maxPa = meanPrecision;
                    minPa = meanPrecision;
                    maxRa = meanRecall;
                    minRa = meanRecall;
                    
                }else{
                    
                    if(maxAa < meanAccuracy)
                        maxAa = meanAccuracy;
                    
                    if(minAa > meanAccuracy)
                        minAa = meanAccuracy;
                    
                    if(maxPa < meanPrecision)
                        maxPa = meanPrecision;
                    
                    if(minPa > meanPrecision)
                        minPa = meanPrecision;
                    
                    if(maxRa < meanRecall)
                        maxRa = meanRecall;
                    
                    if(minRa > meanRecall)
                        minRa = meanRecall;
                    
                }
                
            }
            
            double auxa = 0;
            double auxp = 0;
            double auxr = 0;
            
           for(Double d: lmAccuracy){
                auxa += Math.pow(d-tMeanAccuracy, 2);
           }
           
            for(Double d: lmPrecision){
                auxp += Math.pow(d-tMeanPrecision, 2);
            }
            
            for(Double d: lmRecall){
                auxr += Math.pow(d-tMeanRecall, 2);
            }
            
            /*ClassificationWeka.listAccuracies += "("+quantityToValidate+","+df.format(tMeanAccuracy*100)+")";
            ClassificationWeka.listPrecisions += "("+quantityToValidate+","+df.format(tMeanPrecision*100)+")";
            ClassificationWeka.listRecalls += "("+quantityToValidate+","+df.format(tMeanRecall*100)+")";
            ClassificationWeka.listAccuraciesDev += "("+quantityToValidate+","+df.format( Math.sqrt(auxa/(runs)) * 100)+")";
            ClassificationWeka.listPrecisionsDev += "("+quantityToValidate+","+df.format( Math.sqrt(auxp/(runs)) * 100 )+")";
            ClassificationWeka.listRecallsDev += "("+quantityToValidate+","+df.format( Math.sqrt(auxr/(runs)) * 100)+")";*/
            
            ClassificationWeka.listAccuracies += "("+numRand+","+df.format(tMeanAccuracy*100)+")";
            ClassificationWeka.listPrecisions += "("+numRand+","+df.format(tMeanPrecision*100)+")";
            ClassificationWeka.listRecalls += "("+numRand+","+df.format(tMeanRecall*100)+")";
            ClassificationWeka.listAccuraciesDev += "("+numRand+","+df.format( Math.sqrt(auxa/(runs)) * 100)+")";
            ClassificationWeka.listPrecisionsDev += "("+numRand+","+df.format( Math.sqrt(auxp/(runs)) * 100 )+")";
            ClassificationWeka.listRecallsDev += "("+numRand+","+df.format( Math.sqrt(auxr/(runs)) * 100)+")";
            resultTesting += "*********************stratified-k-fold-crossvalidation*********************\n"
                    + "number of instancies: "+datasetSize
                    + "\nnumber of repetitions: "+runs
                    + "\nk-folds: "+folds+"\n\n"
                /*+"ALGORITHM\n"
                    + "Hidden Layers: "+mlp.getHiddenLayers()+"\n"
                    + "Revision: "+mlp.getRevision()+"\n"
                    + "Learning rate: "+mlp.getLearningRate()+"\n"
                    + "Momentum: "+mlp.getMomentum()+"\n"
                    + "Seed: "+mlp.getSeed()+"\n"
                    + "Training time: "+mlp.getTrainingTime()+"\n"
                    + "Validation set size: "+mlp.getValidationSetSize()+"\n"
                    + "Validation threshould: "+mlp.getValidationThreshold()+"\n\n"*/
                    + "Artificial Size: "+dec.getArtificialSize()+"\n"
                    + "Num Iterations: "+dec.getNumIterations()+"\n"
                    + "Desired Size: "+dec.getDesiredSize()+"\n"
                +"TOTAL RESULT\n"
                    + "number of instancies: "+tQttInstacies+"\n"
                    + "true side effect: "+ttse+"\n"
                    + "true no side effect: "+ttnse+"\n"
                    + "false side effect: "+tfse+"\n"
                    + "false no side effect: "+tfnse+"\n\n"
                    + "precision: "+df.format( ( ((double)ttse / (ttse+tfse))) * 100)+"%\n"
                    + "recall: "+df.format(( ((double)ttse / (ttse+tfnse))) * 100)+"%\n"
                    + "accuracy: "+df.format( (((double)ttse+ttnse) / (ttse+ttnse+tfse+tfnse)) * 100)+"%\n\n"
                +"MEAN RESULT OF 'RUNS' REPETITIONS\n"
                    +"numRand: "+ClassificationWeka.numRand+"\n"
                    + "mean precision: "+df.format(tMeanPrecision * 100)+"%\n"
                    + "mean recall: "+df.format(tMeanRecall * 100)+"%\n"
                    + "mean accuracy: "+df.format(tMeanAccuracy * 100)+"%\n"
                    + "\nstandard deviation precision's means:"+df.format( Math.sqrt(auxp/(runs)) * 100 )+"%"
                        + "\nmaximum precision: "+df.format(maxPa * 100)+"%"
                        + "\nminimum precision: "+df.format(minPa * 100)+"%"
                    + "\n\nstandard deviation recall's means:"+df.format( Math.sqrt(auxr/(runs)) * 100)+"%"
                        + "\nmaximum recall: "+df.format(maxRa * 100)+"%"
                        + "\nminimum recall: "+df.format(minRa * 100)+"%"
                    + "\n\nstandard deviation accuracy's means:"+df.format( Math.sqrt(auxa/(runs)) * 100)+"%"
                        + "\nmaximum accuracy: "+df.format(maxAa * 100)+"%"
                        + "\nminimum accuracy: "+df.format(minAa * 100)+"%"
                    + "\n****************************************************\n";
                //+"\n\nINDIVIDUAL RESULTS\n"+individualTesting;
            //****************************************************
            ClassificationWeka.acc = Double.valueOf(df.format(tMeanAccuracy * 100));
            ClassificationWeka.rec= Double.valueOf(df.format(tMeanRecall * 100));
            ClassificationWeka.prec = Double.valueOf(df.format(tMeanPrecision * 100));
            ClassificationWeka.numRand++;
                        
        } catch (IOException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultTesting;
        
    }
    
    
    /**@param pathToArffFile : path where is the arff file dataset
     @returns the statical results. Added: max and min and, standard deviation*/
    /*public static String holdoutRandomized2(String pathToArffFile){
        
        String resultTesting = "";
        String individualTesting = "";
        DecimalFormat df = new DecimalFormat("#.##");
        int datasetSize;
        
        try {
            
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances (reader);
            instancies.setClassIndex (instancies.numAttributes() - 1);
            datasetSize = instancies.numInstances();
            
            //creates classifier based on Multilayer Perceptrons
            MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.3);
            mlp.setTrainingTime (4000);
            
            //A string with a comma seperated list of numbers. Each number is the number of nodes to be on a hidden layer.
            mlp.setHiddenLayers ("5"); 
            
            int tse; //true side effect
            int tnse; //true no side effect
            int fse; //false side effect
            int fnse; //false no side effect
            double meanPrecision = 0;
            double meanRecall = 0;
            double meanAccuracy = 0;
            int ttse = 0; //total true side effect
            int ttnse = 0; //total true no side effect
            int tfse = 0; //total false side effect
            int tfnse = 0; //total false no side effect
            int tQttInstacies = 0; //total 
            double auxPrecision = 0;
            double auxAccuracy = 0;
            double auxRecall = 0;
            
            /**max. and min. of each run*/
           /* double maxP = 0; //P: Precision
            double maxR = 0; //R: Recall
            double maxA = 0; //A: Accuracy
            double minP = 0;
            double minR = 0;
            double minA = 0;
            
            double auxVarPrecision = 0;
            double auxVarRecall = 0;
            double auxVarAccuracy = 0;
            int ic; //instance class generated by the classifier
            int iClass; //instance class
            
            int seed;
            int runs = 200; //TODO enhancement: passes it how a parameter
            int trainSize = 0;
            int testSize;
            //double percentToTrain = (double)67.79/100; //TODO enhancement: passes it how a parameter integer and make the necessary modification on calc
            
            //sometimes recall and/or precision can be null divisions and must not be computed
            int pf = runs; //precision runs considered on computation
            int rf = runs; //recall runs considered on computation
            
            ArrayList<Double> lPrecision = new ArrayList<>(runs);
            ArrayList<Double> lRecall = new ArrayList<>(runs);
            ArrayList<Double> lAccuracy = new ArrayList<>(runs); 

            for(int i=0; i < runs; i++){ //repeats "runs" times the holdout-randomized
                            
                //randomizes instancies
                seed = i + 1;
                Random rand = new Random(seed);
                Instances randData = new Instances(instancies);
                randData.randomize(rand);
                
                //split train and test
                //trainSize = (int) Math.round(randData.numInstances() * percentToTrain);
                trainSize = 10;
                testSize = randData.numInstances() - trainSize;
                Instances train = new Instances(randData, 0, trainSize);
                Instances test = new Instances(randData, trainSize, testSize);
                    
                //training network
                mlp.buildClassifier(train);

                tQttInstacies += test.numInstances();
                Instance instanceTest;
                tse = 0; 
                tnse = 0;
                fse = 0; 
                fnse = 0;
                auxAccuracy = 0;
                auxPrecision = 0;
                auxRecall = 0;

                for(int j =0; j < test.numInstances(); j++){ //classifying

                    instanceTest = test.instance(j); //recovery the instance
                    ic = (int)mlp.classifyInstance(instanceTest); //classifies the instance
                    iClass = (int)instanceTest.classValue();

                    if (ic == iClass){ //true classification

                        if(instanceTest.classAttribute().value(iClass).contentEquals("yes")){ //siddeEffect
                            tse++;
                        }else{
                            tnse++;
                        }
                        
                    }else{ //false classification

                        if(instanceTest.classAttribute().value(iClass).contentEquals("yes")){
                            fse++;
                        }else{
                            fnse++;
                        }
                    }

                }
                
                ttse += tse;
                ttnse += tnse;
                tfse += fse;
                tfnse += fnse;

                /*measurements
                    precision = tp/tp+fp
                    recall = tp/tp+fn
                    accuracy = tp+tn/tp+tn+fp+fn
                    standard deviation = squareRoot(variance)
                */

                /*auxAccuracy = ((double)tse+tnse) / (tse+tnse+fse+fnse);
                auxPrecision = (double)tse / (tse+fse);
                auxRecall = (double)tse / (tse+fnse);

                meanAccuracy += (auxAccuracy / runs);
                lAccuracy.add(auxAccuracy);

                if(!Double.isNaN(auxPrecision)){

                    meanPrecision += auxPrecision;
                    lPrecision.add(auxPrecision);

                }else
                    pf--;

                if(!Double.isNaN(auxRecall)){

                    meanRecall += auxRecall;
                    lRecall.add(auxRecall);

                }else
                    rf--; 

                if(i == 0){

                    maxA = auxAccuracy;
                    minA = auxAccuracy;
                    maxP = auxPrecision;
                    minP = auxPrecision;
                    maxR = auxRecall;
                    minR = auxRecall;

                }else{

                    if(!Double.isNaN(auxPrecision)){

                        if(maxP < auxPrecision)
                            maxP = auxPrecision;

                        if(minP > auxPrecision)
                            minP = auxPrecision;

                    }

                    if(maxA < auxAccuracy)
                        maxA = auxAccuracy;

                    if(minA > auxAccuracy)
                       minA = auxAccuracy;

                    if(!Double.isNaN(auxRecall)){

                        if(maxR < auxRecall)
                            maxR = auxRecall;

                        if(minR > auxRecall)
                            minR = auxRecall;

                    }

                }
                
                individualTesting += "number of instancies: "+test.numInstances()+"\n"
                        + "true side effect: "+tse+"\n"
                        + "true no side effect: "+tnse+"\n"
                        + "false side effect: "+fse+"\n"
                        + "false no side effect: "+fnse+"\n\n"
                        + "precision: "+df.format(auxPrecision * 100)+"%\n"
                        + "recall: "+df.format(auxRecall * 100)+"%\n"
                        + "accuracy: "+df.format(auxAccuracy * 100)+"%\n"
                        + "\n************************************************\n\n";
                
            }
                                    
            //calculates the mean of recall e precision
            meanPrecision /= pf;
            meanRecall /= rf;

            for(Double d: lAccuracy)
                auxVarAccuracy += Math.pow(d-meanAccuracy, 2);

            for(Double d: lPrecision)
                auxVarPrecision += Math.pow(d-meanPrecision, 2);

            for(Double d: lRecall)
                auxVarRecall += Math.pow(d-meanRecall, 2);

            auxVarAccuracy /= runs; 
            auxVarPrecision /= pf; 
            auxVarRecall /= rf; 
            
            resultTesting += "*********************randomized-holdout*********************\n"
                   + "number of instancies: "+datasetSize
                    + "\nnumber of repetitions: "+runs
                    + "\nnumber of instances to train: "+trainSize
                    + "\nnumber of instances to test: "+(datasetSize - trainSize)+"\n\n"
                +"REDE\n"
                    + "Hidden Layers list: "+mlp.getHiddenLayers()+"\n"
                    + "Revision: "+mlp.getRevision()+"\n"
                    + "Learning rate: "+mlp.getLearningRate()+"\n"
                    + "Momentum: "+mlp.getMomentum()+"\n"
                    + "Seed: "+mlp.getSeed()+"\n"
                    + "Training time: "+mlp.getTrainingTime()+"\n"
                    + "Validation set size: "+mlp.getValidationSetSize()+"\n"
                    + "Validation threshould: "+mlp.getValidationThreshold()+"\n\n"
                +"TOTAL RESULT\n"
                    + "number of instancies: "+tQttInstacies+"\n"
                    + "true side effect: "+ttse+"\n"
                    + "true no side effect: "+ttnse+"\n"
                    + "false side effect: "+tfse+"\n"
                    + "false no side effect: "+tfnse+"\n\n"
                    + "precision: "+df.format( ( ((double)ttse / (ttse+tfse))) * 100)+"%\n"
                    + "recall: "+df.format(( ((double)ttse / (ttse+tfnse))) * 100)+"%\n"
                    + "accuracy: "+df.format( (((double)ttse+ttnse) / (ttse+ttnse+tfse+tfnse)) * 100)+"%\n\n"
                +"MEAN RESULT OF 'RUNS' REPETITIONS\n"
                    + "mean precision: "+df.format(meanPrecision * 100)+"%\n"
                    + "mean recall: "+df.format(meanRecall * 100)+"%\n"
                    + "mean accuracy: "+df.format(meanAccuracy * 100)+"%\n"
                    + "\nstandard deviation precision's means:"+df.format( Math.sqrt(auxVarPrecision) * 100 )+"%"
                        + "\nmaximum precision: "+df.format(maxP * 100)+"%"
                        + "\nminimum precision: "+df.format(minP * 100)+"%"
                    + "\n\nstandard deviation recall's means:"+df.format( Math.sqrt(auxVarRecall) * 100)+"%"
                        + "\nmaximum recall: "+df.format(maxR * 100)+"%"
                        + "\nminimum recall: "+df.format(minR * 100)+"%"
                    + "\n\nstandard deviation accuracy's means:"+df.format( Math.sqrt(auxVarAccuracy) * 100)+"%"
                        + "\nmaximum accuracy: "+df.format(maxA * 100)+"%"
                        + "\nminimum accuracy: "+df.format(minA * 100)+"%"
                +"\n\nINDIVIDUAL RESULTS\n"+individualTesting;

        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }           
        
        return resultTesting;
        
    }*/
   
    /**@param pathToArffFile : path where is the arff file dataset
     @returns the statical results*/
    /*public static String stratifiedKCrossvalidation(String pathToArffFile){
        
        String resultTesting = "";
        String individualTesting = "";
        DecimalFormat df = new DecimalFormat("#.##");
        int datasetSize;
        
        try {
            
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances (reader);
            instancies.setClassIndex (instancies.numAttributes() - 1);
            datasetSize = instancies.numInstances();
            
            //creates classifier based on Multilayer Perceptrons
            MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.2);
            mlp.setTrainingTime (1000);
            mlp.setHiddenLayers ("5");
            
            int tse; //true side effect
            int tnse; //true no side effect
            int fse; //false side effect
            int fnse; //false no side effect
            int qttInstacies;
            double meanPrecision;
            double meanRecall;
            double meanAccuracy;
            int ttse = 0; //total true side effect
            int ttnse = 0; //total true no side effect
            int tfse = 0; //total false side effect
            int tfnse = 0; //total false no side effect
            int tQttInstacies = 0; //total 
            double tMeanPrecision = 0; //total mean
            double tMeanRecall = 0; //total mean
            double tMeanAccuracy = 0; //total mean
            double auxPrecision = 0;
            double auxRecall = 0;
            int ic; //instance class generated by the classifier
            int iClass; //instance class
            
            int seed;
            int folds = 10; //TODO enhancement: passes it how a parameter
            int runs = 200; //TODO enhancement: passes it how a parameter
            
            for(int i=0; i < runs; i++){ //repeats "runs" times the stratifyed-cross-validation
            
                seed = i + 1;
                Random rand = new Random(seed);
                Instances randData = new Instances(instancies);
                randData.randomize(rand);
                randData.stratify(folds);
                
                qttInstacies = 0;
                meanPrecision = 0;
                meanRecall = 0;
                meanAccuracy = 0;
                
                for(int n=0; n < folds; n++){ //stratifyed-cross-validation
                    
                    Instances train = randData.trainCV(folds, n);
                    Instances test = randData.testCV(folds, n);
                    
                    //training network
                    mlp.buildClassifier(train);
                    
                    qttInstacies += test.numInstances();
                    Instance instanceTest;
                    tse = 0; 
                    tnse = 0;
                    fse = 0; 
                    fnse = 0;

                    for(int j =0; j < test.numInstances(); j++){ //classifying
                        
                        instanceTest = test.instance(j); //recovery the instance
                        ic = (int)mlp.classifyInstance(instanceTest); //classifies the instance
                        iClass = (int)instanceTest.classValue();

                        if (ic == iClass){ //true classification

                            if(instanceTest.classAttribute().value(iClass).contentEquals("yes")) //siddeEffect
                                tse++;
                            else
                                tnse++;

                        }else{ //false classification

                            if(instanceTest.classAttribute().value(iClass).contentEquals("yes"))
                                fse++;
                            else
                                fnse++;

                        }

                    }
                    
                    ttse += tse;
                    ttnse += tnse;
                    tfse += fse;
                    tfnse += fnse;
                    
                    /*measurements
                        precision = tp/tp+fp
                        recall = tp/tp+fn
                        accuracy = tp+tn/tp+tn+fp+fn
                    */
                    
                    /*meanAccuracy +=  ((((double)tse+tnse) / (tse+tnse+fse+fnse)) / folds);
                    auxPrecision = (double)tse / (tse+fse);
                    auxRecall = (double)tse / (tse+fnse);
                            
                    if(!Double.isNaN(auxPrecision))
                        meanPrecision += (auxPrecision / folds);
                    
                    if(!Double.isNaN(auxRecall))
                        meanRecall += (auxRecall / folds);
                    
                }
                 
                tQttInstacies += qttInstacies;
                tMeanAccuracy += (meanAccuracy / runs);
                tMeanPrecision += (meanPrecision / runs);
                tMeanRecall += (meanRecall / runs);
                    
                individualTesting += "number of instancies: "+qttInstacies+"\n"
                            + "mean precision: "+df.format( meanPrecision * 100)+"%\n"
                            + "mean recall: "+df.format(meanRecall * 100)+"%\n"
                            + "mean accuracy: "+df.format( meanAccuracy * 100)+"%\n"
                            + "************************************************\n\n";
                
            }
            
            resultTesting += "*********************stratified-k-fold-crossvalidation*********************\n"
                    + "number of instancies: "+datasetSize
                    + "\nnumber of repetitions: "+runs
                    + "\nk-folds: "+folds+"\n\n"
                +"REDE\n"
                    + "Hidden Layers: "+mlp.getHiddenLayers()+"\n"
                    + "Revision: "+mlp.getRevision()+"\n"
                    + "Learning rate: "+mlp.getLearningRate()+"\n"
                    + "Momentum: "+mlp.getMomentum()+"\n"
                    + "Seed: "+mlp.getSeed()+"\n"
                    + "Training time: "+mlp.getTrainingTime()+"\n"
                    + "Validation set size: "+mlp.getValidationSetSize()+"\n"
                    + "Validation threshould: "+mlp.getValidationThreshold()+"\n\n"
                +"TOTAL RESULT\n"
                    + "number of instancies: "+tQttInstacies+"\n"
                    + "true side effect: "+ttse+"\n"
                    + "true no side effect: "+ttnse+"\n"
                    + "false side effect: "+tfse+"\n"
                    + "false no side effect: "+tfnse+"\n\n"
                    + "precision: "+df.format( ( ((double)ttse / (ttse+tfse))) * 100)+"%\n"
                    + "recall: "+df.format(( ((double)ttse / (ttse+tfnse))) * 100)+"%\n"
                    + "accuracy: "+df.format( (((double)ttse+ttnse) / (ttse+ttnse+tfse+tfnse)) * 100)+"%\n\n"
                +"MEAN RESULT\n"
                    + "mean precision: "+df.format(tMeanPrecision * 100)+"%\n"
                    + "mean recall: "+df.format(tMeanRecall * 100)+"%\n"
                    + "mean accuracy: "+df.format(tMeanAccuracy * 100)+"%\n\n"
                +"INDIVIDUAL RESULTS\n"+individualTesting;
                        
        } catch (IOException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultTesting;
        
    }*/
    
    
    /**@param pathToArffFile : path where is the arff file dataset
     @returns the statical results*/
    /*public static String holdoutRandomized(String pathToArffFile){
        
        String resultTesting = "";
        String resultInd = "";
        DecimalFormat df = new DecimalFormat("#.##");
        int datasetSize;
        
        try {
            
            FileReader reader = new FileReader (pathToArffFile);
            Instances instancies = new Instances (reader);
            instancies.setClassIndex (instancies.numAttributes() - 1);
            datasetSize = instancies.numInstances();
            
            //creates classifier based on Multilayer Perceptrons
            MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.2);
            mlp.setTrainingTime (1000);
            mlp.setHiddenLayers ("5");
            
            /** total */
           /* int tse = 0; //true side effect
            int tnse = 0; //true no side effect
            int fse = 0; //false side effect
            int fnse = 0; //false no side effect
            int qttInstacies = 0;
            
            double meanPrecision = 0;
            double meanRecall = 0;
            double meanAccuracy = 0;
            
            /** individual **/
            /*int tseInd; //true side effect
            int tnseInd; //true no side effect
            int fseInd; //false side effect
            int fnseInd; //false no side effect

            int ic; //instance class generated by the classifier
            int iClass; //instance class
            
            int seed;
            int trainSize;
            int testSize;
            int runs = 5000; //TODO enhancement: passes it how a parameter
            double percentToTrain = 0.2174; //TODO enhancement: passes it how a parameter integer and make the necessary modification on calc
            double auxPrecision = 0;
            double auxRecall = 0;
            double auxAccuracy = 0;
            
            for(int i=0; i < runs; i++){ //repeats "runs" times the holdout-randomized
            
                //randomizes instancies
                seed = i + 1;
                Random rand = new Random(seed);
                Instances randData = new Instances(instancies);
                randData.randomize(rand);
                
                //split train and test
                trainSize = (int) Math.round(randData.numInstances() * percentToTrain);
                testSize = randData.numInstances() - trainSize;
                Instances train = new Instances(randData, 0, trainSize);
                Instances test = new Instances(randData, trainSize, testSize);
                
                tseInd = 0; 
                tnseInd = 0;
                fseInd = 0; 
                fnseInd = 0;

                //training network
                mlp.buildClassifier(train);

                qttInstacies += test.numInstances();
                Instance instanceTest;

                for(int j =0; j < test.numInstances(); j++){ //classifying

                    instanceTest = test.instance(j); //recovery the instance
                    ic = (int)mlp.classifyInstance(instanceTest); //classifies the instance
                    iClass = (int)instanceTest.classValue();

                    if (ic == iClass){ //true classification

                        if(instanceTest.classAttribute().value(iClass).contentEquals("yes")){ //siddeEffect
                            
                            tse++;
                            tseInd++;
                            
                        }else{
                            
                            tnse++;
                            tnseInd++;
                            
                        }
                        
                    }else{ //false classification

                        if(instanceTest.classAttribute().value(iClass).contentEquals("yes")){
                            
                            fse++;
                            fseInd++;
                            
                        }else{
                            
                            fnse++;
                            fnseInd++;
                            
                        }
                        
                    }

                }  
                    
                /*measurements
                    precision = tp/tp+fp
                    recall = tp/tp+fn
                    accuracy = tp+tn/tp+tn+fp+fn
                */
                
               /* auxAccuracy = ((double)tseInd+tnseInd) / (tseInd+tnseInd+fseInd+fnseInd);
                auxPrecision = (double)tseInd / (tseInd+fseInd);
                auxRecall = (double)tseInd / (tseInd+fnseInd);
                meanAccuracy += (auxAccuracy / runs);
                
                if(!Double.isNaN(auxPrecision))
                    meanPrecision += (auxPrecision /runs);
                
                if(!Double.isNaN(auxRecall))
                    meanRecall += (auxRecall /runs);
                    
                resultInd += 
                    "number of instancies: "+test.numInstances()+"\n"
                    + "true side effect: "+tseInd+"\n"
                    + "true no side effect: "+tnseInd+"\n"
                    + "false side effect: "+fseInd+"\n"
                    + "false no side effect: "+fnseInd+"\n\n"
                    + "precision: "+df.format(auxPrecision * 100)+"%\n"
                    + "recall: "+df.format(auxRecall  * 100)+"%\n"
                    + "accuracy: "+df.format(auxAccuracy  * 100)+"%\n"
                    + "***************************************************************************************\n\n";
                
            }
            
            resultTesting += "*********************repeated-randomized-holdout*********************\n"
                    + "number of instancies: "+datasetSize
                    + "\nnumber of repetitions: "+runs
                    + "\npercent to train: "+df.format(percentToTrain * 100)+"%"
                    + "\npercent to test: "+df.format((1 - percentToTrain) * 100)+"%\n\n"
                +"REDE\n"
                    + "Hidden Layers: "+mlp.getHiddenLayers()+"\n"
                    + "Revision: "+mlp.getRevision()+"\n"
                    + "Learning rate: "+mlp.getLearningRate()+"\n"
                    + "Momentum: "+mlp.getMomentum()+"\n"
                    + "Seed: "+mlp.getSeed()+"\n"
                    + "Training time: "+mlp.getTrainingTime()+"\n"
                    + "Validation set size: "+mlp.getValidationSetSize()+"\n"
                    + "Validation threshould: "+mlp.getValidationThreshold()+"\n\n"
                +"TOTAL RESULT\n"
                    + "number of instancies: "+qttInstacies+"\n"
                    + "true side effect: "+tse+"\n"
                    + "true no side effect: "+tnse+"\n"
                    + "false side effect: "+fse+"\n"
                    + "false no side effect: "+fnse+"\n\n"
                    + "precision: "+df.format( ((double)tse / (tse+fse)) * 100)+"%\n"
                    + "recall: "+df.format(((double)tse / (tse+fnse)) * 100)+"%\n"
                    + "accuracy: "+df.format( (((double)tse+tnse) / (tse+tnse+fse+fnse)) * 100)+"%\n\n"
                +"MEAN RESULT\n"
                    + "mean precision: "+df.format(meanPrecision * 100)+"%\n"
                    + "mean recall: "+df.format(meanRecall * 100)+"%\n"
                    + "mean accuracy: "+df.format(meanAccuracy * 100)+"%\n\n"
                +"INDIVIDUAL RESULTS\n"+resultInd;
                        
        } catch (IOException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return resultTesting;
        
    }*/
    
    
    /**@param pathToArffFile : path where is the arff file training*/
    /*public static boolean trainingNetwork(String pathToArffFile){
        
        ObjectOutputStream oos = null;
        
        try {
            
            FileReader reader = new FileReader(pathToArffFile);
            Instances instancies = new Instances(reader);
            instancies.setClassIndex(instancies.numAttributes() - 1);
            
            //creates classifier based on Multilayer Perceptrons
            MultilayerPerceptron mlp = new MultilayerPerceptron ();
            mlp.setAutoBuild (true);
            mlp.setLearningRate (0.7);
            mlp.setMomentum (0.3);
            mlp.setTrainingTime (4000);
            
            //A string with a comma seperated list of numbers. Each number is the number of nodes to be on a hidden layer.
            mlp.setHiddenLayers ("5");

            //training network
            mlp.buildClassifier(instancies);

            //saves classifier to use in other moment
            oos = new ObjectOutputStream (new FileOutputStream(ClassificationWeka.PATH_CLASSIFIER));
            oos.writeObject(mlp);
            oos.close();
            
            return true;
                        
        } catch (IOException ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(ClassificationWeka.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return false;
                
    }*/
    
    
}