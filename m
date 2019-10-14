Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJuSL-0003Lo-NI
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 07:07:51 +0000
From: Sven Eckelmann <sven@narfation.org>
Subject: Re: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
Date: Mon, 14 Oct 2019 09:07:42 +0200
Message-ID: <1614044.H5m0Cyd3Ly@bentobox>
In-Reply-To: <9a9ec99b-9643-7288-eed5-b549a9fe1487@newmedia-net.de>
References: <20190918124259.17804-1-sven@narfation.org>
 <9a9ec99b-9643-7288-eed5-b549a9fe1487@newmedia-net.de>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============8609644286598458446=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

--===============8609644286598458446==
Content-Type: multipart/signed; boundary="nextPart3096302.iHDqCeegG6"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3096302.iHDqCeegG6
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Monday, 14 October 2019 00:15:20 CEST Sebastian Gottschall wrote:
> i checked your patch on 10.4 based chipsets with 9984. the values are 
> now looking bogus and wrong at all. busy and active time time in ms does 
> increase in hours each second
> the problem seem to be that your patch is 10.2.4 only related. 
> ath_clean_survey does not trigger on 10.4 so the values double itself 
> each time the event raises since you add the full values and not just a 
> delta on top

Thanks for the feedback. So we have now a firmware 10.2.4 which is counting 
busy + active up and has wraparound problems. And then we have a 10.4 firmware 
(on QCA9888 and QCA4019) which is clearing everything as expected with 
WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR  and then we have some 10.4 firmware (one 
QCA9984) which behaves more like ath 10.2.4 firmware but is marked as 
ATH10K_HW_CC_WRAP_SHIFTED_EACH like the QCA4019.

So I have no idea how to fix this when QCA4019 and QCA9984 are currently 
marked the same but behave differently. Does somebody have a overview how the 
different HW versions should behave or is there some special bit in the data 
reported by the firmware which can be used to evaluate the expected behavior?

Kind regards,
	Sven
--nextPart3096302.iHDqCeegG6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAl2kHr4ACgkQXYcKB8Em
e0Y0gA/+J3vh6vqdz7b6HrkGIgGPto8oO94eyZVurrnv2bQg6wZtGaBZsiw0c0Fg
+kl6b+xDAOwy2WzfEEqZUAY1Wkbdub7MHG41dLJ2sJ8UvARksGNuPx6qT16yseHY
ewaTaIdBb6cIQmb/HewibxC8sIeLAz2s0Qj4UPxqlnmgRiEK39VHZ3tyGD1uptcH
Br0SkxDg4nTvIKqvNVHRIq8iduM+InK0mMl3WXV+/Q0ax93CR3wfStHE0G2hP9ep
fO1ZWdgPtw4Do9RRh9j+0K6eEmyA/EhDy6kTYptonIRcz9+yRRS8OhNtg+8xrwIk
0nPhlBKpvZKcSDhISyJfakbktXVFuEYaPgJXilBK7AjVPIUxS+9VVCR1v1AxA/Ep
CcDn/akUBbFf4s6/HD2kiQUEghfxrPp4lt0qqBb0Mbe4eDjVlAtbQFQll1RyOf9F
Vf2K/0I/bdIG/TCAu7qDLJqypUdjOSUAYxBe2tkuewkLji+xFg61Z9J8Pdb/gFUZ
ba/tacoXY1gRF+56yaj07WlJg1GcKtMWNmP+531awg/sSm7v1M89qhXM5kqMAc9H
5dIt1m/rSiTDW9zjOUS1Rh0WtUnZYqG4MKZNxLqasat9rwW3it9PPCHykTlDmHay
OtZakA1Y43+fELFCVsJgJnfPC6y3F0o6FFHL1pXCIvI4+JfEUIQ=
=GLvq
-----END PGP SIGNATURE-----

--nextPart3096302.iHDqCeegG6--





--===============8609644286598458446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8609644286598458446==--
