Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x22e.google.com ([2607:f8b0:4001:c0b::22e])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bFMtE-0004H2-OE
 for ath10k@lists.infradead.org; Tue, 21 Jun 2016 14:42:58 +0000
Received: by mail-it0-x22e.google.com with SMTP id a5so75010411ita.1
 for <ath10k@lists.infradead.org>; Tue, 21 Jun 2016 07:42:30 -0700 (PDT)
From: Tom Marble <tmarble@info9.net>
Subject: Cannot initialize Compex WLE600VX for 802.11ac?
Date: Tue, 21 Jun 2016 09:42:20 -0500
Message-ID: <57dtwgmmwmr.fsf@cerise.info9.net>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============7269507225311482084=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: tmarble@info9.net

--===============7269507225311482084==
Content-Type: multipart/signed; boundary="=-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--=-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


All:

I have configured a system specifically for 802.11ac using ath10k with
Compex WLE600VX [0] which is one of the QCA9880 Version 2 devices listed
on [1], but I'm unable to get it work.

This is an amd64 machine running Debian Jessie (stable), with
the latest kernel from kvalo [2] with all debugging enabled:
  CONFIG_ATH10K=3Dm
  CONFIG_ATH10K_PCI=3Dm
  CONFIG_ATH10K_DEBUG=3Dy
  CONFIG_ATH10K_DEBUGFS=3Dy
  CONFIG_ATH10K_TRACING=3Dy

Linux six 4.7.0-rc3-wt-ath-tm1 #3 SMP Mon Jun 20 22:18:00 CDT 2016 x86_64 G=
NU/Linux

The firmware is also from klavo's git [3][4][5]. Upon boot the
kernel says:
  Jun 21 08:36:05 six kernel: [    4.193061] ath10k_pci 0000:02:00.0: pci i=
rq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
  Jun 21 08:36:05 six kernel: [    4.416764] ath10k_pci 0000:02:00.0: board=
_file api 1 bmi_id N/A crc32 bebc7c08
  Jun 21 08:36:05 six kernel: [    5.608354] ath10k_pci 0000:02:00.0: htt-v=
er 2.1 wmi-op 5 htt-op 2 cal otp max-sta 128 raw 0 hwcrypto 1

The hostapd software is built from the latest upstream [6], including
the configuration
  CONFIG_IEEE80211AC=3Dy
  CONFIG_DRIVER_NL80211=3Dy
  CONFIG_DRIVER_NL80211_QCA=3Dy
  CONFIG_ACS=3Dy

The hostapd config file /etc/hostapd/wlan0.conf is set exactly in
the "Full hostapd configuration" from [6] (with passwords changed).

Setting channel=3D0 to enable scanning results in finding channel 52
as the ideal channel, but then (full log in [7])...
# hostapd -dd /etc/hostapd/wlan0.conf | tee /tmp/wlan0.log
...=20
  Mode: IEEE 802.11a  Channel: 52  Frequency: 5260 MHz
  DFS 0 channels required radar detection
  Could not set channel for kernel driver
  Interface initialization failed

Setting channel=3D52 and trying again fails with... (full log in [8]).
# hostapd -dd /etc/hostapd/wlan0.conf | tee /tmp/wlan0-52.log
...
  nl80211: Failed to start radar detection: -16 (Device or resource busy)


What suggestions do you have to help me identify the cause of=20
this problem (and hopefully resolve it!)?

=2D-Tom

[0] WLE600VX
    http://www.compex.com.sg/product/wle600vx/
[1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k
[2] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/sources
[3] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/firmware
[4] board.bin
    https://github.com/kvalo/ath10k-firmware/blob/master/QCA988X/board.bin=
=20
[5] firmware-5.bin
    https://github.com/kvalo/ath10k-firmware/blob/master/QCA988X/10.2.4/fir=
mware-5.bin_10.2.4.70.44=20
[6] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/configuration
[7] channel=3D0 log
    http://paste.debian.net/740824/=20
[8] channel=3D52 log
    http://paste.debian.net/740826/=20


--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJXaVJNAAoJEEC/7oaLBV2aR0YP/2/F0GFI0Nl8M51ltnoM0IoQ
BG1hd3YfQVl2sDC6kbSQZAUD3jizLneKGtuk7GxskQyEtXl1jlUPLUZifPOuB051
VZjQSSrgyTAYeLBrow1MpO+nEZhOd67khfnJSXhnsVXpSx9aYfDETrfocAJxoGNj
WeUHxOEYuTCqALqy9lDstxpi9fN/beeBD3zeqZzk72FZpgwZLyOPsYbIcnCFpZte
UaP3mFhVzQnhVSlqdVXSgD1897dsEVPi4KhkEqFPooBbOoV2Yal9Qm51g10X9NM4
djM0B7LeKlVIgX6YDYfAi1Ti/mb9msvw8nuE8BmfuWWlfwfoKiIMnyKKJBscQJfN
cZQqY6MZhPZj7CTVWHku0C6gdp97kkWJ/G1+1CdF/RdwQwP8BM1exMLtV1OeEEMe
H6kHhp8WcJ+Dc/xbM+8sZhqdc13CzvUq0A8Rbgb1g9HA/Pz58ecDqdanoT6QQF1T
GgBE9ysxP/go/3suq/lzsGAyGvvI1d3VQgER6KR1hKOmpdQegiM5Q/ATJ9j9r4M4
8Z3A3g0XoM/4scez9JVRKQJHAeDCKPU6vNJLaM25nyWJUgj0qk/Yo7qPlq406y1A
aTcIEnrGS1oOrNyM7ky1z4jLDdLNewHWrSqfY0zxwpknThQfWaRRKCvjoI+R2nJw
RFC8aJeCRhbDVwCnSzZj
=xBw2
-----END PGP SIGNATURE-----
--=-=-=--


--===============7269507225311482084==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============7269507225311482084==--
