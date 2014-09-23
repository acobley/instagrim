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
            String CreateTweetTable = "CREATE TABLE if not exists Pics ("
                    + "user varchar,"
                    + " interaction_time timeuuid,"
                    + " title varchar,"
                    + " image blob,"
                    + " imagelength int,"
                    + " type  varchar,"
                    + " name  varchar,"
                    + " PRIMARY KEY (user,interaction_time)"
                    + ") WITH CLUSTERING ORDER BY (interaction_time DESC);";
            Session session = c.connect();
            try {
                PreparedStatement statement = session
                        .prepare(createkeyspace);
                BoundStatement boundStatement = new BoundStatement(
                        statement);
                ResultSet rs = session
                        .execute(boundStatement);
                System.out.println("created instagrim " );
            } catch (Exception et) {
                System.out.println("Can't create instagrim " + et);
            }

            //now add some column families 
            session.close();
            session = c.connect("instagrim");
            System.out.println("" + CreateTweetTable);

            try {
                SimpleStatement cqlQuery = new SimpleStatement(CreateTweetTable);
                session.execute(cqlQuery);
            } catch (Exception et) {
                System.out.println("Can't create tweet table " + et);
            }
            session.close();

        } catch (Exception et) {
            System.out.println("Other keyspace or coulm definition error" + et);
        }

    }
}
