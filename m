Return-Path: <SRS0=6Xds=JM=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 450B9C433B4
	for <ath10k@archiver.kernel.org>; Thu, 15 Apr 2021 05:33:11 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E69861003
	for <ath10k@archiver.kernel.org>; Thu, 15 Apr 2021 05:33:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E69861003
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=dd-wrt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GbVhv6s6PEYz82sIItx+wqTx8WnN52a/HRGcIDrWlUo=; b=WtlLPmMDEMSrkNlrckECOCnem
	mt7askqrF6kjxnAWeyg1z+RLIHLLeEUDCBx4AXTKFDNGDK4crPxx1n+qgyiji2KfpQBfpzGODv1EG
	xJTrvz4AWBF50ok1dJFBiAKTutSXUEcrEL7tMDwkuV3XwMIG9f0h0bMlse+sOZSlmgOVlJfeTiCq9
	33CCk2cNz6q7NcbQVqekSYaK+EQHVYE57DxnTeDCgQmhURDFeEqDtl645W2qsCo2/XKYjhne+AfaC
	+cGyrZbVOVRUbwMEgBv5flN4i/7k6f6LiMaV+T+ZpBoeefuDZarVQtdYr8GtH72AHwvfFvbEDAVoy
	qHBLg7tRg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWubt-00Euu0-JW; Thu, 15 Apr 2021 05:32:13 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWubr-00Eutq-C8
 for ath10k@desiato.infradead.org; Thu, 15 Apr 2021 05:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Cc:Content-ID:Content-Description;
 bh=kcA73jc4eKAfGzqHozHxaSnh4GkUc6TrUznuKdshDmU=; b=sd//kwnJ3aa2NGO92JhjwZD8aD
 rHt6VLsu3RDxLr+J5EZx3D83D2JP1eBEmLj17PzqzSaxdUJUlWTMNJaO3Bzh32PX0KFZhRTu4WjF7
 YFOY1bwIvWvo6W+7cI8K+GCPqdoweEcPqviQl/MKJfyKCCHE4gLR8G3JJfe/hWwPDw/PbWoSci6eK
 tGCplcngQZl194Qa4+sF0U8u7/s9i2xMyFs3PQlX2UjPMW9irUOW+7w8AKCvj/zfKuGR9svOlttKb
 chVJDIA1AZhZ13xIDbncqwnLxCxe8HQ/UDuqbm3Uro54ffzSRfq6/+C5RTmvLSz7HdjGJk84teXcH
 28B9rwvQ==;
Received: from mail.as201155.net ([185.84.6.188])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWubn-008HXb-NF
 for ath10k@lists.infradead.org; Thu, 15 Apr 2021 05:32:10 +0000
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]:36304
 helo=webmail.newmedia-net.de)
 by mail.as201155.net with esmtps (TLSv1:DHE-RSA-AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1lWubh-00081R-0G
 for ath10k@lists.infradead.org; Thu, 15 Apr 2021 07:32:01 +0200
X-CTCH-RefID: str=0001.0A782F1A.6077CFD1.001D, ss=1, re=0.000, recu=0.000,
 reip=0.000, cl=1, cld=1, fgs=0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=dd-wrt.com;
 s=mikd; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID;
 bh=kcA73jc4eKAfGzqHozHxaSnh4GkUc6TrUznuKdshDmU=; 
 b=JDxV6r4c0KPFKqJLgojo1HkK94i4ff1Xqef190yU9IBicJntnPi5H+fUfhqXGKZyuMXW6+FCK9xVCpkltTABh6N67IQxrpbLrstZ1mnJ49ISdp1sGvzBT696LQ4YatSyXl0tqBKr69UUU7N6zMkrRiFc+J6yrj2gCr48S6ZfO0E=;
Message-ID: <8d3a0a43-1d0b-15e7-4211-661f0c04ce19@dd-wrt.com>
Date: Thu, 15 Apr 2021 07:31:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:88.0) Gecko/20100101
 Thunderbird/88.0
