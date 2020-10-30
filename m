Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from caillette.gueux.org ([2a0e:c400:ff:f010:ffff:ffff:ffff:ffff])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYQ7w-0000OS-P7
 for ath10k@lists.infradead.org; Fri, 30 Oct 2020 08:51:19 +0000
Date: Fri, 30 Oct 2020 09:51:02 +0100
From: =?utf-8?B?RsOpbGl4?= Sipma <felix+kernel@gueux.org>
Subject: Re: [PATCH] Revert "ath: add support for special 0x0 regulatory
 domain"
Message-ID: <20201030085102.GA2137481@capeo.gueux.org>
References: <20201022172113.GA1367233@capeo.gueux.org>
 <CANe27jKpYm29QOjYOZ_jwHiRxuWx66J+th8-zgbXK4geiCU0_Q@mail.gmail.com>
 <20201029140616.GG515433@capeo.gueux.org>
 <CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CANe27j+fur52HydqqzLc2hBV3QwC2La8+RTJcV=5W5LkUr=PqQ@mail.gmail.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============6682602298271472319=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Jouni Malinen <jkmalinen@gmail.com>
Cc: ath10k@lists.infradead.org


--===============6682602298271472319==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2020-10-30 09:20+0200, Jouni Malinen wrote:
>On Thu, Oct 29, 2020 at 4:06 PM F=C3=A9lix Sipma <felix+kernel@gueux.org> =
wrote:
>> I made a detailed report, with dmesg outputs of different
>> kernel/firmware-atheros and wireless-regdb combinations at
>> https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D970679
>
>So the issue is in not being able to operate an AP on the 5 GHz band?

Yes, sorry for not being clear about this.

>That sounds like the expected behavior for any device that has not
>been calibrated and provisioned for a specific country where
>regulatory rules allow operation on the 5 GHz band. I understand that
>this may look like a regression since the commit removed
>functionality, but it feels like a bug fix to me since that
>functionality should not have been enabled by default in the first
>place. The goal here is to avoid inappropriate operation on the band
>without explicit configuration to enable such operation. In AP
>devices, the device should have been provisioned for a specific
>country to be able to enforce the correct frequency range
>restrictions. The safe default for a device that does not have such
>explicit configuration within the WLAN component itself is to use the
>world roaming mode which prevents initialization of radiation (i.e.,
>does not allow AP mode to be started but allows station mode operation
>to connect to an already started AP) on the 5 GHz band.

So, if I understand well, the new behaviour (non working AP with ac) is=20
expected, given that the device was not provisioned with the settings=20
specifics to my zone? And to prevent people from operating an AP with=20
the wrong settings, we force them to use hardware that is specific to=20
their zone? If that's the intention, I'm not sure it is very effective:=20
I can still buy a German wifi card and use it in France. It will=20
probably suits most of the hardware vendors, though: people moving to=20
another country are forced to buy new stuff and they can't buy cheaper=20
stuff abroad, but, seen from another angle, it sounds like planned=20
obsolescence.

The vendor of my (new) hardware is from Switzerland, and is selling to=20
(at least) everywhere in Europe, and they sell the same hardware (that=20
used to work) for everybody. So, now, they are supposed to sell=20
specific hardware for each country? I think the card was not=20
provisioned with a specific country (I'm in France, and I tried FR, CH,=20
US,  ...), so I guess I have to throw it to the bin anyway (and they=20
should do the same with all their stocks).

I hope I have misunderstood your message, else I have to admit I'm a=20
little disappointed... Thanks for your explanation, though!

If that's really the intention, is there a workaround for irresponsible=20
people like me, who just wan't to avoid buying new stuff?

Regards,

--=20
F=C3=A9lix

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQR6zeIsS8L0XLQfqiQBpfxHUdFE8AUCX5vT8wAKCRABpfxHUdFE
8JU6AP9IsnFavN0uwmpJRqYEdltZjwCuHd17p112af5ltXqU3QEAplZcoryKc9NW
jRADJpdvN4vvTNuBy030L7oxUr6A4wE=
=U1oy
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--


--===============6682602298271472319==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============6682602298271472319==--
