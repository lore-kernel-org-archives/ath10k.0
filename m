Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from caillette.gueux.org ([2a0e:c400:ff:f010:ffff:ffff:ffff:ffff])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kY8Zd-0004Ya-H4
 for ath10k@lists.infradead.org; Thu, 29 Oct 2020 14:06:42 +0000
Date: Thu, 29 Oct 2020 15:06:16 +0100
From: =?utf-8?B?RsOpbGl4?= Sipma <felix+kernel@gueux.org>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
Message-ID: <20201029140616.GG515433@capeo.gueux.org>
References: <20201022172113.GA1367233@capeo.gueux.org>
 <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1957613018835730743=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Jouni Malinen <jkmalinen@gmail.com>
Cc: ath10k@lists.infradead.org


--===============1957613018835730743==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="XvKFcGCOAo53UbWW"
Content-Disposition: inline


--XvKFcGCOAo53UbWW
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Thanks for your detailed answer.

I made a detailed report, with dmesg outputs of different=20
kernel/firmware-atheros and wireless-regdb combinations at=20
https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970679

Massimo Maggi pointed me to this ath10k issue on the last message.

Regards,

On 2020-10-22 23:28+0300, Jouni Malinen wrote:
>What is the exact issue you are seeing?
>
>> Is there something preventing
>>
>> https://patchwork.kernel.org/project/ath10k/patch/20200527165718.129307-=
1-briannorris@chromium.org/
>> from being merged?
>
>That seems to have a risk of mapping the default country code (CTRY_DEFAULT
>is defined to be 0 in regd.h) being mapped to something else than a safe
>world roaming case and this could have an impact throughout all drivers
>using the generic ath/regd.c implementation. It looks like the correct
>thing to do is to map an unexpected value to the safest option instead of
>allowing this to be mapped to something that could end up enabling
>incorrect regulatory rules.
>
>- Jouni

--=20
F=C3=A9lix

--XvKFcGCOAo53UbWW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR6zeIsS8L0XLQfqiQBpfxHUdFE8AUCX5rMVQAKCRABpfxHUdFE
8NyBAP9KEaIHjMxbkgclX2X15lI0AFboO+oRoNjSG5C+ZfpzmAEA94JQyYAucvym
2JiFOjBrzjBOe2vVhp/wLQHnr5FmsA4=
=Hx7v
-----END PGP SIGNATURE-----

--XvKFcGCOAo53UbWW--


--===============1957613018835730743==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1957613018835730743==--
