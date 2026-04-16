<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">
    <title>GoAbs - Absensi Digital Berbasis Parentis</title>
    <link rel="icon" type="image/x-icon" href="favicon.ico">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Inter:opsz,wght@14..32,300;14..32,400;14..32,500;14..32,600;14..32,700;14..32,800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Inter', sans-serif;
            background: #f8fafc;
            color: #1e293b;
            line-height: 1.5;
            scroll-behavior: smooth;
        }

        /* Warna tema utama */
        :root {
            --primary-start: #667eea;
            --primary-end: #764ba2;
            --primary: #667eea;
            --primary-dark: #5a67d8;
            --gray-light: #f1f5f9;
            --gray: #e2e8f0;
            --text-dark: #1e293b;
            --text-muted: #64748b;
        }

        .bg-gradient {
            background: linear-gradient(135deg, var(--primary-start), var(--primary-end));
        }

        .btn-primary {
            background: linear-gradient(135deg, var(--primary-start), var(--primary-end));
            color: white;
            border: none;
            padding: 12px 28px;
            border-radius: 40px;
            font-weight: 600;
            font-size: 1rem;
            cursor: pointer;
            transition: transform 0.2s, box-shadow 0.2s;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 8px 20px rgba(102, 126, 234, 0.3);
        }

        .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
        }

        .btn-outline {
            background: transparent;
            border: 2px solid white;
            color: white;
            padding: 10px 24px;
            border-radius: 40px;
            font-weight: 600;
            transition: all 0.2s;
        }

        .btn-outline:hover {
            background: rgba(255,255,255,0.2);
            transform: translateY(-2px);
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 0 24px;
        }

        /* Header */
        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 0;
            flex-wrap: wrap;
            gap: 20px;
        }

        .logo {
            font-size: 28px;
            font-weight: 800;
            background: linear-gradient(135deg, var(--primary-start), var(--primary-end));
            -webkit-background-clip: text;
            background-clip: text;
            color: transparent;
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .logo img {
            height: 32px;
        }

        .nav-links {
            display: flex;
            gap: 32px;
            align-items: center;
            flex-wrap: wrap;
        }

        .nav-links a {
            text-decoration: none;
            color: var(--text-dark);
            font-weight: 500;
            transition: color 0.2s;
        }

        .nav-links a:hover {
            color: var(--primary);
        }

        /* Hero */
        .hero {
            padding: 60px 0 80px;
        }

        .hero-grid {
            display: flex;
            align-items: center;
            gap: 48px;
            flex-wrap: wrap;
        }

        .hero-content {
            flex: 1;
            min-width: 280px;
        }

        .hero-badge {
            background: rgba(102,126,234,0.1);
            color: var(--primary);
            padding: 6px 14px;
            border-radius: 40px;
            font-size: 0.85rem;
            font-weight: 600;
            display: inline-block;
            margin-bottom: 20px;
        }

        .hero-content h1 {
            font-size: 3rem;
            font-weight: 800;
            line-height: 1.2;
            margin-bottom: 20px;
        }

        .hero-content p {
            font-size: 1.1rem;
            color: var(--text-muted);
            margin-bottom: 30px;
        }

        .hero-stats {
            display: flex;
            gap: 32px;
            margin-top: 40px;
        }

        .stat-item h3 {
            font-size: 1.8rem;
            font-weight: 800;
            color: var(--primary);
        }

        .hero-image {
            flex: 1;
            text-align: center;
        }

        .hero-image img {
            max-width: 100%;
            border-radius: 190px;
            box-shadow: 0 25px 50px -12px rgba(0,0,0,0.25);
        }

        /* Section umum */
        .section {
            padding: 80px 0;
        }

        .section-title {
            text-align: center;
            font-size: 2.2rem;
            font-weight: 700;
            margin-bottom: 48px;
        }

        .section-subtitle {
            text-align: center;
            color: var(--text-muted);
            max-width: 700px;
            margin: -30px auto 50px;
        }

        /* Fitur Grid */
        .features-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 32px;
        }

        .feature-card {
            background: white;
            border-radius: 28px;
            padding: 28px;
            box-shadow: 0 10px 25px -5px rgba(0,0,0,0.05);
            transition: transform 0.2s;
            text-align: center;
        }

        .feature-card:hover {
            transform: translateY(-8px);
        }

        .feature-icon {
            width: 70px;
            height: 70px;
            background: linear-gradient(135deg, var(--primary-start), var(--primary-end));
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 20px;
        }

        .feature-icon i {
            font-size: 32px;
            color: white;
        }

        .feature-card h3 {
            font-size: 1.4rem;
            margin-bottom: 12px;
        }

        .feature-card p {
            color: var(--text-muted);
        }

        /* Paket harga */
        .pricing-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(240px, 1fr));
            gap: 30px;
            margin-top: 20px;
        }

        .pricing-card {
            background: white;
            border-radius: 32px;
            padding: 32px 20px;
            text-align: center;
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
            transition: all 0.2s;
            border: 1px solid var(--gray);
        }

        .pricing-card:hover {
            transform: scale(1.02);
            border-color: var(--primary);
        }

        .pricing-card.popular {
            border: 2px solid var(--primary);
            position: relative;
        }

        .popular-badge {
            position: absolute;
            top: -12px;
            left: 50%;
            transform: translateX(-50%);
            background: var(--primary);
            color: white;
            padding: 4px 16px;
            border-radius: 40px;
            font-size: 0.75rem;
            font-weight: 700;
        }

        .price {
            font-size: 2.5rem;
            font-weight: 800;
            color: var(--primary);
            margin: 20px 0;
        }

        .price span {
            font-size: 1rem;
            color: var(--text-muted);
        }

        .pricing-card ul {
            list-style: none;
            margin: 20px 0;
        }

        .pricing-card li {
            margin: 12px 0;
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 8px;
        }

        .pricing-card li i {
            color: #22c55e;
        }

        /* Testimoni */
        .testimonial-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 30px;
        }

        .testimonial-card {
            background: white;
            border-radius: 24px;
            padding: 28px;
            box-shadow: 0 5px 20px rgba(0,0,0,0.05);
        }

        .testimonial-text {
            font-style: italic;
            margin-bottom: 20px;
            color: var(--text-dark);
        }

        .testimonial-author {
            display: flex;
            align-items: center;
            gap: 12px;
        }

        .testimonial-author img {
            width: 48px;
            height: 48px;
            border-radius: 50%;
            object-fit: cover;
            background: var(--gray);
        }

        /* CTA */
        .cta {
            background: linear-gradient(135deg, var(--primary-start), var(--primary-end));
            border-radius: 48px;
            padding: 60px 40px;
            text-align: center;
            color: white;
        }

        .cta h2 {
            font-size: 2rem;
            margin-bottom: 16px;
        }

        .cta .btn-primary {
            background: white;
            color: var(--primary);
            box-shadow: none;
            margin-top: 20px;
        }

        .cta .btn-primary:hover {
            transform: translateY(-3px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.2);
        }

        /* Footer */
        .footer {
            background: #0f172a;
            color: #cbd5e1;
            padding: 40px 0;
            margin-top: 40px;
        }

        .footer a {
            color: #cbd5e1;
            text-decoration: none;
        }

        .footer a:hover {
            color: white;
        }

        /* Responsive */
        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }
            .hero-content h1 {
                font-size: 2.2rem;
            }
            .section {
                padding: 50px 0;
            }
            .section-title {
                font-size: 1.8rem;
            }
            .hero-stats {
                flex-wrap: wrap;
                gap: 20px;
            }
            .cta {
                padding: 40px 20px;
            }
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="container">
    <div class="navbar">
        <div class="logo">
            <img src="icon4.png" alt="logo" style="height: 32px;">
            <span>GoAbs</span>
        </div>
        <div class="nav-links">
            <a href="#fitur">Fitur</a>
            <a href="#harga">Harga</a>
            <a href="#testimoni">Testimoni</a>
            <a href="https://wa.me/6289609745090?text=Halo%20Admin%20GoAbs%2C%20saya%20tertarik%20mendaftar" target="_blank" class="btn-outline" style="border-color:var(--primary); color:var(--primary);">Hubungi Admin</a>
            <a href="index.html" class="btn-primary" style="padding: 8px 20px;">Login</a>
        </div>
    </div>
