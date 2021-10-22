Return-Path: <SRS0=d3gV=PK=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3E03C433EF
	for <ath10k@archiver.kernel.org>; Fri, 22 Oct 2021 11:44:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A272361053
	for <ath10k@archiver.kernel.org>; Fri, 22 Oct 2021 11:44:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A272361053
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=storopack.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PhHWj2zMbHtGa516zjI6zVSjgOCht589E8ATyTVxaVU=; b=2w1zgdF0zX3WVC
	m/5EFITc8YbYaNvw9vcNu7G87pvEvIWKwCaXo2aXJh4/NpfZpQo5VPznTkTC/epbg5hjvbvW850uL
	jhurz9bIBehZno8Snz7DolnNgCo3PALzalGyA2KR/YtNXf1ikacBD7Eq4VsyfqTlWznr3X2x8IzXK
	K6BSctpMUE10tmIo4cDnghn/xRWSER07LR3gyXHWuS0/mCeGsG9cyxhzAT0wVj5QhNsgeNVcOgbDB
	hMsSGsEQcdStIexwR/GsrnwHUcL6eiFdJ9QYqC8sl8VfgxEITagd66ZMuxvzzEuFmYNUWbwdlEOr3
	w81GrfMtkwYIhWoINaaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdsy4-00Ag8W-QI; Fri, 22 Oct 2021 11:44:12 +0000
Received: from relay.stp.tds-sharedservices.de ([185.55.232.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdsy2-00Ag7r-LW
 for ath10k@lists.infradead.org; Fri, 22 Oct 2021 11:44:11 +0000
Received: from relay.stp.tds-sharedservices.de (localhost [127.0.0.1])
 by relay.stp.tds-sharedservices.de (Postfix) with SMTP id 58EEA34188C
 for <ath10k@lists.infradead.org>; Fri, 22 Oct 2021 13:44:09 +0200 (CEST)
Received: from stpinfexc2vp.corporate.storopack.net (stpinfexc2vp.nat.tds.rz
 [10.252.18.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay.stp.tds-sharedservices.de (Postfix) with ESMTPS id 3FFDE341814
 for <ath10k@lists.infradead.org>; Fri, 22 Oct 2021 13:44:09 +0200 (CEST)
Received: from stpinfexc1vp.corporate.storopack.net (10.252.18.138) by
 stpinfexc2vp.corporate.storopack.net (10.252.18.139) with Microsoft SMTP
 Server (TLS) id 15.0.1497.23; Fri, 22 Oct 2021 13:44:08 +0200
Received: from stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) by
 stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) with mapi id
 15.00.1497.023; Fri, 22 Oct 2021 13:44:08 +0200
From: "Wadepohl, Wolfram" <wolfram.wadepohl@storopack.com>
To: "'ath10k@lists.infradead.org'" <ath10k@lists.infradead.org>
Subject: PHY settings for QCA9377-3 based module
Thread-Topic: PHY settings for QCA9377-3 based module
Thread-Index: AdfHOfZHkKBIQw6qQ+ivw245wncSSw==
Date: Fri, 22 Oct 2021 11:44:08 +0000
Message-ID: <c581bff7f4114be98fb676ca60937587@stpinfexc1vp.corporate.storopack.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.13.24.7]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211022_044410_887319_8553D91E 
X-CRM114-Status: UNSURE (   6.50  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi,

I'm a complete newbie to linux wireless and want to know, how I can set tra=
nsmit power and antenna gain for the 8device RedBean (QCA9377-3 based)?


-- =

Wolfram Wadepohl
Plattformtechnologien & Datenmanagement

Storopack Deutschland GmbH & Co. KG

Phone +49 (0)7123 164-2062
Mobile +49 (0)160 9531 5679

P.S. N=E4chste Abwesenheiten: 16.-18.11.2021, 22.-24.11.2021


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
