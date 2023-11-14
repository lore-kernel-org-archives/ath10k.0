Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B49A0C4332F
	for <ath10k@archiver.kernel.org>; Tue, 14 Nov 2023 21:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HMiFYBTrn4c8s42Uh7bAYgTZ2pTsjoVCcxyI2v2ZIuQ=; b=cdvtIV3HrA8wZEipBa3cILKEoW
	CHR5nkzbu9R4y5RfWOLE8tD3uh2t0rue1UYRGCsrLXIJZtZFGNwmOLGAR69fwrdRIUiuaXjDgKtgC
	7IJblyM5dH/V0sNsGsVfGTmeTsl1OGnNBt4xHz8eCywdPltqldV2rvCB8FFohCIssVX/BHl3IUrls
	2NkUI+eZx/hvjdtwgW4702yoHz+bOsMtP6LZ08HT97v+qGB2e1tBmV0ZQX3CK0SZZn9C6bWs9aubI
	1iDR3VIrfsk3C4SC4YRzfIHsHCWtiUNBlJXY7Z2iukKT1njc1VG/5wiOInkeT9BPLI9tV3wDdPVnS
	JgY9rz8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r31IS-00Gs5s-0E;
	Tue, 14 Nov 2023 21:50:12 +0000
Received: from out-186.mta1.migadu.com ([95.215.58.186])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r31IO-00Gs5Q-38
	for ath10k@lists.infradead.org;
	Tue, 14 Nov 2023 21:50:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1699998601;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZFb1YUmP4PlD7cm7heieX6s0LPelSFaQRLcm3e9dz4g=;
	b=QtSRvO/wGtINt13M+YQyuNDK7xWRKsty2mDJvMHCBiORnfZPpBuJ7ZBR3QWtEuX8NYwe8g
	5DuNkQ3dOQfdVSR7rMJwYjD/2TjN9RZ3PqL5+aPO0R4SzmBhk236cBgZhU8FOZp0VBAomz
	Pjirdoi5RzVXkMYRf/JKrNr1gWop9P6hCITTw0iIZPPLVI4rOme4ZPmci1PSiULJfjOM7E
	sRnptivoDhpj+nImxQuxC32rI1cC/AP6m3oxd/BS7kq22MoTycGM9If66w24X2x3V1BUer
	YsMJ9PPrvi4eC7/nwk/mPE8XTiWg/YpzpC6wUBAacrgBuRpJbiNZiOO6hrRahA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>, debian-kernel@lists.debian.org,
 Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Kalle Valo <kvalo@kernel.org>, linux-wireless@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, ath10k@lists.infradead.org,
 Ben Hutchings <ben@decadent.org.uk>
Subject: Re: ath10k_pci logs errors about missing pre-cal and cal firmware on a laptop
Date: Tue, 14 Nov 2023 22:49:50 +0100
Message-ID: <73921857.09T0xDi13r@bagend>
Organization: Connecting Knowledge
In-Reply-To: <58d017a1-cae6-46d8-9cee-515dbf607051@molgen.mpg.de>
References: <7158e5e9-8bdc-4660-ac5d-5e3f81cf6158@molgen.mpg.de>
 <2e4be606-68a9-455b-a43d-20b8375efc49@quicinc.com>
 <58d017a1-cae6-46d8-9cee-515dbf607051@molgen.mpg.de>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_135009_440462_A639DE56 
X-CRM114-Status: GOOD (  19.49  )
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
Content-Type: multipart/mixed; boundary="===============8377438208163516815=="
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

--===============8377438208163516815==
Content-Type: multipart/signed; boundary="nextPart10502693.KXfdfZlzAl";
 micalg="pgp-sha256"; protocol="application/pgp-signature"

--nextPart10502693.KXfdfZlzAl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"; protected-headers="v1"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Diederik de Haas <didi.debian@cknow.org>
Date: Tue, 14 Nov 2023 22:49:50 +0100
Message-ID: <73921857.09T0xDi13r@bagend>
Organization: Connecting Knowledge
In-Reply-To: <58d017a1-cae6-46d8-9cee-515dbf607051@molgen.mpg.de>
MIME-Version: 1.0

FTR: I do NOT speak on behalf of the Debian kernel team.

On Tuesday, 14 November 2023 20:58:58 CET Paul Menzel wrote:
> > Based upon the message:
> > [   14.401143] firmware_class: See https://wiki.debian.org/Firmware
> > for information about missing firmware
> > 
> > it seems you are not running a stock kernel. So perhaps Debian has
> > modified the firmware loading such that it ignores the FW_OPT_NO_WARN
> > flag and warns even when told not to do so? This does not appear to be
> > an upstream kernel issue.
> 
> Thank you very much for the analysis. It seems to be indeed a Debian
> specific patch [1].
> 
> Dear Debian Linux kernel team, is my observation about the error log a
> result of the patch and intended?
> 
> [1]:
> debian/patches/debian/firmware_class-refer-to-debian-wiki-firmware-page.patch

There are a number of Debian patches wrt firmware and *I* think they should get 
a (serious) review. In https://bugs.debian.org/1040738 I requested a review of 
the firmware related patches and described one of the issues I encountered 
myself. I've also been involved in triaging Debian kernel bug issues and there 
I've encountered several more such cases.

AFAIK quite a bit of work has happened upstream to make the firmware messages 
more appropriate and I think the Debian patches haven't been (properly) 
adjusted for those changes.

So they are (very) likely caused by the Debian patches and thus expected, but 
I'm hesitant to call them intended ;-)
--nextPart10502693.KXfdfZlzAl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCZVPrfgAKCRDXblvOeH7b
boiXAQDA1uG7ZfQM5AYj9rUiuH0ukanafGQ2IiEA/RJJ4CiqrQD+LQCWZ+QZJF2n
ZI0Wzz8jlYnQUxCwRfbYW9pRT6Oo9go=
=ZsyL
-----END PGP SIGNATURE-----

--nextPart10502693.KXfdfZlzAl--





--===============8377438208163516815==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

--===============8377438208163516815==--




