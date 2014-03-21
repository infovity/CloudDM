package com.infovity.clouddm.view;

import com.infovity.clouddm.model.Loader;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class DataMigratorBean {
    public DataMigratorBean() {
    }
    
    private String loaderId;
    
    private Map<String, ArrayList> loadersMap; 
    
    public Object[] getProductFamilies() {
        return getLoadersMap().entrySet().toArray();
    }    
   
   /* 
    public List<Loader> getLoadersByProductFamily(String productFamily) {
        return prepareLoadersByProductFamily().get(productFamily);
    }

   */
    public void setLoadersMap(Map<String, ArrayList> loadersMap) {
        this.loadersMap = loadersMap;
    }

    public Map<String, ArrayList> getLoadersMap() {
        System.out.println("Inside get loaders");
        
       if (loadersMap == null) {
            loadersMap = prepareLoadersByProductFamily();
            System.out.println("Prepared loaders");

       }
        return loadersMap;
    }
    
    public Map<String, ArrayList> prepareLoadersByProductFamily() {
        ArrayList <Loader> allLoaders = Loader.getAllLoaders();
        Map<String, ArrayList> loadersByFamily = new HashMap<String, ArrayList> ();
        
        for(Loader selectedLoader : allLoaders) {
            ArrayList loaderList = loadersByFamily.get(selectedLoader.getProductFamily());
            
            if (loaderList == null) {
                loaderList = new ArrayList ();
                loadersByFamily.put(selectedLoader.getProductFamily(), loaderList);
            }
            
            loaderList.add(selectedLoader);
            
            //System.out.println(s);
        }
         
        return loadersByFamily;
    }
}
