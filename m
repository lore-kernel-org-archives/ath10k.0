Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD9CD4F21
	for <ath10k@archiver.kernel.org>; Wed,  4 Sep 2024 18:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:In-Reply-To:References:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bx0NfChvS/WRzwXKgzFXcOJ4I2pWdn1qR9pxH9TDklE=; b=j+uJpTxzjO02LpGz/DgTnZ5qta
	wtfw68csVS/jvCnOvQPOFSKbkaJ4c/XnNEOCmJw76ouEYZ5N/02Rx6ZGbg1fpelHzRvmLH5Z9xrwH
	EfdUPhjkGd7/rrb1UsmwhVChkYF0Y5oe75y84M95BBtULZOa743dpk93RgJ0e+rcMxNLUcOZJD2gn
	fhLf2A8M1KmfRFErz2quXqXVZibeveSEQGRHgXAxtUNlERd0xKBcWwqFEEPSGFN/ihylqUvSHfr7Q
	9vccFo7Nw6PGvO+wWJpyPoX13hQ6Pyt+uiJ0sn0Sewt0xN6WVjhxx5d1lpYmeuvGb9iwFfgDuQRIV
	ds0eWJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slupY-00000005cbI-02Ve;
	Wed, 04 Sep 2024 18:34:12 +0000
Received: from mxe-2-566.seznam.cz ([2a02:598:64:8a00::1000:566])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slukP-00000005bSv-2mxw
	for ath10k@lists.infradead.org;
	Wed, 04 Sep 2024 18:28:55 +0000
Received: from email.seznam.cz
	by smtpc-mxe-5549df4ffc-zc8mb
	(smtpc-mxe-5549df4ffc-zc8mb [2a02:598:64:8a00::1000:566])
	id 3f8f2cc5c17b9e6f3f01a2dd;
	Wed, 04 Sep 2024 20:28:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1725474526;
	bh=Bx0NfChvS/WRzwXKgzFXcOJ4I2pWdn1qR9pxH9TDklE=;
	h=Received:From:To:Cc:Subject:Date:Message-Id:References:
	 In-Reply-To:Mime-Version:X-Mailer:Content-Type:
	 Content-Transfer-Encoding;
	b=dHIvLbFSoCy6SLun53I7arXesqBJEuo6+FAQKPDYbKR6aQ2HPrVjMacDR5+hoOHby
	 zWS1fSuHb7mGs6S986h671ot3WpSmc0ghZMiaTL0DbgEXLjcphYpkgamz/iWXSqxOv
	 4jDIp8NqGQ5Nrt4VsWDPq2+edLpW7XCHsCYJ2L4pLsXC+9ETZH587YeGJ0rfBBj831
	 SO4kI0S78pJYmHgvcKGQTJHI1iQAXtdast/W4xnvV+6kAq88nzkENxAqMn43mzABdx
	 fZ7tsiu6yHbDoyusZETy4K1KBMiD3k97gCZowvRNKhpd1dkLx441QAGRqDuZbYJbXw
	 fh/AYPe7MhrxQ==
Received: from 184-143.ktuo.cz (184-143.ktuo.cz [82.144.143.184])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Wed, 04 Sep 2024 20:28:41 +0200 (CEST)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Jeff Johnson" <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,
	<ath10k@lists.infradead.org>
Subject: Re: [PATCH] wifi: ath10k: add USB device ID for Atheros QCA9377-7
Date: Wed, 04 Sep 2024 20:28:41 +0200 (CEST)
Message-Id: <56o.Zbc9.7x3xmPitckT.1csARP@seznam.cz>
References: <22t.ZbsX.5bWREDtSGGB.1cqQpF@seznam.cz>
	<8b7d9777-e239-4173-bec5-607e15b98130@quicinc.com>
In-Reply-To: <8b7d9777-e239-4173-bec5-607e15b98130@quicinc.com>
Mime-Version: 1.0 (szn-mime-2.1.61)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240904_112854_230183_36BE975A 
X-CRM114-Status: UNSURE (   3.72  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

> Also the Tested-on tag should include the firmware version information a=
s well.

Hi Jeff,

I tested it with manually converted firmware from https://github.com/8devi=
ces/qcacld-2.0/tree/CNSS.LEA.NRT_3.0/firmware_bin/usb which does not inclu=
de any explicit version.

What version should I write in the Tested-on tag in this case?

Best regards

Tomas

