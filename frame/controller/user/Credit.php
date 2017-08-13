<?php
//学分管理
class Credit extends base
{
    /**
     * I类学分
     * @date   2017-06-13T21:36:34+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listOne()
    {
        $type = get('type', 'intval', 1);
        $user = getSession('yh');
        if (!$user) {
            die(header('location:/'));
        }
        $map['uid']   = $user['bh'];
        $map['type']  = 1;
        $map['yeard'] = date('Y');

        if ($type == 1) {
            $map['status'] = 1;
        } elseif ($type == 2) {
            $map['status']   = 1;
            $map['is_apply'] = 1;
        } elseif ($type == 3) {
            $map['yeard'] = array('<', date('Y'));
        }

        $list = table('cqks_credit', false)->where($map)->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $list[$key]['ks'] = (int) table('kj')->where(array('kc_sn' => $value['code']))->field('id')->find();
            }
        }

        $this->updateCredit();

        $this->assign('type', (int) $type);
        $this->assign('list', $list);
        $this->show('/user/credit_1');
    }

    /**
     * II类学分
     * @date   2017-06-13T21:37:15+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    public function listTwo()
    {
        $type = get('type', 'intval', 1);
        $user = getSession('yh');
        if (!$user) {
            die(header('location:/'));
        }

        $map['uid']   = $user['bh'];
        $map['type']  = 2;
        $map['yeard'] = date('Y');

        if ($type == 1) {
            $map['status'] = 1;
        } elseif ($type == 2) {
            $map['status']   = 1;
            $map['is_apply'] = 1;
        } elseif ($type == 3) {
            $map['yeard'] = array('<', date('Y'));
        }

        $list = table('cqks_credit', false)->where($map)->find('array');

        $this->assign('type', (int) $type);
        $this->assign('list', $list);
        $this->show('/user/credit_2');
    }

    /**
     * 更新未完成的记录
     * @date   2017-07-25T16:20:11+0800
     * @author ChenMingjiang
     * @return [type]                   [description]
     */
    private function updateCredit()
    {
        $user = getSession('yh');
        if (!$user) {
            return false;
        }

        $map['code']   = $user['sfz'];
        $map['status'] = 0;

        $list = table('cqks_credit_api_log', false)->where($map)->field('id,data')->find('array');
        if ($list) {
            foreach ($list as $key => $value) {
                $params = json_decode($value['data'], true);

                if (!$params['ID'] || !$params['Name']) {
                    table('cqks_credit_api_log', false)->where(array('id' => $value['id']))->save(array('status' => 2, 'error_copy' => '请传学员信息'));
                }

                $user = table('cqks_yh', false)->where(array('sfz' => $params['ID'], 'xm' => $params['Name']))->field('bh,yy')->find();
                if (!$user) {
                    table('cqks_credit_api_log', false)->where(array('id' => $value['id']))->save(array('status' => 2, 'error_copy' => '未查询到相关学员信息'));
                }

                $kc = table('kj')->where(array('kc_sn' => $params['Code']))->field('id,credit,title')->find();
                if (!$kc) {
                    table('cqks_credit_api_log', false)->where(array('id' => $value['id']))->save(array('status' => 2, 'error_copy' => '未查询到相关课程信息'));
                }

                //保存学分
                $data['hospital'] = $user['yy'];
                $data['uid']      = $user['bh'];
                $data['type']     = 1;
                $data['code']     = $params['Code'];
                $data['credit']   = $kc['credit'];
                $data['title']    = $kc['title'];
                $data['status']   = 1; //已通过
                $data['is_apply'] = 0; //未申请
                $data['created']  = isset($params['PassTime']) ? $params['PassTime'] : time();
                $data['yeard']    = date('Y');

                $result = table('cqks_credit', false)->add($data);
                //echo table('cqks_credit', false)->getSql();
                if ($result) {
                    table('cqks_credit_api_log', false)->where(array('id' => $value['id']))->save(array('status' => 1));
                    //删除学习记录
                    table('cqks_course', false)->where(array('uid' => $user['bh'], 'code' => $params['Code']))->save(array('status' => 3));
                }

                table('cqks_credit_api_log', false)->where(array('id' => $value['id']))->save(array('status' => 2, 'error_copy' => '操作失败'));
            }
        }
    }
}
