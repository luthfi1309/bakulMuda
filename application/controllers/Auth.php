<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Auth extends CI_Controller
{

  public function __construct()
  {
    parent::__construct();
    $this->load->model('model_auth');
  }


  public function index()
  {
    $this->load->view('templates/header');
    $this->load->view('form_login');
    $this->load->view('templates/footer');
  }

  public function login()
  {
    // $this->form_validation->set_rules('username', '
    // Username', 'required', ['required' => 'Username wajib diisi!']);
    // $this->form_validation->set_rules('password', '
    // Password', 'required', ['required' => 'Password wajib diisi!']);

    // if ($this->form_validation->run() == FALSE) {
    //   $this->load->view('templates/header');
    //   $this->load->view('form_login');
    //   $this->load->view('templates/footer');
    // } else {
    $username = $this->input->post('username');
    $password = $this->input->post('password');

    if ($this->model_auth->cek_login($username, $password)) {
      if ($this->session->userdata('role_id') == 1) {
        redirect('0/dashboard');
      } elseif ($this->session->userdata('role_id') == 2) {
        redirect('1/dashboard');
      }
    } else {
      $this->session->set_flashdata('pesan', '<div class="alert alert-danger alert-dismissible fade show" role="alert">
        Username atau Password Anda Salah!
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>');
      redirect('Auth');
    }
    // }
  }

  public function logout()
  {
    $this->session->sess_destroy();
    redirect('Auth');
  }
}
