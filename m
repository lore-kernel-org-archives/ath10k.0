Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABEDFC43219
	for <ath10k@archiver.kernel.org>; Thu, 17 Nov 2022 12:57:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37G31To9rkCil+Wvhln+K7HAFegUJc2uDoA4Nmsk4+Q=; b=nwjvq5ukpzL9Lb
	eArL56ox+L2US2lvbfFGq7SI453YpEe/Y/nio/mkr0f3MED1xFG5wEn4EdzzwgkbYzT9fIx+k0m1l
	MmtFdGJVijYsrhfai4uxz4xnOGrrLkKnTkNRBq9phPJXBAqsFcOi8ISxf8JuBi7+Z1/m9gwo0/jwK
	SaqupMTQzEW/GyyFTiXK8HeoOmb6NHpEVEaQyHvEwGy41Y4SI82kSXnmXvKUKCuIGMy1P1OaYZYRW
	PmINyMPXFZm7cRKpBJJW/rb0kiOMsPpHYJajTSldgfARrMdqd/1kZdiDBq8Y7XVlbA6tZDlcROn9L
	c6RW5BnEyBNpfmNH5Lhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveSC-00DzQu-1s; Thu, 17 Nov 2022 12:57:16 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oveS9-00DzPq-J3
	for ath10k@lists.infradead.org; Thu, 17 Nov 2022 12:57:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 4297FB81FFA;
	Thu, 17 Nov 2022 12:57:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE637C433D6;
	Thu, 17 Nov 2022 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668689831;
	bh=ZOv2xrVLw6KOC97u6Z3qAeavQOyOIGJMgx0UM0hKo/E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=sGOk610N3CduGTmOdPfuOT4PNjLz8I5lU6nN2aUENTa4ejgyLccsO3fLtFYjBRdpf
	 T2irFWVv7K6q4+bhEShd+i1QU3gpog6quSWq7XiHhS9WqcgQXCA/UuSaUIHLjHsKRQ
	 BR+CeJRqNkvGfPxPsXnXARlsIMFvoWtd/uqlxeg7EVuU017+GEeVK+m57IiGPRMqn0
	 XcwQtg5O69/i8A6mO4mianTfLiImbGmvTe+8B9LLGjJgVUlIMzkELU8WU8aVlGLLN7
	 ZtWbwOmN1b5y91nNEop79i3wu82uFjJSd/eYRXn2/wmG+0D+NOtqo01ZdjC9xb2Zgw
	 HUTp5YgmlG4ng==
MIME-Version: 1.0
Subject: Re: [PATCH RESEND v2] wifi: ath10k: Fix return value in
 ath10k_pci_init()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221110061926.18163-1-xiujianfeng@huawei.com>
References: <20221110061926.18163-1-xiujianfeng@huawei.com>
To: Xiu Jianfeng <xiujianfeng@huawei.com>
Cc: <davem@davemloft.net>, <edumazet@google.com>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <rmani@qti.qualcomm.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166868982720.22046.2839005153989061348.kvalo@kernel.org>
Date: Thu, 17 Nov 2022 12:57:08 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_045713_831778_987A808E 
X-CRM114-Status: GOOD (  10.35  )
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

Xiu Jianfeng <xiujianfeng@huawei.com> wrote:

> This driver is attempting to register to support two different buses.
> if either of these is successful then ath10k_pci_init() should return 0
> so that hardware attached to the successful bus can be probed and
> supported. only if both of these are unsuccessful should ath10k_pci_init()
> return an errno.
> 
> Fixes: 0b523ced9a3c ("ath10k: add basic skeleton to support ahb")
> Signed-off-by: Xiu Jianfeng <xiujianfeng@huawei.com>
> Reviewed-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

2af7749047d8 wifi: ath10k: Fix return value in ath10k_pci_init()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221110061926.18163-1-xiujianfeng@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
