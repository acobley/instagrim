package uk.ac.dundee.computing.aec.instagrim.lib;

import java.util.ArrayList;
import java.util.List;

import com.datastax.driver.core.*;

public final class Keyspaces {

    public Keyspaces() {

    }

    public static void SetUpKeySpaces(Cluster c) {
        try {
            //Add some keyspaces here
            String createkeyspace = "create keyspace if not exists instagrim  WITH replication = {'class':'SimpleStrategy', 'replication_factor':1}";
            String CreatePicTable = "CREATE TABLE if not exists instagrim.Pics ("
                    + " user varchar,"
                    + " picid uuid, "
                    + " interaction_time timestamp,"
                    + " title varchar,"
                    + " image blob,"
                    + " thumb blob,"
                    + " processed blob,"
                    + " imagelength int,"
                    + " thumblength int,"
                    + "  processedlength int,"
                    + " type  varchar,"
                    + " name  varchar,"
                    + " PRIMARY KEY (picid)"
                    + ")";
            String Createuserpiclist = "CREATE TABLE if not exists instagrim.userpiclist (\n"
                    + "picid uuid,\n"
                    + "user varchar,\n"
                    + "pic_added timestamp,\n"
                    + "PRIMARY KEY (user,pic_added)\n"
                    + ") WITH CLUSTERING ORDER BY (pic_added desc);";
            /*String CreateAddressType = "CREATE TYPE if not exists instagrim.address (\n"
                    + "      street text,\n"
                    + "      city text,\n"
                    + "      zip int\n"
                    + "  );";
             */       
            String CreateUserProfile = "CREATE TABLE if not exists instagrim.userprofiles (\n"
                    + "      login text PRIMARY KEY,\n"
                    + "      password text,\n"
                    + "      firstname text,\n"
                    + "      lastname text,\n"
                    + "      email text,\n"
                    + "      addresses  map<text, frozen <address>>\n"
                    + "  );";
            String CreateComment = "CREATE TABLE if not exists instagrim.comments (\n)"
                    +"       login text PRIMARY KEY,\n"
                    +"       comment text,\n"
                    +"   );";
            Session session = c.connect();
            try {
                PreparedStatement statement = session
                        .prepare(createkeyspace);
                BoundStatement boundStatement = new BoundStatement(
                        statement);
                ResultSet rs = session
                        .execute(boundStatement);
                System.out.println("created instagrim ");
            } catch (Exception et) {
                System.out.println("Can't create instagrim " + et);
            }

            //now add some column families 
            System.out.println("" + CreatePicTable);

            try {
                //SimpleStatement cqlQuery1 = new SimpleStatement("DROP TABLE instagrim.CreatePicTable;");
                //session.execute(cqlQuery1);
                SimpleStatement cqlQuery = new SimpleStatement(CreatePicTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create tweet table " + et);
            }
            System.out.println("" + Createuserpiclist);

            try {
                //SimpleStatement cqlQuery1 = new SimpleStatement("DROP TABLE instagrim.Createuserpiclist;");
                //session.execute(cqlQuery1);
                SimpleStatement cqlQuery = new SimpleStatement(Createuserpiclist);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create user pic list table " + et);
            }
            /*System.out.println("" + CreateAddressType);
            try {
                //SimpleStatement cqlQuery1 = new SimpleStatement("DROP TABLE instagrim.CreateAddressType;");
                //session.execute(cqlQuery1);
                SimpleStatement cqlQuery = new SimpleStatement(CreateAddressType);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create Address type " + et);
            }*/
            System.out.println("" + CreateComment);
            try {
                //SimpleStatement cqlQuery1 = new SimpleStatement("DROP TABLE instagrim.CreateComment;");
                //session.execute(cqlQuery1);
                SimpleStatement cqlQuery = new SimpleStatement(CreateComment);
                session.execute(cqlQuery);
            } catch (Exception et)
                    {
                        System.out.println("Can't add comment " + et);
                    }
            System.out.println("" + CreateUserProfile);
            try {
                //SimpleStatement cqlQuery1 = new SimpleStatement("DROP TABLE instagrim.userprofiles;");
                //session.execute(cqlQuery1);
                SimpleStatement cqlQuery = new SimpleStatement(CreateUserProfile);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create Address Profile " + et);
            }
            session.close();

        } catch (Exception et) {
            System.out.println("Other keyspace or coulm definition error" + et);
        }

    }
}
