Return-Path: <SRS0=v3dE=OV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3733CC433EF
	for <ath10k@archiver.kernel.org>; Fri,  1 Oct 2021 06:38:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF20B61A6F
	for <ath10k@archiver.kernel.org>; Fri,  1 Oct 2021 06:38:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF20B61A6F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bg45KutdJAGRJq4zew+5IUT/vVMg1O7U2/3SOpRQlp8=; b=xwlk1FJz+HV+vf
	umYLcZS2WVMf8JFkCKwEsAum1jf40f7W9QjrlM3vKAH9TYbQSXAiH0D36eP9XW2rtLp+FtnHNMj9S
	qdg1BZVq/gi4SnIpQld2R3EVeU0BrhgbsKRbfYkxVKWisvXeqwmXOb1Pt0hDPbbxNQq3TNhdxiowf
	aUsijHecsh39Xp1Pt8wrqgKFf3P9DA+0WtXItEfZrXrB43kR10xtn7qKDionnY9315+1OK4ZIME0G
	ugkvDhlaGYWj07NieX/hDoBKGgFBda/omH9i0YMWxy0sMciFsfRomDW/IfjPDAsOzSUZW6X6m5MGd
	SXug2ipDZ4UGEJZW7Gtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mWCBb-00GocG-HU; Fri, 01 Oct 2021 06:38:23 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mWCBY-00Goaj-2p
 for ath10k@lists.infradead.org; Fri, 01 Oct 2021 06:38:21 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633070298; h=Content-Transfer-Encoding: Content-Type:
 MIME-Version: Message-ID: In-Reply-To: Date: References: Subject: Cc:
 To: From: Sender; bh=zwE1UcSRKjH4fdXGIfTb0HNedDc6r4BlZz/g6kDw5TA=;
 b=gGrqpEa2MgJcnfl8iuZFe2Z88NoBQ6i4cOJfcpp+drdLMk0epyY4oyyQhZ+U8WmxXZEGrfl/
 lED9PTQl8lSS0CBzOSY7R33Tx7+ImSEXY1qkKAz4acUWCiDKhJqZ4GXowdUrkS79xHfHK4QX
 59jZcCcWwldQ2/DJFpf37IGx43w=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 6156acd89ffb41314965ce26 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 01 Oct 2021 06:38:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C54F3C43616; Fri,  1 Oct 2021 06:38:15 +0000 (UTC)
Received: from tynnyri.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DBEA4C4338F;
 Fri,  1 Oct 2021 06:38:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org DBEA4C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Maurice Smulders <Maurice.Smulders@windtalker.com>
Cc: "linux-wireless\@vger.kernel.org" <linux-wireless@vger.kernel.org>,
 ath10k@lists.infradead.org, ath11k@lists.infradead.org
Subject: Re: Qualcomm Atheros Ath10k and Ath11k CE Buffer DMA alignment issues
 on Raspberry PI CM4 - Aarch64 architecture
