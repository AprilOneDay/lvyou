<?php
//课程管理
class Course extends base
{
    /**
     * 列表展示
     * @date   2017-06-13T22:52:42+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function lists()
    {
        $user = getSession('yh');
        $type = get('type', 'intval', 2);

        if (!$user) {
            die(header('location:/'));
        }

        $map['uid']    = $user['bh'];
        $map['yeard']  = date('Y');
        $map['status'] = 1;
        $map['type']   = $type;

        $this->repairCourseTitle(); //修复空白标题

        $list = table('cqks_course', false)->where($map)->limit('0,20')->order('created desc')->find('array');

        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['kj'] = '';
                if ($value['type'] == 2) {
                    $list[$key]['kj'] = table('kj')->where(array('id' => $value['code']))->field('catid,id')->find();
                } else {
                    $list[$key]['kj'] = table('kj')->where(array('kc_sn' => $value['code']))->field('catid,id')->find();
                }

            }
        }

        $this->assign('type', $type);
        $this->assign('list', $list);
        $this->assign('user', $user);
        $this->show('/user/course');
    }

    /**
     * 删除记录
     * @date   2017-06-13T22:52:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function delete()
    {
        $id = post('id', 'intval', 0);

        $user = getSession('yh');
        if (!$user) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请登录'));
        }

        $map['id']  = $id;
        $map['uid'] = $user['bh'];

        $isCourse = table('cqks_course', false)->where($map)->find('array');
        if (!$isCourse) {
            $this->ajaxReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        $result = table('cqks_course', false)->where($map)->save(array('status' => 3));
        if ($result) {
            $this->ajaxReturn(array('status' => true, 'msg' => '操作成功'));
        }

        $this->ajaxReturn(array('status' => false, 'msg' => '操作失败'));
    }

    public function repairCourseTitle($uid = 0)
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $map['title'] = '';
        if ($uid) {
            $map['uid'] = $uid;
        }

        $list = table('cqks_course', false)->where($map)->find('array');
        $i    = 0;
        if ($list) {
            foreach ($list as $key => $value) {
                $title = '';
                if ($value['type'] == 2) {
                    $title = table('kj')->where(array('id' => $value['code']))->field('title')->find('one');
                } else {
                    $title = table('kj')->where(array('kc_sn' => $value['code']))->field('title')->find('one');
                }

                if ($title) {
                    $i++;
                    table('cqks_course', false)->where(array('id' => $value['id']))->save(array('title' => $title));
                }
            }
        }

        /* header("refresh:5;url=/frame/index.php?m=user&c=course&a=repairCourseTitle&pageNo=" . ($pageNo + 1));
    print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');

    die('执行完毕');*/

    }
}
