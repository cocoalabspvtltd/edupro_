package com.worldline.in.ipg;

import android.app.Dialog;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.AsyncTask;
import android.util.Log;

import com.awl.merchanttoolkit.builder.RefundReqDTO;
import com.awl.merchanttoolkit.dto.ResMsgDTO;
import com.awl.merchanttoolkit.transaction.AWLMEAPI;
import com.worldline.in.callback.ResultListener;
import com.worldline.in.utility.Utility;

import java.io.IOException;
import java.lang.ref.WeakReference;

/**
 * Created by sunny.birman on 26-09-2017.
 */

public class RefundTransaction extends AsyncTask<String, Void, ResMsgDTO> {

    private final WeakReference<Context> context_wkRef;
    private final ResultListener resultListener;
    private Dialog dialog;
    private final String TAG = getClass().getSimpleName();

    public RefundTransaction(Context context, ResultListener activity) {

        this.context_wkRef = new WeakReference<>(context);
        this.resultListener = activity;

    }

    @Override
    protected void onPreExecute() {
        super.onPreExecute();
        dialog = Utility.getProgressDialog(context_wkRef);
        dialog.show();
    }
    @Override
    protected ResMsgDTO doInBackground(String... strings) {

        ResMsgDTO resMsgDTO = null;
        Context context = context_wkRef.get();

        if (null != strings && 3 <= strings.length) {
            AWLMEAPI awlmeapi = new AWLMEAPI();

            String orderId = strings[0];
            String pgMeTrn = strings[1];
            String amount = strings[2];
            String encryptionKey = null;
            String mid;
            String url;
            try {
                // If encryption_key and mid passed at runtime
                if(3<strings.length)
                {
                    try {
                        encryptionKey = strings[2];
                        mid = strings[3];
                    }catch (ArrayIndexOutOfBoundsException e)
                    {
                        Log.e(TAG, context.getString(R.string.error_missing_param));
                        return null;
                    }
                }
                else
                {
                    encryptionKey = Utility.getMerchantDetails(context.getString(R.string.key), context);
                    mid = Utility.getMerchantDetails(context.getString(R.string.mid), context);
                }

                url = Utility.getProperty(context.getString(R.string.ipg_transaction_refund), context);

            } catch (PackageManager.NameNotFoundException e) {
                if (encryptionKey == null) {
                    Log.e(TAG, context.getString(R.string.error_encryption_key_not_found));
                } else {
                    Log.e(TAG, context.getString(R.string.error_mid_not_found));
                }

                return null;
            } catch (IOException e) {
                Log.e(TAG, context.getString(R.string.error_missing_url));
                e.printStackTrace();

                return null;
            }


            RefundReqDTO refundReqDTO =
                    RefundReqDTO.builder()
                            .mid(mid)
                            .encKey(encryptionKey)
                            .orderId(orderId)
                            .pgMeTrnRefNo(pgMeTrn)
                            .url(url)
                            .amount(Long.valueOf(amount))
                            .build();

            try {
                resMsgDTO = awlmeapi.refundTransaction(refundReqDTO);
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            Log.e(TAG, context.getString(R.string.error_missing_param));
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
