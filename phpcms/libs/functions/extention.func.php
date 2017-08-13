<?php
/**
 *  extention.func.php 用户自定义函数库
 *
 * @copyright			(C) 2005-2010 PHPCMS
 * @license				http://www.phpcms.cn/license/
 * @lastmodify			2010-10-27
 */
function kj($value)
{
    $db = pc_base::load_model('content_model');
    $db->table_name = 'cqks_kc';
    $res = $db->select();
    $srt = "<select name=\"info[kj]\" id=\"kj\" >";
    foreach ($res as $v) {
        if($value == $v['mc'] )
        {
            $srt.="<option value='{$v['mc']}' selected>{$v['mc']}</option>";
        }
        else{
            $srt.="<option value='{$v['mc']}'>{$v['mc']}</option>";
        }
    }
    $srt.="</select>";
    return $srt;
}
?>