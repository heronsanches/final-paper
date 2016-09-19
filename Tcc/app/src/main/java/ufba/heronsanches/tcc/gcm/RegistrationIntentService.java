package ufba.heronsanches.tcc.gcm;

import android.app.IntentService;
import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;
import android.util.Log;

import com.google.firebase.iid.FirebaseInstanceId;

import org.json.JSONException;
import org.json.JSONObject;

import ufba.heronsanches.tcc.HttpConnection;
import ufba.heronsanches.tcc.SharedPreferencesConstants;


public class RegistrationIntentService extends IntentService {

	private String token;
    private final int idClient = 1;
	
	
	public RegistrationIntentService() {
		super("RegIntentService");
	}
	

	@Override
	protected void onHandleIntent(Intent intent) {
		
		try {
            Log.d("ffnet", "RegistrationIntentService: onHandleIntent");

			token = FirebaseInstanceId.getInstance().getToken();

			JSONObject jo = new JSONObject();
			jo.put("id_client", idClient);
			jo.put("txt_fcm_token", token);

			String result = HttpConnection.makePutRequest(HttpConnection.WEBSERVER_ADDRESS_FIM+"system/client-fcm-update-token", jo.toString());

			if(result != null){

				try {

					jo = new JSONObject(result);

					if(jo.getInt("status") == 4){

						SharedPreferences sp_ = getSharedPreferences(SharedPreferencesConstants.GCM_SHARED_PREFERENCES, AppCompatActivity.MODE_PRIVATE);
						sp_.edit().putBoolean(SharedPreferencesConstants.GCM_TOKEN_REGISTERED, true).commit();

					}

				} catch (JSONException e) {
					Log.d("ffnet", "RegistrationIntentService: JSONException onHandleIntent makePutRequest result treatment"+e);
				}

			}
						
		} catch (Exception e) {
			Log.d("ffnet", "RegistrationIntentService Exception on getToken from GCM: "+e);
		}
		
	}
	

}