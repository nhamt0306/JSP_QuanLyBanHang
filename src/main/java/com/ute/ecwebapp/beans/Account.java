package com.ute.ecwebapp.beans;

public class Account {
    String accID;
    String accPASS;
    String email;


    public Account(String accID, String accPASS, String email) {
        this.accID = accID;
        this.accPASS = accPASS;
        this.email = email;
    }

    public Account() {
    }

    public String getAccID() {
        return accID;
    }

    public void setAccID(String accID) {
        this.accID = accID;
    }

    public String getAccPASS() {
        return accPASS;
    }

    public void setAccPASS(String accPASS) {
        this.accPASS = accPASS;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
}
