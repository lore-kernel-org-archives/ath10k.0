Return-Path: <SRS0=CwSx=HE=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56482C433DB
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 09:13:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 03B6964E32
	for <ath10k@archiver.kernel.org>; Tue,  2 Feb 2021 09:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 03B6964E32
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4T+3dF6dTEMQOjl9RBRC15j+K3jePj9Wk3WRhULm6QY=; b=a1NtPv7iKkifZLvT01o8MRP8q
	fRB9qpqhV6WZ2DrouKV1UM4y2eOYz1D2GlpdBxohIe5oocqlwPV0Fdn7eiZMiKQp4LAwyme5euQ78
	3C9mcknwdAbekxF4z2IMlyGIkT+uWN1Bzu7DE7ut12lU6j+ri3vglNdhG1Rx66G/Lhu43tBndKWLy
	8myAebREBuxTfKS3gdPCPHjIjrgKVLx9IcDz6VvajV2UksbmrjzjbNsdATKkADKiQdTDVcqwdJGR0
	fX8tn6Rk458uJcbKbc/bqmb/oEc2kryFMQw7IoRdc9a9BrzjUgv7KJhwE/449mkZDcyjDTugL6h0r
	WbNCsrDeg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6rjw-0007rT-6H; Tue, 02 Feb 2021 09:12:52 +0000
Received: from mail.as201155.net ([185.84.6.188])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6rju-0007qZ-FD
 for ath10k@lists.infradead.org; Tue, 02 Feb 2021 09:12:51 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:35758
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6rjr-0007yl-0b; Tue, 02 Feb 2021 10:12:47 +0100
X-CTCH-RefID: str=0001.0A782F1B.6019178F.004F, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=0ultzq2pUMQnS7l924hs7UejuXE9XfcK79Pmp771G1U=; 
 b=XUq0BCwJj9WVpUpH1YgNotwDHQBbvM2WPQW/Dev+336BJDECq8fFEN2Xb42+CVGPA+gBOUV9AGFs1UmFMmUwLg4pdQwppXhbmmpqZS83AR4zaf9UIPBEaG37fzacFgiv0okE4RbVrWagn2ZF8A9QNI1YfVZLc6IB7zdrCRjLZ9o=;
Message-ID: <a54d233a-7677-80d4-32e9-3cec6744e8c7@dd-wrt.com>
Date: Tue, 2 Feb 2021 10:12:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:86.0) Gecko/20100101
 Thunderbird/86.0
Subject: Re: EAP AP/VLAN: multicast not send to client
To: Sven Eckelmann <sven@narfation.org>, ath10k@lists.infradead.org,
 Ben Greear <greearb@candelatech.com>
References: <268706864.fOQeQAt3TZ@ripper> <6253766.kEHZKgWlQx@ripper>
 <93607622-3fef-a203-6ca0-3daa54dff07c@dd-wrt.com> <2354947.QRssEMCmQP@ripper>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <2354947.QRssEMCmQP@ripper>
