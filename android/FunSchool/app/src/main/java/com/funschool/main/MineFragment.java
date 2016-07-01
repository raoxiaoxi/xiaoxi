package com.funschool.main;


import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import com.funschool.R;

/**
 * Created by yybo on 16/6/28.
 */
public class MineFragment extends Fragment implements MainContract.View, View.OnClickListener{

    private Activity mActivity;
    private View layout;
    private TextView tvname, tv_accout;

    private MainContract.Presenter mPresenter;

    public static MineFragment newInstance() {
        Bundle arguments = new Bundle();
//        arguments.putString("","");
        MineFragment fragment = new MineFragment();

        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        if (layout == null) {
            mActivity = this.getActivity();
            layout = mActivity.getLayoutInflater().inflate(R.layout.fragment_mine,
                    null);
            initViews();
            setOnListener();
        } else {
            ViewGroup parent = (ViewGroup) layout.getParent();
            if (parent != null) {
                parent.removeView(layout);
            }
        }
        return layout;
    }
    private void initViews() {
        tvname = (TextView) layout.findViewById(R.id.tvname);
        tv_accout = (TextView) layout.findViewById(R.id.tvmsg);
    }

    private void setOnListener() {
        layout.findViewById(R.id.view_user).setOnClickListener(this);
        layout.findViewById(R.id.txt_collect).setOnClickListener(this);
        layout.findViewById(R.id.txt_comment).setOnClickListener(this);
        layout.findViewById(R.id.txt_msg).setOnClickListener(this);
        layout.findViewById(R.id.txt_listen).setOnClickListener(this);
        layout.findViewById(R.id.txt_more).setOnClickListener(this);
    }

    @Override
    public void onClick(View v) {
        switch (v.getId()) {
            case R.id.view_user:
                break;
            case R.id.txt_collect:// 我的收藏
                break;
            case R.id.txt_comment:// 我的评论
                break;
            case R.id.txt_msg:// 我的消息
                break;
            case R.id.txt_listen:// 试听申请
                break;
            case R.id.txt_more:// 更多
                break;
            default:
                break;
        }
    }

    @Override
    public void onResume() {
        super.onResume();
        mPresenter.start();
    }

    @Override
    public void setPresenter(MainContract.Presenter presenter) {
        mPresenter = presenter;
    }

}
