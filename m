Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
From: Peter Oh <ebmajor@live.com>
Subject: Re: DFS radar pattern detection in different regions
Date: Mon, 22 Aug 2016 16:42:38 +0000
Message-ID: <221398f0d39e4869bec507f12c5fe230700ab28c645e429c96253f60b17f9f9528663b9fd8c1489ba855dc8546949494BY2PR20MB02484FF3083D9915E53E396BDFE80@BY2PR20MB0248.namprd20.prod.outlook.com>
References: <CA+uUJGs7HGamb3duZ_9PYfx++43F3UWE2nO4C3AN9Saen=iMrA@mail.gmail.com>
 <CA+uUJGvb6sUXywTvtnyigrkrGSeVEp-2KbndQ_5k5_RxdKgV-Q@mail.gmail.com>
 <CAJ-Vmo=xh3ij6n1UHH=jC8W1mdsn+kWg9SroSKdm_F6tLMKsDA@mail.gmail.com>,
 <CA+uUJGs=aZQ+oRJeHJO92UTg94vhvyYVVn5pKD+=N37bfY_evA@mail.gmail.com>
In-Reply-To: <CA+uUJGs=aZQ+oRJeHJO92UTg94vhvyYVVn5pKD+=N37bfY_evA@mail.gmail.com>
Content-Language: en-US
Content-ID: <03C8A46EC0845D4F838E8F3C2F13BC0F@namprd20.prod.outlook.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Raj Joshi <rajjoshi@comp.nus.edu.sg>, Adrian Chadd <adrian@freebsd.org>
Cc: "wireless-regdb@lists.infradead.org" <wireless-regdb@lists.infradead.org>, ath10k <ath10k@lists.infradead.org>

re-send in plain text mode.

>=A0I am just confused by the output of "iw reg get", which outputs lines



>=A0from the db.txt of wireless-regdb [1]. For example,  the first lines of
>=A0the output for some countries read like the following:
>=A0country AE: DFS-FCC
>=A0country AF: DFS-ETSI
>=A0country BD: DFS-JP
>=A0
>=A0What is that supposed to mean? These lines seem to allow using DFS
>=A0channels in these countries as long as DFS is enabled in kernel
>=A0config, although this won't be "right" ?!
FCC, ETSI, and JP are DFS regulatory domains which have their own radar pat=
tern definitions and requirements, so that=A0many countries are adapting an=
d following.
If countries do not fall into one of=A0the 3 regulatory domains, ath10k DFS=
 detector could not detect DFS radar since the DFS pattern detectors are de=
signed for those 3.
If you want to support the countries that do not follow those 3 domains, th=
en you need to add new pattern detector and use the phy error data reported=
 from firmware.


Peter     =

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
