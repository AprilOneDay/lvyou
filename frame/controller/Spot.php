<?php
//课程管理
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
        $field            = "$tm.title,$tm.id,$tm.type,$td.content,$td.traffic,$td.album";

        $data            = table('map')->join($td, "$td.id = $tm.id", 'left')->where($map)->field($field)->find();
        $data['album']   = json_decode($data['album'], true);
        $data['comment'] = table('comment_data')->where(array('commentid' => $id, 'status' => 1))->field('content')->find('one', true);

        $this->assign('id', $id);
        $this->assign('data', $data);
        $this->show('/spot/index');
    }

    /**
     * 增加评价 印象
     * @date   2017-08-16T21:04:35+0800
     * @author ChenMingjiang
     */
    public function addComment()
    {
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
    }
}
