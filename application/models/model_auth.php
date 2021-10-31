<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Model_auth extends CI_Model
{
  private $user = 'tb_user';

  /**
   * @param bool
   */
  public function cek_login($username, $password): bool
  {
    $password = $this->hash($password);
    $this->db->where('username', $username);
    $this->db->where('password', $password);
    $query = $this->db->get('tb_user');
    if ($query->num_rows() == 1) {
      foreach ($query->result() as $row) {
        $data = [
          'uid'           => $row->id,
          'nama'           => $row->nama,
          'username'      => $row->username,
          'role_id'          => $row->role_id,
          // 'rolename'         => $row->role_id == 1 ? 'Administrator' : 'Penjual',
          // 'isLoggon'     => true,
          // 'isAdmin'       => $row->role_id == 1 ? true : false,
          // 'isPenjual' => $row->role_id == 2 ? true : false
        ];
      }
      $this->session->set_userdata($data);
      return TRUE;
    } else {
      return FALSE;
    }
  }

  public function hash($string)
  {
    return hash('sha512', $string . config_item('encryption_key'));
  }
}
