Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr0-x236.google.com ([2a00:1450:400c:c0c::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cicgZ-0004tX-DE
 for ath10k@lists.infradead.org; Tue, 28 Feb 2017 07:59:05 +0000
Received: by mail-wr0-x236.google.com with SMTP id l37so2997343wrc.1
 for <ath10k@lists.infradead.org>; Mon, 27 Feb 2017 23:58:42 -0800 (PST)
From: Sven Eckelmann <sven.eckelmann@openmesh.com>
Subject: Re: QCA4019: calibration files and board files
Date: Tue, 28 Feb 2017 08:58:39 +0100
Message-ID: <1884460.SDYHzsflKl@bentobox>
In-Reply-To: <017699fcd5b2f14fee8708fc8d8863cf@codeaurora.org>
References: <1591748.RGYhBEn8I1@bentobox> <4082394.QILMJyBdPS@bentobox>
 <017699fcd5b2f14fee8708fc8d8863cf@codeaurora.org>
MIME-Version: 1.0
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2719069320058578209=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: akolli@codeaurora.org
Cc: Rajkumar Manoharan <rmanohar@codeaurora.org>, ath10k@lists.infradead.org, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, Raja Mani <rmani@codeaurora.org>, Tamizh chelvam <tamizhchelvam@codeaurora.org>, shashidhar.lakkavalli@openmesh.com

--===============2719069320058578209==
Content-Type: multipart/signed; boundary="nextPart3574322.LWiv8nvSUA"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart3574322.LWiv8nvSUA
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Donnerstag, 9. Februar 2017 15:56:59 CET akolli@codeaurora.org wrote:
[...]
> Thanks for pointing this, I broke the sequence in qsdk while loading cal 
> data
> from flash MTD partitions. I will revert these changes in QSDK patch[1].
> 
> @@ -224,21 +224,13 @@
>   +		 * from board data content and caldata content downloaded in
>   +		 * previous steps.
>   +		*/
> -+		goto load_bdata_and_run_otp;
> ++		goto done;
>   +	}
>   +
>    	ret = ath10k_download_cal_file(ar, ar->cal_file);
>    	if (ret == 0) {
>    		ar->cal_mode = ATH10K_CAL_MODE_FILE;
> -@@ -1401,6 +1520,7 @@ static int ath10k_download_cal_data(stru
> - 		   "boot did not find target EEPROM entry, try OTP next: %d\n",
> - 		   ret);
> -
> -+load_bdata_and_run_otp:
> - 	ret = ath10k_download_and_run_otp(ar);
> - 	if (ret) {
> - 		ath10k_err(ar, "failed to run otp: %d\n", ret);
> -@@ -2024,6 +2144,8 @@ static int ath10k_core_probe_fw(struct a
> +@@ -2025,6 +2144,8 @@ static int ath10k_core_probe_fw(struct a
>    			   "could not load pre cal data: %d\n", ret);
>    	}

We now got answer from QCA support (Eric Guo, case 02807752). He told us now
that the data on the ART partition is *not* the pre-calibration data
and instead is the full calibration data (he is is not really clear about that
part).

It looks to me now that this information is contradicting your implementation
(which now loads the data from 0:ART partition [1] like pre-cal data [2] and
then loads the board-2.bin [3]). 

I have doubt regarding his explanation but I got no actual spec - only
information which seems to be contradicting (or to vague) . Is is possible
to get some confirmation from you about whether the data from the 0:ART
partition is pre-cal data or not and whether the board-2.bin should be
used when the data from 0:ART is used.

It could also be that Eric and I are just using the terms "pre-cal" and
"calibration" data differently. My understanding until now was that:

 * pre-cal data + board-2.bin info == actual calibration data

Maybe he is using a different definitions like

 * pre-cal data == some incomplete calibration data from somewhere else
                   (he never specified it - just that it exists)
 * calibration data == incomplete calibration data from 0:ART
                       (what I've described in the past as pre-cal data)
 * (pre-cal or calibration data) + board-2.bin info == actual calibration data

Would be nice if this confusion could be cleared up by you.

Kind regards,
	Sven

[1] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/a00-0058-ath10k-add-qca40xx-mtd-caldata-download-sup.patch?id=b9910f7bd128b719562b6807388ef5519e7676c1#n123
[2] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/a00-0058-ath10k-add-qca40xx-mtd-caldata-download-sup.patch?id=b9910f7bd128b719562b6807388ef5519e7676c1#n213
[3] https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/tree/mac80211/patches/a00-0058-ath10k-add-qca40xx-mtd-caldata-download-sup.patch?id=b9910f7bd128b719562b6807388ef5519e7676c1#n222


--nextPart3574322.LWiv8nvSUA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAli1La8ACgkQXYcKB8Em
e0aYyhAAmCvNeM1lWkE7pqUI4PFIpWNeFHeejd/VJkF113se6JtQFAIh3fXkKKdp
ctUnXQsmmZDTap4kFx7uqaCLdwPHUQzIDsEc6PoTGJ/mp5K3PiJ9nd+XvH4ibgaS
7u+/Mq8JZdixjFyuQ+AsBHMuPtQfeKqn2TGJ1YxtUKDC+Lr+T3KDGrAXHSykjKG7
GbW2O//+JXdadm3nktbPC3znOCJageJY4kVAY2hkFWSsgkYCw/tUkjMiCrVxERnx
Sg66asGfkj/NWiJ9bN0aePb/n0huxeSC8kIyoFqnXYdNoeXsqixAI42Wltjaj2Aj
AcAyZbfREKkCz0FH6P+svUNf+dfoyGn8FeVbQ0v9Juq/0SeTh4dp1yGmyZSqrfnS
afNwL4BZBnyQYIhYYU++B2r4EALgTbmDT9HKFPavYncJ6XeORdB99Hr0PC78O4vE
peLc5LvyfhEjwHpkKoenzLTG+Hiz5s7oEtz/674r8gXjHj1U6kPqc5BpFrE0rrf1
CoE+vJwWLZ1PHEBtocQu4zIdmsERAINs9GPN0V1PCFlPP1e+RFFJ2+wVA/cQ5atN
SjBBEvhsjylQXgC2tCLMFA12jsi6yxj9vNF+/+aHH9bU7pq596xaaDqnd5CI99Ze
e6UDTdJ+tX45rSyb1bXoo6q/LGA45kcjjRM0S2nERX7+JDUEgIU=
=3Z5h
-----END PGP SIGNATURE-----

--nextPart3574322.LWiv8nvSUA--



--===============2719069320058578209==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============2719069320058578209==--
