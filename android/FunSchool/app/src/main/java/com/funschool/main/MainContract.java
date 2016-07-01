package com.funschool.main;

import com.funschool.BasePresenter;
import com.funschool.BaseView;

/**
 * 主页面的契约类
 * 来统一管理view与presenter的所有接口
 * Created by yybo on 16/6/28.
 */
public interface MainContract {
    interface View extends BaseView<Presenter> {
    }

    interface Presenter extends BasePresenter {

    }
}
