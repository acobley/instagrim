package uk.ac.dundee.computing.aec.instagrim.servlets;

import com.datastax.driver.core.Cluster;
import java.io.BufferedInputStream;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import org.apache.commons.fileupload.FileItemIterator;
import org.apache.commons.fileupload.FileItemStream;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.util.Streams;
import uk.ac.dundee.computing.aec.instagrim.lib.CassandraHosts;
import uk.ac.dundee.computing.aec.instagrim.models.TweetModel;

/**
 * Servlet implementation class Image
 */
@WebServlet("/Image")
@MultipartConfig

public class Image extends HttpServlet {
    
    private static final long serialVersionUID = 1L;
    private Cluster cluster;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public Image() {
        super();
        // TODO Auto-generated constructor stub

    }
    
    public void init(ServletConfig config) throws ServletException {
        // TODO Auto-generated method stub
        cluster = CassandraHosts.getCluster();
    }

    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
     * response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        TweetModel tm = new TweetModel();
        tm.setCluster(cluster);
        byte Image[] = tm.getPic();
        System.out.println("Image Size " + Image.length);
        
        OutputStream out = response.getOutputStream();
        
        response.setContentType("image/png");
        response.setContentLength(Image.length);
        //out.write(Image);
        InputStream is = new ByteArrayInputStream(Image);
        BufferedInputStream input = new BufferedInputStream(is);
        byte[] buffer = new byte[8192];
        for (int length = 0; (length = input.read(buffer)) > 0;) {
            out.write(buffer, 0, length);
        }
        out.close();
        
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        for (Part part : request.getParts()) {
	      System.out.println(part.getName());
	      InputStream is = request.getPart(part.getName()).getInputStream();
	      int i = is.available();
	      byte[] b  = new byte[i + 1];
	      is.read(b);
	      System.out.println("Length : " + b.length);
              TweetModel tm = new TweetModel();
              tm.setCluster(cluster);
              tm.insertPic(b); 

	      is.close();
	    }
        
       
    }
}
