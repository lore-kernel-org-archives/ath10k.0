Return-Path: <SRS0=ZFlJ=IZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D82C433DB
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 17:34:30 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0E35B6191C
	for <ath10k@archiver.kernel.org>; Sat, 27 Mar 2021 17:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0E35B6191C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IVgHT/LM0lW8OKkTyyRAp+cPD/vAUS5CjjOj65NnS/8=; b=Gg/wsUKLqeyepM+o9/AOpk2Em
	kOKPN92C5+bHfTGYMiO34+lE+KoepN/R/jVBYnrKO01MyS7DQjSFbC7ZuaBn3m6YWFxzLSa0MelKL
	KszhEMC6UdrX2F9aHEOalSTWFGgq9Qy9h7M1ARJ2Y3W03TOo4jS8i/+SKy2PGx/r6cTE+05sLXCid
	wk+9vn2TT39Ui28rx+QnoWf07dsLp3ziJc1xnLNcjkLxS8xDtVobLwF07eWcqeQeRK9VCAtdOJ1UJ
	mDXmqRvl2kpUUFgc2tA120KIqmm/4BSHmAZ/orM1cc6Zq7+B5mnW/vHZlSQnY9i+3bfJz43UDYlfP
	2qzuDpv8g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQCoj-005M6U-2L; Sat, 27 Mar 2021 17:33:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQCoa-005M5Q-DF
 for ath10k@lists.infradead.org; Sat, 27 Mar 2021 17:33:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08E9B619AE;
 Sat, 27 Mar 2021 17:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616866410;
 bh=oxyLYLefehpWosmb5y5Pli16dqH1dyu9Z35XDlG8ET0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rQXaQob413Eg6E56SJ8wTkqWk9NuTG34Apv0JcwAKGYMjnNn33LGum+D+t7gTyWyH
 lojMX41ea2R9C9cd/yrn/IgxUT1xO4NgYRbw0WRKb55UOEnt/s6rEuRa36wSmop6UB
 wbU6uMoA35DrwNx1QcJrseH9+DbH5aazyNWNn3+l3wSdo7z7/AzxYId1+uUGq13c/A
 rLAIzrW8MvxEZpl5qi0iBXlU6G486nxvTrBMybqIL6N3Op5msIGG6Pk99SQw8gOSaM
 vLXBnUnzLhTDEqR1z/9IEjqJNbkK9fHIRDvmVF1ejmU0RhFCSz7Qk9IZXHDlwiLWpG
 y55ZIdi19uv9w==
Received: by pali.im (Postfix)
 id 6551195D; Sat, 27 Mar 2021 18:33:27 +0100 (CET)
Date: Sat, 27 Mar 2021 18:33:27 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Marek =?utf-8?B?QmVow7pu?= <marek.behun@nic.cz>
Cc: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, vtolkm@gmail.com,
 Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pci@vger.kernel.org, ath10k@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] PCI: Disallow retraining link for Atheros QCA98xx chips
 on non-Gen1 PCIe bridges
Message-ID: <20210327173327.tfn4mjq3cvrq33qu@pali>
References: <20210326124326.21163-1-pali@kernel.org>
 <YF540gjh156QIirA@rocinante> <20210327132959.fwkphna7gg57aove@pali>
 <20210327154213.571aa263@dellmb.labs.office.nic.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210327154213.571aa263@dellmb.labs.office.nic.cz>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_173338_035399_5B42E68F 
X-CRM114-Status: GOOD (  11.28  )
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

T24gU2F0dXJkYXkgMjcgTWFyY2ggMjAyMSAxNTo0MjoxMyBNYXJlayBCZWjDum4gd3JvdGU6Cj4g
T24gU2F0LCAyNyBNYXIgMjAyMSAxNDoyOTo1OSArMDEwMAo+IFBhbGkgUm9ow6FyIDxwYWxpQGtl
cm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4gSSBjYW4gY2hhbmdlIHRoaXMgdG8gJ2lmICghcmV0KScg
aWYgbmVlZGVkLCBubyBwcm9ibGVtLgo+ID4gCj4gPiBJIHVzZSAnaWYgKCF2YWwpJyBtb3N0bHkg
Zm9yIGJvb2xlYW4gYW5kIHBvaW50ZXIgdmFyaWFibGVzLiBJZgo+ID4gdmFyaWFibGUgY2FuIGNv
bnRhaW4gbW9yZSBpbnRlZ2VyIHZhbHVlcyB0aGVuIEkgbG90IG9mIHRpbWVzIEkgdXNlCj4gPiAn
PT0nLgo+IAo+IENvbXBhcmluZyBpbnRlZ2VyIHZhcmliYWxlcyB3aXRoIGV4cGxpY2l0IGxpdGVy
YWxzIGlzIHNlbnNpYmxlLCBidXQKPiBpZiBhIGZ1bmN0aW9uIHJldHVybmluZyBpbnRlZ2VyIHJl
dHVybnMgMCBvbiBzdWNjZXNzIGFuZCBuZWdhdGl2ZSB2YWx1ZQo+IG9uIGVycm9yLCBMaW51eCBr
ZXJuZWwgaGFzIGEgdHJhZGl0aW9uIG9mIHVzaW5nIGp1c3QKPiAgIGlmICghcmV0KQo+IG9yIAo+
ICAgaWYgKHJldCkKPiAKPiBNYXJlawoKT2ssIEkgd2lsbCBjaGFuZ2UgaXQuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0
CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
