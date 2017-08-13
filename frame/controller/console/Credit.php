<?php
//学分明细列表
class Credit extends base
{

    public function lists()
    {

        //后台账户名
        $hospital = auth($_COOKIE['xYoum_admin_username'], 'DECODE');
        if (!$hospital) {
            header('location:/index.php?m=admin');
        }

        $page = new page();

        $isApply  = get('is_apply', 'text');
        $type     = get('type', 'intval', 0);
        $yeard    = get('yeard', 'intval', 0);
        $field    = get('field', 'text', '');
        $keyword  = get('keyword', 'text', '');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);
        $status   = get('status', 'text');

        $offer = ($pageNo - 1) * $pageSize;
        $param = array();

        $map['yeard'] = date('Y');
        if ($status != '') {
            $map['status']   = $status;
            $param['status'] = $status;
        }

        if ($type) {
            $map['type']   = $type;
            $param['type'] = $type;
        }

        if ($isApply != '') {
            $map['is_apply']   = $isApply;
            $param['is_apply'] = $isApply;
        }

        if ($yeard) {
            $map['yeard']   = $yeard;
            $param['yeard'] = $yeard;
        }

        if ($hospital != 'admin') {
            $map['hospital']   = $hospital;
            $param['hospital'] = $hospital;
        }

