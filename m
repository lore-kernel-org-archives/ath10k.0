Return-Path: <SRS0=+Z/7=LJ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77C1C49361
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 899B261603
	for <ath10k@archiver.kernel.org>; Tue, 15 Jun 2021 16:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 899B261603
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t2JVuPPS/b2qGo6zAk1otKGYe8EVEzrSh8LFjUZ+8fk=; b=SEuiJdWmIh0zkZ
	IdkcAU3gse4DMBLr5JaIMz01jA2Hks/0QBkzK3z2PCZCVfV2cCu+ylJdEl8TJf6cXr5ksqIwZXpDy
	vB4wyCHlPfvPx0URQQlPERYg/WEOdHe/G8bEREpWHO78g99T7HCPeKchZYw8tL+zf/sJcPWJOhUhM
	yVRgchAgb2fWCaMd/gwc6JS7owlpAEC6bXt8BBmiyGZHmlt333EAtrBlZmfC2vWMF2dEqUpEIaug6
	L5kW3uatAmS3ZKKjxK8A4sN6ZKPKA8RAqevSAY/7GUzi3vq6IaKF5/80vBS18i3insG8FgzriFxbx
	6kkT5iVWd3OzAO0WuEcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltBfz-001FzA-IV; Tue, 15 Jun 2021 16:12:31 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9gD-000R2G-Ot
 for ath10k@lists.infradead.org; Tue, 15 Jun 2021 14:04:41 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1623765880; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=IPC2L7Dcc2OzC+XpRNtoSBVEfo9Ysnw0qZQTrRJWwQ0=;
 b=xJvCu7d7QiKMmVTe4kh1cvqfVBDFzUqEX/FTp8JytMfFWOcjzwR7sBLVvZlt8+dDLiTSep5o
 fNso0Aae4/fQMITz+lpuemEeB+YiRX50LFu27veNCKDNlRi79l+hQu3zwbX+81VR3MQizLgt
 cJNQ32LoCtCceevVCXnxkDUYlww=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 60c8b350ed59bf69cc1b0a67 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 15 Jun 2021 14:04:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id D2D3BC433D3; Tue, 15 Jun 2021 14:04:00 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A8D49C433F1;
 Tue, 15 Jun 2021 14:03:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A8D49C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: remove the repeated declaration
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1622448459-50805-1-git-send-email-zhangshaokun@hisilicon.com>
References: <1622448459-50805-1-git-send-email-zhangshaokun@hisilicon.com>
To: Shaokun Zhang <zhangshaokun@hisilicon.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Shaokun Zhang <zhangshaokun@hisilicon.com>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20210615140400.D2D3BC433D3@smtp.codeaurora.org>
Date: Tue, 15 Jun 2021 14:04:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_070440_333087_3A529700 
X-CRM114-Status: UNSURE (   7.00  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shaokun Zhang <zhangshaokun@hisilicon.com> wrote:

> Functions 'ath10k_pci_free_pipes' and 'ath10k_wmi_alloc_skb'
> are declared twice in their header file, so remove the repeated
> declaration.
> 
> Cc: Kalle Valo <kvalo@codeaurora.org>
> Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

a8b1de7f4f68 ath10k: remove the repeated declaration

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1622448459-50805-1-git-send-email-zhangshaokun@hisilicon.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
