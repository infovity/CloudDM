package com.infovity.clouddm.model;

import com.infovity.clouddm.model.helper.EntityReader;

import java.io.IOException;

import java.util.ArrayList;

public class Loader {
    
    private String loaderName;
    
    private String loaderCode;

    private String mappingEnabled;

    public void setLoaderName(String loaderName) {
        this.loaderName = loaderName;
    }

    public String getLoaderName() {
        return loaderName;
    }

    public void setLoaderCode(String loaderCode) {
        this.loaderCode = loaderCode;
    }

    public String getLoaderCode() {
        return loaderCode;
    }

    public void setMappingEnabled(String mappingEnabled) {
        this.mappingEnabled = mappingEnabled;
    }

    public String getMappingEnabled() {
        return mappingEnabled;
    }

    public void setProductFamily(String productFamily) {
        this.productFamily = productFamily;
    }

    public String getProductFamily() {
        return productFamily;
    }

    private String productFamily;

    public Loader() {
        super();
    }
    
    public static ArrayList getAllLoaders() {
        ArrayList allLoaders = null;
        String filePath = "C:\\JDeveloper\\mywork\\Cloud Data Migration\\Model\\datastore\\EntityList.csv";

        try{
            allLoaders = EntityReader.getAllLoaders(filePath);
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        
        return allLoaders;
    }
}
