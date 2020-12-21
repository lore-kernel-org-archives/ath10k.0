Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB399C433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 19:53:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2C63225A9
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 19:53:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2C63225A9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Oi4eNnhgwSUTSsUmewsvOJXkq7JwqFA8gpIykhM+8yA=; b=e0yhONZ6RoUUs2nOWhG13QtMW
	0wZnt9z0A9g9VgsAmo+1Xplyu3KCf5Wily/YBYkIprPez095Fs5FSZStgLCSVdHbAoJczRo3uNbVV
	5z1TqeyUjtdc3P0gDOEgpDDR6rBCVOefbYjWnk2yYOtfWOI4soQ59OvMA5KjYqbA7mfd7mzGCXE/n
	hNrzruyuM7zqmkIfFStuj3RbM/gMZHoUAsphJIuX4NYjmu2oO9aNKEUnjpzBZSSiELo+sBG+TPozd
	edmYEhSML+8suCKamvMnWynDu+ik8B4cjkwsr0TKjEHRJdoJ535FyYyf6jEgC1vSWfYpRXjNn74DR
	WQgAW9YZQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krRFT-0005Fw-PT; Mon, 21 Dec 2020 19:53:39 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krRFR-0005FP-Fs
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 19:53:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608580415; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=iPs1eZk0G/knaly+Pu8IDcD6AR0WgxZXKzna114NbZo=;
 b=k0KLznSq2r+phpGEzfFDtSkP4xNVUQFf3CnKb+L6QrVtNUT/PWxsUkQmKTxEEHMdUh7ucS2o
 JDqI25yOas/iy7jWMbFt30MwXFPL5GWsc9xd2UZV9NaJVwpS21SRStcVc8k0XIq6KrSfdIY8
 P0u4p0Vt+wz2eP0UScMLROKFEp8=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fe0fd3d120d248bb5bebafb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 19:53:33
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 58831C43462; Mon, 21 Dec 2020 19:53:32 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6CE26C43461;
 Mon, 21 Dec 2020 19:53:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6CE26C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: fix wmi mgmt tx queue full due to race condition
References: <1608515579-1066-1-git-send-email-miaoqing@codeaurora.org>
 <CA+ASDXP8LotnQZNvXYZqfYH8za6rx1DaZmnH21TsO2NmzX+OZA@mail.gmail.com>
Date: Mon, 21 Dec 2020 21:53:28 +0200
In-Reply-To: <CA+ASDXP8LotnQZNvXYZqfYH8za6rx1DaZmnH21TsO2NmzX+OZA@mail.gmail.com>
 (Brian Norris's message of "Mon, 21 Dec 2020 11:31:40 -0800")
Message-ID: <87ft3zndfr.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_145337_616278_5C696DA5 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>,
 ath10k <ath10k@lists.infradead.org>, Miaoqing Pan <miaoqing@codeaurora.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

QnJpYW4gTm9ycmlzIDxicmlhbm5vcnJpc0BjaHJvbWl1bS5vcmc+IHdyaXRlczoKCj4gSGksCj4K
PiBPbiBTdW4sIERlYyAyMCwgMjAyMCBhdCA1OjUzIFBNIE1pYW9xaW5nIFBhbiA8bWlhb3FpbmdA
Y29kZWF1cm9yYS5vcmc+IHdyb3RlOgo+Pgo+PiBGYWlsZWQgdG8gdHJhbnNtaXQgd21pIG1hbmFn
ZW1lbnQgZnJhbWVzOgo+Pgo+PiBbODQ5NzcuODQwODk0XSBhdGgxMGtfc25vYyBhMDAwMDAwLndp
Zmk6IHdtaSBtZ210IHR4IHF1ZXVlIGlzIGZ1bGwKPj4gWzg0OTc3Ljg0MDkxM10gYXRoMTBrX3Nu
b2MgYTAwMDAwMC53aWZpOiBmYWlsZWQgdG8gdHJhbnNtaXQgcGFja2V0LCBkcm9wcGluZzogLTI4
Cj4+IFs4NDk3Ny44NDA5MjRdIGF0aDEwa19zbm9jIGEwMDAwMDAud2lmaTogZmFpbGVkIHRvIHN1
Ym1pdCBmcmFtZTogLTI4Cj4+IFs4NDk3Ny44NDA5MzJdIGF0aDEwa19zbm9jIGEwMDAwMDAud2lm
aTogZmFpbGVkIHRvIHRyYW5zbWl0IGZyYW1lOiAtMjgKPj4KPj4gVGhpcyBpc3N1ZSBpcyBjYXVz
ZWQgYnkgcmFjZSBjb25kaXRpb24gYmV0d2VlbiBza2JfZGVxdWV1ZSBhbmQKPj4gX19za2JfcXVl
dWVfdGFpbC4gVGhlIHF1ZXVlIG9mIOKAmHdtaV9tZ210X3R4X3F1ZXVl4oCZIGlzIHByb3RlY3Rl
ZCBieSBhCj4+IGRpZmZlcmVudCBsb2NrOiBhci0+ZGF0YV9sb2NrIHZzIGxpc3QtPmxvY2ssIHRo
ZSByZXN1bHQgaXMgbm8gcHJvdGVjdGlvbi4KPgo+IE5pY2UgY2F0Y2ghCj4KPj4gLS0tIGEvZHJp
dmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9tYWMuYwo+PiArKysgYi9kcml2ZXJzL25ldC93
aXJlbGVzcy9hdGgvYXRoMTBrL21hYy5jCj4+IEBAIC0zNzYzLDIzICszNzYzLDE2IEBAIGJvb2wg
YXRoMTBrX21hY190eF9mcm1faGFzX2ZyZXEoc3RydWN0IGF0aDEwayAqYXIpCj4+ICBzdGF0aWMg
aW50IGF0aDEwa19tYWNfdHhfd21pX21nbXQoc3RydWN0IGF0aDEwayAqYXIsIHN0cnVjdCBza19i
dWZmICpza2IpCj4+ICB7Cj4+ICAgICAgICAgc3RydWN0IHNrX2J1ZmZfaGVhZCAqcSA9ICZhci0+
d21pX21nbXRfdHhfcXVldWU7Cj4+IC0gICAgICAgaW50IHJldCA9IDA7Cj4+IC0KPj4gLSAgICAg
ICBzcGluX2xvY2tfYmgoJmFyLT5kYXRhX2xvY2spOwo+Pgo+PiAgICAgICAgIGlmIChza2JfcXVl
dWVfbGVuKHEpID09IEFUSDEwS19NQVhfTlVNX01HTVRfUEVORElORykgewo+Cj4gSSBiZWxpZXZl
IHlvdSBzaG91bGQgYmUgc3dpdGNoaW5nIHRoaXMgdG8gdXNlIHNrYl9xdWV1ZV9sZW5fbG9ja2xl
c3MoKQo+IHRvby4KCldoeSBsb2NrbGVzcz8gKHJlYWRzIGRvY3VtZW50YXRpb24pIEFoLCBpcyBp
dCBkdWUgdG8gbWVtb3J5CnN5bmNocm9uaXNhdGlvbiBub3cgdGhhdCB3ZSBkb24ndCB0YWtlIHRo
ZSBkYXRhX2xvY2sgYW55bW9yZT8KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwu
b3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
