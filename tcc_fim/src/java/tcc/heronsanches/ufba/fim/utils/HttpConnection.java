package tcc.heronsanches.ufba.fim.utils;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.ProtocolException;
import java.net.URL;
import java.util.logging.Level;
import java.util.logging.Logger;


public class HttpConnection {
	
	public final static String METHOD_PUT = "PUT";
	public final static String METHOD_POST = "POST";
    public final static String METHOD_GET = "GET";
    public final static String WEBSERVER_GCM = "https://fcm.googleapis.com/fcm/send";
    
    /**Key server to use to send push notifications with FCM*/
	private final static String KEY_SERVER = "put here your key server";
	
    
	private HttpConnection(){ }
    
	
    /** * @param jsonParameter Json String post parameter
	 * @return <code>null</code> if HTTP response code was different than 200 or occurred a Exception<br>
	 * Otherwise it will return a Json String response.*/
	public static String makePostRequestGcm(String jsonParameter){

		HttpURLConnection httpUrlConnection = null;
		StringBuilder requestResult = null;
		boolean ok = true;

		try {

			URL urlObj = new URL(WEBSERVER_GCM);
			httpUrlConnection = (HttpURLConnection) urlObj.openConnection();

			//add request header
			httpUrlConnection.setRequestMethod(METHOD_POST);
			httpUrlConnection.setRequestProperty("Content-Type", "application/json");
			httpUrlConnection.setRequestProperty("Authorization", "key="+KEY_SERVER);

			//send post request
			httpUrlConnection.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(httpUrlConnection.getOutputStream());
			wr.writeBytes(jsonParameter);
			wr.flush();
			wr.close();

			if(httpUrlConnection.getResponseCode() == HttpURLConnection.HTTP_OK){

				BufferedReader br = new BufferedReader(new InputStreamReader(httpUrlConnection.getInputStream()));
				String line;
				requestResult = new StringBuilder();

				while( (line = br.readLine()) != null)
					requestResult.append(line);

				br.close();

			}else
				ok = false;

		}catch( Exception e) {

			ok = false;

		}finally{

			if(httpUrlConnection != null)
				httpUrlConnection.disconnect();

		}

		if(ok)
			return requestResult.toString();
		else
			return null;

	}

    
	/**@param request - the complete get request url
	 * @return <code>null</code> if HTTP response code was different than 200 or occurred a Exception<br>
	 * Otherwise it will return a Json String response.*/
	public static String makeGetRequest(String request){

		HttpURLConnection HttpURLConnection = null;
		StringBuilder requestResult = null;
		boolean ok = true;

		try {

			URL urlObj = new URL(request.replace(" ", "%20"));
			HttpURLConnection = (HttpURLConnection) urlObj.openConnection();

			if(HttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK){

				//reading stream
				requestResult = new StringBuilder();
				BufferedReader br = new BufferedReader(new InputStreamReader(HttpURLConnection.getInputStream()));
				String line;

				while( (line = br.readLine()) != null)
					requestResult.append(line);

				br.close();

			}else
				ok = false;

		} catch (IOException ex) {
            
            ok = false;
            Logger.getLogger(HttpConnection.class.getName()).log(Level.SEVERE, null, ex);
            
		}finally{

			if(HttpURLConnection != null)
				HttpURLConnection.disconnect();

		}

		if(ok)
			return requestResult.toString();
		else
			return null;

	}


