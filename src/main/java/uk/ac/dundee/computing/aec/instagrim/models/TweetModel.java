package uk.ac.dundee.computing.aec.instagrim.models;

/*
 * Expects a cassandra columnfamily defined as
 * use keyspace2;
 CREATE TABLE Tweets (
 user varchar,
 interaction_time timeuuid,
 tweet varchar,
 PRIMARY KEY (user,interaction_time)
 ) WITH CLUSTERING ORDER BY (interaction_time DESC);
 * To manually generate a UUID use:
 * http://www.famkruithof.net/uuid/uuidgen
 */
import com.datastax.driver.core.BoundStatement;
import com.datastax.driver.core.Cluster;
import com.datastax.driver.core.PreparedStatement;
import com.datastax.driver.core.ResultSet;
import com.datastax.driver.core.Row;
import com.datastax.driver.core.Session;
import com.datastax.driver.core.utils.Bytes;
import java.io.FileInputStream;
import java.io.InputStream;
import java.nio.ByteBuffer;
import java.util.LinkedList;

import uk.ac.dundee.computing.aec.instagrim.lib.*;
import uk.ac.dundee.computing.aec.instagrim.stores.Pic;
//import uk.ac.dundee.computing.aec.stores.TweetStore;

public class TweetModel {

    Cluster cluster;

    public TweetModel() {

    }

    public void setCluster(Cluster cluster) {
        this.cluster = cluster;
    }

    public void insertPic(byte[] b, String type, String name) {
        try {
            Convertors convertor = new Convertors();
		//FileInputStream fis=new FileInputStream("/Users/Administrator/Desktop/mystery.png");
        /*
             byte[] b= new byte[fis.available()+1];
             int length=b.length;
             System.out.println("length "+b.length);
             fis.read(b);
             */
            ByteBuffer buffer = ByteBuffer.wrap(b);
            int length = b.length;
            Session session = cluster.connect("instagrim");

            PreparedStatement ps = session.prepare("insert into pics ( image, user, interaction_time,imagelength,type,name) values(?,?,?,?,?,?)");
            BoundStatement boundStatement = new BoundStatement(ps);
            session.execute(boundStatement.bind(buffer, "majed", convertor.getTimeUUID(), length, type, name));

            session.close();
        } catch (Exception ex) {
            System.out.println("Error --> " + ex);
        }
    }

    public Pic getPic() {
        try {
            Convertors convertor = new Convertors();

            Session session = cluster.connect("instagrim");

            PreparedStatement ps = session.prepare("select user,image,imagelength,type from pics where user =?");
            BoundStatement boundStatement = new BoundStatement(ps);
            ResultSet rs = session.execute( // this is where the query is executed
                    boundStatement.bind( // here you are binding the 'boundStatement'
                            "majed"));

            ByteBuffer bImage = null;
            String type = null;
            int length = 0;
            if (rs.isExhausted()) {
                System.out.println("No Images returned");
                return null;
            } else {
                for (Row row : rs) {
                    bImage = row.getBytes("image");
                    length = row.getInt("imagelength");
                    type = row.getString("type");

                }
            }
            session.close();
            Pic p = new Pic();
            p.setPic(bImage, length,type);

            return p;

        } catch (Exception ex) {
            System.out.println("Get Pic Error --> " + ex);
        }
        return null;
    }
}
