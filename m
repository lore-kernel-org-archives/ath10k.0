Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55014CA0EED
	for <ath10k@archiver.kernel.org>; Thu, 28 Aug 2025 01:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:In-Reply-To:Message-ID:To:From:Date:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=rSzLGnoNLaSk1a2U8PHAM5rUvrguAVULmLVroN6J2Bk=; b=tFlzDCRbpbGJ1cJg4OAVTo5pEI
	V4zkUhk6rC1STYlnp+Z13na85tkidtyTJ4r0KQGu3qR4G2ML8eFUO7Ye0553VjgiUBrGPyXWcdD+v
	3wPoHtKKoYCD2oRL8OkGMCyB+pAA5Syl38kfWu7xYeDCOQXfPSmanK1P19adH10sLbeFo6lC0idGz
	oQz4uT2jVUXJKnWTzqzKCU+ARlMHZV9UtBCDMb11JQG0vLH7QDedDVSPpEIaEBR4iC+TSHhGA8Zad
	NSpr39j0qih1pSI7DeCY4ct5rRnBkcc7pIBY9sliUu3EbEitMYoINLXQ+RmO6F2EwuV9H6p4ZOvxI
	yKRhIpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urRRx-0000000HV1m-2BAo;
	Thu, 28 Aug 2025 01:29:13 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urRRw-0000000HV1D-2v3r
	for ath10k@bombadil.infradead.org;
	Thu, 28 Aug 2025 01:29:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Subject:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:Cc:
	Content-ID:Content-Description:References;
	bh=rSzLGnoNLaSk1a2U8PHAM5rUvrguAVULmLVroN6J2Bk=; b=cajT7PtTJtr8uWw0PqyyCh5f9N
	nOvGBWCmwjHqoylvZkSs4MkUsGP8L3g1uVkt/OjG06QR0o6y3bfNY5YHrARmjzVTWIcfH0s7ps8Wr
	rtYUwC4+okRaUnf02D7LMa6aF8WR3KFG07LGUbliAMVXafCnzcuPqMY74yPABGthMglY1kFrJ8DEN
	t8WS5rVqvSHkHfupJzRl2hrWaDKB/0UNmnztP58ODylkixQEXwWHjCpyK8VyKW6vFjvO+BPKSpQ/8
	I2BwdFtniBYvGa00uPG09PHvgYmQU76w36/+FFuE0Bm97sJPu7pRk0UfrDHXrsUs5odumkLLzmCE6
	tMhxPONg==;
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urRRs-00000002arV-34Yx
	for ath10k@lists.infradead.org;
	Thu, 28 Aug 2025 01:29:11 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1756344543; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=b46aTbpQHjKRRvS5DX4XgDuNZZfyhB5Gu5EgfIUHTNDR8VrhP7JEjVVl5U7KiTb2zXHCTbsah2VG41M9QGOnTA5A18sqT6dQmvmB0557bzpQGVDwkp0pSzqYjS/c5pJV330c9sBFCiMOUu5JPM4QUM4cjADNT773+vULWOxy+kw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1756344543; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=rSzLGnoNLaSk1a2U8PHAM5rUvrguAVULmLVroN6J2Bk=; 
	b=M1xg95c4pobM6izEKabI77X9ADFvydHD4Bx/WzEHgIW8s4r1VjvpLFo3IChcjbXbq9DixLSZ0v7H5EieLH+ZpRBFEXemOkg3+tCpLrQneQeUtBrmyh+JFt+OKx26Tuqe70F+SQYT796DwLYd2ljQVRIItmA6MlWWu5sqKB/bWCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=mcqueen.au;
	spf=pass  smtp.mailfrom=craig@mcqueen.au;
	dmarc=pass header.from=<craig@mcqueen.au>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756344543;
	s=zmail; d=mcqueen.au; i=craig@mcqueen.au;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=rSzLGnoNLaSk1a2U8PHAM5rUvrguAVULmLVroN6J2Bk=;
	b=bAVciQMZeutEmZB9yul906oX8+2PtRSFnOP+EAFU3XUoL7i8Uj5gdz4dXGcDtBdj
	alJVnPe3TYMRULVok/JIue+CogMUtTHxG7ZVLBH6k3WccetlNpwL03JEEyqWH4Dxy3I
	k/wqAzQjgqXF4BrppW3g68KqG/+CJO/+M9vw2Aso=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 1756344542116679.2165482523119; Wed, 27 Aug 2025 18:29:02 -0700 (PDT)
Date: Thu, 28 Aug 2025 11:29:02 +1000
From: Craig McQueen <craig@mcqueen.au>
To: "ath10k" <ath10k@lists.infradead.org>
Message-ID: <198ee4ae393.6baf8d9a2862139.411061161396944784@mcqueen.au>
In-Reply-To: 
Subject: QCA9377 hw1.1 SDIO failed to read from address 0x874 etc
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-Bad-Reply: In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_022909_276395_AB1746BD 
X-CRM114-Status: UNSURE (   9.36  )
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

I am trying to set up a Quectel FC900E on a Rockchip RK3328 system using Yocto kirkstone or scarthgap.

The FC900E connects to SDIO. I have done configuration of the device tree. When I boot it, I see:

[    2.650793] ath10k_sdio mmc1:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id 0x00000000 sub 0000:0000
[    2.651689] ath10k_sdio mmc1:0001:1: kconfig debug 1 debugfs 1 tracing 0 dfs 0 testmode 0
[    2.653382] ath10k_sdio mmc1:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1 api 5 features ignore-otp crc32 7746e551
[    2.816274] ath10k_sdio mmc1:0001:1: failed to fetch board data for bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000 from ath10k/QCA9377/hw1.0/board-2.bin
[    2.819785] ath10k_sdio mmc1:0001:1: board_file api 1 bmi_id N/A crc32 544289f7
[    6.538676] ath10k_sdio mmc1:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1
[    6.875686] ath10k_sdio mmc1:0001:1: failed to read from address 0x874: -110
[    6.876506] ath10k_sdio mmc1:0001:1: failed to read from mbox window data address: -110
[    6.876732] ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -110
[    6.877234] ath10k_sdio mmc1:0001:1: failed to read calibration data: -110
[    6.877877] ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -110
[    7.517279] ath10k_sdio mmc1:0001:1: failed to write to address 0x1c7e8: -16
[    7.517963] ath10k_sdio mmc1:0001:1: failed to write skb to 0x1c7e8 asynchronously: -16
[    7.908301] ath10k_sdio mmc1:0001:1: suspend timed out - target pause event never came
[    8.155419] ath10k_sdio mmc1:0001:1: failed to read from address 0x868: -16
[    8.156081] ath10k_sdio mmc1:0001:1: failed to read fifo/chip control register: -16
[   11.342898] ath: EEPROM regdomain: 0x0
[   11.342938] ath: EEPROM indicates default country code should be used
[   11.342947] ath: doing EEPROM country->regdmn map search
[   11.342959] ath: country maps to regdmn code: 0x3a
[   11.342971] ath: Country alpha2 being used: US
[   11.342982] ath: Regpair used: 0x3a

I have confirmed that the FC900E is being fed a 32 kHz signal on its WLAN_SLP_CLK input.

I saw a previous message from Anthony Needles from August 2022 which sounded almost the same. But there was no resolution for the issue then.

I would appreciate any advice on diagnosing this.

-- 
Craig McQueen


