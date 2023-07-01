package com.worldline.in.ipg;

import android.annotation.SuppressLint;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.net.http.SslError;
import android.os.Build;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.webkit.CookieManager;
import android.webkit.SslErrorHandler;
import android.webkit.ValueCallback;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ProgressBar;

import android.widget.Toast;

import androidx.annotation.RequiresApi;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import com.awl.merchanttoolkit.dto.ReqMsgDTO;
import com.awl.merchanttoolkit.transaction.AWLMEAPI;
import com.worldline.in.constant.Param;
import com.worldline.in.utility.Utility;

import java.io.IOException;

public class PaymentCardCapture extends AppCompatActivity {

    private final String Tag = getClass().getSimpleName();
    private String encryptionKey;
    private String mid;
    private WebView webView;
    private FrameLayout webViewContainer;

    private BroadcastReceiver receiver = new BroadcastReceiver() {

        @Override
        public void onReceive(Context context, Intent intent) {
            finish();
        }
    };

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.lay_process_payment);

        /*Broadcast receiver implemented to finish activity when
        ipg is stuck but merchant app received notification*/

        IntentFilter filter = new IntentFilter();
        filter.addAction(getString(R.string.broadcast_action_name));
        registerReceiver(receiver, filter);


        final ProgressBar progressBar =  findViewById(R.id.ipg_progress_bar);
        webViewContainer =  findViewById(R.id.frame_layout_webview);
        webView =  findViewById(R.id.web_view_payment);
        cleanWebView(webView);

        webView.setWebChromeClient(new WebChromeClient() {


            @Override
            public void onProgressChanged(WebView view, int newProgress) {

                progressBar.setProgress(newProgress);
                if (newProgress == 100) {
                    progressBar.setVisibility(View.GONE);
                }

            }
        });

        webView.setWebViewClient(new WebViewClient() {

            @Override
            public boolean shouldOverrideUrlLoading(final WebView view, final String url) {

                webView.postDelayed(new Runnable() {

                    @Override
                    public void run() {
                        view.loadUrl(url);
                    }
                }, 1000);
                return true;
            }


            @Override
            public void onReceivedError(WebView view, int errorCode, String description, String failingUrl) {
                Log.e("PaymentStandard","onReceivedError");
                Toast.makeText(PaymentCardCapture.this, "Error:" + description, Toast.LENGTH_SHORT).show();

            }

            @Override
            public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
                // handler.proceed();
                //super.onReceivedSslError(view, handler, error);
                final SslErrorHandler handler1 = handler;
                final AlertDialog.Builder builder = new AlertDialog.Builder(PaymentCardCapture.this);
                String message = "SSL Certificate error.";
                switch (error.getPrimaryError()) {
                    case SslError.SSL_UNTRUSTED:
                        message = "Problem with security certificate for this site.";
                        break;
                    case SslError.SSL_EXPIRED:
                        message = "The certificate has expired.";
                        break;
                    case SslError.SSL_IDMISMATCH:
                        message = "The certificate Hostname mismatch.";
                        break;
                    case SslError.SSL_NOTYETVALID:
                        message = "The certificate is not yet valid.";
                        break;
                }
                message += " Do you want to continue anyway?";

                // builder.setTitle("SSL Certificate Error");
                builder.setMessage(message);
                builder.setPositiveButton("Continue", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {
                        handler1.proceed();

                    }
                });
                builder.setNegativeButton("Cancel", new DialogInterface.OnClickListener() {
                    @Override
                    public void onClick(DialogInterface dialog, int which) {

                        handler1.cancel();

                        finish();
                    }
                });
                final AlertDialog dialog = builder.create();
                dialog.show();
            }

            @Override

            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
            }


            @RequiresApi(api = Build.VERSION_CODES.KITKAT)
            @Override
            public void onPageFinished(WebView view, String url) {

                String pageTitle = view.getTitle();

                if (pageTitle.equals(getString(R.string.page_title))) {
                    view.evaluateJavascript("(function(){return window.document.body.outerHTML})();",
                            new ValueCallback<String>() {
                                @Override
                                public void onReceiveValue(String html) {
                                    int startIndex = html.lastIndexOf("responseString") + 44;
                                    //int endIndex = html.lastIndexOf("|{");
                                    int endIndex = html.lastIndexOf("\\\"\\u003C");
                                    String pipeSeparatedResponse = html.substring(startIndex, endIndex).trim();
                                    String[] resultArray = pipeSeparatedResponse.split("\\|",-1);

                                    Intent data = new Intent();
                                    data.putExtra(Param.ORDER_ID, resultArray[0]);
                                    data.putExtra(Param.TRANSACTION_REFERENCE_NUMBER, resultArray[1]);
                                    data.putExtra(Param.RRN, resultArray[2]);
                                    data.putExtra(Param.STATUS_CODE, resultArray[3]);
                                    data.putExtra(Param.STATUS_DESCRIPTION, resultArray[4]);
                                    data.putExtra(Param.TRANSACTION_AMOUNT, resultArray[5]);
                                    data.putExtra(Param.TRANSACTION_REQUEST_DATE, resultArray[6]);
                                    data.putExtra(Param.AUTH_N_STATUS, resultArray[7]);
                                    data.putExtra(Param.AUTH_Z_STATUS, resultArray[8]);
                                    data.putExtra(Param.CAPTURE_STATUS, resultArray[9]);
                                    data.putExtra(Param.PG_REF_CANCEL_REQ_ID, resultArray[10]);
                                    data.putExtra(Param.REFUND_AMOUNT, resultArray[11]);
                                    data.putExtra(Param.ADDL_FIELD_1, resultArray[12]);
                                    data.putExtra(Param.ADDL_FIELD_2, resultArray[13]);
                                    data.putExtra(Param.ADDL_FIELD_3, resultArray[14]);
                                    data.putExtra(Param.ADDL_FIELD_4, resultArray[15]);
                                    data.putExtra(Param.ADDL_FIELD_5, resultArray[16]);
                                    data.putExtra(Param.ADDL_FIELD_6, resultArray[17]);
                                    data.putExtra(Param.ADDL_FIELD_7, resultArray[18]);
                                    data.putExtra(Param.ADDL_FIELD_8, resultArray[19]);
                                    data.putExtra(Param.ADDL_FIELD_9, resultArray[20]);
                                    data.putExtra(Param.ADDL_FIELD_10, resultArray[21]);
                                    setResult(RESULT_OK, data);
                                    webViewContainer.removeView(webView);
                                    webView.removeAllViews();
                                    webView.destroy();
                                    finish();
                                }
                            });
                }
            }
        });

        WebSettings webSettings = webView.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setLoadWithOverviewMode(true);
        webSettings.setUseWideViewPort(true);

        try {
            Intent appIntent=getIntent();
            if(null!=appIntent.getStringExtra(getString(R.string.key)) && null!=appIntent.getStringExtra(getString(R.string.mid)))
            {
                encryptionKey = appIntent.getStringExtra(getString(R.string.key));
                mid = appIntent.getStringExtra(getString(R.string.mid));
            }
            else
            {
                encryptionKey = Utility.getMerchantDetails(getString(R.string.key), this);
                mid = Utility.getMerchantDetails(getString(R.string.mid), this);
            }

        } catch (PackageManager.NameNotFoundException e) {
            e.printStackTrace();
        }

        if (encryptionKey != null && mid != null) {

            Intent paymentParams = getIntent();
            String orderId = paymentParams.getStringExtra(Param.ORDER_ID);
            String transactionAmount = paymentParams.getStringExtra(Param.TRANSACTION_AMOUNT);
            String transactionCurrency = paymentParams.getStringExtra(Param.TRANSACTION_CURRENCY);
            String transactionDescription = paymentParams.getStringExtra(Param.TRANSACTION_DESCRIPTION);
            String transactionType = paymentParams.getStringExtra(Param.TRANSACTION_TYPE);
            String cardNumber = paymentParams.getStringExtra(Param.CARD_NUMBER);
            String paymentType = paymentParams.getStringExtra(Param.PAYMENT_TYPE);
            String expiryDate = paymentParams.getStringExtra(Param.EXPIRY_DATE);
            String cvv = paymentParams.getStringExtra(Param.CVV);
            String nameOnCard = paymentParams.getStringExtra(Param.NAME_ON_CARD);
            String addField_1 = paymentParams.getStringExtra(Param.ADDL_FIELD_1);
            String addField_2 = paymentParams.getStringExtra(Param.ADDL_FIELD_2);
            String addField_3 = paymentParams.getStringExtra(Param.ADDL_FIELD_3);
            String addField_4 = paymentParams.getStringExtra(Param.ADDL_FIELD_4);
            String addField_5 = paymentParams.getStringExtra(Param.ADDL_FIELD_5);
            String addField_6 = paymentParams.getStringExtra(Param.ADDL_FIELD_6);
            String addField_7 = paymentParams.getStringExtra(Param.ADDL_FIELD_7);
            String addField_8 = paymentParams.getStringExtra(Param.ADDL_FIELD_8);
            String addField_9 = paymentParams.getStringExtra(Param.ADDL_FIELD_9);
            String addField_10 = paymentParams.getStringExtra(Param.ADDL_FIELD_10);


            boolean isAllValid = validateParams(orderId, transactionAmount, transactionCurrency, transactionDescription, transactionType,
                    cardNumber, paymentType, expiryDate, cvv);
            if (isAllValid) {

                String url , responseURL;
                try {
                    url = Utility.getProperty(getString(R.string.ipg_transaction_card_capture), getApplicationContext());
                    responseURL = Utility.getProperty(getString(R.string.ipg_response_url), getApplicationContext());

                    ReqMsgDTO objReqMsgDTO = new ReqMsgDTO();
                    objReqMsgDTO.setOrderId(orderId);
                    objReqMsgDTO.setMid(mid);
                    objReqMsgDTO.setTrnAmt(transactionAmount);
                    objReqMsgDTO.setTrnCurrency(transactionCurrency);
                    objReqMsgDTO.setMeTransReqType(transactionType);
                    objReqMsgDTO.setEnckey(encryptionKey);
                    objReqMsgDTO.setResponseUrl(responseURL);
                    objReqMsgDTO.setTrnRemarks(transactionDescription);
                    objReqMsgDTO.setAddField1(addField_1);
                    objReqMsgDTO.setAddField2(addField_2);
                    objReqMsgDTO.setAddField3(addField_3);
                    objReqMsgDTO.setAddField4(addField_4);
                    objReqMsgDTO.setAddField5(addField_5);
                    objReqMsgDTO.setAddField6(addField_6);
                    objReqMsgDTO.setAddField7(addField_7);
                    objReqMsgDTO.setAddField8(addField_8);
                    objReqMsgDTO.setAddField9(addField_9);
                    objReqMsgDTO.setAddField10(addField_10);
                    objReqMsgDTO.setPayTypeCode(paymentType);
                    objReqMsgDTO.setCardNumber(cardNumber);
                    objReqMsgDTO.setExpiryDate(expiryDate);
                    objReqMsgDTO.setNameOnCard(nameOnCard);
                    objReqMsgDTO.setCvv(cvv);


                    AWLMEAPI objAWLMEAPI = new AWLMEAPI();
                    try {
                        objReqMsgDTO = objAWLMEAPI.generateTrnReqMsgWithCard(objReqMsgDTO);
                        String merchantRequest = null;
                        if (objReqMsgDTO.getStatusDesc().equals("Success")) {
                            merchantRequest = objReqMsgDTO.getReqMsg();
                            processPayment(merchantRequest, url, mid);
                        } else
                            Log.e(Tag, getString(R.string.error_transaction_request_message));

                    } catch (Exception e) {
                        e.printStackTrace();
                    }

                } catch (IOException e) {
                    Log.e(Tag, getString(R.string.error_missing_url));
                    e.printStackTrace();
                }
            }
        } else {
            if (encryptionKey == null) {
                Log.e(Tag, getString(R.string.error_encryption_key_not_found));
            } else {
                Log.e(Tag, getString(R.string.error_mid_not_found));
            }
        }

    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        unregisterReceiver(receiver);
    }

    private void cleanWebView(WebView webView) {

        CookieManager cookieManager = CookieManager.getInstance();

        if (Build.VERSION.SDK_INT < Build.VERSION_CODES.LOLLIPOP) {
            cookieManager.removeAllCookie();
        } else
            cookieManager.removeAllCookies(null);

        webView.clearCache(true);
        webView.clearHistory();

    }

    private void processPayment(String merchantRequest, String url, String mid) {

        String requestHeader = "merchantRequest=" + merchantRequest + "&MID=" + mid;

        byte[] requestHeaderBytes = requestHeader.getBytes();
        webView.postUrl(url, requestHeaderBytes);
    }

    private boolean validateParams(String orderId, String transactionAmount, String transactionCurrency, String transactionDescription, String transactionType, String cardNumber, String paymentType, String expiryDate, String cvv) {
        boolean isAllValid;
        boolean isStandardParamValid = validateParamsForStandardTransaction(orderId, transactionAmount, transactionCurrency, transactionDescription, transactionType);
        boolean isCardDetailsValid = validateCardDetails(cardNumber,expiryDate, cvv, paymentType);

        isAllValid = isCardDetailsValid || isStandardParamValid;
        return isAllValid;
    }

    private boolean validateCardDetails(String cardNumber, String expiryDate, String cvv, String paymentType) {

        boolean isAllValid = true;

        if (null == cardNumber || cardNumber.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_amount));
            isAllValid = false;
        }

        if (null == expiryDate || expiryDate.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_amount));
            isAllValid = false;
        }
        if (null == cvv || cvv.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_amount));
            isAllValid = false;
        }

        if (null == paymentType || paymentType.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_amount));
            isAllValid = false;
        }

        return isAllValid;
    }


    private boolean validateParamsForStandardTransaction(String orderId, String transactionAmount, String transactionCurrency, String transactionDescription, String transactionType) {

        boolean isAllValid = true;

        if (null == orderId || orderId.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_order_id));
            isAllValid = false;
        }
        if (null == transactionAmount || transactionAmount.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_amount));
            isAllValid = false;
        }
        if (null == transactionDescription || transactionDescription.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_discription));
            isAllValid = false;
        }
        if (null == transactionCurrency || transactionCurrency.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_currency));
            isAllValid = false;
        }
        if (null == transactionDescription || transactionType.equals("")) {
            Log.e(Tag, getString(R.string.error_missing_transaction_type));
            isAllValid = false;
        }

        return isAllValid;

    }
}
