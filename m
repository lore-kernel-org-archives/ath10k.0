Return-Path: <SRS0=ZGrE=GV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63866C433E0
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:17:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12CA920715
	for <ath10k@archiver.kernel.org>; Mon, 18 Jan 2021 16:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 12CA920715
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=cdB0uW7gmoAn0JJ+93xm1QqOuJfNLWsYkD11KsFqKNg=; b=ofVsUOpdd4lYUdz6SKew9R/z2
	mprip4HTFAQM6RojB21AgffDi3TD28HEha+cK7mkmKytEQHcClMoDWkgIpUWFg0ffZatdHocF4ZPc
	yKnUEjZGZcdEmAM5XsN1r/cCJWXyXEeg8ilfOXRnzl1YupFoMrJkam4i+52dfKgXFlobT12yRzxYn
	GSDDA3AC/EGxhVjJbQP/VffGQ+cspMwa8HRGn9e6AsdBzYqWDRZs7J0aI57J2IaQ1SU3v9mw1U0eU
	au/x2lm+mZxnr2FmPS0+ymqiNFuAnToc9uOwc61K7lTgmrMu8Tg7FBg/wS3iW0yrT2OwRMLOYYNMM
	zlQPXEX8g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1XDK-0003Tj-Hy; Mon, 18 Jan 2021 16:17:10 +0000
Received: from so254-31.mailgun.net ([198.61.254.31])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1XDE-0003Sq-Sd
 for ath10k@lists.infradead.org; Mon, 18 Jan 2021 16:17:08 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1610986626; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ZIgPL9kC7wP7X1pjETK6SXx3Wl+85iVGjPDjTYmiw4c=;
 b=wUqiYcasAXb+Sc4L7iCPey1Rvhq60aPOOoJhXJEzy03lzT9GRNH1b1fZIa18f/PY03yZO9gj
 N9cVY6dfzenaLuPpOOLtwdaZfp3N0H/m9mdf1IlOYerQFZEOH+PVMsqD2/xXyXw4f48i7Ef+
 Zq9CjyJqCxkVeNmtZ7Ir20bU+3Q=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6005b472ba7f86850642188b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 18 Jan 2021 16:16:50
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 29942C433C6; Mon, 18 Jan 2021 16:16:50 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A1558C433CA;
 Mon, 18 Jan 2021 16:16:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A1558C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
References: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
To: Miaoqing Pan <miaoqing@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210118161650.29942C433C6@smtp.codeaurora.org>
Date: Mon, 18 Jan 2021 16:16:50 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210118_111706_409393_583AF6C6 
X-CRM114-Status: GOOD (  14.03  )
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

