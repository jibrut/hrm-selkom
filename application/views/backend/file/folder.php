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
				<h1 style="text-align: center">Daftar File</h1>
				<?php if ($this->session->userdata('session_hak_akses') == 'manajer'):?>
				<a href="<?php echo base_url('file/tambah') ?>" 
					class="btn btn-primary btn-bg-gradient-x-purple-blue box-shadow-2"> 
					<i class="ft-plus-circle"></i> Tambah File</a>

				<?php endif?>
			</div>
			<div class="card-body">

			<table class="table table-bordered zero-configuration" >

			<tr>
				<th>No</th>
				<th>File Name</th>
				<th>Type</th>
				<th>Delete</th>
			</tr>
			<?php
			$no = 1;
			if ($handle = opendir('./upload/'))
			{   while (false !== ($file = readdir($handle)))
		    {   if($file!=="." && $file !=="..")
		    	{   
		    	echo "<tr><td>" . $no++ . '</td>';
		    	echo "<td><a href=\"download/" . urlencode($file). "\">$file</a></td>";
		        
		        echo "<td>" . pathinfo("files/".$file, PATHINFO_EXTENSION) . ' file </td>';
		        echo "<td><a href=\"hapus.php?id=$file\">Delete</a></td></tr>";
		        }
		    }
		    closedir($handle);
			}
			?>
			</table>

		</div>
		</div>
	</div>
</div>


