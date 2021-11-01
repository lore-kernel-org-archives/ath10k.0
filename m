Return-Path: <SRS0=v+vA=PU=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1F5AC433F5
	for <ath10k@archiver.kernel.org>; Mon,  1 Nov 2021 14:18:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 709BB60ED5
	for <ath10k@archiver.kernel.org>; Mon,  1 Nov 2021 14:18:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 709BB60ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yk7bjk2rGqG5jlrw7h54p2pGkeDZ6JkmLgZJrrPb/mY=; b=TytjXdaGYSrjiA
	vFbgEABeL9BETXhI1vWhVsQF23A/ptL3CKxt+IzdGdINM4H+y2pOA6A9Ykc2H1FkHc5mKj2YsZhz9
	1gmyfHUKX+qm8q4G3+y2xiMz2Rmn9uWu/M7F9/OBkLhvS/uVeH38WRrqPdED6jk7sxxNxldU8UeZU
	fk44ARNZULwSrIeu0dw9Xkg48dCj6rocGTF1oHUO1FDlmxsGjCufLmcdiMcsmTi1V5WX1Ls5x5oyy
	LOwuEoSoJ81irv4lLXHV7GWyGOkWnT8GYNjsecbcdMEQp74f/JVBNWW1QJDkGHZcolS5GxqF/baxK
	A0olblmFiVGA9omcfbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhY8c-00GYnc-Ny; Mon, 01 Nov 2021 14:18:14 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhY8Z-00GYkc-QV
 for ath10k@lists.infradead.org; Mon, 01 Nov 2021 14:18:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635776281; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=mzWwspTlFMHBznnaHPlRuX/fRbGkpHA9H50sezneeDQ=;
 b=bmDoKPK4oO7t8B3rcn7RnKOm47Vwy/hQdgIYEqAuDfHrMntFegi8wYwOPbMFJTAp7Mx5tUt8
 nu+lVhj+t09yxQ7A1vPEOTEtAs+xgNqpKzhFX1bo+M3Z18B4C6BDFQZfQKkf8sbMSq4ZpoKE
 QArXYukkjRXAgLGdJXGCtrAYRxc=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 617ff70a900d71ea1e6463e2 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 01 Nov 2021 14:17:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 50F17C4360C; Mon,  1 Nov 2021 14:17:45 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6996DC4338F;
 Mon,  1 Nov 2021 14:17:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 6996DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fetch (pre-)calibration data via nvmem
 subsystem
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211016234609.1568317-1-chunkeey@gmail.com>
References: <20211016234609.1568317-1-chunkeey@gmail.com>
To: Christian Lamparter <chunkeey@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163577626002.7461.6786359547877026876.kvalo@codeaurora.org>
Date: Mon,  1 Nov 2021 14:17:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_071811_954139_7B1FB2A2 
X-CRM114-Status: UNSURE (   9.62  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Q2hyaXN0aWFuIExhbXBhcnRlciA8Y2h1bmtlZXlAZ21haWwuY29tPiB3cm90ZToKCj4gQVRIMTBL
IGNoaXBzIGFyZSB1c2VkIGl0IHdpZGUgcmFuZ2Ugb2Ygcm91dGVycywKPiBhY2Nlc3Nwb2ludHMs
IHJhbmdlIGV4dGVuZGVycywgbmV0d29yayBhcHBsaWFuY2VzLgo+IE9uIHRoZXNlIGVtYmVkZGVk
IGRldmljZXMsIGNhbGlicmF0aW9uIGRhdGEgaXMgb2Z0ZW4KPiBzdG9yZWQgb24gdGhlIG1haW4g
c3lzdGVtJ3MgZmxhc2ggYW5kIHdhcyBvdXQgb2YgcmVhY2gKPiBmb3IgdGhlIGRyaXZlci4KPiAK
PiBUbyBicmlkZ2UgdGhpcyBnYXAsIGF0aDEwayBpcyBnZXR0aW5nIGV4dGVuZGVkIHRvIHB1bGwK
PiB0aGUgKHByZS0pY2FsaWJyYXRpb24gZGF0YSB0aHJvdWdoIG52bWVtIHN1YnN5c3RlbS4KPiBU
byBkbyB0aGlzLCBhIG52bWVtLWNlbGwgY29udGFpbmluZyB0aGUgaW5mb3JtYXRpb24gY2FuCj4g
ZWl0aGVyIGJlIHNwZWNpZmllZCBpbiB0aGUgcGxhdGZvcm0gZGF0YSBvciB2aWEgZGV2aWNlLXRy
ZWUuCj4gCj4gVGVzdGVkIHdpdGg6Cj4gICAgICAgICBOZXRnZWFyIEVYNjE1MHYyIChJUFE0MDE4
IC0gcHJlLWNhbGlicmF0aW9uIG1ldGhvZCkKPiAgICAgICAgIFRQLUxpbmsgQXJjaGVyIEM3IHYy
IChRQ0E5ODgwdjIgLSBvbGQgY2FsaWJyYXRpb24gbWV0aG9kKQo+IAo+IENjOiBSb2JlcnQgTWFy
a28gPHJvYmltYXJrb0BnbWFpbC5jb20+Cj4gQ2M6IFRoaWJhdXQgVkFSw4hORSA8aGFja3NAc2xh
c2hkaXJ0Lm9yZz4KPiBTaWduZWQtb2ZmLWJ5OiBDaHJpc3RpYW4gTGFtcGFydGVyIDxjaHVua2Vl
eUBnbWFpbC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogS2FsbGUgVmFsbyA8a3ZhbG9AY29kZWF1cm9y
YS5vcmc+CgpQYXRjaCBhcHBsaWVkIHRvIGF0aC1uZXh0IGJyYW5jaCBvZiBhdGguZ2l0LCB0aGFu
a3MuCgoyN2RlYjBmMTU3MGIgYXRoMTBrOiBmZXRjaCAocHJlLSljYWxpYnJhdGlvbiBkYXRhIHZp
YSBudm1lbSBzdWJzeXN0ZW0KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Byb2pl
Y3QvbGludXgtd2lyZWxlc3MvcGF0Y2gvMjAyMTEwMTYyMzQ2MDkuMTU2ODMxNy0xLWNodW5rZWV5
QGdtYWlsLmNvbS8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwub3JnL2VuL2RldmVsb3Bl
cnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9hdGgxMGsK
