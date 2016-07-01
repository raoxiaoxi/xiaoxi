package com.funschool.main;

/**
 * Created by yybo on 16/6/28.
 */
public class MainPresenter implements MainContract.Presenter {

    private final MainContract.View mainView;

    public MainPresenter(MainContract.View mainView) {
        this.mainView = mainView;

        this.mainView.setPresenter(this);
    }

    @Override
    public void start() {

    }
}
