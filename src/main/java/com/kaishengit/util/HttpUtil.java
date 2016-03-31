package com.kaishengit.util;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class HttpUtil {

    public static String getText(String url) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet(url);
        httpGet.addHeader("User-Agent","Mozilla/5.0 (Windows NT 10.0; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/49.0.2623.110 Safari/537.36");
        HttpResponse httpResponse = httpClient.execute(httpGet);

        int httpCode = httpResponse.getStatusLine().getStatusCode();
        if(httpCode == 200) {
            InputStream inputStream = httpResponse.getEntity().getContent();
            String html = IOUtils.toString(inputStream);
            return html;
        } else {
            System.out.println("Http Error Code:" + httpCode);
        }

        httpClient.close();
        return null;
    }

    public static void getInputStream(String url, OutputStream outputStream) throws IOException {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpGet httpGet = new HttpGet("http://u1.img.mobile.sina.cn/public/files/image/620x300_img56f50cc20695e.png");
        HttpResponse httpResponse = httpClient.execute(httpGet);

        if(httpResponse.getStatusLine().getStatusCode() == 200) {
            InputStream inputStream = httpResponse.getEntity().getContent();
            IOUtils.copy(inputStream,outputStream);
            outputStream.flush();
            outputStream.close();
            inputStream.close();
        } else {
            throw new RuntimeException("HTTP请求错误,错误码:" + httpResponse.getStatusLine().getStatusCode());
        }

        httpClient.close();
    }

}
