package com.bg.www;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
/**
 * Servlet implementation class NaverSearchRegionServlet
 */
@WebServlet("/NaverSearchRegionServlet")
public class NaverSearchRegionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		   	String clientId = "g1Z3xn_406vEi9lDoZhd";//애플리케이션 클라이언트 아이디값";
	        String clientSecret = "8nfaHgDS5b";//애플리케이션 클라이언트 시크릿값";
	        try {
//	            String text = URLEncoder.encode((String)request.getParameter("stadium"), "UTF-8");
	            String text = URLEncoder.encode("동국대학교 대운동장", "UTF-8");
	            String apiURL = "https://openapi.naver.com/v1/search/local.json";
	            URL url = new URL(apiURL);
	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("GET");
	            con.setRequestProperty("X-Naver-Client-Id", clientId);
	            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
	            // post request
	            String postParams = "source=ko&target=ko&query=" + text;
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.writeBytes(postParams);
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();
	            BufferedReader br;
	            if(responseCode==200) { // 정상 호출
	                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
	            } else {  // 에러 발생
	                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
	            }
	            String inputLine;
	            StringBuffer response1 = new StringBuffer();
	            while ((inputLine = br.readLine()) != null) {
	                response1.append(inputLine);
	            }
	            br.close();
	            System.out.println(response1.toString());
	        } catch (Exception e) {
	            System.out.println(e);
	        }
	}

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String clientId = "AdeeIjS2ZNeYfPL7cOy5";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "QWYwQhKE08";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode((String)request.getParameter("stadium"), "UTF-8");
//            String text = URLEncoder.encode("동국대학교", "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/local.json?query=" + text + "&display=5";
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
//            String postParams = "query=" + text;
            con.setDoOutput(true);
//            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
//            wr.writeBytes(postParams);
//            wr.flush();
//            wr.close();
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response1 = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response1.append(inputLine);
            }
            br.close();
            System.out.println(response1.toString());
			response.getWriter().write(response1.toString());
        } catch (Exception e) {
            System.out.println(e);
        }
	}
	
}
