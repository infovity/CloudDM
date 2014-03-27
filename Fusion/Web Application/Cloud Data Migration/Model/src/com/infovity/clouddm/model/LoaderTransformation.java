package com.infovity.clouddm.model;

import com.infovity.clouddm.model.helper.EntityReader;

import java.io.IOException;

import java.util.ArrayList;

public class LoaderTransformation {
    public LoaderTransformation() {
        super();
    }
    private String customerID = null;

    private String customerName = null;

    private String entity = null;

    private String fusionVersion = null;

    private String infovityVersion = null;

    private String transMapping = null;

    private String inputFileLocation = null;

    private String outputFileLocation = null;

    private String infovityTemplFileLocation = null;

    private String infovityTemplFileName = null;

    private String transFileLocation = null;

    private String transFile = null;

    private String inputFileName = null;

    private String outputFileName = "FusionOutput";

    public void setInputFileName(String inputFileName) {
        this.inputFileName = inputFileName;
    }

    public String getInputFileName() {
        return inputFileName;
    }

    public void setOutputFileName(String outputFileName) {
        this.outputFileName = outputFileName;
    }

    public String getOutputFileName() {
        
        if (getInputFileName() != null) {
            return "Fusion" + getInputFileName();
        }
        return outputFileName;
    }

    public void setCustomerID(String CustomerID) {
        this.customerID = CustomerID;
    }

    public String getCustomerID() {
        return customerID;
    }

    public void setCustomerName(String CustomerName) {
        this.customerName = CustomerName;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setEntity(String Entity) {
        this.entity = Entity;
    }

    public String getEntity() {
        return entity;
    }

    public void setFusionVersion(String FusionVersion) {
        this.fusionVersion = FusionVersion;
    }

    public String getFusionVersion() {
        return fusionVersion;
    }

    public void setInfovityVersion(String InfovityVersion) {
        this.infovityVersion = InfovityVersion;
    }

    public String getInfovityVersion() {
        return infovityVersion;
    }

    public void setTransMapping(String TransMapping) {
        this.transMapping = TransMapping;
    }

    public String getTransMapping() {
        return transMapping;
    }

    public void setInputFileLocation(String FusionTemplFileLocation) {
        this.inputFileLocation = FusionTemplFileLocation;
    }

    public String getInputFileLocation() {
        return inputFileLocation;
    }

    public void setOutputFileLocation(String FusionTemplFileName) {
        this.outputFileLocation = FusionTemplFileName;
    }

    public String getOutputFileLocation() {
        return outputFileLocation;
    }

    public void setInfovityTemplFileLocation(String InfovityTemplFileLocation) {
        this.infovityTemplFileLocation = InfovityTemplFileLocation;
    }

    public String getInfovityTemplFileLocation() {
        return infovityTemplFileLocation;
    }

    public void setInfovityTemplFileName(String InfovityTemplFileName) {
        this.infovityTemplFileName = InfovityTemplFileName;
    }

    public String getInfovityTemplFileName() {
        return infovityTemplFileName;
    }

    public void setTransFileLocation(String TransFileLocation) {
        this.transFileLocation = TransFileLocation;
    }

    public String getTransFileLocation() {
        return transFileLocation;
    }

    public void setTransFile(String TransFile) {
        this.transFile = TransFile;
    }

    public String getTransFile() {
        return transFile;
    }
    
    public static ArrayList <LoaderTransformation> getAllLoaderTransformations(String fileName) {
        ArrayList <LoaderTransformation> allTransformations = null;
       // String filePath = "C:\\JDeveloper\\mywork\\Cloud Data Migration\\Model\\datastore\\EntityList.csv";

        try{
            allTransformations = EntityReader.getAllLoaderTransformations(fileName);
        } catch (IOException ioe) {
            ioe.printStackTrace();
        }
        
        return allTransformations;
    }
    
    public String toString() {
        StringBuffer sb = new StringBuffer();
        sb.append("CustomerID=" +               getCustomerID()); 
        sb.append("CustomerName=" +             getCustomerName()); 
        sb.append("Entity=" +                   getEntity()); 
        sb.append("FusionVersion=" +            getFusionVersion()); 
        sb.append("InfovityVersion=" +          getInfovityVersion()); 
        sb.append("TransMapping=" +             getTransMapping()); 
        sb.append("InputFileLocation=" +   getInputFileLocation()); 
        sb.append("OutputFileLocation=" +      getOutputFileLocation()); 
        sb.append("InfovityTemplFileLocation=" + getInfovityTemplFileLocation()); 
        sb.append("InfovityTemplFileName=" +    getInfovityTemplFileName()); 
        sb.append("TransFileLocation=" +        getTransFileLocation()); 
        sb.append("TransFile=" +                getTransFile()); 
        
        return sb.toString();
    }
}
