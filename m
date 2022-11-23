Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFD1C433FE
	for <ath10k@archiver.kernel.org>; Wed, 23 Nov 2022 04:49:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:MIME-Version:To:Subject:
	From:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GPOXrsI2/XDoV+Xaw7B+UdWeH8PIJZkqw7m2dMhERUA=; b=epI8/76IieriXv/WFR8MHRogHR
	9aVAHrwrubK130092VZuh0/7Ovnz8RqfuysGWvsDwlkpR4s9y/2rD1uSPPvl4nSddpkMj2oZfANFl
	ksFgJYn86wGAZoZvAnr0eprfWxR4YHEA9wss5ff2o/+9NiYcylQMAz6UYIgu8GxRlgbzoP9vk3Mje
	6wpkMS3jAA/GWeQ6sY42QvQdkIvS0BDaWo21t6RbgWiG3JKto1PxN3VH8/ipEVoFgzriP8zIIbqrj
	G5csYSPx/IW47Vg0c3wPdhwWxHgO7X39vz82UzoaoIpm2GoFAO1X4+30XYs7zb4KKPl5lCXrs5T90
	o1pjvGAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhhC-00E2FW-Vw; Wed, 23 Nov 2022 04:49:14 +0000
Received: from [120.48.105.27] (helo=mk.nxgeu.top)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxhh7-00E2C6-MD
	for ath10k@lists.infradead.org; Wed, 23 Nov 2022 04:49:14 +0000
Received: from jklfldfj-PC (59.61.220.126) by mk.nxgeu.top id hfmj4a0e97cp for <ath10k@lists.infradead.org>; Wed, 23 Nov 2022 12:38:21 +0800 (envelope-from <info10@yahoo.com>)
From: "Alice" <my2@huanyutong.com>
Subject: Ideas for PC Monitoring Software of Wireless Nurse Call System
To: ath10k@lists.infradead.org
MIME-Version: 1.0
Date: Wed, 23 Nov 2022 12:38:20 +0800
X-Priority: 3
X-MSMail-Priority: Normal
X-MimeOLE: Produced By Microsoft MimeOLE V6.00.3790.4913
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_204909_772953_84881F14 
X-CRM114-Status: UNSURE (  -0.64  )
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
Reply-To: my2@huanyutong.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Message-ID: <E1oxhhC-00E2FW-Vw@bombadil.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RGVhciwNCkhlcmUgaXMgTUVFWUksIHdoaWNoIGlzIGEgbWFudWZhY3R1cmVyIHNpbmNlIDE5OTks
IGZvY3VzaW5nIG9uIHdpcmVsZXNzIGNhbGwgc3lzdGVtcywgd2hpY2ggYXJlIHdpZGVseSB1c2Vk
IGluIGhvc3BpdGFscywgbnVyc2luZyBob21lcywgYW5kIG1lZGljYWwgY2VudGVycy4NClc5MDAg
aXMgb3VyIG5ldyB3aXJlbGVzcyBjYWxsIHN5c3RlbSBtYW5hZ2VtZW50IHNvZnR3YXJlLiBUaGUg
bWFuYWdlbWVudCBzeXN0ZW0gY2FuIGJlIGluc3RhbGxlZCBkaXJlY3RseSBvbiB0aGUgY29tcHV0
ZXIsICBzdXBwb3J0cyBzdGF0aXN0aWNzIGFuZCByZWNvcmQgY2FsbCBwcm9jZXNzaW5nLCBtb3Jl
IGNvbmR1Y2l2ZSB0byBudXJzZXMgZm9yIHVuaWZvcm0gbWFuYWdlbWVudC4NClRoZSB3aG9sZSBz
eXN0ZW0gY2FuIGJlIGVxdWlwcGVkIHdpdGggdGhlIHdhdGNoLCBMRUQgZGlzcGxheSBzY3JlZW5z
LCBhbmQgb3RoZXIgZXF1aXBtZW50LiBUaGlzIG1lYW5zIHRoYXQgd2hlbiBwYXRpZW50cyBuZWVk
cyBoZWxwLCB0aGUgbnVyc2UgY2FuIHBpbnBvaW50IHRoZSBsb2NhdGlvbiBhbmQgYmUgdGhlIGZp
cnN0IHRvIHByb3ZpZGUgYXNzaXN0YW5jZS4NCkNvbnRhY3QgbWUgZnJlZWx5IGlmIHlvdSBhcmUg
aW50ZXJlc3RlZCBpbiB0aGlzIHdpcmVsZXNzIGNhbGxpbmcgc3lzdGVtLg0KQmVzdCByZWdhcmRz
DQrigIvigIvigIvigIvigIvigIvigItBbGljZQ0KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0
aDEwawo=
