package com.infovity.clouddm.model.helper;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import com.infovity.clouddm.model.Loader;

import com.infovity.clouddm.model.LoaderTransformation;

import java.io.FileReader;
import java.io.IOException;
import java.io.StringWriter;

import java.util.ArrayList;
import java.util.List;

import javax.sound.sampled.Line;

public class EntityReader {
    public EntityReader() {
        super();
    }
    
    public static ArrayList getAllLoaders(String fileName) throws IOException {
        
        CSVReader reader = new CSVReader(new FileReader(fileName));
        String [] nextLine;
        int i = 0;
        ArrayList loaders = new ArrayList();
        
        if ((nextLine = reader.readNext()) != null) {
            // Skipped the header
            while ((nextLine = reader.readNext()) != null) {
                Loader loader = new Loader();
                loader.setLoaderCode(nextLine[0]);
                loader.setLoaderName(nextLine[1]);
                loader.setMappingEnabled(nextLine[2]);
                loader.setProductFamily(nextLine[3]);
                
                loaders.add(loader);
                
                    System.out.println("Name: [" + nextLine[0] + "]\nAddress: [" + nextLine[1] + "]\nEmail: [" + nextLine[2] + "]");
            }
        
        }
        
        return loaders;

    }

    public static ArrayList <LoaderTransformation> getAllLoaderTransformations(String fileName) throws IOException {
        
        CSVReader reader = new CSVReader(new FileReader(fileName));
        String [] nextLine;
        int i = 0;
        ArrayList <LoaderTransformation> loaderTransformations = new ArrayList();
        
        if ((nextLine = reader.readNext()) != null) {
            // Skipped the header
            while ((nextLine = reader.readNext()) != null) {
                LoaderTransformation loaderTrans = new LoaderTransformation();
                loaderTrans.setCustomerID(nextLine[0]);
                loaderTrans.setCustomerName(nextLine[1]);
                loaderTrans.setEntity(nextLine[2]);
                loaderTrans.setFusionVersion(nextLine[3]);
                loaderTrans.setInfovityVersion(nextLine[4]);
                loaderTrans.setTransMapping(nextLine[5]);
                loaderTrans.setFusionTemplFileLocation(nextLine[06]);
                loaderTrans.setFusionTemplFileName(nextLine[7]);
                loaderTrans.setInfovityTemplFileLocation(nextLine[8]);
                loaderTrans.setInfovityTemplFileName(nextLine[9]);
                loaderTrans.setTransFileLocation(nextLine[10]);
                loaderTrans.setTransFile(nextLine[11]);
                
                loaderTransformations.add(loaderTrans);
                
                    System.out.println("Loader Transformation: " + loaderTrans);
            }
        
        }
        
        return loaderTransformations;

    }
}
