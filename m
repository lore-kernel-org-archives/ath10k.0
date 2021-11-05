Return-Path: <SRS0=0VSz=PY=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEE42C433F5
	for <ath10k@archiver.kernel.org>; Fri,  5 Nov 2021 12:29:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 55E326125F
	for <ath10k@archiver.kernel.org>; Fri,  5 Nov 2021 12:29:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 55E326125F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sENKQHf6dn29haZCAojBQHiD1mC2Fz+kUa+zgoBHqEc=; b=xHLI5js6Wvn7JS
	Klh5pkHQZ0Mor20FASQ0DxWQP1dMWjTc+d5PBFrLTMYc53s82urk9+62T4V54FQmWACteWjeSqw11
	juKml16Vwnjh/+qJix+MhpuEoTsjqCqX1BF/fZim2h7qyfN/cs/mSsGwmbSc7Qldg1lWcopfjp6PV
	rmW/L4x7q51OTNYjREPu08kFUNU28fGNMRC9tNqZQq4SnzbfdTsW/NhojGnlkeGwTOYbreNYSyIrV
	V2Y7BDR1GDVDFLd42wZFaB8nIs8fRB7NMhtd0glSsiAs+j0frry9zvG3A5MHcgBkiKZSDkTwOaEXP
	e4jGXN+C7dkwWwVkhnTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miyLn-00BFuA-RV; Fri, 05 Nov 2021 12:29:43 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miyLk-00BFtq-Ps
 for ath10k@lists.infradead.org; Fri, 05 Nov 2021 12:29:42 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1636115380; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=5gyxY92i0U1AzI5x0lNZ8Y1r1eJlkSEZSR605FD4njQ=;
 b=eGhrNSTpdZROKZgZvQltVl+bOoo1EhmB7zyrwaTJ02I8v7921oPehwrpxuGR2JXErtKdMYSR
 EhqoqdPP3t3xb6uQuDe1zB/IOxMz/Wlla8cT2f2weNuqt3YvfwERZik/T4mQh3RTPKeeRGdI
 /ES07zZEmROe7mnwimDOYfIZKFA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6185239df97c48cc48cc8043 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 05 Nov 2021 12:29:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2FE5FC4360D; Fri,  5 Nov 2021 12:29:17 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 9C6E3C4338F;
 Fri,  5 Nov 2021 12:29:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 9C6E3C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: =?utf-8?B?5bCk5pmT5p2w?= <yxj790222@163.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Subject: Re: qca9984 fails to work
