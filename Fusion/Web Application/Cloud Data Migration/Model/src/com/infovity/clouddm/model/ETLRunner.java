package com.infovity.clouddm.model;

import org.jetel.main.runGraph;


public class ETLRunner {
    public ETLRunner() {
        super();
    }
    
    public static void main(String args[])  {
       
       // Program parameters:
  
        //-v	be verbose - print even graph layout
        //-P:properyName=propertyValue	add definition of property to global graph's property list
        //-cfg filename	load definitions of properties from specified file
        //-logcfg filename	load log4j properties from specified file; if not specified, \"log4j.properties\" should be in classpath
        //-loglevel ALL | TRACE | DEBUG | INFO | WARN | ERROR | FATAL | OFF	overrides log4j configuration and sets specified logging level for rootLogger
        //-tracking seconds	how frequently output the processing status
        //-info	print info about Clover library version
        //-plugins filename	directory where to look for plugins/components
        //-pass password	password for decrypting of hidden connections passwords
        //-stdin	load graph layout from STDIN
        //-loghost	define host and port number for socket appender of log4j (log4j library is required); i.e. localhost:4445
        //-skipcheckconfig	skip checking of graph configuration
        //-noJMX	this switch turns off sending graph tracking information; this switch is recommended if the tracking information are not necessary
        //-config filename	load default engine properties from specified file
        //-nodebug	turns off all runtime debugging e.g edge debugging
        //-debugdirectory foldername	directory dedicated to store temporary debug data; default is java's temporary folder
        //-contexturl foldername	all relative paths in graph xml are relative to this folder
        //filename	filename or URL of the file (even remote) containing graph's layout in XML (this must be the last parameter passed)

      String projectDir = "P:PROJECT_DIR=C:\\Anto\\Infovity\\ProjectMgmt\\CloudMigration\\source1\\Fusion\\ETL\\Customers\\Common\\HCM\\WorkStructuresMigration\\WorkStructure_IFTY_V1_FUSN_R7";

        String verbose = "v123";

        String pluginDir = "C:\\Anto\\Infovity\\ProjectMgmt\\CloudMigration\\source1\\Fusion\\Web Application\\Cloud Data Migration\\Model\\lib\\cloverETL\\plugins";
        
        String contexturl = "C:\\Anto\\Infovity\\ProjectMgmt\\CloudMigration\\source1\\Fusion\\ETL\\Customers\\Common\\HCM\\WorkStructuresMigration\\WorkStructure_IFTY_V1_FUSN_R7";
        String graphName = "graph\\COMN_JobMigration.grf";
      //  runGraph.PLUGINS_SWITCH = pluginsDir
        String [] arguments = new String [] {runGraph.PLUGINS_SWITCH, pluginDir, runGraph.CONTEXT_URL_SWITCH, contexturl, graphName};
       runGraph.main(arguments);
       
    }
}
