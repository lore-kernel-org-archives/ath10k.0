Return-Path: <SRS0=s6Jr=LD=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55DACC48BCF
	for <ath10k@archiver.kernel.org>; Wed,  9 Jun 2021 13:35:02 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13BD8613AD
	for <ath10k@archiver.kernel.org>; Wed,  9 Jun 2021 13:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13BD8613AD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=storopack.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jHh0x8ZmewSkc/gXEG0CD/+eDEPb9Dmuqz2DlaxsvBo=; b=gKoUDK/DUXPH7S
	nU+82/tHUtaiDRfNQONPrBSee56zh/3iAmc5KcaHQWRy0hcI3yey2fWHQK23SGHlap/zoa2WVgh+e
	iPWXt024+0n5AN6pTO1Zh23dahprr0qkROFEn/rQN2eJDtpAPmi4OY1YtqXjiKsCIpuHkvL4Tylmx
	f+9Rh1h1BuDcUjY1lFb0bQ8vmadcB6mt24Hk0gR1aYYptYccUofnno3PDq6+pt9JrAeHg6+mxyNzs
	WsxZ5vUwXvpCxD2tZA1h/mAiUjaBeZnUOiRA/2axTz/MU/LTBcQDfvC+OohTGC/10YUYcNW1IcqOn
	dnU5Wn9vP0ZuUxske2RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqyKj-00E14h-Dy; Wed, 09 Jun 2021 13:33:26 +0000
Received: from relay.stp.tds-sharedservices.de ([185.55.232.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqxq1-00Dsiw-64
 for ath10k@lists.infradead.org; Wed, 09 Jun 2021 13:01:42 +0000
Received: from relay.stp.tds-sharedservices.de (localhost [127.0.0.1])
 by relay.stp.tds-sharedservices.de (Postfix) with SMTP id CF57634063E
 for <ath10k@lists.infradead.org>; Wed,  9 Jun 2021 15:01:38 +0200 (CEST)
Received: from stpinfexc2vp.corporate.storopack.net (stpinfexc2vp.nat.tds.rz
 [10.252.18.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay.stp.tds-sharedservices.de (Postfix) with ESMTPS id B27F53405C6
 for <ath10k@lists.infradead.org>; Wed,  9 Jun 2021 15:01:38 +0200 (CEST)
Received: from stpinfexc1vp.corporate.storopack.net (10.252.18.138) by
 stpinfexc2vp.corporate.storopack.net (10.252.18.139) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Wed, 9 Jun 2021 15:01:38 +0200
Received: from stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) by
 stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) with mapi id
 15.00.1497.015; Wed, 9 Jun 2021 15:01:38 +0200
From: "Wadepohl, Wolfram" <wolfram.wadepohl@storopack.com>
To: "'ath10k@lists.infradead.org'" <ath10k@lists.infradead.org>
Subject: PHY settings for RED certification
Thread-Topic: PHY settings for RED certification
Thread-Index: AdddLrTF3nXFC5KdQrOldceNRpL4+Q==
Date: Wed, 9 Jun 2021 13:01:37 +0000
Message-ID: <55c4eee535ff43729e6f469d893a2f68@stpinfexc1vp.corporate.storopack.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.13.24.5]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_060141_420630_113ABAE5 
X-CRM114-Status: UNSURE (   5.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I've to do a RED and FCC certifiaction with an OEM radio device running GNU/Linux 5.10 and ath10k on Qualcomm QCA9377-3 (SDIO).
I want to know how to set PHY parameters like bandwidth, modulation, transmit power, contnious sending rsp receiving.
Any hints available?

-- 
Wolfram Wadepohl
Platform Technology & Data Management

Storopack Deutschland GmbH & Co. KG

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
