package org.yecq.weblibrary.bean;

/**
 *
 * @author yecq
 */
public class LogStatus {
    private boolean logged;
    private String username;

    public LogStatus() {
    }

    public boolean isLogged() {
        return logged;
    }

    public void setLogged(boolean logged) {
        this.logged = logged;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }
}
