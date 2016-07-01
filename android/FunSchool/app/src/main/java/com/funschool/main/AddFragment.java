package com.funschool.main;


import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

/**
 * Created by yybo on 16/6/28.
 */
public class AddFragment extends Fragment implements MainContract.View{

    private MainContract.Presenter mPresenter;

    public static AddFragment newInstance() {
        Bundle arguments = new Bundle();
//        arguments.putString("","");
        AddFragment fragment = new AddFragment();

        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        TextView mTextView = new TextView(getActivity());
        mTextView.setText("添加");
        return mTextView;
    }

    @Override
    public void onResume() {
        super.onResume();
//        mPresenter.start();
    }

    @Override
    public void setPresenter(MainContract.Presenter presenter) {
        mPresenter = presenter;
    }
}
