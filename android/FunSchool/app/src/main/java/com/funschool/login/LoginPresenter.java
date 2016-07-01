package com.funschool.login;

/**
 * Created by yybo on 16/6/30.
 */
public class LoginPresenter implements LoginContract.Presenter {
    private LoginContract.View loginView;

    public LoginPresenter(LoginContract.View loginView) {
        this.loginView = loginView;
        this.loginView.setPresenter(this);
    }

    @Override
    public void start() {

    }
}
