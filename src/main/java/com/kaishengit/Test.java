package com.kaishengit;

import com.kaishengit.util.HttpUtil;
import org.apache.commons.io.IOUtils;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import sun.java2d.pipe.OutlineTextRenderer;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class Test {

    public static void main(String[] args) throws IOException {

        CloseableHttpClient httpClient = HttpClients.createDefault();
        HttpPost httpPost = new HttpPost("http://192.168.1.7/StuLogin.do");

        List<NameValuePair> paramList = new ArrayList<>();
        paramList.add(new BasicNameValuePair("username","zhangsanzzz"));
        paramList.add(new BasicNameValuePair("password","123123123"));

        httpPost.setEntity(new UrlEncodedFormEntity(paramList));

        HttpResponse response = httpClient.execute(httpPost);

        System.out.println(response.getStatusLine().getStatusCode());







    }

}
