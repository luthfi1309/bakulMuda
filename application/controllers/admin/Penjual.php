<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Penjual extends CI_Controller
{
    public function __construct()
    {
        parent::__construct();
        //Do your magic here
    }

    public function index()
    {
        $data = [];

        $this->load->view('templates_admin/header');
        $this->load->view('templates_admin/sidebar');
        $this->load->view('admin/data_penjual', $data);
        $this->load->view('templates_admin/footer');
    }
}

/* End of file Penjual.php */
