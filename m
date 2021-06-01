Return-Path: <SRS0=Nlrh=K3=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BF23C47080
	for <ath10k@archiver.kernel.org>; Tue,  1 Jun 2021 11:29:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBB8361057
	for <ath10k@archiver.kernel.org>; Tue,  1 Jun 2021 11:29:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBB8361057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=shDVdxkr806ZVT2zbBhz8E63JPAHgf7hyUrfANbnz7k=; b=Lgzr/5He4S060r
	Y93FI1nzwjJG7MIbQkL6DPup8LUGM/5IbuCqzevvdOZ1SkKfXnrowvitOt1J03mHKqytJsxCy38v9
	oGtK28iVul5muRbuGY3737+4rb2XiuVTuSMzoTkbyYtDp30LS46TfzYne9piARLiVyjpKDx5xB9Ip
	WvctQF8wrtGqoeCLvnHtRKckeprANmiDKdjFNg61PW+Fvd3GrK4tuo61y0nOyDKUpYa5XzpYHlpzi
	pXs7L3NWyGxOyseEkRUwYAsxOUfx6xq8m8+ANtbfiOICcjUcoFQMd0klPiiQqFs/Rp3RubyQs+3rf
	GJV6X90X4Pq6GKSdKIFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo2ZS-00GBqd-74; Tue, 01 Jun 2021 11:28:30 +0000
Received: from mail-wr1-f48.google.com ([209.85.221.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo2ZP-00GBoo-5s
 for ath10k@lists.infradead.org; Tue, 01 Jun 2021 11:28:28 +0000
Received: by mail-wr1-f48.google.com with SMTP id m18so13910477wrv.2
 for <ath10k@lists.infradead.org>; Tue, 01 Jun 2021 04:28:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=HAFqZJJNfiC2AGdxA4gbkC1Qg+KvNCEqsSjmBVkFjH0=;
 b=ejXP1qy9ckYuAFedvhNgo44ZK9E7udiZDeVxerKje13G2w+DXixRvsNIJbvOHvJSQC
 8x5OeIXPVe7afq+N5zBTZcR2KK91ULUMvigQqzhNtnBxbwUjqMVYhry5t3rEKJYjW1Ug
 hHFpix8K9qQ+vLaQX3BWzQ5IrL2uxFMZIc1Xizu0gxo1QknWN4NmZ4+W9M09EX+Vka37
 ciCAp9KV6O5Nw/BhGxvy8MiisW/PXjg7f9EklXB9RgWun60/xE3GwqU+nuNHdaIziHLW
 7C0Td5N3d5YvOse4wEs/dFQJKpUeUYiOtuaiSc6HcLwljgwX6+w9Vem5pu90pa+0qJzW
 2KXw==
X-Gm-Message-State: AOAM5326O9iJp1v3c0FpCb/6vXMJTYDqj1p/bW1Qq04oIh1agi+4Y2wz
 /dridG8nSbj9kC6itnZzzpg=
X-Google-Smtp-Source: ABdhPJzSJFaWOyQO59mkgqVzre/9t0p9NiapOKwk/5uV6uk+H29hMEjZJWzfGWuZPiUwRs81xnoi4Q==
X-Received: by 2002:a5d:6382:: with SMTP id p2mr10176931wru.338.1622546903114; 
 Tue, 01 Jun 2021 04:28:23 -0700 (PDT)
Received: from rocinante.localdomain ([95.155.85.46])
 by smtp.gmail.com with ESMTPSA id o3sm2917179wrm.78.2021.06.01.04.28.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 04:28:22 -0700 (PDT)
Date: Tue, 1 Jun 2021 13:28:20 +0200
From: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
To: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Cc: Bjorn Helgaas <bhelgaas@google.com>, Kalle Valo <kvalo@codeaurora.org>,
 Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>,
 Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>, vtolkm@gmail.com,
 Rob Herring <robh@kernel.org>,
 Ilias Apalodimas <ilias.apalodimas@linaro.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 linux-pci@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] PCI: Disallow retraining link for Atheros chips on
 non-Gen1 PCIe bridges
Message-ID: <20210601112820.GA189305@rocinante.localdomain>
References: <20210326124326.21163-1-pali@kernel.org>
 <20210505163357.16012-1-pali@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210505163357.16012-1-pali@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_042827_241799_8B639509 
X-CRM114-Status: GOOD (  10.19  )
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

SGkgUGFsaSwKClRoYW5rIHlvdSBmb3Igd29ya2luZyBvbiB0aGlzIGFuZCBmaXhpbmcgdGhlIHBy
b2JsZW0sIGFuZCBhbHNvIHRoYW5rIHlvdQpnb2VzIHRvIE1hcmVrIGFuZCBUb2tlIGZvciB0ZXN0
aW5nISAgTXVjaCBhcHByZWNpYXRlZCEKClsuLi5dCj4gLSBBUjkyODcgY2hpcCB0aHJvd3MgYWxz
byBMaW5rIERvd24gYW5kIExpbmsgVXAgZXZlbnRzLCBhbHNvIGhhcwo+ICAgYWNjZXNzaWJsZSBj
b25maWcgc3BhY2UgY29udGFpbmluZyBjb3JyZWN0IHZhbHVlcy4gQnV0IGF0aDlrIGRyaXZlcgo+
ICAgZmFpbHMgdG8gaW5pdGlhbGl6ZSBjYXJkIGZyb20gdGhpcyBzdGF0ZSBhcyBpdCBpcyB1bmFi
bGUgdG8gYWNjZXNzIEhXCj4gICByZWdpc3RlcnMuIFRoaXMgYWxzbyBpbmRpY2F0ZXMgdGhhdCB0
aGUgY2hpcCBpc2VsZiBpcyBub3QgYWJsZSB0byByZWFkCgpBIHR5cG8gaGVyZSAtIGl0IHdvdWxk
IGJlICJpdHNlbGYiIGluIHRoZSBhYm92ZS4gIEJ1dCB0aGlzIGlzIG5vdCB3b3J0aApzZW5kaW5n
IHY0LCBhbmQgSSBhbSBzdXJlIHRoYXQgQmpvcm4gb3IgTG9yZW56byBjb3VsZCBmaXggdGhpcyBp
bi1wbGFjZQp3aGVuIG1lcmdpbmcuCgpbLi4uXQo+IFNpZ25lZC1vZmYtYnk6IFBhbGkgUm9ow6Fy
IDxwYWxpQGtlcm5lbC5vcmc+Cj4gUmVwb3J0ZWQtYnk6IFRva2UgSMO4aWxhbmQtSsO4cmdlbnNl
biA8dG9rZUByZWRoYXQuY29tPgo+IFRlc3RlZC1ieTogVG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu
IDx0b2tlQHJlZGhhdC5jb20+Cj4gVGVzdGVkLWJ5OiBNYXJlayBCZWjDum4gPGthYmVsQGtlcm5l
bC5vcmc+ClsuLi5dCgpUaGFuayB5b3UgZXZlcnlvbmUhCgpSZXZpZXdlZC1ieTogS3J6eXN6dG9m
IFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CgoJS3J6eXN6dG9mCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwphdGgxMGsgbWFpbGluZyBsaXN0CmF0aDEw
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vYXRoMTBrCg==
