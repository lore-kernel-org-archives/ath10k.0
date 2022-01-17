Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD06C433EF
	for <ath10k@archiver.kernel.org>; Mon, 17 Jan 2022 10:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qcJgzOEdgPOMTjebKa+pR9lpsJMBsNyvG0tQBTwrlc0=; b=wJMsg7erTToWFV
	/LKvvtObBwahuhyOYZKVsyCjo7+4GvK0E6WB3wZkXUDavI7eLvYz3A3tJR9jcJVwyDYAb4xF93sy1
	E3QTsdYr23Uy19E5oODmRqQ8PPAXNjGg0zqKBkjA2ovE91oo/gL+kyd5m8iqRc8bsKIJT7NTvjCNf
	W3D+n2VZUKaCGh3iZv3Uy+tKjQSbAEYKXc5bjZM1RKTaMMBng6RXqPlGFwIQiwJ53SF6MhAfS2I5n
	LcgzW/RR1iSJUaLGrijoatbUbTWvMrbzM3OIy567mWgDoNcBU4yWgKOPwmKa4z5cR0Mdhile/XKC9
	UuBDuOHwtvJu6Z/rdioQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n9PEn-00EUhQ-Is; Mon, 17 Jan 2022 10:27:45 +0000
Received: from relay.stp.tds-sharedservices.de ([185.55.232.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n9PEk-00EUgB-1d
 for ath10k@lists.infradead.org; Mon, 17 Jan 2022 10:27:43 +0000
Received: from relay.stp.tds-sharedservices.de (localhost [127.0.0.1])
 by relay.stp.tds-sharedservices.de (Postfix) with SMTP id 74A4F34021B
 for <ath10k@lists.infradead.org>; Mon, 17 Jan 2022 11:27:39 +0100 (CET)
Received: from stpinfexc2vp.corporate.storopack.net (stpinfexc2vp.nat.tds.rz
 [10.252.18.139])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay.stp.tds-sharedservices.de (Postfix) with ESMTPS id 547233400E9
 for <ath10k@lists.infradead.org>; Mon, 17 Jan 2022 11:27:39 +0100 (CET)
Received: from stpinfexc1vp.corporate.storopack.net (10.252.18.138) by
 stpinfexc2vp.corporate.storopack.net (10.252.18.139) with Microsoft SMTP
 Server (TLS) id 15.0.1497.26; Mon, 17 Jan 2022 11:27:32 +0100
Received: from stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) by
 stpinfexc1vp.corporate.storopack.net ([10.252.18.138]) with mapi id
 15.00.1497.026; Mon, 17 Jan 2022 11:27:32 +0100
From: "Wadepohl, Wolfram" <wolfram.wadepohl@storopack.com>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Subject: cannot initiate radiation because of NO-IR setting in device
Thread-Topic: cannot initiate radiation because of NO-IR setting in device
Thread-Index: AdgLi1eTiSeucnjmSuiNmwK/7F+bPA==
Date: Mon, 17 Jan 2022 10:27:32 +0000
Message-ID: <3d6d00ce2cbf44139656eec64e8f0b32@stpinfexc1vp.corporate.storopack.net>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.13.24.7]
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220117_022742_262568_C4EF5450 
X-CRM114-Status: UNSURE (   7.07  )
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

we want to setup an access point on ch. 36 (or any other DFS free channels) but the user mode cannot override the NO-IR flag for the channel which is stored somewhre in the firmware or device.
We are using the regulative domain DE or US.
How can we solve this problem? do we need the help from the device manufacturer (8devices ReadBean QCA9377-3 based)?
Thanks

-- 
Wolfram Wadepohl
Platform Technology & Data Management

Storopack Deutschland GmbH & Co. KG

Phone +49 (0)7123 164-2062
Mobile +49 (0)160 9531 5679

Next Absences: 18.01.2022


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