	/**@param jsonParameter Json String post parameter
	 * @param url the resource's name into webserver
	 * @return <code>null</code> if HTTP response code was different than 200 or occurred a Exception<br>
	 * Otherwise it will return a Json String response.*/
	public static String makePostRequest(String url, String jsonParameter){

		HttpURLConnection HttpURLConnection = null;
		StringBuilder requestResult = null;
		boolean ok = true;

		try {

			URL urlObj = new URL(url);
			HttpURLConnection = (HttpURLConnection) urlObj.openConnection();

			//add request header
			HttpURLConnection.setRequestMethod(METHOD_POST);
			HttpURLConnection.setRequestProperty("Content-Type", "application/json");
			HttpURLConnection.setRequestProperty("Content-Length", String.valueOf(jsonParameter.length()));
			//send post request
			HttpURLConnection.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(HttpURLConnection.getOutputStream());
			wr.writeBytes(jsonParameter);
			wr.flush();
			wr.close();

			if(HttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK){

				BufferedReader br = new BufferedReader(new InputStreamReader(HttpURLConnection.getInputStream()));
				String line;
				requestResult = new StringBuilder();

				while( (line = br.readLine()) != null)
					requestResult.append(line);

				br.close();

			}else
				ok = false;

		} catch (MalformedURLException e) {
            
			Logger.getLogger(HttpURLConnection.class.getName()).log(Level.SEVERE, null, e);
			ok = false;

        } catch (ProtocolException e) {
            
			Logger.getLogger(HttpURLConnection.class.getName()).log(Level.SEVERE, null, e);
			ok = false;

        } catch (IOException e) {
            
			Logger.getLogger(HttpURLConnection.class.getName()).log(Level.SEVERE, null, e);
			ok = false;

        } finally{

			if(HttpURLConnection != null)
				HttpURLConnection.disconnect();

		}

        if(ok)
			return requestResult.toString();
		else
			return null;

	}


	public static String makePutRequest(String url, String jsonParameter){

		HttpURLConnection HttpURLConnection = null;
		StringBuilder requestResult = null;
		boolean ok = true;

		try {

			URL urlObj = new URL(url);
			HttpURLConnection = (HttpURLConnection) urlObj.openConnection();

			//add request header
			HttpURLConnection.setRequestMethod(METHOD_PUT);
			HttpURLConnection.setRequestProperty("Content-Type", "application/json");
			//HttpURLConnection.setRequestProperty("Content-Length", String.valueOf(jsonParameter.length()));

			//send post request
			HttpURLConnection.setDoOutput(true);

			DataOutputStream wr = new DataOutputStream(HttpURLConnection.getOutputStream());
			wr.writeBytes(jsonParameter);
			wr.flush();
			wr.close();

			if(HttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK){

				BufferedReader br = new BufferedReader(new InputStreamReader(HttpURLConnection.getInputStream()));
				String line;
				requestResult = new StringBuilder();

				while( (line = br.readLine()) != null)
					requestResult.append(line);

				br.close();

			}else
				ok = false;

		} catch (IOException ex) {
            
            ok = false;
            Logger.getLogger(HttpConnection.class.getName()).log(Level.SEVERE, null, ex);
		
        }finally{

			if(HttpURLConnection != null)
				HttpURLConnection.disconnect();

		}

		if(ok)
			return requestResult.toString();
		else
			return null;

	}
    
    
    public static String makePutRequest(String url){

		HttpURLConnection HttpURLConnection = null;
		StringBuilder requestResult = null;
		boolean ok = true;

		try {

			URL urlObj = new URL(url);
			HttpURLConnection = (HttpURLConnection) urlObj.openConnection();

			//add request header
			HttpURLConnection.setRequestMethod(METHOD_PUT);
			HttpURLConnection.setRequestProperty("Content-Type", "application/json");
			//HttpURLConnection.setRequestProperty("Content-Length", String.valueOf(jsonParameter.length()));

			if(HttpURLConnection.getResponseCode() == HttpURLConnection.HTTP_OK){

				BufferedReader br = new BufferedReader(new InputStreamReader(HttpURLConnection.getInputStream()));
				String line;
				requestResult = new StringBuilder();

				while( (line = br.readLine()) != null)
					requestResult.append(line);

				br.close();

			}else
				ok = false;

		} catch (IOException ex) {
            
            ok = false;
            Logger.getLogger(HttpConnection.class.getName()).log(Level.SEVERE, null, ex);
		
        }finally{

			if(HttpURLConnection != null)
				HttpURLConnection.disconnect();

		}

		if(ok)
			return requestResult.toString();
		else
			return null;

	}


}