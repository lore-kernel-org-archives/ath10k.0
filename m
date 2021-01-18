Return-Path: <SRS0=ZGrE=GV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 005A7C433E0
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:13:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AF502222F9
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF502222F9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8Yg5BUkygu6QWi07ivyDoehvxUjxxpfpBWBzHlybopU=; b=0DN5k75muOu5Ju/NicMmr/+UZ
	FVfQrZKgogqfSHdHI6gDrs3WcILFHqn8HXYbb1oHSn/sBGaGdOT3Lw6AEaPqZJ3g9mDGO4vbjZzKu
	f/EP69j9ajWJ8rEG4RTGGIMo6TYEosllVr21mdF6DXXO8m/tSyWHlzVusvmDChg7tWbhl0bFCKvAq
	Kg7bJZ5wYC5FaqYYPjhFUgAJb1trTxizGt0A4u67x4tiflBgX3K3RJPuSzr4ZeWUF3EI14f875Bld
	FrW2e2KxUEgpp4Kmny6YP7QcklU9eSSirn8zAs5tT2OcUj4yOctoEcf0qptfXC2B3PCmW7m5i8UOC
	JND+YU9yQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1X9Y-0003BN-Vw; Mon, 18 Jan 2021 16:13:17 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1X9W-00033e-V1
 for ath10k@lists.infradead.org; Mon, 18 Jan 2021 16:13:16 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610986395; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=QSN4vwmJGElORk0Uljeje4PQPgKgyF8sRWakhbOM3fc=;
 b=dNF+L8zN+l6alidHXZclEqwze6oTGcXUmfzRQsudCVaqQd/+3p+wUhVChFX9WpyjDATuiR/R
 1YzC3lyjYjFaAdL5EKNqUo1wqlU7QsVi5uweSY9PSa0gIfbTx076JnNZnDrlF9iFeZMShVIu
 HvuJJoj2F+FgD/OGgQfYNE5MSeY=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6005b399e23dedcc3a73ad0b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 16:13:13
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E2581C43463; Mon, 18 Jan 2021 16:13:12 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 94F5FC433CA;
 Mon, 18 Jan 2021 16:13:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94F5FC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: increase rx buffer size to 2048
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20200205191043.21913-1-linus.luessing@c0d3.blue>
References: <20200205191043.21913-1-linus.luessing@c0d3.blue>
To: =?utf-8?q?Linus_L=C3=BCssing?= <linus.luessing@c0d3.blue>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210118161312.E2581C43463@smtp.codeaurora.org>
Date: Mon, 18 Jan 2021 16:13:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_111315_159693_F5D0A5F1 
X-CRM114-Status: GOOD (  10.24  )
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
Cc: =?utf-8?q?Linus_L?= =?utf-8?q?=C3=BCssing?= <ll@simonwunderlich.de>,
 Simon Wunderlich <sw@simonwunderlich.de>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, Ben Greear <greearb@candelatech.com>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

TGludXMgTMO8c3NpbmcgPGxpbnVzLmx1ZXNzaW5nQGMwZDMuYmx1ZT4gd3JvdGU6Cgo+IEJlZm9y
ZSwgb25seSBmcmFtZXMgd2l0aCBhIG1heGltdW0gc2l6ZSBvZiAxNTI4IGJ5dGVzIGNvdWxkIGJl
Cj4gdHJhbnNtaXR0ZWQgYmV0d2VlbiB0d28gODAyLjExcyBub2Rlcy4KPiAKPiBGb3IgYmF0bWFu
LWFkdiBmb3IgaW5zdGFuY2UsIHdoaWNoIGFkZHMgaXRzIG93biBoZWFkZXIgdG8gZWFjaCBmcmFt
ZSwKPiB3ZSB0eXBpY2FsbHkgbmVlZCBhbiBNVFUgb2YgYXQgbGVhc3QgMTUzMiBieXRlcyB0byBi
ZSBhYmxlIHRvIHRyYW5zbWl0Cj4gd2l0aG91dCBmcmFnbWVudGF0aW9uLgo+IAo+IFRoaXMgcGF0
Y2ggbm93IGluY3JlYXNlcyB0aGUgbWF4bWltdW0gZnJhbWUgc2l6ZSBmcm9tIDE1MjggdG8gMTY1
Ngo+IGJ5dGVzLgo+IAo+IFRlc3RlZCB3aXRoIHR3byBhdGgxMGsgZGV2aWNlcyBpbiA4MDIuMTFz
IG1vZGUsIGFzIHdlbGwgYXMgd2l0aAo+IGJhdG1hbi1hZHYgb24gdG9wIG9mIDgwMi4xMXMgd2l0
aCBmb3J3YXJkaW5nIGRpc2FibGVkLgo+IAo+IEZpeCBvcmlnaW5hbGx5IGZvdW5kIGFuZCBkZXZl
bG9wZWQgYnkgQmVuIEdyZWVhci4KPiAKPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vZ3JlZWFy
Yi9hdGgxMGstY3QvaXNzdWVzLzg5Cj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2dyZWVhcmIv
YXRoMTBrLWN0L2NvbW1pdC85ZTVhYjI1MDI3ZTA5NzFmYTI0Y2NmOTMzNzMzMjRjMDhjNGU5OTJk
Cj4gQ2M6IEJlbiBHcmVlYXIgPGdyZWVhcmJAY2FuZGVsYXRlY2guY29tPgo+IFNpZ25lZC1vZmYt
Ynk6IExpbnVzIEzDvHNzaW5nIDxsbEBzaW1vbnd1bmRlcmxpY2guZGU+Cj4gU2lnbmVkLW9mZi1i
eTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9yYS5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIGF0
aC1uZXh0IGJyYW5jaCBvZiBhdGguZ2l0LCB0aGFua3MuCgozZTZiOWNmNTM0Y2EgYXRoMTBrOiBp
bmNyZWFzZSByeCBidWZmZXIgc2l6ZSB0byAyMDQ4CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2Vy
bmVsLm9yZy9wcm9qZWN0L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzIwMjAwMjA1MTkxMDQzLjIxOTEz
LTEtbGludXMubHVlc3NpbmdAYzBkMy5ibHVlLwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5l
bC5vcmcvZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxp
bmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
