package com.isep.HomeExchange.controller.security;

public class LoginDao {

    public static boolean validate(LoginBean bean){
        boolean status=false;
        try{

            String user = bean.getEmail();
            String pass = bean.getPass();

            if ((user == "123") && (pass == "123")) {
                status = true;
            }

        }catch(Exception e){}

        return status;

    }
}