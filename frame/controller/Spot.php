<?php
//景区管理
class Spot extends base
{
    public function index()
    {
        $id = get('id', 'intval', 0);

        if (!$id) {
            header('location:/frame/index.php');
        }

        $td = table('map_data')->tableName();
        $tm = table('map')->tableName();

        $map[$tm . '.id'] = $id;
        $field            = "$tm.title,$tm.id,$tm.type,$tm.address,$tm.go,$tm.lng,$tm.lat,$tm.catid,$td.content,$td.traffic,$td.album,$td.mp3";

        $data            = table('map')->join($td, "$td.id = $tm.id", 'left')->where($map)->field($field)->find();
        $data['album']   = json_decode($data['album'], true);
        $data['mp3']     = json_decode($data['mp3'], true);
        $data['comment'] = table('comment_data')->where(array('commentid' => $id, 'status' => 1))->field('content')->find('one', true);

        $wx = puls('weixin.jssdk', 'JSSDK');

        $this->assign('wx', $wx->getSignPackage());
        $this->assign('id', $id);
        $this->assign('data', $data);

        if ($data['type'] == 2) {
            $this->show('/spot/index');
        } else {
            $this->show('/spot/detail');
        }

    }

    public function showMap()
    {
        $id   = get('id', 'intval', 0);
        $type = get('type', 'intval', 0);

        $data = table('map')->where(array('id' => $id))->field('title,spot_id,map_url')->find();
        if (IS_POST || get('debug', 'intval') == 1) {
            $map['catid'] = $data['spot_id'];
            if ($type) {
                $map['type'] = $type;
            }
            $field = "thumb,title,lng,lat,id,background";
            $list  = table('map')->where($map)->field($field)->find('array');

            foreach ($list as $key => $value) {
                $list[$key]['url']        = '/frame/index.php?c=spot&id=' . $value['id'];
                $list[$key]['background'] = $value['background'] ? $value['background'] : '/static/images/mark_roundns.png';
            }

            $this->ajaxReturn(array('status' => true, 'msg' => '提交成功', data => $list));
        } else {
            if (!$data['spot_id']) {
                header('location:/frame/index.php');
            }

            $this->assign('type', $type);
            $this->assign('id', $id);
            $this->assign('data', $data);
            $this->show('/spot/map');
        }

    }

    /**
     * 增加评价 印象
     * @date   2017-08-16T21:04:35+0800
     * @author ChenMingjiang
     */
    public function addComment()
    {
        if (IS_POST) {
            $content = post('content', 'text', '');
            $id      = post('id', 'intval', 0);

            if (!$id) {
                $this->ajaxReturn(array('status' => false, 'msg' => '参数错误'));
            }

            if (!$content) {
                $this->ajaxReturn(array('status' => false, 'msg' => '请添加内容'));
            }

            $data['commentid'] = $id;
            $data['siteid']    = 1;
            $data['creat_at']  = TIME;
            $data['ip']        = getIP();
            $data['status']    = 1;
            $data['userid']    = 0;
            $data['support']   = 0;
            $data['content']   = $content;

            $isComment = table('comment_data')->where(array('commentid' => $id, 'content' => $content))->find();

            if (!$isComment) {
                $reslut = table('comment_data')->add($data);
            }

            $this->ajaxReturn(array('status' => true, 'msg' => '提交成功'));
        } else {
            $id = get('id', 'intval', 0);

            if (!$id) {
                header('location:/frame/index.php');
            }

            $td = table('map_data')->tableName();
            $tm = table('map')->tableName();

            $map[$tm . '.id'] = $id;
            $field            = "$tm.title,$tm.id,$tm.type,$td.content,$td.traffic,$td.album";

            $data            = table('map')->join($td, "$td.id = $tm.id", 'left')->where($map)->field($field)->find();
            $data['album']   = json_decode($data['album'], true);
            $data['comment'] = table('comment_data')->where(array('commentid' => $id, 'status' => 1))->field('content,creat_at')->find('array');

            $this->assign('id', $id);
            $this->assign('data', $data);
            $this->show('/spot/comment');
        }
    }

    //点击增加去过次数
    public function addRunHot()
    {
        $id         = get('id', 'intval', 0);
        $data['go'] = array('add', 1);
        table('map')->where(array('id' => $id))->save($data);
        echo table('map')->getSql();
    }
}