</nav>

<!-- Hero -->
<section class="hero">
    <div class="container hero-grid">
        <div class="hero-content">
            <div class="hero-badge"><i class="fas fa-mobile-alt"></i> Absensi Digital Terintegrasi</div>
            <h1>Absensi Digital <span class="bg-gradient" style="background: linear-gradient(135deg, #667eea, #764ba2); -webkit-background-clip: text; background-clip: text; color: transparent;">Berbasis Parentis</span></h1>
            <p>Catat kehadiran siswa dengan QR Code, kirim notifikasi real-time ke orang tua via Telegram, dan kelola laporan absensi dengan mudah.</p>
            <div class="hero-buttons" style="display: flex; gap: 16px; flex-wrap: wrap;">
                <a href="#harga" class="btn-primary"><i class="fas fa-rocket"></i> Mulai Rp. 10.000</a>
                <a href="#fitur" class="btn-outline" style="border-color: var(--primary); color: var(--primary);">Lihat Fitur</a>
            </div>
            <!-- Hero
            <div class="hero-stats">
                <div class="stat-item"><h3>500+</h3><p>Sekolah</p></div>
                <div class="stat-item"><h3>10rb+</h3><p>Siswa</p></div>
                <div class="stat-item"><h3>100rb+</h3><p>Absensi Tercatat</p></div>
            </div>
             -->
        </div>
        <div class="hero-image">
            <img src="icon4.png" alt="GoAbs Mockup">
            <!-- Ganti dengan gambar asli jika ada -->
        </div>
    </div>
