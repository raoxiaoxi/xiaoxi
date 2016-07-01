package com.funschool.login;

import android.support.v4.app.Fragment;

/**
 * Created by yybo on 16/6/30.
 */
public class LoginFragment extends Fragment implements LoginContract.View {

    private LoginContract.Presenter mPresernter;
    @Override
    public void setPresenter(LoginContract.Presenter presenter) {
        mPresernter = presenter;
    }

    @Override
    public void onResume() {
        super.onResume();
        mPresernter.start();
    }
}
