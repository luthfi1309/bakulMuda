<?php

class model_kategori extends CI_Model{
  public function data_elektronik()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'elektronik '));
  }

  public function data_pakaian_pria()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'pakaian pria '));
  }

  public function data_pakaian_wanita()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'pakaian wanita'));
  }

  public function data_peralatan_olahraga()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'peralatan olahraga'));
  }

  public function data_makanan()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'makanan'));
  }

  public function data_accessories()
  {
    $this->db->get_where("tb_barang",array('kategori' =>
    'accessories'));
  }
}