Subject: Re: Reading default values of Roaming parameters with wmi commands
To: ath10k@lists.infradead.org
References: <5525e305-6f59-1e8f-952f-99bc8d1f1d1b@gmail.com>
From: Sebastian Gottschall <s.gottschall@dd-wrt.com>
In-Reply-To: <5525e305-6f59-1e8f-952f-99bc8d1f1d1b@gmail.com>
X-Received: from [2003:c9:3f18:200:d59b:9f66:63af:ddc2]
 by webmail.newmedia-net.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.72) (envelope-from <s.gottschall@dd-wrt.com>)
 id 1lWubg-000Vny-S5
 for ath10k@lists.infradead.org; Thu, 15 Apr 2021 07:32:00 +0200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210414_223207_967000_E7454121 
X-CRM114-Status: GOOD (  11.58  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

QW0gMTUuMDQuMjAyMSB1bSAwNToyNCBzY2hyaWViIEFydmluZDoKPiBIaSBBbGwsCj4gwqDCoMKg
wqDCoMKgwqDCoCBJIGhhdmUgYmVlbiB1c2luZyBhdGgxMGsgZHJpdmVyIGZvciBhIHF1YWxjb21t
IGNoaXAgCj4gUUNBOTM3NyBiYXNlZCBtb2R1bGUgdXNlZCBpbiBhIGN1c3RvbSBib2FyZCBhbmQg
SSB3YXMgbG9va2luZyBhdCB0aGUgCj4gY29kZSB0byBzZWUgaWYgdGhlcmUgaXMgYSB3YXkgdG8g
cmVhZCB0aGUgdmFsdWVzIG9mIHRoZSBmb2xsb3dpbmcgCj4gUm9hbWluZyBwYXJhbWV0ZXJzIGZy
b20gZmlybXdhcmUgdG8gZmluZCBpdHMgZGVmYXVsdCB2YWx1ZS4KPgo+IFdNSV9ST0FNX1NDQU5f
TU9ERQo+IFdNSV9ST0FNX1NDQU5fUlNTSV9USFJFU0hPTEQKPiBXTUlfUk9BTV9TQ0FOX1BFUklP
RAo+IFdNSV9ST0FNX1NDQU5fUlNTSV9DSEFOR0VfVEhSRVNIT0xECj4gV01JX1JPQU1fQVBfUFJP
RklMRQo+Cj4gSXMgdGhlcmUgYW55IHdheSB0byBvYnRhaW4gdGhlc2UgdmFsdWVzIHVzaW5nIGF0
aDEwayBkcml2ZXI/Cgpvbmx5IGlmIHlvdSBtb2RpZnkgdGhlIGF0aDEwayBkcml2ZXIgdG8gb2J0
YWluIHRoZXNlIHZhbHVlcy4gYnV0IGl0cyAKcG9pbnRsZXNzIGFueXdheS4gdGhlIGZpcm13YXJl
IGJhc2VkIHJvYW1pbmcgb2ZmbG9hZCBjb2RlIGlzIHVudXNlZCBieSAKYXRoMTBrLiBzbyB0aGVz
ZSB2YWx1ZXMKaGF2ZSBubyBpbmZsdWVuY2UgdG8gcm9hbWluZy4gaXRzIGFsbCBoYW5kbGVkIGJ5
IHdwYV9zdXBwbGljYW50L21hYzgwMjExCgpTZWJhc3RpYW4KCj4KPiBSZWdhcmRzICYgVGhhbmtz
LAo+IEFydmluZCBSYW0gUHJha2FzaAo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPiBhdGgxMGsgbWFpbGluZyBsaXN0Cj4gYXRoMTBrQGxpc3RzLmlu
ZnJhZGVhZC5vcmcKPiBodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2F0aDEwawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
YXRoMTBrIG1haWxpbmcgbGlzdAphdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2F0aDEwawo=
