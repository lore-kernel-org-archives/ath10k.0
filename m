Return-Path: <SRS0=cvhI=OM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_ALL,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA79DC433EF
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 15:49:25 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 714876115A
	for <ath10k@archiver.kernel.org>; Wed, 22 Sep 2021 15:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 714876115A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=narfation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z+Ktstty9McWTjpGR5lI/bUzaArD08Wlo/+a0g+9l/A=; b=zfKipBca9hv8MErVB++bp6dte8
	FQ/j0PU72tZVUjXPwueU57LjOuV4sjlqtXTz/bDWgXPAdGk0plbssr8rcKTzBsmnnnrHtB6XGOPvM
	mEfX7rrAFBuTVMwm+05rhfkv2JaQHE5IVhvglV/tdyRoWsSzWr3FQAoRNvQDbw4apPOmHeMEF7qw/
	0RMvVSvqPvHkYMAKs0WdBvlPQ5beS0hkzeDP3ytufLYSAAgStbC5TlH/9WSfw6knWXMVHImbvFOd2
	709TwYL3rmPnd44FIojTxamN1lOl90PMikcPdP5opA030tt4rT1u/tCs16l5VltXsy3haxtRZT5td
	fNAQqO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mT4U7-0090wh-N0; Wed, 22 Sep 2021 15:48:35 +0000
Received: from dvalin.narfation.org ([2a00:17d8:100::8b1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mT4U5-0090vV-5d
 for ath10k@lists.infradead.org; Wed, 22 Sep 2021 15:48:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=narfation.org;
 s=20121; t=1632325709;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uLN25ZOcfukmwBOaIV64ZGeQ7sx/aNedlHl7cH/nWT8=;
 b=DutzWJrLcUCx1YQGFvj76zpUA0GTxjufDNnce4w1GvcxwO6KN7hdrXPW6jY7Ph2UgeFBaB
 WHzg2GxGDwRq3kFQWHB3LVWeyrtRXG+Ih/7D0noCuHm9yWFgjTayLrJf4nEFZ+Yt6iLpLr
 gnDfC6NVHQUaYG4WsYX8jeGk0cAsGnQ=
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org
Cc: openwrt-devel <openwrt-devel@lists.openwrt.org>,
 Marek Lindner <marek.lindner@kaiwoo.ai>, Sven Eckelmann <sven@narfation.org>
Subject: Re: ath10k: qca4019: FW crash on 5GHz when
 baseEepHeader.nonLinearTxFir == 1
Date: Wed, 22 Sep 2021 17:48:26 +0200
Message-ID: <17555113.WnMBOQ43yy@ripper>
In-Reply-To: <3423718.UToCqzeSYe@ripper>
References: <3423718.UToCqzeSYe@ripper>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210922_084833_581644_50F8E86A 
X-CRM114-Status: GOOD (  10.55  )
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
Content-Type: multipart/mixed; boundary="===============1363321810206339752=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============1363321810206339752==
Content-Type: multipart/signed; boundary="nextPart5730682.S9lqGrx1Bm"; micalg="pgp-sha512"; protocol="application/pgp-signature"

--nextPart5730682.S9lqGrx1Bm
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
From: Sven Eckelmann <sven@narfation.org>
To: ath10k@lists.infradead.org
Cc: openwrt-devel <openwrt-devel@lists.openwrt.org>, Marek Lindner <marek.lindner@kaiwoo.ai>, Sven Eckelmann <sven@narfation.org>
Subject: Re: ath10k: qca4019: FW crash on 5GHz when baseEepHeader.nonLinearTxFir == 1
Date: Wed, 22 Sep 2021 17:48:26 +0200
Message-ID: <17555113.WnMBOQ43yy@ripper>
In-Reply-To: <3423718.UToCqzeSYe@ripper>
References: <3423718.UToCqzeSYe@ripper>

On Friday, 17 September 2021 18:25:35 CEST Sven Eckelmann wrote:
[...]
> Interestingly, the crash disappeared when I've changed 
> baseEepHeader.nonLinearTxFir (offset 0xc2 in the BDF) from 1 to 0.
> 
> The device itself was using firmware 10.4-3.6-00140 (the version currently in 
> linux-firmware) - a working firmware is 10.4-3.5.3-00078. I also wanted to 
> "bisected" when this problem was introduced but there are only these two 
> recent firmware version available in Kalle's ath10k-firmware repository.

In case somebody wants to try it out, here is the config.seed for OpenWrt 
21.02.0:

    CONFIG_TARGET_ipq40xx=y
    CONFIG_TARGET_ipq40xx_generic=y
    CONFIG_TARGET_ipq40xx_generic_DEVICE_plasmacloud_pa1200=y
    CONFIG_ATH10K_LEDS=y
    CONFIG_PACKAGE_ath10k-firmware-qca4019=y
    # CONFIG_PACKAGE_ath10k-firmware-qca4019-ct is not set
    # CONFIG_PACKAGE_firewall is not set
    CONFIG_PACKAGE_ipq-wifi-plasmacloud_pa1200=y
    CONFIG_PACKAGE_kmod-ath10k=y
    # CONFIG_PACKAGE_kmod-ath10k-ct is not set
    # CONFIG_TARGET_ROOTFS_INITRAMFS is not set
    CONFIG_PACKAGE_kmod-hwmon-core=y
    CONFIG_PACKAGE_kmod-ipt-conntrack=y
    CONFIG_PACKAGE_kmod-ipt-nat=y
    CONFIG_PACKAGE_kmod-nf-conntrack6=y
    CONFIG_PACKAGE_kmod-nf-nat=y

Kind regards,
	Sven
--nextPart5730682.S9lqGrx1Bm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEF10rh2Elc9zjMuACXYcKB8Eme0YFAmFLUEoACgkQXYcKB8Em
e0aqGQ//ZZmb+ivlFNffew4t7CBsW22kkb1OGt83D6nv2scNXagzcuaIgOq2BPun
HHeKT8dGJfIesVzWCBoTzhe6mD4Sy1JwHku/zrMsEMH/3JLAE1FNz6vHpY4unKnO
ATMAdv4aJVHe/XwdsVFfwnyJzksADlJSWj/bw5YfabkSCnm7LVqsRTeQO77qKY7/
8A9ZupSIwO23bNUnPZHRpsMx/gjLaAM0rjUmBOVPOiULVQ/Twpcr6q9u/cC9mSz0
euY6SDrI7yGYqMYRbxPp8WzSwzoOcNOKyyWXnqNozzkrwYhgROKvSd9Jab8yWbBr
QbVLUJ0B4viji97VMo2p/qmdtrPqrpgTXSG1TqsrlZN96FoucDCwGejuNj67xLug
OqxFGkmUYxSG4L8OULj3KC02VYZLB5iFZgkwtB7f3u13unOaz5env23JF6MRInpF
CjAhJK/mQAmQ/+7G0dZ3FAZP1UK4ef7gXLbE+kiumUuWi7KnIvn5u6mHPEOuaRuf
e+sFuSTqdpkls789Qfdk7wTxeCDRfnXBi6mar+LYnn/3GiTaqWF5MwZ4B5/kigLX
qnAp2NrE7U3xK16Cwa+ZBC7E3w0KD9i814xkvKp5feW3I/uTfIQ7o3m+q/Jp0DCc
BOTdrrxLI5juv+TEfq8QsX6m7P/u29M9+AtAecPN13kERecmZ0Y=
=4cfS
-----END PGP SIGNATURE-----

--nextPart5730682.S9lqGrx1Bm--





--===============1363321810206339752==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============1363321810206339752==--




