package com.infovity.clouddm.model;

import com.infovity.clouddm.model.helper.EntityReader;

import java.io.IOException;

import java.util.ArrayList;

public class LoaderTransformation {
    public LoaderTransformation() {
        super();
    }
    private String CustomerID = null;

    private String CustomerName = null;

    private String Entity = null;

    private String FusionVersion = null;

    private String InfovityVersion = null;

    private String TransMapping = null;

    private String FusionTemplFileLocation = null;

    private String FusionTemplFileName = null;

    private String InfovityTemplFileLocation = null;

    private String InfovityTemplFileName = null;

    private String TransFileLocation = null;

    private String TransFile = null;


    public void setCustomerID(String CustomerID) {
        this.CustomerID = CustomerID;
    }

    public String getCustomerID() {
        return CustomerID;
    }

    public void setCustomerName(String CustomerName) {
        this.CustomerName = CustomerName;
    }

    public String getCustomerName() {
        return CustomerName;
    }

    public void setEntity(String Entity) {
        this.Entity = Entity;
    }

    public String getEntity() {
        return Entity;
    }

    public void setFusionVersion(String FusionVersion) {
        this.FusionVersion = FusionVersion;
    }

    public String getFusionVersion() {
        return FusionVersion;
    }

    public void setInfovityVersion(String InfovityVersion) {
        this.InfovityVersion = InfovityVersion;
    }

    public String getInfovityVersion() {
        return InfovityVersion;
    }

    public void setTransMapping(String TransMapping) {
        this.TransMapping = TransMapping;
    }

    public String getTransMapping() {
        return TransMapping;
    }

    public void setFusionTemplFileLocation(String FusionTemplFileLocation) {
        this.FusionTemplFileLocation = FusionTemplFileLocation;
    }

    public String getFusionTemplFileLocation() {
        return FusionTemplFileLocation;
    }

    public void setFusionTemplFileName(String FusionTemplFileName) {
        this.FusionTemplFileName = FusionTemplFileName;
    }

    public String getFusionTemplFileName() {
        return FusionTemplFileName;
    }

    public void setInfovityTemplFileLocation(String InfovityTemplFileLocation) {
        this.InfovityTemplFileLocation = InfovityTemplFileLocation;
    }

    public String getInfovityTemplFileLocation() {
        return InfovityTemplFileLocation;
    }

    public void setInfovityTemplFileName(String InfovityTemplFileName) {
        this.InfovityTemplFileName = InfovityTemplFileName;
    }

    public String getInfovityTemplFileName() {
        return InfovityTemplFileName;
    }

    public void setTransFileLocation(String TransFileLocation) {
        this.TransFileLocation = TransFileLocation;
    }

    public String getTransFileLocation() {
        return TransFileLocation;
    }

    public void setTransFile(String TransFile) {
        this.TransFile = TransFile;
    }

    public String getTransFile() {
        return TransFile;
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
        sb.append("FusionTemplFileLocation=" +   getFusionTemplFileLocation()); 
        sb.append("FusionTemplFileName=" +      getFusionTemplFileName()); 
        sb.append("InfovityTemplFileLocation=" + getInfovityTemplFileLocation()); 
        sb.append("InfovityTemplFileName=" +    getInfovityTemplFileName()); 
        sb.append("TransFileLocation=" +        getTransFileLocation()); 
        sb.append("TransFile=" +                getTransFile()); 
        
        return sb.toString();
    }
}
