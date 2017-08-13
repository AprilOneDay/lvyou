<?php
defined('IN_PHPCMS') or exit('No permission resources.');
class index
{
	public function kc()
	{
		if($_GET['type'] == 'add')
		{
			header('location:/admin/kcgl_zjkc.php');
		}
		if($_GET['type'] == 'edit')
		{
			header('location:/admin/kcgl_xgkc.php');
		}
		if($_GET['type'] == 'del' )
		{
			header('location:/admin/kcgl_sckc.php');
		}
	}
	public function kj()
	{
		if($_GET['type'] == 'add')
		{
			header('location:/admin/kjgl_zjkj.php');
		}
		if($_GET['type'] == 'edit')
		{
			header('location:/admin/kjgl_xgkj.php');
		}
		if($_GET['type'] == 'del' )
		{
			header('location:/admin/kjgl_sckj.php');
		}
	}
	public function st()
	{
		if($_GET['type'] == 'add')
		{
			header('location:/admin/stgl_zjst.php');
		}
		if($_GET['type'] == 'edit')
		{
			header('location:/admin/stgl_xgst.php');
		}
		if($_GET['type'] == 'del' )
		{
			header('location:/admin/stgl_scst.php');
		}
	} 
	
	public function tj()
	{
		if($_GET['type'] == 'zftj')
		{
			header('location:/admin/xftj_zftj.php');
		}
		if($_GET['type'] == 'mxtj')
		{
			header('location:/admin/xftj_mxtj.php');
		}
		if($_GET['type'] == 'cxtj' )
		{
			header('location:/admin/xftj_cxtj.php');
		}
	} 
	
	public function sys()
	{
		if($_GET['type'] == 'xtzt')
		{
			header('location:/admin/xtgl_xtzt.php');
		}
		if($_GET['type'] == 'sdkg')
		{
			header('location:/admin/xtgl_sdkg.php');
		}
		if($_GET['type'] == 'zdkg' )
		{
			header('location:/admin/xtgl_zdkg.php');
		}
		if($_GET['type'] == 'jb' )
		{
			header('location:/admin/xtgl_jb.php');
		}
	} 
	
	public function member()
	{
		if($_GET['type'] == 'sh')
		{
			header('location:/admin/shhy.php');
		}
		if($_GET['type'] == 'list')
		{
			header('location:/admin/yhgl_ckyh.php');
		}
		if($_GET['type'] == 'del')
		{
			header('location:/admin/yhgl_scyh.php');
		}

	}

	public function fxm()
	{
		if($_GET['type'] == 'lr')
		{
			header('location:/admin/xflr.php');
		}
		if($_GET['type'] == 'list')
		{
			header('location:/admin/xflr_list.php');
		}
	}

    public function time()
    {
        if($_GET['type'] == 'xs')
        {
            header('location:/admin/xs.php');
        }
    }
}