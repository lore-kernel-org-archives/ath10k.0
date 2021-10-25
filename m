Return-Path: <SRS0=tAHh=PN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BF69C433EF
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 05:28:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0DE460E96
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 05:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0DE460E96
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=storopack.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fy3aA7/eNHUOyXYCes4RiK7NygQrktSfCeEBaVlAcfs=; b=LyZXbcGh76+DLy
	Ehg+590bbzyhPw+4/V56tTbUWrvN7XWFrRBfnKKW6EKvhDQS2gCNOJDAlaN3ZLIYmFp01rVZYrl86
	VXcXiGmjVf0d9BNTYJh6BvQMEKcKki/74kPomUNr50ODG5LE7mFXWKSSzrHyccnsgbraLNMvgPr/p
	4gOgK1nhBja/gCNzy5H4czmJQgSKUhQvGyl5eJR3yWoqYn6Dm1KlZvcYYb7qzNaxb61miSqYz9gvK
	hlzVYmPmVcv0UPiGYjRJDZ5LmLdH+M4ucSCLfDE6Jfdd9f+PU4CfeosudEbRnI6ACooE3Jt0NRU9c
	FqOafUyd5+Q0oFSrxW5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mesXM-00FJak-GS; Mon, 25 Oct 2021 05:28:44 +0000
Received: from relay.stp.tds-sharedservices.de ([185.55.232.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mesXJ-00FJZs-CC
 for ath10k@lists.infradead.org; Mon, 25 Oct 2021 05:28:42 +0000
Received: from relay.stp.tds-sharedservices.de (localhost [127.0.0.1])
 by relay.stp.tds-sharedservices.de (Postfix) with SMTP id A6EDF340EC6
 for <ath10k@lists.infradead.org>; Mon, 25 Oct 2021 07:28:29 +0200 (CEST)
Received: from stpinfexc2vp.corporate.storopack.net (stpinfexc2vp.nat.tds.rz
 [10.252.18.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay.stp.tds-sharedservices.de (Postfix) with ESMTPS id 8B3683401FD
 for <ath10k@lists.infradead.org>; Mon, 25 Oct 2021 07:28:29 +0200 (CEST)
Received: from stpinfexc1vp.corporate.storopack.net (10.252.18.138) by
 stpinfexc2vp.corporate.storopack.net (10.252.18.139) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Mon, 25 Oct 2021 07:28:16 +0200
Received: from stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) by
 stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) with mapi id
 15.00.1497.023; Mon, 25 Oct 2021 07:28:16 +0200
From: "Wadepohl, Wolfram" <wolfram.wadepohl@storopack.com>
To: "'ath10k@lists.infradead.org'" <ath10k@lists.infradead.org>
Subject: RE: PHY settings for QCA9377-3 based module
Thread-Topic: PHY settings for QCA9377-3 based module
Thread-Index: AdfHOfZHkKBIQw6qQ+ivw245wncSSwAA6+QAAIjKPsA=
Date: Mon, 25 Oct 2021 05:28:16 +0000
Message-ID: <6cedffcd94464bb7957289ddc0ebb530@stpinfexc1vp.corporate.storopack.net>
References: <c581bff7f4114be98fb676ca60937587@stpinfexc1vp.corporate.storopack.net>
 <d2919db8-af63-5089-03a1-801a22a91f4a@bda.space>
In-Reply-To: <d2919db8-af63-5089-03a1-801a22a91f4a@bda.space>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.13.24.7]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_222841_609250_C938538C 
X-CRM114-Status: GOOD (  11.85  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Bryce Allen
> Sent: Friday, October 22, 2021 4:09 PM
> To: ath10k@lists.infradead.org
> Subject: Re: PHY settings for QCA9377-3 based module
> 
> Use the "iw" command as root, something like this, assuming 'wlan0' is
> the device name. To figure out your wireless device name, you can do 'ip
> link' to see a list of interfaces and the wireless one should be pretty
> obvious.
[WW/D ] Thats the easy way, but to compensate for an antenna with too mauch gain in an certain frequency area the power must be reduced persitently, not only temporary. 
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
