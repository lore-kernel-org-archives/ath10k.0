Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Date: Sat, 29 Aug 2020 13:48:33 +0200
From: Baptiste Jonglez <baptiste@bitsofnetworks.org>
Subject: Re: CVE-2020-3702: Firmware updates for ath9k and ath10k chips
Message-ID: <20200829114833.GC574887@tuxmachine.localdomain>
References: <20200810090126.mtu3uocpcjg5se5e@pali>
 <20200812083600.6zxdf5pfktdzggd6@pali> <87lfik1av8.fsf@toke.dk>
 <20200812092334.GA17878@w1.fi>
MIME-Version: 1.0
In-Reply-To: <20200812092334.GA17878@w1.fi>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2365012943804134037=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org
Cc: openwrt-devel@lists.openwrt.org


--===============2365012943804134037==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4ZLFUWh1odzi/v6L"
Content-Disposition: inline


--4ZLFUWh1odzi/v6L
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Cross-posting to openwrt-devel because we are backporting the necessary fix=
es.

On 12-08-20, Jouni Malinen wrote:
> On Wed, Aug 12, 2020 at 11:17:47AM +0200, Toke H?iland-J?rgensen wrote:
> > Pali Roh?r <pali at kernel.org> writes:
> > > Could somebody react and provide some details when fixes would be
> > > available for ath9k and ath10k Linux drivers? And what is current sta=
te
> > > of this issue for Linux?
> > >
> > > I'm looking at ath9k and ath10k git trees [1] [2] [3] and I do not see
> > > there any change which could be related to CVE-2020-3702.
> >=20
> > How about these, from March:
> >=20
> > a0761a301746 ("mac80211: drop data frames without key on encrypted link=
s")
> > ce2e1ca70307 ("mac80211: Check port authorization in the ieee80211_tx_d=
equeue() case")
> > b16798f5b907 ("mac80211: mark station unauthorized before key removal")
>=20
> Those cover most of the identified issues for drivers using mac80211
> (e.g., ath9k and ath10k; though, I don't remember whether I actually
> ever managed to reproduce this with ath10k in practice). I have couple
> of additional ath9k-specific patches that cover additional lower layer
> paths for this. I hope to get those out after confirming they work with
> the current kernel tree snapshot.

I could find linux-stable backports for ce2e1ca70307 and b16798f5b907, but
not for a0761a301746.  Is it intended?  From the commit message, it looks
like it does fix an important issue.

Also, for the sake of completeness, this subsequent commit is also related
to CVE-2020-3702 (and already backported):

5981fe5b0529 ("mac80211: fix misplaced while instead of if")

Thanks,
Baptiste

--4ZLFUWh1odzi/v6L
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEjVflzZuxNlVFbt5QvgHsIqBOLkYFAl9KQJEACgkQvgHsIqBO
Lkarkw/+PZ7ALBbTv+M8aEGiCJ0yyNSNdAm1RLQm39NoWDAgNSwHFMx0JcUComWw
BmUeAhvx7aIsGNW0X6msgCrucojetL3EgfGJX5FiqlVTVM+l4Ucgs4y0lLwMIsjm
s9GABynZvUxHmNGWt0bUpgnER1Uf3cmnGhXpKvru1dlZTCCEIHpYwxoWrHTOThkf
8A72GSs7HoDmgreUTcJEtO6aWWd3KagD3Mu3g9aSXSqTIl1M9qVKPYKar4AMbzfF
DO4zfl2TCOy1O/CPw+yDl3e5PG3ySVhxW5E2fBDsZMnb1jGFy1g9zhZrlGEOSpTj
GTJTVeVwmI13MmjvmZtYcCIzaoJIGPM+JbX4KvXDqhowEtmYZOREzccOqlCQ9owp
jCPAZ8eFSNYNSWqqFkbCF6BF6MYYESIeWL47gPuIlMCLt9ZjpwMT8EK86JD2t+s+
Dmj+1VhB89Gr1bsKuDYZWvpsQkUlrPWDQICCcvZlPCI5h2sjfHeV3iKTDy/4Jeaw
OFIqhBO+2v1RUJiRj0X8ebINx1EVaJlABgynP6X1whoqTL9oks1+F4NIEWK1U68C
2kUOwoCGdZn325SktgantskEVwQW+f9KY3qQU49g14Wqz0sL6m2lngsJVi9BYvQx
z7HEMUBsXcVVwiW/otHQpvARV8NEotwXNutOWab9TVcvBtFD+Rw=
=RSpC
-----END PGP SIGNATURE-----

--4ZLFUWh1odzi/v6L--


--===============2365012943804134037==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2365012943804134037==--
