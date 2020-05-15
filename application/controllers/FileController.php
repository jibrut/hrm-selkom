<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class FileController extends CI_Controller{
	public function __construct()
	{
		parent::__construct();
		$this->load->model('JabatanModel');
		$this->load->helper('nominal');
		if (!$this->session->has_userdata('session_id')) {
			$this->session->set_flashdata('alert', 'belum_login');
			redirect(base_url('login'));
		}
	}

	public function index(){
		$data = array(
			'file' => $this->db->get('sigaka_file')->result_array(),
			'title' => 'Daftar File'
		);
		$this->load->view('templates/header',$data);
		$this->load->view('backend/file/index',$data);
		$this->load->view('templates/footer');
	}

	public function folder(){
		$data = array(
			'title' => 'Daftar File'
		);
		$this->load->view('templates/header',$data);
		$this->load->view('backend/file/folder',$data);
		$this->load->view('templates/footer');
	}

	public function download($file_name)
	{
		//$file = $back_dir.$_GET['nama_file'];
 		$file = "./upload/".$file_name;
		 if (file_exists($file))
		 {
			  header('Content-Description: File Transfer');
			  header('Content-Type: application/octet-stream');
			  header('Content-Disposition: attachment; filename='.basename($file));
			  header('Content-Transfer-Encoding: binary');
			  header('Expires: 0');
			  header('Cache-Control: private');
			  header('Pragma: private');
			  header('Content-Length: ' . filesize($file));
			  ob_clean();
			  flush();
			  readfile($file);
		  exit;
		 } else {
		 	redirect('fileController/folder');
		 }

	}

	public function tambah(){
		if($_POST){
			$config['upload_path'] = './upload/'; //path folder
	        $config['allowed_types'] = '*'; 
	 
	        $this->load->library('upload');
	        $this->upload->initialize($config);
	        for ($i=1; $i <=5 ; $i++) { 
	            if(!empty($_FILES['filename'.$i]['name'])){
	                if(!$this->upload->do_upload('filename'.$i))
	                	echo $this->upload->display_errors(); 
	                echo $this->upload->data('file_name'); 

	            }
	        }
	        //redirect('file/tambah');
		}else{
			$data = array(
				'title' => 'Upload File'
			);
			$this->load->view('templates/header',$data);
			$this->load->view('backend/file/tambah',$data);
			$this->load->view('templates/footer');
		}
	}


}