/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.sql.Timestamp;
import sun.util.calendar.BaseCalendar;



/**
 *
 * @author Eslam
 */
public class Post {
    public int ID;
    public String PostTitle;
    public String PostContent;
    public String PostDescription;
    public String PostImage;
    public Timestamp PublishDate;
    public String PostAuthor;
    public boolean IsVisiable=true;
    public boolean AllowComments=true;
    public int CatID;
    
    
}