</section>

<!-- Fitur Unggulan -->
<section id="fitur" class="section">
    <div class="container">
        <h2 class="section-title">Fitur Unggulan GoAbs</h2>
        <p class="section-subtitle">Semua yang Anda butuhkan untuk kelola absensi sekolah modern</p>
        <div class="features-grid">
            <div class="feature-card"><div class="feature-icon"><i class="fas fa-qrcode"></i></div><h3>Scan QR Code</h3><p>Siswa cukup scan QR, absensi langsung tercatat otomatis.</p></div>
            <div class="feature-card"><div class="feature-icon"><i class="fab fa-telegram"></i></div><h3>Notifikasi Parentis</h3><p>Orang tua terima pesan real-time via Telegram setiap anak absen.</p></div>
            <div class="feature-card"><div class="feature-icon"><i class="fas fa-chalkboard"></i></div><h3>Manajemen Mapel & Siswa</h3><p>Atur mata pelajaran, jadwal, toleransi, dan data siswa dengan mudah.</p></div>
            <div class="feature-card"><div class="feature-icon"><i class="fas fa-print"></i></div><h3>Laporan Lengkap</h3><p>Cetak rekap harian, mingguan, bulanan, semester dalam PDF atau CSV.</p></div>
            <div class="feature-card"><div class="feature-icon"><i class="fas fa-calendar-times"></i></div><h3>Hari Libur</h3><p>Setel tanggal libur, sistem otomatis nonaktifkan absensi.</p></div>
            <div class="feature-card"><div class="feature-icon"><i class="fas fa-database"></i></div><h3>Backup & Restore</h3><p>Cadangkan data terenkripsi dan pulihkan kapan saja.</p></div>
        </div>
    </div>
</section>

<!-- Paket Harga -->
<section id="harga" class="section" style="background: var(--gray-light);">
    <div class="container">
        <h2 class="section-title">Pilih Paket Sesuai Kebutuhan</h2>
        <p class="section-subtitle">Harga terjangkau, fitur lengkap. Mulai harga hanya 10rb!</p>
        <div class="pricing-grid">
            <div class="pricing-card"><h3>Mingguan</h3><div class="price">Rp10.000</div><ul><li><i class="fas fa-check-circle"></i> Semua fitur dasar</li><li><i class="fas fa-check-circle"></i> 1 Minggu akses</li><li><i class="fas fa-check-circle"></i> Support WhatsApp</li></ul><a href="https://wa.me/6289609745090?text=Saya%20minat%20paket%20Mingguan%20GoAbs" class="btn-primary" style="padding: 10px 20px; font-size: 0.9rem;">Pilih Paket</a></div>
            <div class="pricing-card popular"><div class="popular-badge">Paling Populer</div><h3>Bulanan</h3><div class="price">Rp30.000</div><ul><li><i class="fas fa-check-circle"></i> Semua fitur</li><li><i class="fas fa-check-circle"></i> 30 Hari akses</li><li><i class="fas fa-check-circle"></i> Prioritas support</li></ul><a href="https://wa.me/6289609745090?text=Saya%20minat%20paket%20Bulanan%20GoAbs" class="btn-primary" style="padding: 10px 20px;">Pilih Paket</a></div>
            <div class="pricing-card"><h3>Semester</h3><div class="price">Rp50.000</div><ul><li><i class="fas fa-check-circle"></i> Semua fitur</li><li><i class="fas fa-check-circle"></i> 180 Hari akses</li><li><i class="fas fa-check-circle"></i> Support prioritas</li></ul><a href="https://wa.me/6289609745090?text=Saya%20minat%20paket%20Semester%20GoAbs" class="btn-primary" style="padding: 10px 20px;">Pilih Paket</a></div>
            <div class="pricing-card"><h3>Tahunan</h3><div class="price">Rp90.000</div><ul><li><i class="fas fa-check-circle"></i> Semua fitur</li><li><i class="fas fa-check-circle"></i> 365 Hari akses</li><li><i class="fas fa-check-circle"></i> Support 24/7</li></ul><a href="https://wa.me/6289609745090?text=Saya%20minat%20paket%20Tahunan%20GoAbs" class="btn-primary" style="padding: 10px 20px;">Pilih Paket</a></div>
        </div>
    </div>
