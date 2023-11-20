package controller;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Random;
import java.util.logging.SimpleFormatter;

import jakarta.servlet.http.Part;

public class Feature {
	public String getFileName(Part part){
        String content = part.getHeader("content-disposition");
        if(!content.contains("filename=")){
            return null;
        }
        int beginIndex = content.indexOf("filename=") + 10;
        int endIndex = content.length()-1;
        return content.substring(beginIndex, endIndex);
    }
}