        if ($field && $keyword) {
            if ($field == 'hospital' && $hospital == 'admin') {
                $map['hospital'] = array('like', '%' . $keyword . '%');
            } elseif ($field == 'name') {
                $userIdArr = table('cqks_yh', false)->where(array('xm' => array('like', '%' . $keyword . '%')))->field('bh')->find('one', true);
                if ($userIdArr) {
                    $map['uid'] = array('in', implode(',', $userIdArr));
                }
            } elseif ($field == 'title') {
                $map['title'] = $keyword;
            }

            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $yearCopy = table('cqks_credit', false)->group('yeard')->field('yeard')->find('one', true);

        $total = table('cqks_credit', false)->where($map)->count();
        $page->pages($total, $pageNo, $pageSize, url('lists', $param), 5);
        $loadPage = $page->loadConsole();

        $list = table('cqks_credit', false)->where($map)->order('is_apply asc')->limit($offer, $pageSize)->find('array');
        //echo table('cqks_credit', false)->getSql();
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['user'] = table('cqks_yh', false)->where(array('bh' => $value['uid']))->field('yy,xm')->find();
            }
        }

        $statusCopy = array('1' => '通过', '0' => '未通过');
        $typeCopy   = array('1' => 'I类', '2' => 'II类');
        $applyCopy  = array('1' => '已申请', '0' => '未申请');

        $this->assign('statusCopy', $statusCopy);
        $this->assign('typeCopy', $typeCopy);
        $this->assign('applyCopy', $applyCopy);
        $this->assign('yearCopy', $yearCopy);

        $this->assign('param', $param);

        $this->assign('list', $list);
        $this->assign('pages', $loadPage);
        $this->show('/console/credit/list');
    }

    /**
     * [listsAll description]
     * @date   2017-07-24T20:51:26+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listsAll()
    {
        //后台账户名
        $hospital = auth($_COOKIE['xYoum_admin_username'], 'DECODE');
        if (!$hospital) {
            header('location:/index.php?m=admin');
        }

        $page = new page();

        $yeard    = get('yeard', 'intval', 0);
        $field    = get('field', 'text', '');
        $keyword  = get('keyword', 'text', '');
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;
        $param = array();
        $map   = array();

        if ($hospital != 'admin') {
            $map['yy'] = $hospital;
        }

        if ($field && $keyword) {
            if ($field == 'hospital' && $hospital == 'admin') {
                $map['yy'] = array('like', '%' . $keyword . '%');
            } elseif ($field == 'name') {
                $map['xm'] = array('like', '%' . $keyword . '%');
            } elseif ($field == 'zc' || $field == 'sfz' || $field == 'ks') {
                $map[$field] = $keyword;
            }

            $param['field']   = $field;
            $param['keyword'] = $keyword;
        }

        $total = table('cqks_yh', false)->where($map)->count();
        $page->pages($total, $pageNo, $pageSize, url('lists_all', $param), 5);
        $loadPage = $page->loadConsole();

        $list = table('cqks_yh', false)->field('bh,xm,yy,sfz,zc,ks')->where($map)->limit($offer, $pageSize)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {

                $creditMap['yeard']    = date('Y');
                $creditMap['uid']      = $value['bh'];
                $creditMap['is_apply'] = 1;

                if ($yeard) {
                    $creditMap['yeard'] = $yeard;
                    $param['yeard']     = $yeard;
                }

                $credit = table('cqks_credit', false)->where($creditMap)->field('SUM(credit) AS credit,type')->group('type')->find('array');

                $listCreditTmp = array('1' => 0, '2' => 0); //默认0分
                if ($credit) {
                    foreach ($credit as $k => $v) {
                        $listCreditTmp[$v['type']] = $v['credit'];
                    }

                }
                $list[$key]['yeard']  = $creditMap['yeard'];
                $list[$key]['credit'] = $listCreditTmp;
            }
        }

        $yearCopy = table('cqks_credit', false)->group('yeard')->field('yeard')->find('one', true);

        $this->assign('yearCopy', $yearCopy);

        $this->assign('param', $param);

        $this->assign('list', $list);
        $this->assign('pages', $loadPage);
        $this->show('/console/credit/list_all');
    }

    /**
     * 导出学分
     * @date   2017-07-06T11:57:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function exprot()
    {
        //后台账户名
        $hospital = auth($_COOKIE['xYoum_admin_username'], 'DECODE');
        if (!$hospital) {
            header('location:/index.php?m=admin');
        }

        $status  = get('status', 'text');
        $isApply = get('is_apply', 'text');
        $type    = get('type', 'intval', 0);
        $yeard   = get('yeard', 'intval', 0);
        $field   = get('field', 'text', '');
        $keyword = get('keyword', 'text', '');

        $map['yeard'] = date('Y');
        if ($status != '') {
            $map['status'] = $status;
        }

        if ($type) {
            $map['type'] = $type;
        }

        if ($isApply != '') {
            $map['is_apply'] = $isApply;
        }

        if ($yeard) {
            $map['yeard'] = $yeard;
        }

        if ($hospital != 'admin') {
            $map['hospital'] = $hospital;
        }

        $list = table('cqks_credit', false)->where($map)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['user'] = table('cqks_yh', false)->where(array('bh' => $value['uid']))->field('xm,sfz,zc')->find();
            }
        }

        $typeCopy = array('1' => 'I类', '2' => 'II类');

        $this->assign('typeCopy', $typeCopy);
        $this->assign('list', $list);
        $this->show('/console/credit/exprot');
    }

    /**
     * 申请学分
     * @date   2017-06-14T16:55:30+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function applyCredit()
    {
        $id = get('id', 'intval', 0);

        $map['id'] = $id;

        $credit = table('cqks_credit', false)->where($map)->find();
        if (!$credit) {
            $this->ajaxReturn(array('status' => false, 'msg' => '信息不存在'));
        }

        //I类学分申请
        if ($credit['type'] == 1) {
            $user = table('cqks_yh', false)->where(array('bh' => $credit['uid']))->field('sfz,xm')->find();
            if (!$user) {
                $this->ajaxReturn(array('status' => false, 'msg' => '用户信息不存在'));
            }

            $data['ID']    = $user['sfz'];
            $data['Name']  = $user['xm'];
            $data['Code']  = $credit['code'];
            $data['Timer'] = time();

            $encrypt = new encrypt();
            $json    = $encrypt->base64Encrypt($data, 'PKCS7');

            $resultContent = file_get_contents('http://cqjlp.91huayi.com/cme/applycertificate.aspx?params=' . $json);
            $result        = json_decode($resultContent, true);

            //更新学分
            if ($result['Status']) {
                table('cqks_credit', false)->where($map)->save(array('is_apply' => 1, 'apply_time' => time()));
                $this->ajaxReturn(array('status' => true, 'msg' => $result['Msg']));
            }

            $this->ajaxReturn(array('status' => false, 'msg' => $result['Msg']));
        }
        //II类学分
        else {
            if ($credit['status'] == 0) {
                $this->ajaxReturn(array('status' => false, 'msg' => '该学生考试未通过无法审核'));
            }

            $user = table('cqks_yh', false)->where(array('bh' => $credit['uid']))->field('sfz,xm')->find();
            if (!$user) {
                $this->ajaxReturn(array('status' => false, 'msg' => '用户信息不存在'));
            }

            //更新学分
            $result = table('cqks_credit', false)->where($map)->save(array('is_apply' => 1, 'apply_time' => time()));
            if ($result) {
                $this->ajaxReturn(array('status' => true, 'msg' => '更新成功'));
            }

            $this->ajaxReturn(array('status' => false, 'msg' => '更新失败'));
        }

    }

    /**
     * 批量申请学分
     * @date   2017-07-06T10:45:57+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function batchApplyCredit()
    {
        $idArr = post('id', 'json', '');
        if (!$idArr) {
            $this->ajaxReturn(array('status' => false, 'msg' => '请选择需要审核的信息', 'data' => $idArr));
        }

        //更新II类学分
        $listTwo = table('cqks_credit', false)->where(array('type' => 2, 'status' => 1, 'id' => array('in', implode(',', $idArr))))->field('id')->find('one', true);

        if ($listTwo) {
            $reslut = table('cqks_credit', false)->where(array('type' => 2, 'status' => 1, 'id' => array('in', implode(',', $idArr))))->save(array('is_apply' => 1, 'apply_time' => time()));

            //剔除已更新学分
            foreach ($idArr as $key => $value) {
                if (in_array($value, $listTwo)) {
                    unset($idArr[$key]);
                }
            }
        }

        //更新I类学分
        $listOne = table('cqks_credit', false)->where(array('type' => 1, 'id' => array('in', implode(',', $idArr))))->field('id,code,uid')->find('array');

        if ($listOne) {
            $encrypt = new encrypt();
            foreach ($listOne as $key => $value) {
                $user = table('cqks_yh', false)->where(array('bh' => $value['uid']))->field('sfz,xm')->find();
                if ($user) {
                    $data['ID']    = $user['sfz'];
                    $data['Name']  = $user['xm'];
                    $data['Code']  = $value['code'];
                    $data['Timer'] = time();

                    $json          = $encrypt->base64Encrypt($data, 'PKCS7');
                    $resultContent = file_get_contents('http://cqjlp.91huayi.com/cme/applycertificate.aspx?params=' . $json);
                    $result        = json_decode($resultContent, true);

                    //更新学分
                    if ($result['Status']) {
                        table('cqks_credit', false)->where(array('id' => $value['id']))->save(array('is_apply' => 1, 'apply_time' => time()));
                    }
                }
            }
        }

        $this->ajaxReturn(array('status' => true, 'msg' => '批量更新完成'));

    }

    /**
     * 导入老学分
     * @date   2017-07-14T15:51:40+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateCreditNew()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;

        $kaoshi = table('kj')->where(array('kaoshi_id' => array('!=', '')))->field('kaoshi_id,title')->find('array');
        $i      = 0;

        foreach ($kaoshi as $key => $value) {
            $list = table('cqks_fs', false)->where(array('kjbh' => $value['kaoshi_id']))->find('array');
            if ($list) {
                foreach ($list as $k => $v) {

                    $is = table('cqks_credit', false)->where(array('uid' => $v['yhbh'], 'code' => $v['kjbh'], 'yeard' => substr($v['sj'], 0, 4)))->field('id')->find('one');

                    if (!$is && $v['yhbh']) {
                        $data['title']   = $value['title'];
                        $data['uid']     = $v['yhbh'];
                        $data['status']  = $v['state'] == 'true' ? 1 : 0;
                        $data['code']    = $v['kjbh'];
                        $data['created'] = strtotime($v['sj']);
                        $data['yeard']   = substr($v['sj'], 0, 4);

                        $data['credit'] = max(table('cqks_kj', false)->where(array('kcbh' => $v['kjbh']))->field('xf')->find('one'), 1);

                        if ($data['status'] == 1) {
                            $data['post_time'] = $data['created'];
                        }

                        $is = table('cqks_credit', false)->where(array('uid' => $data['uid'], 'code' => $data['code'], 'yeard' => $data['yeard'], 'status' => $data['status']))->field('id')->find('one');

                        if (!$is) {
                            table('cqks_credit', false)->add($data);
                            $i++;
                        }
                    }
                }
            }
        }

        header("refresh:5;url=/frame/index.php?m=console&c=credit&a=update_credit_new&pageNo=" . ($pageNo + 1));
        print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');

    }

    /**
     * 导入老学分
     * @date   2017-07-14T15:51:40+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateCredit()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;

        $map       = array();
        $map['bh'] = array('>=', '28801');

        $list = table('cqks_fs', false)->limit($offer, $pageSize)->find('array');
        $i    = 0;
        if ($list) {
            foreach ($list as $key => $value) {
                $data['title'] = table('kj')->where(array('kaoshi_id' => $value['kjbh']))->field('title')->find('one');
                if ($data['title']) {
                    $data['type']    = 2;
                    $data['uid']     = $value['yhbh'];
                    $data['status']  = $value['state'] == 'true' ? 1 : 0;
                    $data['code']    = $value['kjbh'];
                    $data['created'] = strtotime($value['sj']);
                    $data['yeard']   = substr($value['sj'], 0, 4);
                    $data['credit']  = max(table('cqks_kj', false)->where(array('kcbh' => $value['kjbh']))->field('xf')->find('one'), 1);

                    if ($data['status'] == 1) {
                        $data['post_time'] = $data['created'];
                    }

                    $is = table('cqks_credit', false)->where(array('uid' => $data['uid'], 'code' => $data['code'], 'yeard' => $data['yeard'], 'status' => $data['status']))->field('id')->find('one');

                    if (!$is) {
                        table('cqks_credit', false)->add($data);
                        $i++;
                    }
                }
            }
        }

        header("refresh:5;url=/frame/index.php?m=console&c=credit&a=update_credit&pageNo=" . ($pageNo + 1));
        print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');

    }

    /**
     * 获取医院名称
     * @date   2017-07-14T15:51:56+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateCreditHospital()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;

        $list = table('cqks_credit', false)->where(array('hospital' => ''))->limit($offer, $pageSize)->find('array');
        $i    = 0;
        if ($list) {
            foreach ($list as $key => $value) {
                $hospital = table('cqks_yh', false)->where(array('bh' => $value['uid']))->field('yy')->find('one');
                if ($hospital) {
                    table('cqks_credit', false)->where(array('id' => $value['id']))->save(array('hospital' => $hospital));
                    $i++;
                }
            }
        } else {
            die('执行完毕');
        }

        header("refresh:5;url=/frame/index.php?m=console&c=credit&a=update_credit_hospital&pageNo=" . ($pageNo + 1));
        print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');

    }

    /**
     * 更新title
     * @date   2017-07-14T15:52:23+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function updateCreditTitle()
    {
        $pageNo   = get('pageNo', 'intval', 1);
        $pageSize = get('pageSize', 'intval', 100);

        $offer = ($pageNo - 1) * $pageSize;

        $list = table('cqks_credit', false)->limit($offer, $pageSize)->find('array');
        $i    = 0;
        if ($list) {
            foreach ($list as $key => $value) {
                if ($value['type'] == 2) {
                    $kc = table('kj')->where(array('kaoshi_id' => $value['code']))->field('title')->find();
                    if ($kc) {
                        table('cqks_credit', false)->where(array('id' => $value['id']))->save(array('title' => $kc['title']));
                        $i++;
                    }
                }
            }
        } else {
            die('执行完毕');
        }

        header("refresh:5;url=/frame/index.php?m=console&c=credit&a=update_credit_title&pageNo=" . ($pageNo + 1));
        print('正在加载，请稍等...<br>5秒后自动跳转到第' . ($pageNo + 1) . '页,共执行' . $i . '条记录<br/>');
    }
}