</section>

<!-- Testimoni 
<section id="testimoni" class="section">
    <div class="container">
        <h2 class="section-title">Apa Kata Guru Pengguna?</h2>
        <div class="testimonial-grid">
            <div class="testimonial-card"><div class="testimonial-text">“GoAbs sangat membantu saya memantau kehadiran siswa. Orang tua juga bisa tahu langsung jika anaknya tidak hadir. Praktis!”</div><div class="testimonial-author"><img src="https://randomuser.me/api/portraits/women/68.jpg" alt="avatar"><div><strong>Ibu Ratna</strong><br>Guru SDN 01 Jakarta</div></div></div>
            <div class="testimonial-card"><div class="testimonial-text">“Dulu repot rekap absensi manual, sekarang tinggal scan QR. Laporan otomatis, kirim broadcast ke orang tua cepat.”</div><div class="testimonial-author"><img src="https://randomuser.me/api/portraits/men/32.jpg" alt="avatar"><div><strong>Pak Budi</strong><br>SMA Negeri 2 Bandung</div></div></div>
            <div class="testimonial-card"><div class="testimonial-text">“Fitur backup dan restore sangat aman. Saya bisa pindah data tanpa takut hilang. Recommended!”</div><div class="testimonial-author"><img src="https://randomuser.me/api/portraits/women/45.jpg" alt="avatar"><div><strong>Bu Dewi</strong><br>MTs Al-Hikmah</div></div></div>
        </div>
    </div>
</section>
-->

<!-- CTA -->
<div class="container" style="margin-bottom: 40px;">
    <div class="cta">
        <h2>Siap Mengubah Cara Absensi Anda?</h2>
        <p>Daftar sekarang. Nikmati kemudahan absensi digital + notifikasi orang tua.</p>
        <a href="index.html" class="btn-primary" style="background: white; color: var(--primary);"><i class="fas fa-arrow-right"></i> Daftar Sekarang</a>
    </div>
</div>

<!-- Footer -->
<footer class="footer">
    <div class="container" style="display: flex; flex-wrap: wrap; justify-content: space-between; gap: 30px;">
        <div><h3 style="color: white;">GoAbs</h3><p>Absensi Digital Berbasis Parentis<br>Efisien, Transparan, Terpercaya.</p><div style="margin-top: 16px;"><a href="https://wa.me/6289609745090" target="_blank" style="background: #25D366; padding: 8px 16px; border-radius: 40px; display: inline-flex; gap: 8px;"><i class="fab fa-whatsapp"></i> Hubungi Admin</a></div></div>
        <div><h4 style="color: white;">Tautan</h4><ul style="list-style: none; margin-top: 12px;"><li><a href="#fitur">Fitur</a></li><li><a href="#harga">Harga</a></li><li><a href="#testimoni">Testimoni</a></li><li><a href="index.html">Login Guru</a></li></ul></div>
        <div><h4 style="color: white;">Kontak</h4><p><i class="fab fa-whatsapp"></i> +62 896-0974-5090</p><p><i class="far fa-envelope"></i> support@goabs.id</p></div>
    </div>
    <div class="container" style="text-align: center; margin-top: 40px; border-top: 1px solid #334155; padding-top: 24px;">&copy; 2025 GoAbs. All rights reserved.</div>
</footer>

<!-- Smooth scroll untuk anchor -->
<script>
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if(target) target.scrollIntoView({ behavior: 'smooth' });
        });
    });
</script>
</body>
</html>
