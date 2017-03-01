Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-x22b.google.com ([2a00:1450:400c:c09::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ciylG-0006Zc-DG
 for ath10k@lists.infradead.org; Wed, 01 Mar 2017 07:33:24 +0000
Received: by mail-wm0-x22b.google.com with SMTP id v186so102815177wmd.0
 for <ath10k@lists.infradead.org>; Tue, 28 Feb 2017 23:33:01 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Wed, 01 Mar 2017 08:32:57 +0100
Message-ID: <2041049.sDAvLy9HAv@bentobox>
In-Reply-To: <821ad665d0934c58fc8b3c830e119433@codeaurora.org>
References: <1591748.RGYhBEn8I1@bentobox> <1884460.SDYHzsflKl@bentobox>
 <821ad665d0934c58fc8b3c830e119433@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0255250003102991726=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@codeaurora.org>
Cc: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, akolli@codeaurora.org, Tamizh chelvam <tamizhchelvam@codeaurora.org>, ath10k@lists.infradead.org, shashidhar.lakkavalli@openmesh.com

--===============0255250003102991726==
Content-Type: multipart/signed; boundary="nextPart1646798.dMxl787Sdt"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1646798.dMxl787Sdt
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 28. Februar 2017 19:22:32 CET Rajkumar Manoharan wrote:
> On 2017-02-27 23:58, Sven Eckelmann wrote:
> > It looks to me now that this information is contradicting your 
> > implementation
> > (which now loads the data from 0:ART partition [1] like pre-cal data 
> > [2] and
> > then loads the board-2.bin [3]).
> > 
> Both reading from ART and loading pre-cal data file are same.
> 
> > I have doubt regarding his explanation but I got no actual spec - only
> > information which seems to be contradicting (or to vague) . Is is 
> > possible
> > to get some confirmation from you about whether the data from the 0:ART
> > partition is pre-cal data or not and whether the board-2.bin should be
> > used when the data from 0:ART is used.
> > 
> In QCA4019 platform, only radio specific calibration (pre-cal-data) is 
> stored in flash.
> Board specific contents are read from board-2.bin. For each radio 
> appropriate board
> data should be loaded. To fetch correct board data from board-2.bin 
> bundle, pre-cal/radio
> specific caldata should be loaded first to get proper board id.
> 
> > My understanding until now was that:
> > 
> >  * pre-cal data + board-2.bin info == actual calibration data
> > 
> Correct.
[...]

Thanks a lot for the confirmation

Kind regards,
	Sven
--nextPart1646798.dMxl787Sdt
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAli2eSkACgkQXYcKB8Em
e0Zr3RAAiFZRT+q6TpqKgH8TYZmfuBLxTnlJ0MfGkyUUnP/Y8b3rZaZ0sd9L2wUP
plE8qtSfbMA8GYxS4Ws0yDB3ACsX1GUnOmvBcE7lSVa1nH/PXLcPUl6vngYJFbJO
u+NrQohYsi4jLvS1sN6JxxI7wEMXQVqcUMXQLmAE1b0c4mLABFO1VvI0wPj/Gr5D
Q8sy58GqfzrOcQjetPySvaXTC8nKmTMEhrEPx4DCwUSBxyNZAePvxdWHgHFLIgh5
k2zGyMxC61IX93+PKEsV2OXxQauXyRpR0Tkq4S9f6CJ1ghNjcz1O0VpAUShFSl4i
eJAbtSUtostsKktVUOC9gaeaGX4UGgUVY3mSe2qjQeYtgQUHw+ay/NE54GCqPerH
ZWhDC9k7LHPe00N3O4pTQ/O5a2huOsamtmPLjWPN7PiKt5OdYd2NKfo1W7H6AUcw
fgHhwDoXfFn0IY1/GBmzH36n6rFu5qEDlGmUtHOk5ynESJmM6eZDrNCSNDw9baPX
+DrPSDLd/6L9Y+P7rUJG+PIkAw20MV2wkM5iOH6Obqc9Lh/0qz0mp3CQWYXd0dHH
ki9aF//lozsiLa6Fv7FnGYqRrgOUvc+pKUvfT8Kad9Wso/GgycpmvXWxSCeQoKMP
dd6db29y+nGV2OtIsUBFbtxa6PGkENop1kJrkT476rsbU0IdyMw=
=zJlh
-----END PGP SIGNATURE-----

--nextPart1646798.dMxl787Sdt--



--===============0255250003102991726==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============0255250003102991726==--
