Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24BADC433F5
	for <ath10k@archiver.kernel.org>; Tue, 22 Mar 2022 06:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S4Ai00Pc59tAC1l1EYNjFcKG8ooDXuVVxTGTwZHwK1Y=; b=mic4gQW1p3RbACiNhWGEW4pPnr
	g89Zclmot41mcW7eiBSzkpR34NscGUB8Fw008JjYS9n2/GpivLb71hdkQ8oYtgUyptvIDooQ4WGXK
	t2EuHHakE50EI83f4fKbnGk9budM3mLuogr8METajt2C2B3//DkuKRZKlEqHmObjc+uHRt1VB/wz+
	8IrmNrVwlB5uS1jLSzlrc8s+XU0DkE0rigFFE04Hsne8nUd+rkD+D+vkRkCgWg/FjKFVSqcGa4lLh
	AEsKQsRkbFH9bVeb9TKBXSAnOG3oN511EwhWdBa45Vu2WK71iZFa0exrttLYquKeTLTnOaW8gPScc
	5swNZTWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWYFo-00AChk-9R; Tue, 22 Mar 2022 06:44:28 +0000
Received: from www.zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWYFZ-00ACdj-Rc
 for ath10k@lists.infradead.org; Tue, 22 Mar 2022 06:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple; d=sang-engineering.com; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=k1; bh=bhAaAoHzDrHU3De5X0RjnAUGIT+O
 wJfzwQ5eF0K/cVQ=; b=O1PKZFbygdvZvUPjWOql2HeAuNmG+Mqzue+CrPt+BXKJ
 k+GX/2eEhNr6I7MDSJy99FdhNAeg6ArjWNMTC/3LJJSOSY6oY6OQ4/xGOvEwwF66
 f8G+ucaN20R3cPf3ZJ8WmSkaK7+cNqNO1H9eQ570kLH1nvWceNuF9eAbQMRA+yY=
Received: (qmail 1202223 invoked from network); 22 Mar 2022 07:44:02 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted,
 authenticated); 22 Mar 2022 07:44:02 +0100
X-UD-Smtp-Session: l3s3148p1@O7gT8MjaPpQgAQnoAGKBAM/VPJLYEVe1
Date: Tue, 22 Mar 2022 07:43:59 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com
Subject: Re: [RFC PATCH 00/10] mmc: improve API to make clear {h|s}w_reset is
 for cards
Message-ID: <YjlwLzxxxR1QIpDK@ninjato>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com,
 brcm80211-dev-list.pdl@broadcom.com,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 SHA-cyfmac-dev-list@infineon.com
References: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
In-Reply-To: <20220321115059.21803-1-wsa+renesas@sang-engineering.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_234414_251659_AAFBD1AC 
X-CRM114-Status: UNSURE (   6.20  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1729492860459638942=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org


--===============1729492860459638942==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="WMfMF+E/rJD23w9V"
Content-Disposition: inline


--WMfMF+E/rJD23w9V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> I tested it with my Renesas boards, so far no regressions. Buildbots are
> currently checking the series.

Update: buildbots are happy \o/


--WMfMF+E/rJD23w9V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmI5cCsACgkQFA3kzBSg
Kbau+Q//bVoc4SoG8It5AVIpQdUks3DAupSbmrT8ebI7arPQCFlUV7n9abCA3RZW
aH9m01itrfZ7TWxSJ2gUp4VR49LlweNqQEcyo/TEkzfZ558St7Wu8pRV9rPfEleo
v310K9zePQwzipMwNJ1htVYvN6wapEoromv45gj//La15GSw3pc8GJxSZBp+AxHa
VaeazFG6z9uAL3MGjpTwU8cEu4vWZFP8txloEVXTtT7iRu26H9/x/Rrmu+8xuchk
ReGG2mn/rAMo3JAzEJvvempkzHSUpjnMq2kDYOqqYvGT8yRGjVcEMSSjp5bVKevz
vi9zIkfJ8Q+Q/oXSC1jOFP7y98lXv8mIOyPlnHev6KhIZMGVooNWDFpnJqPAaTa7
HU8mQ1IEqoNsZ7/OCdCliRZGQG5NL0XJDGyxcZyBoUSiAvegDlh8v17A5ukm/jBS
eWGHjajY/McPxd8LM78WOANF0sQD5Adiyhrx1U5gStqWRYrVE5ppRig38LvSQ3ZH
GOg3rN2Jfjq/PJv38Ykow9fv4TPIywy/UlZuVGpt3GlqcN1rNojffDYTzbKCPUwX
83cEyZW4/ngtKZf6scgipsHntN7WDQ/xbSWDHb7uZux/x+cIsZuKQiHB61mqecwa
k1BwoutPwvyQkK9gHC3hlPEDa+S5CRl5NIQlnPkB1Fic4C1/S1k=
=nk9X
-----END PGP SIGNATURE-----

--WMfMF+E/rJD23w9V--


--===============1729492860459638942==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1729492860459638942==--

