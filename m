Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mx1.redhat.com ([209.132.183.28])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bLOJN-0000K2-16
 for ath10k@lists.infradead.org; Fri, 08 Jul 2016 05:26:49 +0000
Received: from int-mx13.intmail.prod.int.phx2.redhat.com
 (int-mx13.intmail.prod.int.phx2.redhat.com [10.5.11.26])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id BC9A3C0624DD
 for <ath10k@lists.infradead.org>; Fri,  8 Jul 2016 05:26:25 +0000 (UTC)
Received: from [10.64.51.10] (vpn1-51-10.bne.redhat.com [10.64.51.10])
 by int-mx13.intmail.prod.int.phx2.redhat.com (8.14.4/8.14.4) with ESMTP id
 u685QNKw022492
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
 for <ath10k@lists.infradead.org>; Fri, 8 Jul 2016 01:26:25 -0400
From: Ben Skeggs <bskeggs@redhat.com>
Subject: AR9882 IOMMU faults
Message-ID: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
Date: Fri, 8 Jul 2016 15:29:05 +1000
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3531285494543916735=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3531285494543916735==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ml6OqRjPGTsjTIEDbqMJpgo0EN6THg8sD"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ml6OqRjPGTsjTIEDbqMJpgo0EN6THg8sD
Content-Type: multipart/mixed; boundary="ox7kd0oeKUqgpr37UfxMgvfsriIGAAEPl"
From: Ben Skeggs <bskeggs@redhat.com>
To: ath10k@lists.infradead.org
Message-ID: <4b0fdabc-ff87-c182-7db6-68bf32755407@redhat.com>
Subject: AR9882 IOMMU faults

--ox7kd0oeKUqgpr37UfxMgvfsriIGAAEPl
Content-Type: multipart/mixed;
 boundary="------------9865159199C770DB83E9DA4D"

This is a multi-part message in MIME format.
--------------9865159199C770DB83E9DA4D
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey,

I've just installed a COMPEX WLE600VX (AR9882) in my router machine,
operating in AP mode.

While it appears to be working well enough, I get massive floods of
IOMMU faults reported in my kernel log.  These appear to increase with
the load on the network.

