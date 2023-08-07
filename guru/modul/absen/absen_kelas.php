<?php
// tampilkan data mengajar
$kelasMengajar = mysqli_query($con, "SELECT * FROM tb_mengajar 
INNER JOIN tb_master_mapel ON tb_mengajar.id_mapel=tb_master_mapel.id_mapel
INNER JOIN tb_mkelas ON tb_mengajar.id_mkelas=tb_mkelas.id_mkelas
INNER JOIN tb_semester ON tb_mengajar.id_semester=tb_semester.id_semester
INNER JOIN tb_thajaran ON tb_mengajar.id_thajaran=tb_thajaran.id_thajaran
WHERE tb_mengajar.id_guru='$data[id_guru]' AND tb_mengajar.id_mengajar='$_GET[pelajaran]'  AND tb_thajaran.status=1  ");

foreach ($kelasMengajar as $d)

?>

<div class="page-inner">
	<div class="page-header">
		<ul class="breadcrumbs" style="font-weight: bold;">
			<li class="nav-home">
				<a href="#">
					<i class="flaticon-home"></i>
				</a>
			</li>
			<li class="separator">
				<i class="flaticon-right-arrow"></i>
			</li>
			<li class="nav-item">
				<a href="#">KELAS (<?= strtoupper($d['nama_kelas']) ?> )</a>
			</li>
			<li class="separator">
				<i class="flaticon-right-arrow"></i>
			</li>
			<li class="nav-item">
				<a href="#"><?= strtoupper($d['mapel']) ?></a>
			</li>
		</ul>
	</div>

	<div class="row">
		<?php
		// dapatkan pertemuan terakhir di tb izin
		$last_pertemuan = mysqli_query($con, "SELECT MAX(id_presensi) AS last_id_presensi FROM _logabsensi WHERE id_mengajar='$_GET[pelajaran]' GROUP BY pertemuan_ke ORDER BY pertemuan_ke DESC LIMIT 1");
		$cekPertemuan = mysqli_num_rows($last_pertemuan);
		$jml = mysqli_fetch_array($last_pertemuan);

		if ($cekPertemuan > 0) {
			$pertemuan = $jml['pertemuan_ke'] + 1;
		} else {
			$pertemuan = 1;
		}
		?>

		<div class="card">
			<div class="card-body">
				<form action="" method="post">
					<p>
						<span class="badge badge-default" style="padding: 7px;font-size: 14px;"><b>Daftar Hadir SANTRI</b></span>
						<!-- <span class="badge badge-primary" style="padding: 7px;font-size: 14px;">Pertemuan Ke : <b><?= $pertemuan; ?></b></span> -->
					</p>

					<div class="card-list">
						<input type="date" name="tgl" class="form-control" value="<?= date('Y-m-d') ?>" style="background-color: #0071e1 ;color: #ffffff ;">

						<label for="pertemuan_ke">Pertemuan Ke:</label>
						<input type="number" name="pertemuan_ke" class="form-control" value="<?= $pertemuan; ?>" min="1">

						<input type="hidden" name="pertemuan" class="form-control" value="<?= $pertemuan; ?>">

						<?php
						// tampilkan data siswa berdasarkan kelas yang dipilih
						$siswa = mysqli_query($con, "SELECT * FROM tb_siswa WHERE id_mkelas='$d[id_mkelas]' ORDER BY id_siswa ASC ");
						$jumlahSiswa = mysqli_num_rows($siswa);
						foreach ($siswa as $i => $s) { ?>

							<div class="item-list">
								<div class="info-user">
									<div class="username">
										<b class="text-success"><?= $s['nama_siswa'] ?></b>
										<input type="hidden" name="id_siswa-<?= $i; ?>" value="<?= $s['id_siswa'] ?>">
										<input type="hidden" name="pelajaran" value="<?= $_GET['pelajaran'] ?>">
									</div>
									<div class="status mt-0">
										<div class="form-check">
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="H">
												<span class="form-check-sign">H</span>
											</label>
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="S">
												<span class="form-check-sign">S</span>
											</label>
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="I">
												<span class="form-check-sign">I</span>
											</label>
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="T">
												<span class="form-check-sign">T</span>
											</label>
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="A">
												<span class="form-check-sign">A</span>
											</label>
											<label class="form-check-label">
												<input name="ket-<?= $i; ?>" class="form-check-input" type="checkbox" value="C">
												<span class="form-check-sign">C</span>
											</label>
										</div>
									</div>
								</div>
							</div>
						<?php } ?>
					</div>
					<center>
						<button type="submit" name="absen" class="btn btn-success">
							<i class="fa fa-check"></i> Selesai
						</button>

						<a href="?page=absen&act=update&pelajaran=<?= $_GET['pelajaran']; ?>" class="btn btn-warning"><i class="fas fa-edit"></i> Update Absesnsi</a>
					</center>
				</form>

				<?php
				if (isset($_POST['absen'])) {
					$total = $jumlahSiswa - 1;
					$today = $_POST['tgl'];
					$pertemuan_ke = (int)$_POST['pertemuan_ke'];

					for ($i = 0; $i <= $total; $i++) {
						$id_siswa = $_POST['id_siswa-' . $i];
						$pelajaran = $_POST['pelajaran'];
						$ket = $_POST['ket-' . $i];

						$cekAbsenHariIni = mysqli_num_rows(mysqli_query($con, "SELECT * FROM _logabsensi WHERE tgl_absen='$today' AND id_mengajar='$pelajaran' AND id_siswa='$id_siswa' "));

						if ($cekAbsenHariIni > 0) {
							echo "
								<script type='text/javascript'>
									setTimeout(function () { 
										swal('Sorry!', 'Absen Hari ini sudah dilakukan', {
											icon : 'error',
											buttons: {        			
												confirm: {
													className : 'btn btn-danger'
												}
											},
										});    
									}, 10);  
									window.setTimeout(function(){ 
										window.location.replace('?page=absen&pelajaran=$_GET[pelajaran]');
									}, 3000);   
								</script>";
						} else {
							$insert = mysqli_query($con, "INSERT INTO _logabsensi VALUES (NULL,'$pelajaran','$id_siswa','$today','$ket','$pertemuan_ke')");

							if ($insert) {
								echo "
									<script type='text/javascript'>
										setTimeout(function () { 
											swal('Berhasil', 'Absen hari ini telah tersimpan!', {
												icon : 'success',
												buttons: {        			
													confirm: {
														className : 'btn btn-success'
													}
												},
											});    
										}, 10);  
										window.setTimeout(function(){ 
											window.location.replace('?page=absen&pelajaran=$_GET[pelajaran]');
										}, 3000);   
									</script>";
							}
						}
					}
				}
				?>
			</div>
		</div>
	</div>
</div>