TWlhb3FpbmcgUGFuIDxtaWFvcWluZ0Bjb2RlYXVyb3JhLm9yZz4gd3JvdGU6Cgo+IEZhaWxlZCB0
byB0cmFuc21pdCB3bWkgbWFuYWdlbWVudCBmcmFtZXM6Cj4gCj4gWzg0OTc3Ljg0MDg5NF0gYXRo
MTBrX3Nub2MgYTAwMDAwMC53aWZpOiB3bWkgbWdtdCB0eCBxdWV1ZSBpcyBmdWxsCj4gWzg0OTc3
Ljg0MDkxM10gYXRoMTBrX3Nub2MgYTAwMDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgcGFj
a2V0LCBkcm9wcGluZzogLTI4Cj4gWzg0OTc3Ljg0MDkyNF0gYXRoMTBrX3Nub2MgYTAwMDAwMC53
aWZpOiBmYWlsZWQgdG8gc3VibWl0IGZyYW1lOiAtMjgKPiBbODQ5NzcuODQwOTMyXSBhdGgxMGtf
c25vYyBhMDAwMDAwLndpZmk6IGZhaWxlZCB0byB0cmFuc21pdCBmcmFtZTogLTI4Cj4gCj4gVGhp
cyBpc3N1ZSBpcyBjYXVzZWQgYnkgcmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBh
bmQKPiBfX3NrYl9xdWV1ZV90YWlsLiBUaGUgcXVldWUgb2Yg4oCYd21pX21nbXRfdHhfcXVldWXi
gJkgaXMgcHJvdGVjdGVkIGJ5IGEKPiBkaWZmZXJlbnQgbG9jazogYXItPmRhdGFfbG9jayB2cyBs
aXN0LT5sb2NrLCB0aGUgcmVzdWx0IGlzIG5vIHByb3RlY3Rpb24uCj4gU28gd2hlbiBhdGgxMGtf
bWdtdF9vdmVyX3dtaV90eF93b3JrKCkgYW5kIGF0aDEwa19tYWNfdHhfd21pX21nbXQoKQo+IHJ1
bm5pbmcgY29uY3VycmVudGx5IG9uIGRpZmZlcmVudCBDUFVzLCB0aGVyZSBhcHBlYXIgdG8gYmUg
YSByYXJlIGNvcm5lcgo+IGNhc2VzIHdoZW4gdGhlIHF1ZXVlIGxlbmd0aCBpcyAxLAo+IAo+ICAg
Q1BVeCAoc2tiX2RldXF1ZSkJCQlDUFV5IChfX3NrYl9xdWV1ZV90YWlsKQo+IAkJCQkJbmV4dD1s
aXN0Cj4gCQkJCQlwcmV2PWxpc3QKPiAgIHN0cnVjdCBza19idWZmICpza2IgPSBza2JfcGVlayhs
aXN0KTsJV1JJVEVfT05DRShuZXdzay0+bmV4dCwgbmV4dCk7Cj4gICBXUklURV9PTkNFKGxpc3Qt
PnFsZW4sIGxpc3QtPnFsZW4gLSAxKTtXUklURV9PTkNFKG5ld3NrLT5wcmV2LCBwcmV2KTsKPiAg
IG5leHQgICAgICAgPSBza2ItPm5leHQ7CQlXUklURV9PTkNFKG5leHQtPnByZXYsIG5ld3NrKTsK
PiAgIHByZXYgICAgICAgPSBza2ItPnByZXY7CQlXUklURV9PTkNFKHByZXYtPm5leHQsIG5ld3Nr
KTsKPiAgIHNrYi0+bmV4dCAgPSBza2ItPnByZXYgPSBOVUxMOwlsaXN0LT5xbGVuKys7Cj4gICBX
UklURV9PTkNFKG5leHQtPnByZXYsIHByZXYpOwo+ICAgV1JJVEVfT05DRShwcmV2LT5uZXh0LCBu
ZXh0KTsKPiAKPiBJZiB0aGUgaW5zdHJ1Y3Rpb24g4oCYbmV4dCA9IHNrYi0+bmV4dOKAmSBpcyBl
eGVjdXRlZCBiZWZvcmUKPiDigJhXUklURV9PTkNFKHByZXYtPm5leHQsIG5ld3NrKeKAmSwgbmV3
c2sgd2lsbCBiZSBsb3N0LCBhcyBDUFV4IGdldCB0aGUKPiBvbGQg4oCYbmV4dOKAmSBwb2ludGVy
LCBidXQgdGhlIGxlbmd0aCBpcyBzdGlsbCBhZGRlZCBieSBvbmUuIFRoZSBmaW5hbAo+IHJlc3Vs
dCBpcyB0aGUgbGVuZ3RoIG9mIHRoZSBxdWV1ZSB3aWxsIHJlYWNoIHRoZSBtYXhpbXVtIHZhbHVl
IGJ1dAo+IHRoZSBxdWV1ZSBpcyBlbXB0eS4KPiAKPiBTbyByZW1vdmUgYXItPmRhdGFfbG9jaywg
YW5kIHVzZSAnc2tiX3F1ZXVlX3RhaWwnIGluc3RlYWQgb2YKPiAnX19za2JfcXVldWVfdGFpbCcg
dG8gcHJldmVudCB0aGUgcG90ZW50aWFsIHJhY2UgY29uZGl0aW9uLgo+IAo+IFRlc3RlZC1vbjog
V0NOMzk5MCBodzEuMCBTTk9DIFdMQU4uSEwuMy4xLmMyLTAwMDMzLVFDQUhMU1dNVFBMWi0xCj4g
Cj4gU2lnbmVkLW9mZi1ieTogTWlhb3FpbmcgUGFuIDxtaWFvcWluZ0Bjb2RlYXVyb3JhLm9yZz4K
PiBTaWduZWQtb2ZmLWJ5OiBLYWxsZSBWYWxvIDxrdmFsb0Bjb2RlYXVyb3JhLm9yZz4KClBsZWFz
ZSBhZGRyZXNzIEJyaWFuJ3MgY29tbWVudHMgYW5kIHNlbmQgdjIuCgpQYXRjaCBzZXQgdG8gQ2hh
bmdlcyBSZXF1ZXN0ZWQuCgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9qZWN0
L2xpbnV4LXdpcmVsZXNzL3BhdGNoLzE2MDg1MTU1NzktMTA2Ni0xLWdpdC1zZW5kLWVtYWlsLW1p
YW9xaW5nQGNvZGVhdXJvcmEub3JnLwoKaHR0cHM6Ly93aXJlbGVzcy53aWtpLmtlcm5lbC5vcmcv
ZW4vZGV2ZWxvcGVycy9kb2N1bWVudGF0aW9uL3N1Ym1pdHRpbmdwYXRjaGVzCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcgbGlz
dAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
