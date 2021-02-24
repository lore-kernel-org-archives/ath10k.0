Return-Path: <SRS0=Mu6E=H2=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C709C433E0
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 12:56:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACEEB64FB3
	for <ath10k@archiver.kernel.org>; Wed, 24 Feb 2021 12:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACEEB64FB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vQoRmHA+2yDhjmqiqV/WEYUGVB3PZ+wHg2ROc2Kjd2Y=; b=K+F3GPtwVE4szxYziNg44E85D
	l42XgP6/b8cEOXiWM9Ljw1bCWsQNQLIpvG+EuQ7YPQQIDiBpdgfbDEnJcl3bNgO9aSqI6NcrM02Ys
	EBm9EgMr9aQVZECM64mr3HQ9lDZ1AJC9H00kAmc7VPIQrPbVDkNJM2BpfwV8dEoO3BnCBKmUvMESv
	gWCQmpwq+VwJxxht9TBcxp+zyJrCAhRdhwV0W6IxXyuMsJUIIknEIobDsG3qcp5WdOC9k7T2yZCsh
	V0bSAdbfeUwYpLPOYdj/iQtgvSQ6/Av4xyIpMe6XFuH32LNfdP9dPp8Jvln3EZi31J9Yr+BmMYV59
	qsTD7k2vQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lEtht-0004J3-6R; Wed, 24 Feb 2021 12:55:58 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lEthl-0004G8-Pd
 for ath10k@lists.infradead.org; Wed, 24 Feb 2021 12:55:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A801764F70;
 Wed, 24 Feb 2021 12:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171348;
 bh=QU7yexYfUTRLPEatwVmCU0ySXJmlqXH1VLn2wY+/vtw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C8O/rzWEz4cWfJKrKKInFNTwtjZHTVZhXTKqvCAj08lVlSg3GxObnO28tmD+qDY4C
 dPg/6JqVmNGkaCu2Asa7dxEfsS3eLaDBS5SPD4TtexeTt1gcDV0QItgfXtuzyI+n94
 2wTvuh/Mya/0IDzUWa34IdQIMg32hc2cA/xJZ8RjxA9pQzH8vo6PTpGvBXx+wqHnB0
 Yqrhxi+4j/LPEDp4C61VzFDHn3S6HNjnn8YQxTdUJy9uMAoCFmaSBQqJlhsuJJQTFK
 lLAVdn1TLmjLct63sT0xpKFNRXTHlyjO/qnExDdUYtlh8NUf5m6fs+bsO0T4mBhI3W
 63LYfLa6ip+rg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.9 06/12] ath10k: fix wmi mgmt tx queue full due to
 race condition
Date: Wed, 24 Feb 2021 07:55:34 -0500
Message-Id: <20210224125540.484221-6-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125540.484221-1-sashal@kernel.org>
References: <20210224125540.484221-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_075550_024740_D6F6CDF4 
X-CRM114-Status: GOOD (  13.58  )
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
Cc: Sasha Levin <sashal@kernel.org>, Miaoqing Pan <miaoqing@codeaurora.org>,
 netdev@vger.kernel.org, Brian Norris <briannorris@chromium.org>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Kalle Valo <kvalo@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