I've attached both the info that ath10k reports when it detects the
device, and a sample of one of the DMAR messages (worth nothing that
it's the same fault address in all the messages).

Is this a known issue, and anything I can do to help get it resolved?

Thanks,
Ben.

--------------9865159199C770DB83E9DA4D
Content-Type: text/plain; charset=UTF-8;
 name="dmesg-ath10k.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-ath10k.txt"

SnVsIDA4IDE0OjUzOjA4IHJhbWllbCBrZXJuZWw6IGF0aDEwa19wY2kgMDAwMDowNDowMC4w
OiBEaXJlY3QgZmlybXdhcmUgbG9hZCBmb3IgYXRoMTBrL2NhbC1wY2ktMDAwMDowNDowMC4w
LmJpbiBmYWlsZWQgd2l0aCBlcnJvciAtMgpKdWwgMDggMTQ6NTM6MDggcmFtaWVsIGtlcm5l
bDogYXRoMTBrX3BjaSAwMDAwOjA0OjAwLjA6IHFjYTk4OHggaHcyLjAgdGFyZ2V0IDB4NDEw
MDAxNmMgY2hpcF9pZCAweDA0MzIyMmZmIHN1YiAwMDAwOjAwMDAKSnVsIDA4IDE0OjUzOjA4
IHJhbWllbCBrZXJuZWw6IGF0aDEwa19wY2kgMDAwMDowNDowMC4wOiBrY29uZmlnIGRlYnVn
IDAgZGVidWdmcyAxIHRyYWNpbmcgMCBkZnMgMCB0ZXN0bW9kZSAwCkp1bCAwOCAxNDo1Mzow
OCByYW1pZWwga2VybmVsOiBhdGgxMGtfcGNpIDAwMDA6MDQ6MDAuMDogZmlybXdhcmUgdmVy
IDEwLjIuNC43MC41MiBhcGkgNSBmZWF0dXJlcyBuby1wMnAscmF3LW1vZGUsbWZwIGNyYzMy
IDY3YzRkMjVjCkp1bCAwOCAxNDo1MzowOCByYW1pZWwga2VybmVsOiBhdGgxMGtfcGNpIDAw
MDA6MDQ6MDAuMDogRGlyZWN0IGZpcm13YXJlIGxvYWQgZm9yIGF0aDEway9RQ0E5ODhYL2h3
Mi4wL2JvYXJkLTIuYmluIGZhaWxlZCB3aXRoIGVycm9yIC0yCkp1bCAwOCAxNDo1MzowOCBy
YW1pZWwga2VybmVsOiBhdGgxMGtfcGNpIDAwMDA6MDQ6MDAuMDogYm9hcmRfZmlsZSBhcGkg
MSBibWlfaWQgTi9BIGNyYzMyIGJlYmM3YzA4Cgo=
--------------9865159199C770DB83E9DA4D
Content-Type: text/plain; charset=UTF-8;
 name="dmesg-ath10k-dmar.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="dmesg-ath10k-dmar.txt"

WyAxMjcyLjA1NjQxNl0gRE1BUjogRFJIRDogaGFuZGxpbmcgZmF1bHQgc3RhdHVzIHJlZyAz
ClsgMTI3Mi4wNTcxMjldIERNQVI6IERNQVI6W0RNQSBXcml0ZV0gUmVxdWVzdCBkZXZpY2Ug
WzA0OjAwLjBdIGZhdWx0IGFkZHIgZmY5YzAwMDAgCiAgICAgICAgICAgICAgIERNQVI6W2Zh
dWx0IHJlYXNvbiAwNV0gUFRFIFdyaXRlIGFjY2VzcyBpcyBub3Qgc2V0Cgo=
--------------9865159199C770DB83E9DA4D--

--ox7kd0oeKUqgpr37UfxMgvfsriIGAAEPl--

--ml6OqRjPGTsjTIEDbqMJpgo0EN6THg8sD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJXfzohAAoJEHYLnGJQkpH7ghUQAJYGKB0ukMHaAJytWvmabvfv
7wcfIVL+OVmn9D2T3VX6aRyqjqIe2rVqhI+cw9W6DmLAMqHno8fxQnqp8ldc6IPg
YPAmOMJLEzwBv5jr3Y6UsCRLBbFsMzfjCB7LPL+vAJqxBEOYV7BPbD5hH1iAZtcl
M3srmGalhNfd8i3HOHg2JSJQQy9gPdyTU7wUEPNGtwvibklY/eQ5YxZDnpMO+SIP
ZzUlaxLLIEMJXPPuHOnGajbZDoPKBJrBpRjIP+Gujme7BmsqhmdiavPLnmzk0F4y
/GSSy38h1xrbK2FWtYWqPn1x0CgqlL58rFPbrKSpqQg4ZnInMtSEydhrEH90D9nF
QIZSlFoopslbBa+9S+ysfne8xkKW050Q/nm60HjUKY8fXmOOKwF3fu1ea3Tvv8q/
ygLuINU4nIphwvlWr3FVxiE0ZFbBUOqblwrEsY2MlHxfwPPUPJffuuXX/ur1vyuX
+JpYIr83WCgG1EF7veoBys3a7UjbowUWTJkx3lUdhXSmd9T2X94z6X0ir2Er6Qfp
MVbDZpP5kxUKCtpMhMSC8b7/dgp/AdIYpjMmX14mBrQ180VHdNGYcXhIGU/5wHEk
xghBDw+8/gNHQa9MZEiM4RzYLeX13i1zqjR+nO9uPytjadYfc7G9iEH5IUU+lVpF
bQq/H32VccS6ja+kBuAd
=AKWM
-----END PGP SIGNATURE-----

--ml6OqRjPGTsjTIEDbqMJpgo0EN6THg8sD--


--===============3531285494543916735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3531285494543916735==--
