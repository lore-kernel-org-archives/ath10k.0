Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20EEBC433EF
	for <ath10k@archiver.kernel.org>; Thu, 20 Jan 2022 08:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:Subject:To:From:Date:MIME-Version:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=d1gvocLDO+93+xabS9aHrQMgByPERHTcS3UK/P/1Wz8=; b=bgQGf9U3rsWaEc
	XWEEj6RP0mF3MswfUxUJU59yg3mDfZ4Cpn9pJ3BIM0eo175x3FUbCcnizpluiLQOpG7zwIgL/fVBv
	BEB/cfXQkhkAzacwZS+I1FSVE2vs2HQRBAbCGJrRNmOKntXseiGnLEoXndR6QxCnX+qebhM6oUmgb
	ABcoLK0T/uxUwzutTQ9qB+b+bqP2He68lZCiSXCCsQOb3hp1Dbvua6NTmt4gvmOzBSx5rzIG1bbMk
	1sPJH9p+KPR4/8yXOvmx6ZTTqbX0iwNOef6lntEf45KeLurm0naQ0Qd6crdsEPdq8KkQCVIvAvGAs
	5VMKcYPynLSQpvtiXqDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nASbH-009g1T-6q; Thu, 20 Jan 2022 08:15:19 +0000
Received: from bute.mt.lv ([2a02:610:7501:2000::195] helo=plekste.mt.lv)
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nASbD-009ftV-DM
 for ath10k@lists.infradead.org; Thu, 20 Jan 2022 08:15:17 +0000
Received: from localhost ([127.0.0.1] helo=plekste.mt.lv)
 by plekste.mt.lv with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <martinspuk@mikrotik.com>)
 id 1nASaw-000242-EO
 for ath10k@lists.infradead.org; Thu, 20 Jan 2022 10:14:58 +0200
MIME-Version: 1.0
Date: Thu, 20 Jan 2022 10:14:58 +0200
From: martinspuk <martinspuk@mikrotik.com>
To: ath10k@lists.infradead.org
Subject: 802.11v BSS transition
Message-ID: <665285c71d1a8ba68c94f8b16a161998@mikrotik.com>
X-Sender: martinspuk@mikrotik.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_001515_667649_F81393BE 
X-CRM114-Status: UNSURE (   2.05  )
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

Hello.

I'm using OpenWrt 21.02.1 with Mikrotik hAP ac2 (IPQ4018 wifi chip) and 
see that BSS transiton support in extended capabilities of the beacon is 
marked as 0 (unsupported).
hostapd: nl80211: Driver-advertised extended capabilities (default) - 
hexdump(len=8): 04 00 00 00 00 00 00 40
Is there a way to enable it?

Regards,
Martins.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
