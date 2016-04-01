package com.kaishengit.entity;

public class Ajax {

    public Ajax done() {
        System.out.println("done method");
        return this;
    }

    public Ajax fail() {
        System.out.println("fail method");
        return this;
    }

    public Ajax always() {
        System.out.println("always method");
        return this;
    }

}
