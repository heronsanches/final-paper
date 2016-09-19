package ufba.heronsanches.tcc;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.SharedPreferences;
import android.os.AsyncTask;
import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.EditText;
import android.widget.ImageButton;
import android.widget.TextView;

import org.json.JSONException;
import org.json.JSONObject;

import ufba.heronsanches.tcc.gcm.RegistrationIntentService;

public class MainActivity extends AppCompatActivity {

    private TextView tv_message;
    private EditText et_idBasket;
    private SharedPreferences sp;
    private BroadcastReceiver br = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent i) {
            tv_message.setText(i.getStringExtra("message"));
        }

    };


    @Override
    protected void onCreate(Bundle savedInstanceState) {

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
        tv_message = (TextView)findViewById(R.id.tv_message);
        et_idBasket = (EditText)findViewById(R.id.et_idBasket);
        sp = getSharedPreferences(SharedPreferencesConstants.GCM_SHARED_PREFERENCES, AppCompatActivity.MODE_PRIVATE);
        String msg = getIntent().getStringExtra("message");

        if(msg != null)
            tv_message.setText(msg);

        ((ImageButton)findViewById(R.id.ib_take_freight)).setOnClickListener(new View.OnClickListener() {

            @Override
            public void onClick(View view) {
                tv_message.setText("...");
                Log.d("tcc", "id: "+et_idBasket.getText().toString().trim());
                new TakeFreightAsyncTask().execute(et_idBasket.getText().toString().trim());
            }

        });

        if(!sp.getBoolean(SharedPreferencesConstants.GCM_TOKEN_REGISTERED, false))
            startService(new Intent(this, RegistrationIntentService.class)); //it starts service to get a token and register it on our database


    }


    @Override
    protected void onResume() {

        super.onResume();
        LocalBroadcastManager.getInstance(this).registerReceiver(br, new IntentFilter(getApplicationContext().getPackageName()+"INTENT_NOTIFICATION_ANSWER"));

    }


    @Override
    protected void onPause() {

        LocalBroadcastManager.getInstance(this).unregisterReceiver(br);
        super.onPause();

    }


    private class TakeFreightAsyncTask extends AsyncTask<String, Void, String>{


        @Override
        protected String doInBackground(String... params) {

            try {
                Log.d("tcc", "params[0]: "+params[0]);
                return HttpConnection.makePutRequest(HttpConnection.WEBSERVER_ADDRESS_FIM+"system/take-freight", (new JSONObject().put("id_basket", Long.valueOf(params[0]))).toString());
            } catch (JSONException e) {
                //TODO
            } catch (NumberFormatException e){
                //TODO
            }

            return null;

        }


        @Override
        protected void onPostExecute(String result) {

            if(result != null){

                try {

                    JSONObject jo = new JSONObject(result);
                    tv_message.setText(jo.getJSONObject("message").getString("message"));

                } catch (JSONException e) {
                    //TODO
                }

            }

        }


    }


}