X-Received: from [81.201.155.134] (helo=[172.29.0.186])
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1l6rjp-0008kE-Ub; Tue, 02 Feb 2021 10:12:45 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210202_041250_623039_4B56EB1C 
X-CRM114-Status: GOOD (  13.07  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Cj4+IHRoZW4gaXQgbWlnaHQgYmUgc29tZXRoaW5nIGRpZmZlcmVudC4gaSdtIG5vdCBzdXJlIGF0
IHRoYXQgcG9pbnQuIGJ1dAo+PiBjb25zaWRlciB0aGF0IEFQX1ZMQU4gaXMgYWxzbyB1c2VkIGZv
ciBXRFMgU1RBL1dEUyBBUCBpbXBsZW1lbnRhdGlvbnMuCj4+IHNvIGVhY2ggd2RzIHN0YXRpb24g
YmVjb21lcyBhIGluZGl2aWR1YWwgaW50ZXJmYWNlIG9uIGFwIHNpZGUgZm9yCj4+IGJyaWRnaW5n
LiB0aGF0IG1pZ2h0IG9mIGNvdXJzZSBoYXZlIGEgaW5mbHVlbmNlIHRvIGJyb2FkY2FzdC9tdWx0
aWNhc3QKPj4gZnJhbWVzCj4gSW50ZXJlc3RpbmdseSwgdGhlIFdEUyAibW9kZSIgd29ya3MgcGVy
ZmVjdGx5IGZpbmUgIG9uIHRoZSBzYW1lIGhhcmR3YXJlLiBTbyBJCj4gaGF2ZSBub3QgYSByZWFs
IGlkZWEgd2hhdCB0aGUgZGlmZmVyZW5jZSBpcyBiZXR3ZWVuIEVBUCBBUF9WTEFOIGFuZCBXRFMg
KFBTSykKPiBBUF9WTEFOIGF0IHRoZSBtb21lbnQuCgptbWguIGwgaGF2ZSBhIGlkZWEKCnRyeSB0
aGUgZm9sbG93aW5nICh0aGlzIGEgcGF0Y2ggaW4gbXkgdHJlZSkgYW5kIGNoZWNrIGFsc28gdGhl
IHdtaSAKc2VydmljZXMgZm9yIHRoaXMgc2VydmljZSBmbGFnIHdoaWNoIG1pZ2h0IGJlIGEgZGlm
ZmVyZW5jZSBiZXR3ZWVuIHRoZXNlIApmaXJtd2FyZXMKCi0tLSBhL2RyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvbWFjLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEw
ay9tYWMuYwpAQCAtOTAwMywxMCArOTAwMywxMCBAQCBpbnQgYXRoMTBrX21hY19yZWdpc3Rlcihz
dHJ1Y3QgYXRoMTBrICphcikKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGdvdG8gZXJy
X2Rmc19kZXRlY3Rvcl9leGl0OwrCoMKgwqDCoMKgwqDCoCB9CgotwqDCoMKgwqDCoMKgIGlmICh0
ZXN0X2JpdChXTUlfU0VSVklDRV9QRVJfUEFDS0VUX1NXX0VOQ1JZUFQsIAphci0+d21pLnN2Y19t
YXApKSB7CisvL8KgwqDCoMKgIGlmICh0ZXN0X2JpdChXTUlfU0VSVklDRV9QRVJfUEFDS0VUX1NX
X0VOQ1JZUFQsIAphci0+d21pLnN2Y19tYXApKSB7CsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCBhci0+aHctPndpcGh5LT5pbnRlcmZhY2VfbW9kZXMgfD0gCkJJVChOTDgwMjExX0lGVFlQ
RV9BUF9WTEFOKTsKwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGFyLT5ody0+d2lwaHkt
PnNvZnR3YXJlX2lmdHlwZXMgfD0gCkJJVChOTDgwMjExX0lGVFlQRV9BUF9WTEFOKTsKLcKgwqDC
oMKgwqDCoCB9CisvL8KgwqDCoMKgIH0KCsKgwqDCoMKgwqDCoMKgIGlmICghYXRoX2lzX3dvcmxk
X3JlZ2QoJmFyLT5hdGhfY29tbW9uLnJlZ3VsYXRvcnkpKSB7CsKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCByZXQgPSByZWd1bGF0b3J5X2hpbnQoYXItPmh3LT53aXBoeSwKCj4KPj4gaW4g
YWRkaXRpb24gdGhlIDEwLjQgZmlybXdhcmUgc2VyaWVzIGhhcyBhIHNwZWNpYWwgd21pIGZsYWcg
d2hpY2ggaXMgbm90Cj4+IHVzZWQgYnkgYXRoMTBrLCBidXQgc29sdmVkIGFsb3Qgb2YgcHJvYmxl
bXMKCj4+ICAgZm9yIG1lIChpbiBteSBjYXNlIHdpdGgKPj4gcmVhdXRoZW50aWNhdGlvbikKPj4g
V01JX1ZERVZfRElTQUJMRV80X0FERFJfU1JDX0xSTgo+PiB0aGlzIG1pZ2h0IGJlIHVucmVsYXRl
ZCB0byB5b3VyIGlzc3VlLiBidXQgdGhpcyBmbGFnIG11c3QgYmUgc2V0IGFueXdheQo+PiBmb3Ig
cHJvcGVyIHdvcmsuIGJ1dCBpdCBpc250IGJ5IGRlZmF1bHQgaW4gYWxsIDEwLjQgZmlybXdhcmVz
Lgo+IEdvb2QgdG8ga25vdywgdGhhbmtzLgo+Cj4+PiBGb3IgQmVuIEdyZWVhcidzIGZpcm13YXJl
LCB0aGUgb25seSB3b3JrYXJvdW5kIHdoaWNoIEkgZm91bmQgdW50aWwgbm93IHdhcyB0bwo+Pj4g
c2V0IE5MODAyMTFfQVRUUl9NVUxUSUNBU1RfVE9fVU5JQ0FTVF9FTkFCTEVEIHRvIDEgdG8gZm9y
Y2UgbWFjODAyMTEgdG8gc2VuZAo+Pj4gbXVsdGljYXN0IGFzIHVuaWNhc3QuCj4+IHNvIGlmIGl0
cyBhIHB1cmUgbXVsdGljYXN0L3VuaWNhc3QgaXNzdWUgaXQgY291bGQgYmUgYWxzbyBhIGJhc2lj
IHJhdGUKPj4gaXNzdWUgZm9yIGN0IGZpcm13YXJlcy4KPiBJbnRlcmVzdGluZyBpZGVhLiBCdHcu
IEkndmUgYWxzbyBzd2l0Y2hlZCB0byBzdyBjcnlwdG8gZm9yIGEgdGVzdCBqdXN0IHRvIG1ha2UK
PiBzdXJlIHRoYXQgdGhlcmUgaXMgbm8gSFcga2V5IHByb2JsZW0uCj4KPiBLaW5kIHJlZ2FyZHMs
Cj4gCVN2ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmF0aDEwayBtYWlsaW5nIGxpc3QKYXRoMTBrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9hdGgxMGsK
