<div class="row">
	<div class="col-md-12">
		<div class="card">
			<?php
			if ($this->session->flashdata('alert') == 'tambah_jabatan'):
				?>
				<div class="alert alert-success alert-dismissible animated fadeInDown" id="feedback" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Data berhasil ditambahkan
				</div>
			<?php
			elseif ($this->session->flashdata('alert') == 'update_jabatan'):
				?>
				<div class="alert alert-success alert-dismissible animated fadeInDown" id="feedback" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Data berhasil diupdate
				</div>
			<?php
			elseif ($this->session->flashdata('alert') == 'hapus_jabatan'):
				?>
				<div class="alert alert-danger alert-dismissible animated fadeInDown" id="feedback" role="alert">
					<button type="button" class="close" data-dismiss="alert" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					Data berhasil dihapus
				</div>
			<?php
			endif;
			?>
			<div class="card-header">
				<h1 style="text-align: center">
					<button class="btn btn-primary btn-bg-gradient-x-purple-blue box-shadow-2">Upload File</button> </h1>
			</div>
			<div class="card-body">


			<form action="<?php echo base_url().'FileController/tambah'?>" method="post" enctype="multipart/form-data">
				<?php for ($i=1; $i <=5 ; $i++) :?>

				    <div class="form-group">
				      <label for="inputEmail4">Upload</label>
				      <input type="file" name="filename<?php echo $i ?>" class="form-control">
				  	</div>

				<?php endfor; ?>


				<div class="form-group">
					<input type="reset" class="btn btn-secondary btn-bg-gradient-x-red-pink" data-dismiss="modal" value="Tutup">
					<input type="submit" class="btn btn-primary btn-bg-gradient-x-blue-cyan" name="simpan" value="Simpan">
				</div>
			</form>





			</div>
		</div>
	</div>
</div>

