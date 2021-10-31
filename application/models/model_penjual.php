<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_penjual extends CI_Model
{
    private $user = 'tb_user';

    public function insert_penjual($data)
    {
        return $this->db->insert($this->user, $data);
    }
}

/* End of file Model_penjual.php */
