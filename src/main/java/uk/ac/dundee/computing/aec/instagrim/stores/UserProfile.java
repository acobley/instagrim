/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uk.ac.dundee.computing.aec.instagrim.stores;
import java.util.UUID;
/**
 *
 * @author Shaun Smith
 */
public class UserProfile {
    String login = null;
    String fName = null;
    String sName = null;
    private UUID profPic=null;
    
    public void UserProfile(){
        
    }

    public void setUUID(UUID profpic){
        this.profPic = profpic;
    }
    public UUID getUUID(){
        return profPic;
    }
    
     public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getsName() {
        return sName;
    }

    public void setsName(String sName) {
        this.sName = sName;
    }
    
}


