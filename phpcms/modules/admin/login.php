<?php
class login {
    public function __construct()
    {
        $session_storage = 'session_' . pc_base::load_config('system', 'session_storage');
        pc_base::load_sys_class($session_storage);

        $this->db = pc_base::load_model('admin_model');
        $this->menu_db = pc_base::load_model('menu_model');
        $this->panel_db = pc_base::load_model('admin_panel_model');
    }

    public function index()
    {
        session_start();
       include_once($_SERVER['DOCUMENT_ROOT'].'/public/config/index.php');

        switch($_POST['oper'])
        {
            case 'read':
                $result=mysql_query('SELECT * FROM cqks_yh WHERE bh='.$_POST['bh']);
                $row=mysql_fetch_array($result);
                $response='<table>
                    <tr><th>编号：</th><td>'.$row['bh'].'</td></tr>
                    <tr><th>用户名：</th><td>'.$row['yhm'].'</td></tr>
                    <tr><th>姓名：</th><td>'.$row['xm'].'</td></tr>
                    <tr><th>性别：</th><td>'.$row['xb'].'</td></tr>
                    <tr><th>出生日期：</th><td>'.$row['csrq'].'</td></tr>
                    <tr><th>身份证：</th><td>'.$row['sfz'].'</tr>
                    <tr><th>最高学历：</th><td>'.$row['xl'].'</td></tr>
                    <tr><th>所在省份：</th><td>'.$row['sf'].'</td></tr>
                    <tr><th>所在城市：</th><td>'.$row['cs'].'</td></tr>
                    <tr><th>所在区县：</th><td>'.$row['qx'].'</td></tr>
                    <tr><th>所属医院：</th><td>'.$row['yy'].'</td></tr>
                    <tr><th>所在科室：</th><td>'.$row['ks'].'</td></tr>
                    <tr><th>您的职称：</th><td>'.$row['zc'].'</td></tr>
                    <tr><th>联系地址：</th><td>'.$row['dz'].'</td></tr>
                    <tr><th>联系电话：</th><td>'.$row['dh'].'</td></tr>
                    </table>';
                echo $response;
                break;
            case 'login':

                unset($_SESSION['yh']);
                $_POST['yzm'] = trim($_POST['yzm']);
                if( ( $_SESSION['code'] != $_POST['yzm'] ) || $_POST['yzm'] == '' )
                {
                    $response['error'] = '验证码有误,请从新输入'.$_SESSION['code'];
                }else {
                    $row = $do->M('cqks_yh')->W(' yhm="'.$_POST['yhm'].'" AND mm="'.$_POST['mm'].'" AND js=0')->find();
                    //$result=$this->db->get_one('yhm="'.$_POST['yhm'].'" AND mm="'.$_POST['mm'].'" AND js=0','*');
                    //print_r($row);
                    if ($row != '-1') {
                        //$row = mysql_fetch_array($result);
                        //print_r($row);
                        if ($row['audit'] == '-1') {
                            $response['error'] = '你的账号还在审核中，现无法登陆和使用学习和考试功能。联系电话：023-89068580';
                        } else {
                            $yh = new stdClass();
                            $yh->bh = $row['bh'];
                            $yh->yhm = $row['yhm'];
                            $yh->mm = $row['mm'];
                            $yh->js = $row['js'];
                            $yh->xm = $row['xm'];
                            $yh->yy = $row['yy'];
                            $yh->sfz = $row['sfz'];
                            $yh->sf = $row['sf'];
                            $yh->cs = $row['cs'];
                            $yh->qx = $row['qx'];
                            $yh->csrq = $row['csrq'];
                            $yh->xb = $row['xb'];
                            $yh->xl = $row['xl'];
                            $yh->dz = $row['dz'];
                            $yh->dh = $row['dh'];
                            $yh->zc = $row['zc'];
                            $yh->ks = $row['ks'];
                            $yh->studyTime = $row['studyTime'];
                            $yh->studyYear = $row['studyYear'];
                            $_SESSION['yh'] = $yh;
                            $response['error']='登录成功。';
                        }
                    } else {
                        $response['error'] = '登录失败，用户名或密码错误。';
                    }
                }
                echo @json_encode($response);
                break;	case 'exit':
            unset($_SESSION['yh']);
            break;
        }

    }
}