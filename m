Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B99F7C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 09:07:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5065760C3F
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 09:07:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5065760C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qSjjlq7bwJTB/+jBsH2PqnVzDrTD5zB60ptn3o5zWh4=; b=nLFMLI7LePjqOj8NQnPXsgIsk
	pdZm+BzommDvQA96zKVpIaFlLQWAE0Zr5ZhWhTCDDiS+x99Mdk++JNUgrkVUToCKnS+48M6Ae/gul
	yDwIbOvp5+jJMJIj29ZHha3xtFdT9fV6P+YZLak+hksn371h+yAYlAZmHnq5KFKuvRtAOACgPAQ0L
	V2eg1w5EwntxL7IbyA3njyzgyyTLW+fAVUvfONcJPGYq4JRmEzOwiSdQzdVCNEkGgo+gxuFlzzf7+
	/TwM8L4JTvCfaHuxrMP+tfC63TFNx2mb05kiLSyVs17/m7d5K8qY0M41dEJWuBhyme/xMRsXkYQCL
	fOMru14yw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6rdr-0007BH-Nj; Tue, 02 Feb 2021 09:06:35 +0000
Received: from dvalin.narfation.org ([213.160.73.56])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6rdp-0007At-3e
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 09:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1612256791;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=IopSD33eXccBitWrgmD8ly9Qj0wLAyb8hu9i8y6tEMw=;
 b=DkO4y+Fmfqso3c9AVSZ1B0vFxidHxrw8OjRDCtK5RDhTU224lQWGJLb/KQjJaBJttMKsPa
 9mNnK0kFLNxZGKVSU+JsyBBSBZdLt43TTZ/RclOsuLhTuE6l/8cNI979uYvCa1EuTkCISJ
 yB9lGSoD8HSVSv6q3iKF3tguhL8Jf7A=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>,
 Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 10:06:26 +0100
Message-ID: <2354947.QRssEMCmQP@ripper>
In-Reply-To: <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <6253766.kEHZKgWlQx@ripper>
 <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_040633_258827_A23AA16D 
X-CRM114-Status: GOOD (  16.29  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9099585080399415899=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============9099585080399415899==
Content-Type: multipart/signed; boundary="nextPart1668554.9bfV69kq4U"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart1668554.9bfV69kq4U
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>, Sebastian Gottschall <s.gottschall@dd-wrt.com>
Subject: Re: EAP AP/VLAN: multicast not send to client
Date: Tue, 02 Feb 2021 10:06:26 +0100
Message-ID: <2354947.QRssEMCmQP@ripper>
In-Reply-To: <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com>
References: <268706864.fOQeQAt3TZ@ripper> <6253766.kEHZKgWlQx@ripper> <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com>

On Tuesday, 2 February 2021 09:58:45 CET Sebastian Gottschall wrote:
>=20
> Am 02.02.2021 um 09:23 schrieb Sven Eckelmann:
> > On Tuesday, 2 February 2021 08:04:56 CET Sebastian Gottschall wrote:
> >> the standard ath10k firmware f=FCr qca988x chipsets does filter vlans.
> > Just to be sure that we are talking about the same thing: I am (or actu=
ally
> > hostapd is) using NL80211_IFTYPE_AP_VLAN here - not 802.1Q.

> then it might be something different. i'm not sure at that point. but=20
> consider that AP_VLAN is also used for WDS STA/WDS AP implementations.
> so each wds station becomes a individual interface on ap side for=20
> bridging. that might of course have a influence to broadcast/multicast=20
> frames

Interestingly, the WDS "mode" works perfectly fine  on the same hardware. S=
o I=20
have not a real idea what the difference is between EAP AP_VLAN and WDS (PS=
K)=20
AP_VLAN at the moment.

> in addition the 10.4 firmware series has a special wmi flag which is not=
=20
> used by ath10k, but solved alot of problems for me (in my case with=20
> reauthentication)
> WMI_VDEV_DISABLE_4_ADDR_SRC_LRN
> this might be unrelated to your issue. but this flag must be set anyway=20
> for proper work. but it isnt by default in all 10.4 firmwares.

Good to know, thanks.

> > For Ben Greear's firmware, the only workaround which I found until now =
was to
> > set NL80211_ATTR_MULTICAST_TO_UNICAST_ENABLED to 1 to force mac80211 to=
 send
> > multicast as unicast.
> so if its a pure multicast/unicast issue it could be also a basic rate=20
> issue for ct firmwares.

Interesting idea. Btw. I've also switched to sw crypto for a test just to m=
ake=20
sure that there is no HW key problem.

Kind regards,
	Sven
--nextPart1668554.9bfV69kq4U
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmAZFhIACgkQXYcKB8Em
e0ZFqQ/8C7dqcJr6IpZHQuqOIsD3LOmCUyohDIHcQzSHuBAxnAoYNgL13f+8ppOu
2abSUu75QD70+yOc4JERWmhffGgSSR4CzcytLdt0kLV4E7CEdGzHM6FQ4HImP5ys
MC46HfeP7YeJFaaFA71nJXdAq2YMz+wgO5wIuNC5FgvBeG7WOvYKqcpQClLeFOI+
JzOhjmqJr8T9xQptYJfwC8e95zk65wEOVdDxhf6cSUE3eTm+Vi6jlQR0N3rWOtrA
cud7jfS2hG2TSqJGdyXs5YN6/8tmLdaxTW/DSkT5S33roOINb4LUCziqMOtA9H6/
A/YhsA05OvjOSTiGXXuXkdM2Xn68KbiD8bfGM/4TlcJyQHTiFt6PdSwQtFxHtkwC
0I7iRXlija0Pw8d/yAwhN4y6egZO6ZViLAJUZUCyXVljJGNTWqsynHzcU2i1xoVo
+9GEeZLWFWg1SJJ6QI0qtmFe8BzyTSwdDWp/IzuIudI67iU/RizOrNnfTCb8Au88
yPAjjRPUumm/UwgdmHahGmSEbm5XZh6kjZPBtK9/u7Hy8BiI8F8hi7dRz74+0h8S
NN9JJex0WxabkOfjk8ISN+mJvcK7DZV2T264NyFiBYo49LTWzk32uVFYeLkwjbws
sesvat6ZVQlYM3isSa6qxURPhxpK/dOCKOWIjYxpF2m/eKYju1E=
=9fr5
-----END PGP SIGNATURE-----

--nextPart1668554.9bfV69kq4U--





--===============9099585080399415899==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============9099585080399415899==--




