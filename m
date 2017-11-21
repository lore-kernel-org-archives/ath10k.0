Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qk0-x22e.google.com ([2607:f8b0:400d:c09::22e])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH592-0003SO-P0
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 09:47:12 +0000
Received: by mail-qk0-x22e.google.com with SMTP id a142so11161675qkb.5
 for <ath10k@lists.infradead.org>; Tue, 21 Nov 2017 01:46:48 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: [PATCHv3 1/2] ath10k: add per peer htt tx stats support for 10.4
Date: Tue, 21 Nov 2017 10:46:41 +0100
Message-ID: <2639938.VraEUeHfYF@bentobox>
In-Reply-To: <566f915b-0dbc-573f-3a6a-95ecf571674a@dd-wrt.com>
References: <1479227849-10042-1-git-send-email-akolli@qti.qualcomm.com>
 <87h8toc9dq.fsf@kamboji.qca.qualcomm.com>
 <566f915b-0dbc-573f-3a6a-95ecf571674a@dd-wrt.com>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3463223827046416424=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: Yifeng Tu <yifeng@qti.qualcomm.com>, Daniel Jeang <dyjeong@qti.qualcomm.com>, Anilkumar Kolli <akolli@qti.qualcomm.com>, "akolli@codeaurora.org" <akolli@codeaurora.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Kalle Valo <kvalo@qca.qualcomm.com>

--===============3463223827046416424==
Content-Type: multipart/signed; boundary="nextPart2760260.seSr6Edl5p"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart2760260.seSr6Edl5p
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Dienstag, 21. November 2017 10:00:20 CET Sebastian Gottschall wrote:
> maybe this one?
> 
> i have this qca988x supporting tx/rx rate patch in my local tree. just 
> need to extract it again
> 
>   ath10k: report per-station tx/rate rates to mac80211

This one sounds like https://patchwork.kernel.org/patch/8597341/ - and it is 
something different (end is implementing get_expected_throughput "wrong" and 
therefore overestimates the expected throughput extremely). This patch is 
using the stuff from fw_stats to fill the station rx/tx information.

It is not the worst thing to do (I want(ed) to use something similar for my 
purposes) but there is a special pktlog message on 10.2 which contains the 
same information as the 10.4 HTT_10_4_T2H_MSG_TYPE_PEER_STATS.

Kind regards,
	Sven 

--nextPart2760260.seSr6Edl5p
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAloT9gEACgkQXYcKB8Em
e0YR/Q/+ISKsP3zkAFNyzCfFB1fuoOkCqXuzboIoqavaV1tQF3eb5/gWaQ+iLvBn
xWi4gDV86ustOjz18Fvi5yghHfEUwd0BoKAR7ghBm6BT/+jvtiYfiClJ03of7UDp
hydIBzx4mibPpzpnxz08MZgxpfhJBXk/q/PTSf1x/XjPjQVqzziSI6u3KVzo9EhR
iNmNNBNryMZ7tebT0c/xBIh/CapmYcoc0o5mLrH2wb5Gmy31eJBduhKAofeHT+Um
2JqdDz4DmfI5pMAlOUvucNp9GR3fHgOwAFLUQYSM+LV3GI/8JtSSKPpZ9aeD6+4P
KNVyGrkXqm62ZjzvyS+8WnCN0231nIgRJycZvFzQgbmT668gbsqcPSu6QD0gfFP5
1HrBAfVAmF5QOYRkRds7gnYZy+DtvdQ42Anuoh2Mtdl00An+Z+7plpb6NUHYDHhp
tyK6q3uo5lHsJu2bFfF0KmKRvGLdDj0XoPxVGd/+qz1C0m/eFqT56e67CdW8r3RV
RczpwYHSYMerI7eLiFlj3cUElmGMKRyhyhSGVDuh9os+F6oVXbaoqyRlUl9kS+qn
Szd0yb387nC4IEyhchxIgvfcBgogguG+s9HNtc89CWUUeQ99VXQD3kdg++KPdCAJ
FRVuqtnoyfEcvV2adUoRj8Ex2b9kfHWYxh/R1pznW09IKVLfy4c=
=PwzF
-----END PGP SIGNATURE-----

--nextPart2760260.seSr6Edl5p--



--===============3463223827046416424==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============3463223827046416424==--
