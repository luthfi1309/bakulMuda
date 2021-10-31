<?php

class Registrasi extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('model_penjual', 'penjual');
  }

  public function index()
  {
    $this->form_validation->set_rules(
      'nama',
      'Nama',
      'required',
      ['required' => 'Wajib diisi!']
    );
    $this->form_validation->set_rules(
      'username',
      'Username',
      'required',
      ['required' => 'Usernama Wajib diisi!']
    );
    $this->form_validation->set_rules(
      'password_1',
      'Password',
      'required|matches[password_2]',
      ['required' => 'Password Wajib diisi', 'matches' => "Password tidak cocok"]
    );
    $this->form_validation->set_rules('password_2', 'Password', 'required|matches[password_1]');

    if ($this->form_validation->run() == FALSE) {
      $this->load->view('templates/header');
      $this->load->view('registrasi');
      $this->load->view('templates/footer');
    } else {
      $input = $this->input->post();
      $data = array(
        'id'        => '',
        'nama'      => $this->input->post('nama'),
        'username'  => $this->input->post('username'),
        'password'  => hash('sha512', $input['password_1'] . config_item('encryption_key')),
        'role_id'   => 2,
        // 'status'    => 0,
        'created_at' => date("Y-m-d H:i:s")
      );

      // var_dump($data);
      // die();
      $this->penjual->insert_penjual($data);
      redirect('auth');
    }
  }
}
