package ufba.heronsanches.tcc.gcm;

import android.content.Intent;
import android.content.SharedPreferences;
import android.support.v7.app.AppCompatActivity;

import com.google.firebase.iid.FirebaseInstanceIdService;

import ufba.heronsanches.tcc.SharedPreferencesConstants;


public class ListenerIDService extends FirebaseInstanceIdService {
	
	
	@Override
	public void onTokenRefresh() {

		SharedPreferences sp_ = getSharedPreferences(SharedPreferencesConstants.GCM_SHARED_PREFERENCES, AppCompatActivity.MODE_PRIVATE);
		sp_.edit().putBoolean(SharedPreferencesConstants.GCM_TOKEN_REGISTERED, false).commit();
		startService(new Intent(this, RegistrationIntentService.class));

	}


}