/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package web;

import java.sql.Timestamp;

/**
 *
 * @author Eslam
 */
public class User {
    public int ID;
    public String Username;
    public String Password;
    public String Email;
    public boolean IsAdmin=false;
    public String LastLogin="today";
    public boolean IsActive=true;
    public String Gender;
    public String About;
    public Timestamp RegDate;

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getUsername() {
        return Username;
    }

    public void setUsername(String Username) {
        this.Username = Username;
    }

    public String getPassword() {
        return Password;
    }

    public void setPassword(String Password) {
        this.Password = Password;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public boolean isIsAdmin() {
        return IsAdmin;
    }

    public void setIsAdmin(boolean IsAdmin) {
        this.IsAdmin = IsAdmin;
    }

    public String getLastLogin() {
        return LastLogin;
    }

    public void setLastLogin(String LastLogin) {
        this.LastLogin = LastLogin;
    }

    public boolean isIsActive() {
        return IsActive;
    }

    public void setIsActive(boolean IsActive) {
        this.IsActive = IsActive;
    }

    public String getGender() {
        return Gender;
    }

    public void setGender(String Gender) {
        this.Gender = Gender;
    }

    public String getAbout() {
        return About;
    }

    public void setAbout(String About) {
        this.About = About;
    }

    public Timestamp getRegDate() {
        return RegDate;
    }

    public void setRegDate(Timestamp RegDate) {
        this.RegDate = RegDate;
    }
    
    
    
}
