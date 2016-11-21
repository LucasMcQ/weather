import java.io.BufferedReader;
import java.io.FileReader;


public class Cleanup{
	
	public static void main(String[] args){
		
		String fileName = args[0];		

		String fileContents = openFile(fileName);
		
		String goodFileInfo = extractFileInfo(fileContents);
		
		printFile(goodFileInfo);

// 		This is to print the output all pretty.		
//		String finalOutput = getFinalOutput(goodFileInfo);
		
//		printFile(finalOutput);

	} // main


	public static String openFile(String fileName){

		String fileContent = "";		

		try{
			BufferedReader buff = new BufferedReader(new FileReader(fileName));
			String line;
			
			while((line = buff.readLine()) != null){
				fileContent = fileContent + line;
			}
			buff.close();
		} // try
		catch(Exception e){
			e.printStackTrace();
			return null;
		} // catch

		return fileContent;
	
	} // openFile


	public static String extractFileInfo(String fileContents){

		String goodFileInfo = "";
		boolean wasGoodInfo = false;
		for (int i = 0; i < fileContents.length(); i++){
			if(Character.isDigit((Character)fileContents.charAt(i)) ||
			   fileContents.charAt(i) == '.'){
				goodFileInfo = goodFileInfo + fileContents.charAt(i);
			} // if
			if(fileContents.charAt(i) == '.'){
				i++;
				goodFileInfo = goodFileInfo + fileContents.charAt(i);
				break;
			}	
		} // for

		return goodFileInfo;

	} // extractFileInfo


	public static String getFinalOutput(String finalTemp){

		String finalOutput = "";
		String boarder     = "###################################################################################################\n";
		String surround    = "#                                                                                                 #\n";
		String cityInfo    = "#                                             Carefree AZ                                         #\n";
		String currentTemp = "#                                      Current temperature is:                                    #\n";
		String temp        = "#                                                " + finalTemp + "                                            #\n";

		finalOutput = finalOutput + boarder + surround + cityInfo + surround + currentTemp + temp + surround + boarder;
				
		return finalOutput;
	
	} // getFinalOutput

	
	public static void printFile(String fileContent){

		System.out.println(fileContent);
	
	} // printFile
	

} // Cleanup
