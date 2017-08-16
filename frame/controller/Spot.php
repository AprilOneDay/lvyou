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

        $this->assign('data', $data);
        $this->show('/spot/index');
    }

    public function addComment()
    {

    }
}
