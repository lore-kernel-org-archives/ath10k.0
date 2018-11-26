Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gRCZI-0004bj-4l
 for ath10k@lists.infradead.org; Mon, 26 Nov 2018 08:48:38 +0000
Received: by mail-qt1-x844.google.com with SMTP id v11so16626121qtc.2
 for <ath10k@lists.infradead.org>; Mon, 26 Nov 2018 00:48:24 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: missing firmware in debian 9
Date: Mon, 26 Nov 2018 09:48:17 +0100
Message-ID: <6892054.LxBMB1ZCDT@bentobox>
In-Reply-To: <20181116133851.czjhgfmttodnudzg@adell35>
References: <20181116133851.czjhgfmttodnudzg@adell35>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4711459578504507944=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: Anil Duggirala <anilduggirala@fastmail.fm>, debian-kernel@lists.debian.org

--===============4711459578504507944==
Content-Type: multipart/signed; boundary="nextPart11185438.vDkDhGOPPh"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart11185438.vDkDhGOPPh
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Freitag, 16. November 2018 08:38:51 CET Anil Duggirala wrote:
> hello,
> I am getting this message at boot.
> 
> [   10.678576] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/pre-cal-pci-0000:03:00.0.bin (-2)
> [   10.678631] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:03:00.0.bin failed with error -2
> [   10.678655] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/cal-pci-0000:03:00.0.bin (-2)        
> [   10.678699] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/cal-pci-0000:03:00.0.bin failed with error -2
> [   10.681081] ath10k_pci 0000:03:00.0: firmware: failed to load ath10k/QCA6174/hw3.0/firmware-5.bin (-2)
> [   10.681127] ath10k_pci 0000:03:00.0: Direct firmware load for ath10k/QCA6174/hw3.0/firmware-5.bin failed with error -2
> [   10.681131] ath10k_pci 0000:03:00.0: could not fetch firmware file 'ath10k/QCA6174/hw3.0/firmware-5.bin': -2  
> 
> I have installed the firmware-atheros package from backports in Debian 9, I had installed the package from the main repository before but I was also getting this message. I have also installed the firmware-linux-free package.

Where should Debian take it when QCA is not providing a firmware-5.bin? Kalle 
Valo's repo [1] contains different firmware-6.bin (which your ath10k version 
doesn't seem to support yet) and firmware-4.bin. And Debian ships both - I 
think the ones which were in linux-firmware [2] at the time of the release.

I don't have a QCA6174 hw3.0 but I would guess that ath10k loaded the
firmware-4.bin after it failed to load the firmware-5.bin.

Kind regards,
	Sven

[1] https://github.com/kvalo/ath10k-firmware/tree/master/QCA6174/hw3.0/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git/
--nextPart11185438.vDkDhGOPPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAlv7s1EACgkQXYcKB8Em
e0Yt3RAAzDykJXDs6eFJ7n69qebzK7wfENcGxCzPXEcmseSi9RmwG6/VO2h0eAww
hR7t18KbcJK9uRpmU0Rur/GrR+Z9Y8K1wLxke4GeRErp9hF5c39bWLET12WqfhTQ
pDw+0DYC7RZaKQ2JNStQx69E4XOcvMnGI/elDlO5REtNPHZEyapOdx4kbhOnDMSk
d13iT36hqb6XCQgbuXw39StbYlECZGYjmaxgtEj5OQoAJWD/PWGswc/Pyfiv4Cib
AZPDSJEN7vlHcItRI1CNWcQ2X8QNr3taZUql+9WnUB6VIEWiBDC7dWL5df3j54S+
jQib1LQmqhXTrVi0XaE3B72UW1l22LUB7PLDCCNypfaC/f9Y9+BZsUHiMs64f/vr
PULsEfwjY4JqoCHVlIN0GM/+hYHQy9lTDSgh4x5/2zhCo8KGUBL61+uCkiA6E+Vk
Mq7j6iyEZycDFmlHoJLKRr+IpY8WUeHXR1bXCaIr68lKexlIqUS2dgqA6OuyrNEy
IP9r4861HiE3RofyoOHM5ptcnG6rk5UAmag3/IMvm6kD40X1SQRnW8lp3miA/UDE
Fyu4LJREfObzozfKe4Ilhvu9ltgjtBRedCqrrP/Q03rWYL6wXtNC/VIar7gtFcXb
DWQLzkoFlaf6uEy6UI/ksER4Z4X6Rs3iwG/siOXKlDipWZYN7II=
=xoSM
-----END PGP SIGNATURE-----

--nextPart11185438.vDkDhGOPPh--



--===============4711459578504507944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============4711459578504507944==--