References: <7fc1368d.53c6.17cda9721bb.Coremail.yxj790222@163.com>
Date: Fri, 05 Nov 2021 14:29:13 +0200
In-Reply-To: <7fc1368d.53c6.17cda9721bb.Coremail.yxj790222@163.com>
 (=?utf-8?B?IuWwpOaZk+adsA==?=
 "'s message of "Mon, 1 Nov 2021 16:21:50 +0800 (CST)")
Message-ID: <87mtmiyeee.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211105_052940_930859_EA77A877 
X-CRM114-Status: UNSURE (   8.65  )
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

5bCk5pmT5p2wIDx5eGo3OTAyMjJAMTYzLmNvbT4gd3JpdGVzOgoKPiBiZWZvcmUgdXBkYXRlLCBl
dmVydGhpbmcgaXMgb2ssIGFmdGVyIHVwZGF0ZSBrZXJuZWwsIHFjYTk5ODQgZmFpbHMgdG8gd29y
ay4KPiBkbWVzZ3xncmVwIGF0aDEwazoKPgo+IFsgwqDCoMKgNC43NjQyMTBdIGF0aDEwa19wY2kg
MDAwMDowNzowMC4wOiBlbmFibGluZyBkZXZpY2UgKDAwMDAgLT4gMDAwMikKPgo+IFsgwqDCoMKg
NC43NjU1MjddIGF0aDEwa19wY2kgMDAwMDowNzowMC4wOiBwY2kgaXJxIG1zaSBvcGVyX2lycV9t
b2RlIDIgaXJxX21vZGUgMCByZXNldF9tb2RlIDAKPgo+IFsgwqDCoMKgNC44ODY4MjhdIGF0aDEw
a19wY2kgMDAwMDowNzowMC4wOiBmaXJtd2FyZTogZGlyZWN0LWxvYWRpbmcKPiBmaXJtd2FyZSBh
dGgxMGsvcHJlLWNhbC1wY2ktMDAwMDowNzowMC4wLmJpbgo+Cj4gWyDCoMKgwqA0Ljg4Njg0NF0g
YXRoMTBrX3BjaSAwMDAwOjA3OjAwLjA6IGZpcm13YXJlOiBmYWlsZWQgdG8gbG9hZCBhdGgxMGsv
UUNBOTk4NC9odzEuMC9maXJtd2FyZS02LmJpbiAoLTIpCj4KPiBbIMKgwqDCoDQuODg4NzY5XSBh
dGgxMGtfcGNpIDAwMDA6MDc6MDAuMDogZmlybXdhcmU6IGRpcmVjdC1sb2FkaW5nCj4gZmlybXdh
cmUgYXRoMTBrL1FDQTk5ODQvaHcxLjAvZmlybXdhcmUtNS5iaW4KPgo+IFsgwqDCoMKgNC44ODg3
NzRdIGF0aDEwa19wY2kgMDAwMDowNzowMC4wOiBxY2E5OTg0L3FjYTk5OTQgaHcxLjAgdGFyZ2V0
Cj4gMHgwMTAwMDAwMCBjaGlwX2lkIDB4MDAwMDAwMDAgc3ViIDE2OGM6Y2FmZQo+Cj4gWyDCoMKg
wqA0Ljg4ODc3N10gYXRoMTBrX3BjaSAwMDAwOjA3OjAwLjA6IGtjb25maWcgZGVidWcgMCBkZWJ1
Z2ZzIDAgdHJhY2luZyAwIGRmcyAwIHRlc3Rtb2RlIDAKPgo+IFsgwqDCoMKgNC44ODkxMjRdIGF0
aDEwa19wY2kgMDAwMDowNzowMC4wOiBmaXJtd2FyZSB2ZXIKPiAxMC40LTMuOS4wLjItMDAxMzEg
YXBpIDUgZmVhdHVyZXMKPiBuby1wMnAsbWZwLHBlZXItZmxvdy1jdHJsLGJ0Y29leC1wYXJhbSxh
bGxvd3MtbWVzaC1iY2FzdCxuby1wcyxwZWVyLWZpeGVkLXJhdGUsCj4gaXJhbS1yZWNvdmVyeSBj
cmMzMiAyM2JkOWU0Mwo+Cj4gWyDCoMKgwqA3LjE3MDQ4Ml0gYXRoMTBrX3BjaSAwMDAwOjA3OjAw
LjA6IGZpcm13YXJlOiBkaXJlY3QtbG9hZGluZyBmaXJtd2FyZSBhdGgxMGsvUUNBOTk4NC9odzEu
MC9ib2FyZC0yLmJpbgo+Cj4gWyDCoMKgwqA3LjE3MDYwMF0gYXRoMTBrX3BjaSAwMDAwOjA3OjAw
LjA6IGJvYXJkX2ZpbGUgYXBpIDIgYm1pX2lkIDA6MSBjcmMzMiA4NTQ5ODczNAo+Cj4gWyDCoMKg
MTAuODEwMDE2XSBhdGgxMGtfcGNpIDAwMDA6MDc6MDAuMDogZmFpbGVkIHRvIGNvcHkgdGFyZ2V0
IGlyYW0gY29udGVudHM6IC0xMgo+Cj4gWyDCoMKgMTAuODY1Mjk1XSBhdGgxMGtfcGNpIDAwMDA6
MDc6MDAuMDogY291bGQgbm90IGluaXQgY29yZSAoLTEyKQo+Cj4gWyDCoMKgMTAuODY1MzMyXSBh
dGgxMGtfcGNpIDAwMDA6MDc6MDAuMDogY291bGQgbm90IHByb2JlIGZ3ICgtMTIpCj4KPiBrZXJu
ZWw6Cj4gWyAwLjAwMDAwMF0gTGludXggdmVyc2lvbiA1LjE0LjAtMy1hbWQ2NAo+IChkZWJpYW4t
a2VybmVsQGxpc3RzLmRlYmlhbi5vcmcpIChnY2MtMTAgKERlYmlhbiAxMC4zLjAtMTEpIDEwLjMu
MCwKPiBHTlUgbGQgKEdOVSBCaW51dGlscyBmb3IgRGViaWFuKSAyLjM3KSAjMSBTTVAgRGViaWFu
IDUuMTQuMTItMQo+ICgyMDIxLTEwLTE0KQo+IFsgMC4wMDAwMDBdIENvbW1hbmQgbGluZTogQk9P
VF9JTUFHRT0vYm9vdC92bWxpbnV6LTUuMTQuMC0zLWFtZDY0Cj4gcm9vdD1VVUlEPTZhZDFiZGE0
LTlmZWItNDg0OS1iMWQ5LTQzMTFjNzZlMzUyMiBybyBxdWlldAo+IFsgICAgMC4wMDAwMDBdIHg4
Ni9mcHU6IFN1cHBvcnRpbmcgWFNBVkUgZmVhdHVyZSAweDAwMTogJ3g4NyBmbG9hdGluZyBwb2lu
dCByZWdpc3RlcnMnCj4gWyAgICAwLjAwMDAwMF0geDg2L2ZwdTogU3VwcG9ydGluZyBYU0FWRSBm
ZWF0dXJlIDB4MDAyOiAnU1NFIHJlZ2lzdGVycycKPiBbICAgIDAuMDAwMDAwXSB4ODYvZnB1OiBT
dXBwb3J0aW5nIFhTQVZFIGZlYXR1cmUgMHgwMDQ6ICdBVlggcmVnaXN0ZXJzJwo+IFsgICAgMC4w
MDAwMDBdIHg4Ni9mcHU6IHhzdGF0ZV9vZmZzZXRbMl06ICA1NzYsIHhzdGF0ZV9zaXplc1syXTog
IDI1NgoKVGhpcyBjb21taXQgc2hvdWxkIGZpeCBpdDoKCmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcv
bGludXMvNmY4YzhiZjRjN2M5CgotLSAKaHR0cHM6Ly9wYXRjaHdvcmsua2VybmVsLm9yZy9wcm9q
ZWN0L2xpbnV4LXdpcmVsZXNzL2xpc3QvCgpodHRwczovL3dpcmVsZXNzLndpa2kua2VybmVsLm9y
Zy9lbi9kZXZlbG9wZXJzL2RvY3VtZW50YXRpb24vc3VibWl0dGluZ3BhdGNoZXMKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmF0aDEwayBtYWlsaW5nIGxp
c3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
