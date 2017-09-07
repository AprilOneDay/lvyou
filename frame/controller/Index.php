<?php
//课程管理
class Index extends base
{
    /**
     * 会员注册
     * @data   2017-06-13T22:52:42+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function index()
    {
        $type = get('type', 'intval', 0);

        $map['catid'] = 20;

        if ($type) {
            $map['type'] = $type;
        } else {
            $map['type'] = array('in', '1,2');
        }

        $list = table('map')->where($map)->find('array');

        $wx = puls('weixin.jssdk', 'JSSDK');

        $this->assign('wx', $wx->getSignPackage());
        $this->assign('list', $list);
        $this->assign('type', $type);
        $this->show();
    }

    /**
     * 会员登陆
     * @data   2017-06-13T22:52:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function login()
    {
        if (IS_POST) {
            $username = post('username', 'text', '');
            $password = md5(post('password', 'trim'));

            if (!$username || !$password) {
                $this->ajaxReturn(array('status' => false, 'msg' => '请输入账号密码'));
            }

            $user = table('member')->where(array('username' => $username, 'password' => $password))->field('username,userid,mobile')->find();

            if (!$user) {
                $this->ajaxReturn(array('status' => false, 'msg' => '账号/密码错误'));
            }

            session('user', $user); //保存session信息
            cookie('userid', $user['userid']);
            $this->ajaxReturn(array('status' => true, 'msg' => '登录成功'));
        } else {
            if (issetSession('user')) {
                header('LOCATION:/');
            } else {
                $this->show('/user/login');
            }
        }

    }

    /**
     * 退出登陆
     * @date   2017-08-09T17:39:23+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function outLogin()
    {
        delSession('user');
        cookie('userid', '');
        header('LOCATION:/');
    }

}
