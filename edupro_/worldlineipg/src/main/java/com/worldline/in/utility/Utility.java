package com.worldline.in.utility;

import android.app.Dialog;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ApplicationInfo;
import android.content.pm.PackageManager;
import android.content.res.AssetManager;
import android.graphics.drawable.ColorDrawable;
import android.os.Bundle;

import com.worldline.in.ipg.R;

import java.io.IOException;
import java.io.InputStream;
import java.lang.ref.WeakReference;
import java.util.Properties;

/**
 * Created by sunny.birman on 19-09-2017.
 */

public class Utility {

    public static String getProperty(String key, Context context) throws IOException {
        Properties properties = new Properties();

        AssetManager assetManager = context.getAssets();
        InputStream inputStream = assetManager.open("AWLMerchantKit.properties");
        properties.load(inputStream);
        return properties.getProperty(key);
    }


    public static String getMerchantDetails(String key, Context context) throws PackageManager.NameNotFoundException {

        ApplicationInfo ai = context.getPackageManager().getApplicationInfo(context.getPackageName(), PackageManager.GET_META_DATA);
        Bundle bundle = ai.metaData;
        return bundle.getString(key);

    }


    public static Dialog getProgressDialog(WeakReference<Context> context)
    {
        Dialog dialog = new Dialog(context.get());
        dialog.setContentView(R.layout.progress_bar_layout);
        dialog.setTitle("Please wait");
        dialog.getWindow().setBackgroundDrawable(new ColorDrawable(android.graphics.Color.TRANSPARENT));
        dialog.setCancelable(false);
        return dialog;
    }

    public static void finishPayment(Context context)
    {
        Intent local = new Intent();
        local.setAction(context.getString(com.worldline.in.ipg.R.string.broadcast_action_name));
        context.sendBroadcast(local);
    }
}
