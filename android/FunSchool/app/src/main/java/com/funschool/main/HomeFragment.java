package com.funschool.main;


import android.app.Activity;
import android.os.Bundle;
import android.support.annotation.Nullable;
import android.support.v4.app.Fragment;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.AdapterView;
import android.widget.GridView;
import android.widget.SimpleAdapter;
import android.widget.Toast;

import com.funschool.R;

import java.util.ArrayList;
import java.util.HashMap;

/**
 * Created by yybo on 16/6/28.
 */
public class HomeFragment extends Fragment implements MainContract.View{

    private MainContract.Presenter mPresenter;

    private Activity mActivity;
    private View layout;
    private GridView gridView;
    private SimpleAdapter saItem;
    private String[] gridviewNames;

    private static int[] gridview_imgs = {R.mipmap.card_icon,
            R.mipmap.card_icon,
            R.mipmap.card_icon,
            R.mipmap.card_icon,
            R.mipmap.card_icon,
            R.mipmap.card_icon};

    ArrayList<HashMap<String, Object>> meumList = new ArrayList<HashMap<String, Object>>();

    public static HomeFragment newInstance() {
        Bundle arguments = new Bundle();
//        arguments.putString("","");
        HomeFragment fragment = new HomeFragment();

        return fragment;
    }

    @Nullable
    @Override
    public View onCreateView(LayoutInflater inflater, ViewGroup container, Bundle savedInstanceState) {
        if (layout == null) {
            mActivity = this.getActivity();
            layout = mActivity.getLayoutInflater().inflate(R.layout.fragment_main,
                    null);
            initViews();
            setValues();

            saItem = new SimpleAdapter(mActivity,
                    meumList,
                    R.layout.gridview_item,
                    new String[]{"ItemImage","ItemText"},
                    new int[]{R.id.item_image,R.id.item_text});

            Log.i("适配器数据",saItem.toString());

            Log.i("gridView",gridView.toString());
            //添加Item到网格中
            gridView.setAdapter(saItem);
            //添加点击事件
            gridView.setOnItemClickListener(
                    new AdapterView.OnItemClickListener() {
                        public void onItemClick(AdapterView<?> arg0, View arg1, int arg2, long arg3) {
                            Toast.makeText(mActivity, gridviewNames[arg2], Toast.LENGTH_SHORT).show();
                            //Toast用于向用户显示一些帮助/提示
                        }
                    }
            );
//            setOnListener();
        } else {
            ViewGroup parent = (ViewGroup) layout.getParent();
            if (parent != null) {
                parent.removeView(layout);
            }
        }
        return layout;
    }

    private void initViews() {
        gridView = (GridView) layout.findViewById(R.id.gridView);
    }

    private void setValues() {
        gridviewNames = mActivity.getResources().getStringArray(R.array.gridview_list);
        for (int i=0; i<gridviewNames.length; i++) {
            HashMap<String, Object> map = new HashMap<String, Object>();
            map.put("ItemImage", gridview_imgs[i]);
            map.put("ItemText", gridviewNames[i]);
            meumList.add(map);
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
