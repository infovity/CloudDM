package com.infovity.clouddm.model.helper;

import au.com.bytecode.opencsv.CSVReader;
import au.com.bytecode.opencsv.CSVWriter;

import com.infovity.clouddm.model.Loader;

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
}
