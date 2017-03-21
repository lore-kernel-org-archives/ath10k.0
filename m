Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x229.google.com ([2a00:1450:400c:c0c::229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cqKrU-0007qj-8t
 for ath10k@lists.infradead.org; Tue, 21 Mar 2017 14:34:14 +0000
Received: by mail-wr0-x229.google.com with SMTP id u108so113184537wrb.3
 for <ath10k@lists.infradead.org>; Tue, 21 Mar 2017 07:33:50 -0700 (PDT)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCH 1/2] dt: bindings: add new dt entry for ath10k calibration
 variant
Date: Tue, 21 Mar 2017 15:33:43 +0100
Message-ID: <5158144.BXJK97egUR@bentobox>
In-Reply-To: <CAL_Jsq+aEdjq9MR--Hyrw17KoKv=uZ7OBsAqX1_0+Djpw+QUCg@mail.gmail.com>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <1919994.musG4GLznX@bentobox>
 <CAL_Jsq+aEdjq9MR--Hyrw17KoKv=uZ7OBsAqX1_0+Djpw+QUCg@mail.gmail.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0107763127475149156=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rob Herring <robh@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org, ext.waldemar.rymarkiewicz@tieto.com, Kalle Valo <kvalo@codeaurora.org>

--===============0107763127475149156==
Content-Type: multipart/signed; boundary="nextPart2121705.Aa6AmNEe8Z"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2121705.Aa6AmNEe8Z
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

On Dienstag, 21. M=E4rz 2017 08:00:34 CET Rob Herring wrote:
[...]
> > It would then up with something like this as compatibility string:
> >
> >  * qcom,ipq4019-wifi-asus-rt-ac58u
> >  * qcom,ipq4019-wifi-fritzbox-4040
> >  * qcom,ipq4019-wifi-netgear-whatever
> >  * qcom,ipq4019-wifi-openmesh-i-have-no-idea
> >  * ...
>=20
> Are these all the same board design or variations? In the latter case,
> you should have specific compatibles anyway. Now if the variants are
> the same hardware, but different configurations say for different
> regions or something, then I'd say a separate property is fine.
>=20
> We already have a "firmware-name" property. Would that work for you?

Hm, maybe we should specify some names better:

"qcom,ipq4019-wifi" =3D=3D compatibility string for WiFi hardware inside th=
e SoC.=20
It is the one which ath10k supports on the Atheros Host Bus (ahb) of the=20
QCA4019.

The ath10k driver will use the information from these nodes to initialize t=
he=20
device. It will basically:

1. load a firmware(-5).bin from /lib/firmware/ath10k/QCA4019/hw1.0/
2. load the pre-cal (aka first part of calibration) data from
   /lib/firmware/ath10k/pre-cal-*
3. do some firmware magic to identify the reference design
4. load board data "files" (BDF) for this reference design from
    /lib/firmware/ath10k/QCA4019/hw1.0/board-2.bin
5. send the BDF data to the firmware to let it compute the final calibration
   data
6. start the actual wifi stuff

The IPQ4018/4019 SoC doesn't contain the actual RF parts. There are a coupl=
e=20
of reference designs (SoC+RF parts) from QCA which got official numbers. Th=
ese=20
numbers identify the BDFs inside the board-2.bin. And the board-2.bin is no=
t=20
the firmware - it is a container for multiple BDFs.


To summarize:

 * pre-cal is some data stored in a special partition of the devices and wi=
ll
   not be overwritten on updates
 * board-2.bin are multiple BDF files containing the second part of the
   calibration data
 * pre-cal + BDF (+ some OTP stuff) are getting combined to form the comple=
te
   calibration data

Asus RT-AC58U, Fritzbox 4040 and ZyXEL NBG6617 are products based on the sa=
me=20
reference design. But of course, some (all?) fiddled around with the RF par=
ts=20
and therefore require special BDFs. They still use the same SoC and require=
=20
that the closed source ath10k firmware behaves like on the official referen=
ce=20
designs. Only the BDFs have to be different.

So you could say that the wifi-chip hardware (part of the QCA4018/4019 SoC)=
 is=20
the same between these different products. But the hardware around the SoC =
is=20
different and therefore requires a different "configuration"/calibration fo=
r=20
the surrounding RF hardware. It is not a perfect match for your "separate=20
property is fine" compromise. Maybe you still meant this - I let you decide.


This is not only a problem on QCA4019 but also for other devices supported =
by=20
ath10k. Waldemar Rymarkiewicz introduced the concept of BDF variants for
this [1] and implemented the support for SMBIOS. The variant string (genera=
ted=20
from the SMBIOS data) is then used by ath10k when it searches for the corre=
ct=20
BDFs in the board-2.bin. Kalle Valo suggested to use the same mechanism for=
=20
QCA401X based boards (which don't use SMBIOS).

The "qcom,ath10k-calibration-variant" is now the (more or less) equivalent =
of=20
the SMBIOS entry - but for device tree users. Let us assume that the varian=
t=20
string would be "RT-AC58U" for the Asus RT-AC58U and the first wifi device=
=20
(bmi-board-id=3D16) gets initialized [2]. Then the step 4 would get splitte=
d in=20
following steps:

4.1. Get the the qcom,ath10k-calibration-variant content
4.2. jump to 4.5. when there is no qcom,ath10k-calibration-variant
4.3. calculate BDF search name with variant string
     "bus=3Dahb,bmi-chip-id=3D0,bmi-board-id=3D16,variant=3DRT-AC58U"
4.4. load BDF and when found, jump to 5.
4.5. calculate BDF search name without variant string
     "bus=3Dahb,bmi-chip-id=3D0,bmi-board-id=3D16"
4.6. load the BDF


There would be no changes in ath10k when adding a new BDF calibration varia=
nt=20
using qcom,ath10k-calibration-variant. Only the device tree node would have=
 to=20
be updated:

 * device tree (simplified):
    / {
      model =3D "ASUS RT-AC58U";
   =20
      soc {
        wifi@a000000 {
          compatible =3D "qcom,ipq4019-wifi";
          reg =3D <0xa000000 0x200000>;
          status =3D "okay";
          qcom,ath10k-calibration-variant =3D "RT-AC58U";
        };
   =20
        wifi@a800000 {
          compatible =3D "qcom,ipq4019-wifi";
          reg =3D <0xa800000 0x200000>;
          status =3D "okay";
          qcom,ath10k-calibration-variant =3D "RT-AC58U";
        };
      };
    };
 * ath10k + ath10k-firmware
   <no change>




This about how the calibration [insert swearword] works for
"qcom,ipq4019-wifi" and why the "qcom,ath10k-calibration-variant" was used =
in
my first implementation. But then you've suggested to "use a more specific
compatible string". This information was not enough for me to understand wh=
at
you've actually meant. I was therefore proposing some examples which show w=
hat
you maybe could have meant. These were following things:

> >  * qcom,ipq4019-wifi-asus-rt-ac58u
> >  * qcom,ipq4019-wifi-fritzbox-4040
> >  * qcom,ipq4019-wifi-netgear-whatever
> >  * qcom,ipq4019-wifi-openmesh-i-have-no-idea

They are basically "qcom,ipq4019-wifi" + a product specific string. The fir=
st=20
part is therefore the string which identifies the wifi device(s) in the=20
QCA4018/4019 SoC. The product specific string is simply the part (or a=20
variation of it) which would been used before in
"qcom,ath10k-calibration-variant" - just to make it "use a more specific=20
compatible string".

I have no idea if this is really what you meant. I just wanted to give you=
=20
some examples and explanations why I don't feel that this a good idea. I=20
thought that this would help you to point me in the right direction and=20
explain better what you've meant.

Right now it looks to me like following must be done for your(?) proposal f=
or=20
each new board:

 * device tree (simplified):
    / {
      model =3D "ASUS RT-AC58U";
   =20
      soc {
        wifi@a000000 {
          compatible =3D "qcom,ipq4019-wifi-asus-rt-ac58u";
          reg =3D <0xa000000 0x200000>;
          status =3D "okay";
        };
   =20
        wifi@a800000 {
          compatible =3D "qcom,ipq4019-wifi-asus-rt-ac58u";
          reg =3D <0xa800000 0x200000>;
          status =3D "okay";
        };
      };
    };
 * ath10k + ath10k-firmware
   - add qcom,ipq4019-wifi-asus-rt-ac58u to
     Documentation/devicetree/bindings/net/wireless/qcom,ath10k.txt
   - add qcom,ipq4019-wifi-asus-rt-ac58u to ath10k_ahb_of_match in
     drivers/net/wireless/ath/ath10k/ahb.c
   - add a mapping from qcom,ipq4019-wifi-asus-rt-ac58u to the RT-AC58U
     variant string somewhere in ath10k


I hope this is enough to understand it a little bit better.

Kind regards,
	Sven


[1] https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?i=
d=3D1657b8f84ed9fc1d2a100671f1d42d6286f20073
[2] the second wifi device for this reference design would be 17. But there
    are a lot more for the other reference designs from QCA
--nextPart2121705.Aa6AmNEe8Z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAljROccACgkQXYcKB8Em
e0aoChAAp6kOR7V+ZhGgvHKsvMGfMb8s5XENZsHJd0QRzHWccm9RJjwfY9rLaRJ4
tmhBrSWovqzjqVTreE6u8D5lSlcUn8XFAvC8NFPHu4dYyTb3dZ0ERUJfFASEF3Pt
gf1OMnHb2JIK/XTjhiR9nGbnpev6nCqSYiVtWH0SzmSoY75u6RLEZvn4vt4bpqMC
I1KbFtgRGrxGlNhoMNe0qkpoN+AGdo24wThqDbqXO6ZnhAPT6O7nVj7IlwPsFL5B
72OjQ77+fk2V4LjQ9iCsMHY5cqoNheerhpxijHmCJ4Kss21b2q3jFP4m2PI2zVpd
TjQSxTf+Hh8njbH01nCmidC0ghch5BxjpU/Ggdp/a5D1Z0UsEO73PuYsSSDtLkVD
GCPT2Ayl/TfLfUfP5AyGf8df/NXMI/nCau1tKxWLURARcu/3aG5mwJjsmrlKVChQ
LFWV5vlxNWMIDtQ7eC8sXafave51kNM1n+Ej3/3E1hNhVeykS/q3BvOM1MjIg8wG
JRJ59t2lrxA4JrnYsEmwe1eIj6iDFbpmvXdntb4Ngmn2evtn2VE6oDUMtb+jQskv
WEIFdVz/xgstRm7jCGPjNZzqb++AFOqxkJFA0IcMBAZTJmYAG7WxnVsZFdhQO4YL
CvD7/cil5S1sVBfYI6PRBtCmGBE3dtgtwRdRWhnk0slutLRHQ2g=
=uIBn
-----END PGP SIGNATURE-----

--nextPart2121705.Aa6AmNEe8Z--



--===============0107763127475149156==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0107763127475149156==--
