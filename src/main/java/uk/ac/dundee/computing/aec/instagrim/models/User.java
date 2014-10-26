/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package uk.ac.dundee.computing.aec.instagrim.models;

import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import uk.ac.dundee.computing.aec.instagrim.lib.AeSimpleSHA1;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
import uk.ac.dundee.computing.aec.instagrim.stores.UserProfile;
import java.util.UUID;

/**
 *
 * @author Administrator
 */
public class User {
    Cluster cluster;
    public User(){
        
    }
    
public boolean RegisterUser(String username, String Password, String firstName, String lastName, String email, String bio){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("insert into userprofiles (login,password,first_name,last_name,email,bio) Values(?,?,?,?,?,?)");
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute(boundStatement.bind(username,EncodedPassword,firstName,lastName,email,bio));
        
        session.close();
        return true;
    }
    
    public boolean updateUser(String username,String firstName, String lastName, String email, String bio){
       
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("update userprofiles set first_name =?, last_name = ?, email = ?, bio = ? where login = ?");
       
        BoundStatement boundStatement = new BoundStatement(ps);
        session.execute( 
                boundStatement.bind( 
                        firstName,lastName,email,bio,username));
        
        session.close();
        return true;
    }
    
    public boolean CheckExisting(String username)
    {
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare ("select login from userprofiles where login = ?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
         rs = session.execute(
                boundStatement.bind( 
                        username));
        session.close();
        if (rs.isExhausted()) {
            System.out.println("User not in database!");
            return true;
        } 
        else 
            {
                return false; 
            }
    
    }
    
    
    public java.util.LinkedList<UserProfile> getUserinfo(String user) {
        java.util.LinkedList<UserProfile> Userinfo = new java.util.LinkedList<>();
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select login, first_name, last_name, picid, email, bio from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        user));
        session.close();
        if (rs.isExhausted()) {
            System.out.println("No user found");
            return null;
        } else {
            for (Row row : rs) {
                UserProfile userprof = new UserProfile();
                String login = row.getString("login");
                String firstName = row.getString ("first_name");
                String lastName = row.getString ("last_name");
                String email = row.getString ("email");
                String bio = row.getString ("bio");
                UUID picid = row.getUUID ("picid");
                userprof.setLogin(login);
                userprof.setfName(firstName);
                userprof.setsName(lastName);
                userprof.setUUID (picid);
                userprof.setEmail(email);
                userprof.setBio(bio);
                Userinfo.push(userprof);
               }
        }
       
        return Userinfo;
    }
    
    public java.util.LinkedList<UserProfile> getUserNames() {
        java.util.LinkedList<UserProfile> Userinfo = new java.util.LinkedList<>();
        Session session = cluster.connect("instagrim");
        ResultSet rs = null;
        rs = session.execute("select login, picid from userprofiles");
        session.close();
        if (rs.isExhausted()) {
            System.out.println("No users found");
            return null;
        } else {
            for (Row row : rs) {
                UserProfile userprof = new UserProfile();
                String login = row.getString("login");
                UUID picid = row.getUUID("picid");
                userprof.setLogin(login);
                userprof.setUUID(picid);
                Userinfo.push(userprof);
               }
        }
        session.close();session.close();
        return Userinfo;
    }
    
    public boolean IsValidUser(String username, String Password){
        AeSimpleSHA1 sha1handler=  new AeSimpleSHA1();
        String EncodedPassword=null;
        try {
            EncodedPassword= sha1handler.SHA1(Password);
        }catch (UnsupportedEncodingException | NoSuchAlgorithmException et){
            System.out.println("Can't check your password");
            return false;
        }
        Session session = cluster.connect("instagrim");
        PreparedStatement ps = session.prepare("select password from userprofiles where login =?");
        ResultSet rs = null;
        BoundStatement boundStatement = new BoundStatement(ps);
        rs = session.execute( // this is where the query is executed
                boundStatement.bind( // here you are binding the 'boundStatement'
                        username));
        session.close();
        if (rs.isExhausted()) {
            System.out.println("No Images returned");
            
            return false;
        } else {
            for (Row row : rs) {
               
                String StoredPass = row.getString("password");
                if (StoredPass.compareTo(EncodedPassword) == 0)
                   
                    return true;
            }
        }
   
        
    session.close();
    return false;  
    }
       public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    
}