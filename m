Return-Path: <SRS0=5jfJ=KV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8688CC47088
	for <ath10k@archiver.kernel.org>; Wed, 26 May 2021 15:26:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 50941611C9
	for <ath10k@archiver.kernel.org>; Wed, 26 May 2021 15:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 50941611C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=84mFa1ETbhw8Ft2FMUYyiKH82EWXChan3uKKePH7h0U=; b=4LnjZ7cKd57TGE
	qJfc2r2jWwcsaqFg29gQNdcL8ABjanG13EH8qCbskNBTPNSNs+Xy1WkQ2pJY/ibxLEy45BXNJ3hdd
	8q0kVF/+vsxXu+4PQriCChhcCTOtZXsPJ0k3DWnytNjiROTOUbLElkBsmKxNNJ5lOssCMwB/F17Sa
	aN82vu1RL9cnD5c04ZpiQ0BMwCgefsxgqSPzYWj8hotfr2Vk08xVpjP6LfNiakAQGbK1wP/PijNIe
	VzShDFH4PlxGV9w4eZpDU+JL0WQ/WSvGvowGjQoH3OqHoNfvza7bEyXVQpZe2OLgcXrviutwWf6ho
	dqh9V/exGymgkpWcq5+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llvQX-00FM3h-3C; Wed, 26 May 2021 15:26:33 +0000
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lluM7-00EnWj-AH
 for ath10k@lists.infradead.org; Wed, 26 May 2021 14:17:56 +0000
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FqtJW6pVCzmZ6j;
 Wed, 26 May 2021 22:15:23 +0800 (CST)
Received: from dggpeml500017.china.huawei.com (7.185.36.243) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 22:17:44 +0800
Received: from huawei.com (10.175.103.91) by dggpeml500017.china.huawei.com
 (7.185.36.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Wed, 26 May
 2021 22:17:44 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <ath10k@lists.infradead.org>
CC: <kvalo@codeaurora.org>, <davem@davemloft.net>
Subject: [PATCH -next] ath10k: Fix W=1 build warning in htt_rx.c
Date: Wed, 26 May 2021 22:22:19 +0800
Message-ID: <20210526142219.2542528-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpeml500017.china.huawei.com (7.185.36.243)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_071755_654461_46FA0007 
X-CRM114-Status: UNSURE (   6.06  )
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

Rml4IHRoZSBmb2xsb3dpbmcgVz0xIGJ1aWxkIHdhcm5pbmc6CgogIGRyaXZlcnMvbmV0L3dpcmVs
ZXNzL2F0aC9hdGgxMGsvaHR0X3J4LmM6MTc5MDo3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhtb3Jl
X2ZyYWdz4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAg
IDE3OTAgfCAgYm9vbCBtb3JlX2ZyYWdzOwogICAgICAgIHwgICAgICAgXn5+fn5+fn5+fgoKRml4
ZXM6IGExMTY2YjI2NTNkYiAoImF0aDEwazogYWRkIENDTVAgUE4gcmVwbGF5IHByb3RlY3Rpb24g
Zm9yIGZyYWdtZW50ZWQgZnJhbWVzIGZvciBQQ0llIikKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZYW5nIFlpbmdsaWFuZyA8eWFuZ3lp
bmdsaWFuZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvbmV0L3dpcmVsZXNzL2F0aC9hdGgxMGsv
aHR0X3J4LmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jIGIvZHJpdmVycy9u
ZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRfcnguYwppbmRleCA3ZmZiNWQ1YjJhNzAuLmFkYmFl
YjY3ZWVkZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvYXRoL2F0aDEway9odHRf
cnguYworKysgYi9kcml2ZXJzL25ldC93aXJlbGVzcy9hdGgvYXRoMTBrL2h0dF9yeC5jCkBAIC0x
Nzg3LDcgKzE3ODcsNiBAQCBzdGF0aWMgYm9vbCBhdGgxMGtfaHR0X3J4X2hfZnJhZ19wbl9jaGVj
ayhzdHJ1Y3QgYXRoMTBrICphciwKIAlzdHJ1Y3QgYXRoMTBrX3BlZXIgKnBlZXI7CiAJdW5pb24g
aHR0X3J4X3BuX3QgKmxhc3RfcG4sIG5ld19wbiA9IHswfTsKIAlzdHJ1Y3QgaWVlZTgwMjExX2hk
ciAqaGRyOwotCWJvb2wgbW9yZV9mcmFnczsKIAl1OCB0aWQsIGZyYWdfbnVtYmVyOwogCXUzMiBz
ZXE7CiAKQEAgLTE4MDUsNyArMTgwNCw2IEBAIHN0YXRpYyBib29sIGF0aDEwa19odHRfcnhfaF9m
cmFnX3BuX2NoZWNrKHN0cnVjdCBhdGgxMGsgKmFyLAogCiAJbGFzdF9wbiA9ICZwZWVyLT5mcmFn
X3RpZHNfbGFzdF9wblt0aWRdOwogCW5ld19wbi5wbjQ4ID0gYXRoMTBrX2h0dF9yeF9oX2dldF9w
bihhciwgc2tiLCBvZmZzZXQsIGVuY3R5cGUpOwotCW1vcmVfZnJhZ3MgPSBpZWVlODAyMTFfaGFz
X21vcmVmcmFncyhoZHItPmZyYW1lX2NvbnRyb2wpOwogCWZyYWdfbnVtYmVyID0gbGUxNl90b19j
cHUoaGRyLT5zZXFfY3RybCkgJiBJRUVFODAyMTFfU0NUTF9GUkFHOwogCXNlcSA9IChfX2xlMTZf
dG9fY3B1KGhkci0+c2VxX2N0cmwpICYgSUVFRTgwMjExX1NDVExfU0VRKSA+PiA0OwogCi0tIAoy
LjI1LjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwph
dGgxMGsgbWFpbGluZyBsaXN0CmF0aDEwa0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0
cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vYXRoMTBrCg==
