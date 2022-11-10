Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 564ADC4332F
	for <ath10k@archiver.kernel.org>; Thu, 10 Nov 2022 04:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:CC:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/S3hIzqBMWqOyseCknKXE17Bk1PKd2glvRCdNiQ0I/c=; b=PlrdNUJ1kd9uM9AgtDbBa0d3VP
	Rsk3eCqiREowH9Ghy3U0YlKes7/69EmV2Q8hI1mbQwfM6vaWAM/uL88eBC3wFhLDi5Gvr8a4Ufrdv
	ytid6HVTDSeiX1rVBu+70chaGqDbqeXY9VkS/h+iQ2pBpSs5D0XBxHBOV7HsdERPgTggFqD+hbH/t
	JtLvSCu0aDXJVUv5s2di3gtnpJfYT+rdmaaZy+cRKNDUGkEJaS35DsCu3L//y6RRx3bLA3TwvjC3j
	mp2yx9lk8Dxv+lAy9GO3hjBrbaIj6gzosUx8Vbi0+wq9BcttbTIZKgA2JxfQjFuWff6IMdA0mG/Kt
	4QPqPNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osykZ-002Vsx-1X; Thu, 10 Nov 2022 04:01:11 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osykT-002VpZ-93
	for ath10k@lists.infradead.org; Thu, 10 Nov 2022 04:01:09 +0000
Received: from dggpeml500023.china.huawei.com (unknown [172.30.72.55])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4N77RK2s3GzmVnn;
	Thu, 10 Nov 2022 12:00:45 +0800 (CST)
Received: from [10.67.110.112] (10.67.110.112) by
 dggpeml500023.china.huawei.com (7.185.36.114) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 10 Nov 2022 12:00:59 +0800
Subject: Re: [PATCH v2] wifi: ath10k: Fix return value in ath10k_pci_init()
To: Jakub Kicinski <kuba@kernel.org>
CC: <kvalo@kernel.org>, <davem@davemloft.net>, <edumazet@google.com>,
	<pabeni@redhat.com>, <rmani@qti.qualcomm.com>, <ath10k@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
References: <20221110031228.247361-1-xiujianfeng@huawei.com>
 <20221109192532.259e4af3@kernel.org>
From: xiujianfeng <xiujianfeng@huawei.com>
Message-ID: <9ea5ec08-65b3-6c8b-ae64-5114b736e64d@huawei.com>
Date: Thu, 10 Nov 2022 12:00:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <20221109192532.259e4af3@kernel.org>
X-Originating-IP: [10.67.110.112]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500023.china.huawei.com (7.185.36.114)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_200105_511360_4F72E533 
X-CRM114-Status: UNSURE (   4.92  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="gbk"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

CgrU2iAyMDIyLzExLzEwIDExOjI1LCBKYWt1YiBLaWNpbnNraSDQtLXAOgo+IE9uIFRodSwgMTAg
Tm92IDIwMjIgMTE6MTI6MjggKzA4MDAgWGl1IEppYW5mZW5nIHdyb3RlOgo+PiBUbzogPGt2YWxv
QGtlcm5lbC5vcmc+LCA8ZGF2ZW1AZGF2ZW1sb2Z0Lm5ldD4sIDxlZHVtYXpldEBnb29nbGUuY29t
PiwgIDxrdWJhQGtlcm5lbC5vcmc+LCA8cGFiZW5pQHJlZGhhdC5jb20+LCA8cm1hbmlAcXRpLnF1
YWxjb21tLmNvbT4KPj4gQ0M6IDxhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZz4sIDxsaW51eC13
aXJlbGVzc0B2Z2VyLmtlcm5lbC5vcmc+LCAgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+
Cj4gCj4gSG93IGRpZCB5b3UgY29tZSB1cCB3aXRoIHRoaXMgQ0MgbGlzdD8gSWYgeW91J3JlIEND
aW5nIG5ldGRldgo+IG1haW50YWluZXJzIHlvdSBzaG91bGQgYWxzbyBDQyBuZXRkZXZAdmdlci5r
ZXJuZWwub3JnCj4gU29tZWhvdyB5b3UgbWFuYWdlZCB0byBDQyBMTUtMIGJ1dCBub3QgbmV0ZGV2
IDpTCj4gLgoKU29ycnksIEkgbWF5IG1pc3NlZCB0aGF0LCBJIHdpbGwgcmVzZW5kIHRoaXMgcGF0
Y2guCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