RnJvbTogTWlhb3FpbmcgUGFuIDxtaWFvcWluZ0Bjb2RlYXVyb3JhLm9yZz4KClsgVXBzdHJlYW0g
Y29tbWl0IGI1NTM3OWUzNDNhMzQ3MmMzNWY0YTEyNDU5MDZkYjUxNThjYWI0NTMgXQoKRmFpbGVk
IHRvIHRyYW5zbWl0IHdtaSBtYW5hZ2VtZW50IGZyYW1lczoKCls4NDk3Ny44NDA4OTRdIGF0aDEw
a19zbm9jIGEwMDAwMDAud2lmaTogd21pIG1nbXQgdHggcXVldWUgaXMgZnVsbApbODQ5NzcuODQw
OTEzXSBhdGgxMGtfc25vYyBhMDAwMDAwLndpZmk6IGZhaWxlZCB0byB0cmFuc21pdCBwYWNrZXQs
IGRyb3BwaW5nOiAtMjgKWzg0OTc3Ljg0MDkyNF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiBm
YWlsZWQgdG8gc3VibWl0IGZyYW1lOiAtMjgKWzg0OTc3Ljg0MDkzMl0gYXRoMTBrX3Nub2MgYTAw
MDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgZnJhbWU6IC0yOAoKVGhpcyBpc3N1ZSBpcyBj
YXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBhbmQKX19za2JfcXVl
dWVfdGFpbC4gVGhlIHF1ZXVlIG9mIOKAmHdtaV9tZ210X3R4X3F1ZXVl4oCZIGlzIHByb3RlY3Rl
ZCBieSBhCmRpZmZlcmVudCBsb2NrOiBhci0+ZGF0YV9sb2NrIHZzIGxpc3QtPmxvY2ssIHRoZSBy
ZXN1bHQgaXMgbm8gcHJvdGVjdGlvbi4KU28gd2hlbiBhdGgxMGtfbWdtdF9vdmVyX3dtaV90eF93
b3JrKCkgYW5kIGF0aDEwa19tYWNfdHhfd21pX21nbXQoKQpydW5uaW5nIGNvbmN1cnJlbnRseSBv
biBkaWZmZXJlbnQgQ1BVcywgdGhlcmUgYXBwZWFyIHRvIGJlIGEgcmFyZSBjb3JuZXIKY2FzZXMg
d2hlbiB0aGUgcXVldWUgbGVuZ3RoIGlzIDEsCgogIENQVXggKHNrYl9kZXVxdWUpCQkJQ1BVeSAo
X19za2JfcXVldWVfdGFpbCkKCQkJCQluZXh0PWxpc3QKCQkJCQlwcmV2PWxpc3QKICBzdHJ1Y3Qg
c2tfYnVmZiAqc2tiID0gc2tiX3BlZWsobGlzdCk7CVdSSVRFX09OQ0UobmV3c2stPm5leHQsIG5l
eHQpOwogIFdSSVRFX09OQ0UobGlzdC0+cWxlbiwgbGlzdC0+cWxlbiAtIDEpO1dSSVRFX09OQ0Uo
bmV3c2stPnByZXYsIHByZXYpOwogIG5leHQgICAgICAgPSBza2ItPm5leHQ7CQlXUklURV9PTkNF
KG5leHQtPnByZXYsIG5ld3NrKTsKICBwcmV2ICAgICAgID0gc2tiLT5wcmV2OwkJV1JJVEVfT05D
RShwcmV2LT5uZXh0LCBuZXdzayk7CiAgc2tiLT5uZXh0ICA9IHNrYi0+cHJldiA9IE5VTEw7CWxp
c3QtPnFsZW4rKzsKICBXUklURV9PTkNFKG5leHQtPnByZXYsIHByZXYpOwogIFdSSVRFX09OQ0Uo
cHJldi0+bmV4dCwgbmV4dCk7CgpJZiB0aGUgaW5zdHJ1Y3Rpb24g4oCYbmV4dCA9IHNrYi0+bmV4
dOKAmSBpcyBleGVjdXRlZCBiZWZvcmUK4oCYV1JJVEVfT05DRShwcmV2LT5uZXh0LCBuZXdzayni
gJksIG5ld3NrIHdpbGwgYmUgbG9zdCwgYXMgQ1BVeCBnZXQgdGhlCm9sZCDigJhuZXh04oCZIHBv
aW50ZXIsIGJ1dCB0aGUgbGVuZ3RoIGlzIHN0aWxsIGFkZGVkIGJ5IG9uZS4gVGhlIGZpbmFsCnJl
c3VsdCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBxdWV1ZSB3aWxsIHJlYWNoIHRoZSBtYXhpbXVtIHZh
bHVlIGJ1dAp0aGUgcXVldWUgaXMgZW1wdHkuCgpTbyByZW1vdmUgYXItPmRhdGFfbG9jaywgYW5k
IHVzZSAnc2tiX3F1ZXVlX3RhaWwnIGluc3RlYWQgb2YKJ19fc2tiX3F1ZXVlX3RhaWwnIHRvIHBy
ZXZlbnQgdGhlIHBvdGVudGlhbCByYWNlIGNvbmRpdGlvbi4gQWxzbyBzd2l0Y2gKdG8gdXNlIHNr
Yl9xdWV1ZV9sZW5fbG9ja2xlc3MsIGluIGNhc2Ugd2UgcXVldWUgYSBmZXcgU0tCcyBzaW11bHRh
bmVvdXNseS4KClRlc3RlZC1vbjogV0NOMzk5MCBodzEuMCBTTk9DIFdMQU4uSEwuMy4xLmMyLTAw
MDMzLVFDQUhMU1dNVFBMWi0xCgpTaWduZWQtb2ZmLWJ5OiBNaWFvcWluZyBQYW4gPG1pYW9xaW5n
QGNvZGVhdXJvcmEub3JnPgpSZXZpZXdlZC1ieTogQnJpYW4gTm9ycmlzIDxicmlhbm5vcnJpc0Bj
aHJvbWl1bS5vcmc+ClNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGNvZGVhdXJvcmEu
b3JnPgpMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzE2MDg2MTg4ODctODg1Ny0xLWdp
dC1zZW5kLWVtYWlsLW1pYW9xaW5nQGNvZGVhdXJvcmEub3JnClNpZ25lZC1vZmYtYnk6IFNhc2hh
IExldmluIDxzYXNoYWxAa2VybmVsLm9yZz4KLS0tCiBkcml2ZXJzL25ldC93aXJlbGVzcy9hdGgv
YXRoMTBrL21hYy5jIHwgMTUgKysrKy0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNl
cnRpb25zKCspLCAxMSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL25ldC93aXJl
bGVzcy9hdGgvYXRoMTBrL21hYy5jIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9t
YWMuYwppbmRleCA4YjNmZTg4ZDFjNGU3Li41NjQxODFiYjA5MDZhIDEwMDY0NAotLS0gYS9kcml2
ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCisrKyBiL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvbWFjLmMKQEAgLTM0NTIsMjMgKzM0NTIsMTYgQEAgYm9vbCBhdGgxMGtf
bWFjX3R4X2ZybV9oYXNfZnJlcShzdHJ1Y3QgYXRoMTBrICphcikKIHN0YXRpYyBpbnQgYXRoMTBr
X21hY190eF93bWlfbWdtdChzdHJ1Y3QgYXRoMTBrICphciwgc3RydWN0IHNrX2J1ZmYgKnNrYikK
IHsKIAlzdHJ1Y3Qgc2tfYnVmZl9oZWFkICpxID0gJmFyLT53bWlfbWdtdF90eF9xdWV1ZTsKLQlp
bnQgcmV0ID0gMDsKLQotCXNwaW5fbG9ja19iaCgmYXItPmRhdGFfbG9jayk7CiAKLQlpZiAoc2ti
X3F1ZXVlX2xlbihxKSA9PSBBVEgxMEtfTUFYX05VTV9NR01UX1BFTkRJTkcpIHsKKwlpZiAoc2ti
X3F1ZXVlX2xlbl9sb2NrbGVzcyhxKSA+PSBBVEgxMEtfTUFYX05VTV9NR01UX1BFTkRJTkcpIHsK
IAkJYXRoMTBrX3dhcm4oYXIsICJ3bWkgbWdtdCB0eCBxdWV1ZSBpcyBmdWxsXG4iKTsKLQkJcmV0
ID0gLUVOT1NQQzsKLQkJZ290byB1bmxvY2s7CisJCXJldHVybiAtRU5PU1BDOwogCX0KIAotCV9f
c2tiX3F1ZXVlX3RhaWwocSwgc2tiKTsKKwlza2JfcXVldWVfdGFpbChxLCBza2IpOwogCWllZWU4
MDIxMV9xdWV1ZV93b3JrKGFyLT5odywgJmFyLT53bWlfbWdtdF90eF93b3JrKTsKIAotdW5sb2Nr
OgotCXNwaW5fdW5sb2NrX2JoKCZhci0+ZGF0YV9sb2NrKTsKLQotCXJldHVybiByZXQ7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBlbnVtIGF0aDEwa19tYWNfdHhfcGF0aAotLSAKMi4yNy4wCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1h
aWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
