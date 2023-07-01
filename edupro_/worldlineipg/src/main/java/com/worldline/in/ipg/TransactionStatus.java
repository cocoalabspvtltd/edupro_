package com.worldline.in.ipg;

import android.app.Dialog;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.util.Log;

import com.awl.merchanttoolkit.builder.StatusReqDTO;
import com.awl.merchanttoolkit.dto.ResMsgDTO;
import com.awl.merchanttoolkit.transaction.AWLMEAPI;
import com.worldline.in.callback.ResultListener;
import com.worldline.in.utility.Utility;

import java.io.IOException;
import java.lang.ref.WeakReference;

/**
 * Created by sunny.birman on 21-09-2017.
 */

public class TransactionStatus extends AsyncTask<String, Void, ResMsgDTO> {

    private final WeakReference<Context> context;
    private final ResultListener resultListener;
    private Dialog dialog;
    private final String TAG = getClass().getSimpleName();

    public TransactionStatus(Context context, ResultListener activity) {

        this.context = new WeakReference<>(context);
        this.resultListener = activity;

    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        dialog = Utility.getProgressDialog(context);
        dialog.show();
    }

    @Override
    protected ResMsgDTO doInBackground(String... strings) {

        ResMsgDTO resMsgDTO = null;

        if (null != strings && 1 <= strings.length) {
            AWLMEAPI awlmeapi = new AWLMEAPI();

            /*Order id is optional*/
            String orderId = strings[0];
            String pgMeTrn;
            try{
                pgMeTrn = strings[1];
            }
            catch(ArrayIndexOutOfBoundsException e)
            {
                pgMeTrn = "";
            }

            String encryptionKey = null;
            String mid;
            String url;
            try {
                // If encryption_key and mid passed at runtime
                if(2<strings.length)
                {
                    try{
                    encryptionKey=strings[2];
                    mid=strings[3];

                }catch (ArrayIndexOutOfBoundsException ex)
                    {
                        Log.e(TAG, context.get().getString(R.string.error_missing_param));
                        return null;
                    }
                }
                else
                {
                    encryptionKey = Utility.getMerchantDetails(context.get().getString(R.string.key), context.get());
                    mid = Utility.getMerchantDetails(context.get().getString(R.string.mid), context.get());
                }

                url = Utility.getProperty(context.get().getString(R.string.ipg_transaction_status), context.get());

            } catch (PackageManager.NameNotFoundException e) {
                if (encryptionKey == null) {
                    Log.e(TAG, context.get().getString(R.string.error_encryption_key_not_found));
                } else {
                    Log.e(TAG, context.get().getString(R.string.error_mid_not_found));
                }

                return null;
            } catch (IOException e) {
                Log.e(TAG, context.get().getString(R.string.error_missing_url));
                e.printStackTrace();

                return null;
            }


            StatusReqDTO reqDTO =
                    StatusReqDTO.builder()
                            .mid(mid)
                            .encKey(encryptionKey)
                            .orderId(orderId)
                            .url(url)
                            .pgMeTrnRefNo(pgMeTrn)
                            .build();


            try {
                resMsgDTO = awlmeapi.getTransactionStatus(reqDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            Log.e(TAG, context.get().getString(R.string.error_missing_param));
        }

        return resMsgDTO;
    }

    @Override
    protected void onPostExecute(ResMsgDTO result) {
        super.onPostExecute(result);
        dialog.dismiss();
        resultListener.onResult(result);

    }
}
