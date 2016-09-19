package ufba.heronsanches.tcc.gcm;

import android.app.NotificationManager;
import android.app.PendingIntent;
import android.content.Context;
import android.content.Intent;

import android.support.v4.content.LocalBroadcastManager;
import android.support.v7.app.NotificationCompat;
import android.util.Log;

import com.google.firebase.messaging.FirebaseMessagingService;
import com.google.firebase.messaging.RemoteMessage;

import ufba.heronsanches.tcc.MainActivity;
import ufba.heronsanches.tcc.R;


public class ListenerGCMService extends FirebaseMessagingService {
	
	private NotificationManager notificationManager;
	private int idNotification = 0;
	private PendingIntent resultPendingIntent;


    @Override
    public void onMessageReceived(RemoteMessage rm) {

        Log.d("ffnet", "onMessageReceived: " + rm.toString());
        idNotification++;
        notificationManager = (NotificationManager) getSystemService(Context.NOTIFICATION_SERVICE);

        Intent resultIntent = new Intent(getApplicationContext(), MainActivity.class)
                .putExtra("message", rm.getData().get("message"))
                .addFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
                .addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

        resultPendingIntent = PendingIntent.getActivity(getApplicationContext(), idNotification, resultIntent, PendingIntent.FLAG_ONE_SHOT);
        NotificationCompat.Builder nb = new NotificationCompat.Builder(getApplicationContext());
        nb.setSmallIcon(R.drawable.ic_notification);
        nb.setContentTitle(rm.getData().get("service"));
        nb.setContentText(rm.getData().get("message"));
        nb.setDefaults(NotificationCompat.DEFAULT_ALL);
        nb.setContentIntent(resultPendingIntent);
        nb.setAutoCancel(true);
        notificationManager.notify(idNotification, nb.build());
        LocalBroadcastManager.getInstance(getApplicationContext()).sendBroadcast(new Intent(getApplicationContext().getPackageName()+"INTENT_NOTIFICATION_ANSWER").putExtra("message", rm.getData().get("message")));

    }

	
}