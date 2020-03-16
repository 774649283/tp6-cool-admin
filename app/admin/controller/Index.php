<?php
/*
 * @Descripttion:
 * @version:
 * @Author: wzs
 * @Date: 2020-03-11 20:17:06
 * @LastEditors: wzs
 * @LastEditTime: 2020-03-14 20:26:32
 */
declare (strict_types = 1);

namespace app\admin\controller;

use app\common\controller\AdminBase;
use app\common\core\interfaces\InterfaceAdminController;
use app\Request;
use think\App;

class Index extends AdminBase implements InterfaceAdminController
{
    public function __construct()
    {
        parent::__construct();
    }

    public function index(Request $request)
    {
        // $this->assign('version', App::VERSION);
        return view('', [
            'version' => App::VERSION,
            'disk' => $this->getDisk(),
        ]);
    }

    public function getDisk()
    {

        return $disk = round(100 - disk_free_space($_SERVER['DOCUMENT_ROOT']) / disk_total_space($_SERVER['DOCUMENT_ROOT']) * 100, 2);
    }

    public function getsysinfo()
    {
        if (php_uname('s') == 'Windows NT') {
            $type = input('type');
            $info = new SysInfo();
            $memory = memory_get_peak_usage();
            $cpu = 0;
        } else {
            $status = $this->get_used_status();
            $cpu = $status['cpu_usage'];
            $memory['usage'] = $status['mem_usage'];
            // dump($status);
        }

        if ($memory) {
            cookie('memory', $memory['usage']);
        }
        if ($cpu) {
            cookie('cpu', $cpu);
        }
        $data['cpu'] = round(cookie('cpu'));
        $data['memory'] = round(cookie('memory'));
        echo json_encode($data);
    }

    public function get_used_status()
    {
        $fp = popen('top -b -n 1', "r"); //获取某一时刻系统cpu和内存使用情况
        $rs = "";
        while (!feof($fp)) {
            //dump(fgets($fp));
            $rs .= fread($fp, 1024);
        }
        pclose($fp);
        $sys_info = explode("\n", $rs);
        $tast_info = explode(",", $sys_info[1]); //进程 数组
        $cpu_info = explode(",", $sys_info[2]); //CPU占有量  数组
        $mem_info = explode(",", $sys_info[3]); //内存占有量 数组

        //正在运行的进程数
        $tast_running = trim(trim($tast_info[1], 'running'));

        //CPU占有量
        $cpu_usage = floatval(explode(':', str_replace(' ', '', $cpu_info[0]))[1]); //百分比

        //内存占有量
        $mem_total = explode(':', str_replace(' ', '', $mem_info[0]))[1];

        $mem_used = str_replace('k used', '', $mem_info[1]);
        $mem_usage = round(100 * intval($mem_used) / intval($mem_total), 2); //百分比
        // dump($cpu_info);

        /*硬盘使用率 begin*/
        $fp = popen('df -lh | grep -E "^(/)"', "r");
        $rs = fread($fp, 1024);
        pclose($fp);
        $rs = preg_replace("/\s{2,}/", ' ', $rs); //把多个空格换成 “_”
        $hd = explode(" ", $rs);
        $hd_avail = trim($hd[3], 'G'); //磁盘可用空间大小 单位G
        $hd_usage = trim($hd[4], '%'); //挂载点 百分比
        //print_r($hd);
        /*硬盘使用率 end*/

        //检测时间
        $fp = popen("date +\"%Y-%m-%d %H:%M\"", "r");
        $rs = fread($fp, 1024);
        pclose($fp);
        $detection_time = trim($rs);

        /*获取IP地址  begin*/
        /*
        $fp = popen('ifconfig eth0 | grep -E "(inet addr)"','r');
        $rs = fread($fp,1024);
        pclose($fp);
        $rs = preg_replace("/\s{2,}/",' ',trim($rs));  //把多个空格换成 “_”
        $rs = explode(" ",$rs);
        $ip = trim($rs[1],'addr:');
         */
        /*获取IP地址 end*/
        /*
        $file_name = "/tmp/data.txt"; // 绝对路径: homedata.dat
        $file_pointer = fopen($file_name, "a+"); // "w"是一种模式，详见后面
        fwrite($file_pointer,$ip); // 先把文件剪切为0字节大小， 然后写入
        fclose($file_pointer); // 结束
         */

        return array('cpu_usage' => $cpu_usage, 'mem_usage' => $mem_usage, 'hd_avail' => $hd_avail, 'hd_usage' => $hd_usage, 'tast_running' => $tast_running, 'detection_time' => $detection_time);
    }

    public function form(Request $request)
    {
        // TODO: Implement form() method.
    }

    public function save(Request $request)
    {
        // TODO: Implement save() method.
    }

    public function del(Request $request)
    {
        // TODO: Implement del() method.
    }

    public function state(Request $request)
    {
        // TODO: Implement del() method.
    }

    public function sort(Request $request)
    {
        // TODO: Implement del() method.
    }
}
