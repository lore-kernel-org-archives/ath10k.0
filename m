Return-Path: <SRS0=B0Fa=PI=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A070AC433FE
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7340E6115B
	for <ath10k@archiver.kernel.org>; Wed, 20 Oct 2021 08:07:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7340E6115B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2fjZRt6vm0dIGYDQumtpKbv7l4jxB7q8jY9SEGZqD9k=; b=nJpNq33Sx++xzq
	ksbUy7Nzu6ORFgmZeabEUtPjRpv49SN6rNKlVN5evQd97qGh32nfEOMf3A0puMuWVLiV5UUFOrVuX
	uFr0g2IJnMFpyZro2yNaZTeSwLMnC7Q+vmaq5M2wkkRXoWFHuUtFg/0DH9Zq3FOwr2y0e89I2eMPa
	mLBoMO/dWfH/ugO+c1qjew9JoAwOhtf6+fsEXSqOYMF5KzpOCJdkNJQ1NEwFBrdfHyuT6OjZBHABR
	1V4ZduahpO8GQIBjsU+i/10FyRt2SUWoWDQHZgQBq6/1pE4vqvG9QG+u8AqQw9Y9ZuMYjSm5NfS8+
	z7aG8nfyrK4RlTHpLusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1md6Ru-003l2l-L3; Wed, 20 Oct 2021 07:55:46 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1md6Rr-003kgS-H2
 for ath10k@lists.infradead.org; Wed, 20 Oct 2021 07:55:45 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634716543; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=sgSU08pE4MwHf7VppFAfRQn6yCyfZVk166EZfeEC2zY=;
 b=f5oaGN0cY/DQvdYltZ+oWkuTR1Ehq9vWUBcD4izL0jXZedwSJgiLCygzj3eefNbkGpZ+ewzl
 a5zg0DBIYGwuNWOJ+UDPTyk9oqcfdGOpEuxpGBFSPpskn00rOS/9XN8wTv2sEwvuialgu1Rx
 FK3iSFznh+tcVHmFsS4+RoHs57s=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 616fcb7f5ca800b6c104bb41 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 20 Oct 2021 07:55:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id F3E09C4360C; Wed, 20 Oct 2021 07:55:42 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 43219C4338F;
 Wed, 20 Oct 2021 07:55:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 43219C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: Fix device boot error
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210913175048.192812-1-jouni@codeaurora.org>
References: <20210913175048.192812-1-jouni@codeaurora.org>
To: Jouni Malinen <jouni@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Abinaya Kalaiselvan <akalaise@codeaurora.org>,
 Jouni Malinen <jouni@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163471653903.23156.15370975982440752540.kvalo@codeaurora.org>
Date: Wed, 20 Oct 2021 07:55:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_005543_702271_977D01FE 
X-CRM114-Status: UNSURE (   8.78  )
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

Jouni Malinen <jouni@codeaurora.org> wrote:

> From: Abinaya Kalaiselvan <akalaise@codeaurora.org>
> 
> mask value ATH10K_FW_CRASH_DUMP_RAM_DATA is not mandatory to get iram
> mem layout. So introduced ath10k_coredump_get_hw_mem_layout to copy
> hardware memory layout.
> 
> This fixes the below boot error:
> [   17.468882] ath10k_pci 0000:06:00.0: failed to copy target iram contents: -12
> [   17.513925] ath10k_pci 0000:06:00.0: could not init core (-12)
> [   17.517635] ath10k_pci 0000:06:00.0: could not probe fw (-12)
> 
> Tested-on: QCA9984 X86 10.4-3.9.0.2-00139
> 
> Fixes: 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
> Signed-off-by: Abinaya Kalaiselvan <akalaise@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Reported-by: kernel test robot <lkp@intel.com>

The patch had multiple issues so I sent v2:

https://patchwork.kernel.org/project/linux-wireless/patch/20211020075054.23061-1-kvalo@codeaurora.org/

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210913175048.192812-1-jouni@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
