package com.funschool.main;

import android.os.Bundle;
import android.support.v4.app.Fragment;
import android.support.v4.app.FragmentActivity;
import android.support.v4.app.FragmentTransaction;
import android.view.View;
import android.widget.ImageView;
import android.widget.RelativeLayout;
import android.widget.TextView;

import com.funschool.R;

public class MainActivity extends FragmentActivity {

    private static final int HOME_PAGE_INDEX = 0;
    private static final int ADD_PAGE_INDEX = 1;
    private static final int MINE_PAGE_INDEX = 2;

    private HomeFragment mHomeFragment;
    private AddFragment mAddFragment;
    private MineFragment mMineFragment;
    private RelativeLayout re_home;
    private RelativeLayout re_add;
    private RelativeLayout re_mine;
    private ImageView ib_home;
    private ImageView ib_add;
    private ImageView ib_mine;
    private TextView tv_home;
    private TextView tv_mine;

    private ImageView[] imagebuttons;
    private TextView[] textviews;
    private Fragment[] fragments;


    /** 选择页面编号*/
    private int index;
    /** 当前fragment的index*/
    private int currentTabIndex;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        //初始化fragment
        if(mHomeFragment == null) {
            mHomeFragment = HomeFragment.newInstance();
        }
        if(mAddFragment == null) {
            mAddFragment = AddFragment.newInstance();
        }
        if(mMineFragment == null) {
            mMineFragment = MineFragment.newInstance();
        }

        // 添加显示第一个fragment
        getSupportFragmentManager().beginTransaction()
                .add(R.id.main_contentFrame, mHomeFragment)
                .add(R.id.main_contentFrame, mAddFragment)
                .add(R.id.main_contentFrame, mMineFragment)
                .hide(mAddFragment).hide(mMineFragment)
                .show(mHomeFragment).commit();

        //创建presenter
        new MainPresenter(mHomeFragment);
        new MainPresenter(mMineFragment);

        initView();
        setValues();
    }

    private void initView() {
        re_home = (RelativeLayout) this.findViewById(R.id.re_home);
        re_add = (RelativeLayout) this.findViewById(R.id.re_add);
        re_mine = (RelativeLayout) this.findViewById(R.id.re_mine);
        ib_home = (ImageView) this.findViewById(R.id.ib_home);
        ib_add = (ImageView) this.findViewById(R.id.ib_add);
        ib_mine = (ImageView) this.findViewById(R.id.ib_mine);
        tv_home = (TextView) this.findViewById(R.id.tv_home);
        tv_mine = (TextView) this.findViewById(R.id.tv_mine);
    }

    private void setValues() {
        fragments = new Fragment[] { mHomeFragment, mAddFragment,
                mMineFragment };

        imagebuttons = new ImageView[3];
        imagebuttons[0] = (ImageView) findViewById(R.id.ib_home);
        imagebuttons[1] = (ImageView) findViewById(R.id.ib_add);
        imagebuttons[2] = (ImageView) findViewById(R.id.ib_mine);

        imagebuttons[0].setSelected(true);
        textviews = new TextView[3];
        textviews[0] = (TextView) findViewById(R.id.tv_home);
        textviews[1] = (TextView) findViewById(R.id.tv_add);
        textviews[2] = (TextView) findViewById(R.id.tv_mine);
        textviews[0].setTextColor(0xFF45C01A);


    }

    public void onTabClicked(View view) {
        switch (view.getId()) {
            case R.id.re_home:
                index = 0;
                break;
            case R.id.re_add:
                index = 1;
                break;
            case R.id.re_mine:
                index = 2;
                break;
        }

        if(currentTabIndex != index) {
            //隐藏当前页面，显示选择页面
            FragmentTransaction trx = getSupportFragmentManager()
                    .beginTransaction();
            trx.hide(fragments[currentTabIndex]);
            if (!fragments[index].isAdded()) {
                trx.add(R.id.main_contentFrame, fragments[index]);
            }
            trx.show(fragments[index]).commit();
        }

        imagebuttons[currentTabIndex].setSelected(false);
        //TODO 把当前tab设为选中状态
        // 把当前tab设为选中状态
        imagebuttons[index].setSelected(true);
        textviews[currentTabIndex].setTextColor(0xFF999999);
        textviews[index].setTextColor(0xFF45C01A);
        currentTabIndex = index;
    }
}