References: <35F57D80-C7F7-47B2-BEC8-533006C72E2A@windtalker.com>
Date: Fri, 01 Oct 2021 09:38:11 +0300
In-Reply-To: <35F57D80-C7F7-47B2-BEC8-533006C72E2A@windtalker.com> (Maurice
 Smulders's message of "Thu, 16 Sep 2021 14:38:14 +0000")
Message-ID: <87lf3d5jxo.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210930_233820_223240_A4FC2691 
X-CRM114-Status: GOOD (  17.96  )
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

TWF1cmljZSBTbXVsZGVycyA8TWF1cmljZS5TbXVsZGVyc0B3aW5kdGFsa2VyLmNvbT4gd3JpdGVz
OgoKPiBJIGFtIHRyeWluZyB0byB1c2UgdGhlIFFDQTYxNzRBIGFuZCB0aGUgUUNBNjM5MCBvbiBh
IGN1c3RvbSBib2FyZCB1c2luZyBhIFBDSWUgc3dpdGNoIC0gYnV0IHRoYXQgZG9lc24ndCBtYXR0
ZXIgLSBJdCBzdGlsbCBmYWlscyB3L28gdGhlIHN3aXRjaDoKPgo+IGxzcGNpCj4gMDA6MDAuMCBQ
Q0kgYnJpZGdlOiBCcm9hZGNvbSBJbmMuIGFuZCBzdWJzaWRpYXJpZXMgQkNNMjcxMSBQQ0llIEJy
aWRnZSAocmV2IDIwKQo+IDAxOjAwLjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9y
IFBJN0M5WDJHNjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4gMDI6MDEu
MCBQQ0kgYnJpZGdlOiBQZXJpY29tIFNlbWljb25kdWN0b3IgUEk3QzlYMkc2MDhHUCBQQ0llMiA2
LVBvcnQvOC1MYW5lIFBhY2tldCBTd2l0Y2gKPiAwMjowMi4wIFBDSSBicmlkZ2U6IFBlcmljb20g
U2VtaWNvbmR1Y3RvciBQSTdDOVgyRzYwOEdQIFBDSWUyIDYtUG9ydC84LUxhbmUgUGFja2V0IFN3
aXRjaAo+IDAyOjAzLjAgUENJIGJyaWRnZTogUGVyaWNvbSBTZW1pY29uZHVjdG9yIFBJN0M5WDJH
NjA4R1AgUENJZTIgNi1Qb3J0LzgtTGFuZSBQYWNrZXQgU3dpdGNoCj4gMDI6MDQuMCBQQ0kgYnJp
ZGdlOiBQZXJpY29tIFNlbWljb25kdWN0b3IgUEk3QzlYMkc2MDhHUCBQQ0llMiA2LVBvcnQvOC1M
YW5lIFBhY2tldCBTd2l0Y2gKPiAwMjowNS4wIFBDSSBicmlkZ2U6IFBlcmljb20gU2VtaWNvbmR1
Y3RvciBQSTdDOVgyRzYwOEdQIFBDSWUyIDYtUG9ydC84LUxhbmUgUGFja2V0IFN3aXRjaAo+IDA1
OjAwLjAgVW5hc3NpZ25lZCBjbGFzcyBbZmYwMF06IFF1YWxjb21tIFFDQTYzOTAgV2lyZWxlc3Mg
TmV0d29yayBBZGFwdGVyIFtBWDUwMC1EQlMgKDJ4MildCj4gMDY6MDAuMCBOZXR3b3JrIGNvbnRy
b2xsZXI6IFF1YWxjb21tIEF0aGVyb3MgUUNBNjE3NCA4MDIuMTFhYyBXaXJlbGVzcyBOZXR3b3Jr
IEFkYXB0ZXIgKHJldiAzMikKPgo+IEJvdGggZGV2aWNlIGRyaXZlcnMgZG8gbm90IHdvcmsuIEkg
Y2hhbmdlZCB0aGUgQ0UgY29kZSB0byB1c2UgdGhlIEdGUF9ETUEzMiBmbGFnIGFzIGFuIGF0dGVt
cHQgdG8gYWxsb2NhdGUgdGhlIG1lbW9yeSBjb3JyZWN0bHksIGJ1dCBETUVTRyBzaG93cwo+Cj4g
W3BpQG5vZGU2NzQ1IH5dJCBkbWVzZyB8IGdyZXAgYXRoCj4gW8KgwqDCoMKgNS44MDE4OTZdIGF0
aDEwa19wY2kgMDAwMDowNjowMC4wOiBhdGgxMGtfY2VfYWxsb2Nfc3JjX3Jpbmc6IE5vdCB1bmFs
aWduZWQgPC0tLSBVc2VyIG1lc3NhZ2UgZXhpdCBmcm9tIHRoaXMgZnVuY3Rpb24KPiBbwqDCoMKg
wqA1LjgwNDI4NF0gYXRoMTBrX3BjaSAwMDAwOjA2OjAwLjA6IGZhaWxlZCB0byBhbGxvYyBDRSBz
cmMgcmluZyAwOiAtMTIKPiBbwqDCoMKgwqA1LjgxMzEzOF0gYXRoMTBrX3BjaSAwMDAwOjA2OjAw
LjA6IGZhaWxlZCB0byBhbGxvY2F0ZSBjb3B5IGVuZ2luZSBwaXBlIDA6IC0xMgo+IFvCoMKgwqDC
oDUuODE1NDE0XSBhdGgxMGtfcGNpIDAwMDA6MDY6MDAuMDogZmFpbGVkIHRvIGFsbG9jYXRlIGNv
cHkgZW5naW5lIHBpcGVzOiAtMTIKPiBbwqDCoMKgwqA1LjgxODAwMl0gYXRoMTBrX3BjaSAwMDAw
OjA2OjAwLjA6IGZhaWxlZCB0byBzZXR1cCByZXNvdXJjZTogLTEyCj4gW8KgwqDCoMKgNS44MjY5
NTNdIGF0aDEwa19wY2k6IHByb2JlIG9mIDAwMDA6MDY6MDAuMCBmYWlsZWQgd2l0aCBlcnJvciAt
MTIKPiBbwqDCoMKgwqA1Ljg1NTk5M10gYXRoMTFrX3BjaSAwMDAwOjA1OjAwLjA6IFdBUk5JTkc6
IGF0aDExayBQQ0kgc3VwcG9ydCBpcyBleHBlcmltZW50YWwhCj4gW8KgwqDCoMKgNS44OTYxNDhd
IGF0aDExa19wY2kgMDAwMDowNTowMC4wOiBCQVIgMDogYXNzaWduZWQgW21lbSAweDYwMDAwMDAw
MC0weDYwMGZmZmZmZiA2NGJpdF0KPiBbwqDCoMKgwqA1LjkwMDIzNl0gYXRoMTFrX3BjaSAwMDAw
OjA1OjAwLjA6IGVuYWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAyKQo+IFvCoMKgwqDCoDUuOTE0
MDUwXSBhdGgxMWtfcGNpOiBwcm9iZSBvZiAwMDAwOjA1OjAwLjAgZmFpbGVkIHdpdGggZXJyb3Ig
LTEyCj4KPiBFcnJvciAtMTIgKEVOT01FTSkgZ2V0cyByZXR1cm5lZCBhbmQgdGhlIGRyaXZlciBk
b2Vzbid0IHdvcmsuLi4KPgo+IDA1OjAwLjAgVW5hc3NpZ25lZCBjbGFzcyBbZmYwMF06IFF1YWxj
b21tIFFDQTYzOTAgV2lyZWxlc3MgTmV0d29yayBBZGFwdGVyIFtBWDUwMC1EQlMgKDJ4MildCj4g
U3Vic3lzdGVtOiBRdWFsY29tbSBEZXZpY2UgMDEwOAo+IENvbnRyb2w6IEkvTy0gTWVtKyBCdXNN
YXN0ZXItIFNwZWNDeWNsZS0gTWVtV0lOVi0gVkdBU25vb3AtIFBhckVyci0gU3RlcHBpbmctIFNF
UlItIEZhc3RCMkItIERpc0lOVHgtCj4gU3RhdHVzOiBDYXArIDY2TUh6LSBVREYtIEZhc3RCMkIt
IFBhckVyci0gREVWU0VMPWZhc3QgPlRBYm9ydC0gPFRBYm9ydC0gPE1BYm9ydC0gPlNFUlItIDxQ
RVJSLSBJTlR4LQo+IFJlZ2lvbiAwOiBNZW1vcnkgYXQgNjAwMDAwMDAwICg2NC1iaXQsIG5vbi1w
cmVmZXRjaGFibGUpIFtzaXplPTE2TV0KPiBDYXBhYmlsaXRpZXM6IDxhY2Nlc3MgZGVuaWVkPgo+
IEtlcm5lbCBtb2R1bGVzOiBhdGgxMWtfcGNpCj4KPiAwNjowMC4wIE5ldHdvcmsgY29udHJvbGxl
cjogUXVhbGNvbW0gQXRoZXJvcyBRQ0E2MTc0IDgwMi4xMWFjIFdpcmVsZXNzIE5ldHdvcmsgQWRh
cHRlciAocmV2IDMyKQo+IFN1YnN5c3RlbTogQVNVU1RlSyBDb21wdXRlciBJbmMuIERldmljZSA4
NmUwCj4gQ29udHJvbDogSS9PLSBNZW0tIEJ1c01hc3Rlci0gU3BlY0N5Y2xlLSBNZW1XSU5WLSBW
R0FTbm9vcC0gUGFyRXJyLSBTdGVwcGluZy0gU0VSUi0gRmFzdEIyQi0gRGlzSU5UeC0KPiBTdGF0
dXM6IENhcCsgNjZNSHotIFVERi0gRmFzdEIyQi0gUGFyRXJyLSBERVZTRUw9ZmFzdCA+VEFib3J0
LSA8VEFib3J0LSA8TUFib3J0LSA+U0VSUi0gPFBFUlItIElOVHgtCj4gSW50ZXJydXB0OiBwaW4g
QSByb3V0ZWQgdG8gSVJRIDQ4Cj4gUmVnaW9uIDA6IE1lbW9yeSBhdCA2MDEwMDAwMDAgKDY0LWJp
dCwgbm9uLXByZWZldGNoYWJsZSkgW2Rpc2FibGVkXSBbc2l6ZT0yTV0KPiBDYXBhYmlsaXRpZXM6
IDxhY2Nlc3MgZGVuaWVkPgo+IEtlcm5lbCBtb2R1bGVzOiBhdGgxMGtfcGNpCj4KPiBJIGFtIGF0
IGEgbG9zcyB3aGF0IHRvIGRvIGhlcmUuIFRoZSBhdGgxMWsgZHJpdmVyIGhhcyB0aGUgU0lOR0xF
IE1TSSBmaXggYnVpbHQgaW4uwqAKPgo+IEFueSBpZGVhcycgd2hhdCBJIGNhbiB0cnkgdG8gZml4
IHRoaXMgcHJvYmxlbSBvbiB0aGUgcmFzcGJlcnJ5IFBpIENNND8KClNvcnJ5LCBubyBpZGVhcy4g
QnV0IGFkZGluZyBhdGgxMGsgYW5kIGF0aDExayBsaXN0cywgbWF5YmUgcGVvcGxlIHRoZXJlCmNh
biBwcm9wb3NlIHNvbWV0aGluZy4KCi0tIApodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3By
b2plY3QvbGludXgtd2lyZWxlc3MvbGlzdC8KCmh0dHBzOi8vd2lyZWxlc3Mud2lraS5rZXJuZWwu
b3JnL2VuL2RldmVsb3BlcnMvZG9jdW1lbnRhdGlvbi9zdWJtaXR0aW5ncGF0Y2hlcwoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KYXRoMTBrIG1haWxpbmcg
bGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
