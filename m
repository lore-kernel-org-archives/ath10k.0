Return-Path: <SRS0=IdeC=OZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE474C433EF
	for <ath10k@archiver.kernel.org>; Tue,  5 Oct 2021 19:44:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DB23610A5
	for <ath10k@archiver.kernel.org>; Tue,  5 Oct 2021 19:44:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DB23610A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=imserv.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	Subject:References:Cc:To:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BkF87iNYiQXE0AZGxtvEKKDiQGYTnNa1U4N/Tf3LQT0=; b=RfkXU9MRAUwkkTU2PZZowoiK+h
	NNMzIJKwxVfqvfHAIJ0/oDDh8ElWUFMC73tAjXGP6DILpQCcgRBSDUl8lX3Q0LqLZmIyiySWvKcSK
	XAuqhIFTirl6T9TXstIjHZF56wrXMSHXOxdDs+z1naYbArgq7jxNGv3/8hiBRDjeGlo3zsGtv8U0V
	v1jiXiVixevMoug3hECS5SCyDNFw5ssBFxcrZZWI0iSCZ0jXvMRSwyG82d7L8Mb8s2Shur43iURmX
	gpwuHyxcQc7Fa7nW4qgE3d2N6YJ+M5T7fUaafyQQoBXVTb06oYsQ3OjOKXThuU/4UejDDd498/1wS
	E57RWFpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXqLv-00BgSn-PI; Tue, 05 Oct 2021 19:43:51 +0000
Received: from mail.imserv.org ([46.232.251.232])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXqLd-00BgI6-7y
 for ath10k@lists.infradead.org; Tue, 05 Oct 2021 19:43:34 +0000
To: pali@kernel.org
Cc: ath10k@lists.infradead.org, bhelgaas@google.com,
 ilias.apalodimas@linaro.org, kabel@kernel.org, kvalo@codeaurora.org,
 kw@linux.com, linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-wireless@vger.kernel.org, robh@kernel.org,
 thomas.petazzoni@bootlin.com, toke@redhat.com, vtolkm@gmail.com
References: <20210505163357.16012-1-pali@kernel.org>
Subject: Re: [PATCH v3] PCI: Disallow retraining link for Atheros chips on
 non-Gen1 PCIe bridges
From: Jannis <jannis@imserv.org>
Message-ID: <924d9193-4277-d443-b4f4-d726bc7747de@imserv.org>
Date: Tue, 5 Oct 2021 21:43:21 +0200
MIME-Version: 1.0
In-Reply-To: <20210505163357.16012-1-pali@kernel.org>
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=jannis@imserv.org smtp.mailfrom=jannis@imserv.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_124333_484474_C7EF0798 
X-CRM114-Status: UNSURE (   3.01  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello!

Just tested this patch on the SolidRun Clearfog Pro with QCA988x based 
WLE600VX wifi card. Fixes the PCI issues, works with no directly visible 
side effects on (at least) kernel 5.10.y and 5.14.y.

Tested-by: Jannis Finkler <jannis@imserv.org>



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
