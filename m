Return-Path: <SRS0=rHb8=OG=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87B41C433EF
	for <ath10k@archiver.kernel.org>; Thu, 16 Sep 2021 12:41:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FBFF60F92
	for <ath10k@archiver.kernel.org>; Thu, 16 Sep 2021 12:41:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FBFF60F92
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=opgifv2UInbkaVpvO/GCCuTcvSYuiBd/384PIQA4PEI=; b=on/iTtFUaAcGAp
	+i9cqhrXbvPe8Jr1UJyuMmlNVXA/IydAtmyrEgg31lkGppgovg9SnigRpJuUaIdC4nRvh71Ec6hGN
	eloVQLFf6PqLDjb8ag3d3vBXtl/CKasrc/c6jPv2fjmrda3HfzpBK974Y/FcHpzpwfp4UfZODE1NA
	wHck3j8vplewSSesTnTnbBeYQiQ3xSjRbwOPzDBIKEBfhFu3y41FdWLSg8UgWiszdUL0MJIjcKriR
	O41DiuqxyGjys1GI0JxbevrjM/MW0p4CU/xyGH9yi++vqgys7xpSoWs8L7eQErxt7GnGMQ/e3ywsj
	fYkUOarHyyJClEX1l1cQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mQqhL-00B7zm-AD; Thu, 16 Sep 2021 12:41:03 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mQqg2-00B7Rv-Bf
 for ath10k@lists.infradead.org; Thu, 16 Sep 2021 12:39:51 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1631795988; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=FWlDZB+/GDVY45adt3uihbENulBfzrai+xdADQpKrz0=;
 b=Kpi5iX+o+1FOXgYGtjQ+qZ30+e6+BBriCU+r/mrBqWN1ckA/GM7HLZqV4Lprm5AympZbU0d6
 bScVqDK5zt6P1ZQW/eb7tvpdCbBOdV8pTgDj1QkjP+sRZ8uaekip7UVpN0HxtPaSr48iX8lA
 OUmm8BudqRguNq6vjpMZuIS5SLA=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 61433ae48b04ef8589fbf4b4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 16 Sep 2021 12:39:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 384A2C43616; Thu, 16 Sep 2021 12:39:00 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 8054DC4338F;
 Thu, 16 Sep 2021 12:38:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 8054DC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: Fabio Estevam <festevam@denx.de>, ath10k@lists.infradead.org,
 linux-wireless <linux-wireless@vger.kernel.org>,
 Christoph Hellwig <hch@lst.de>, erik.stromdahl@gmail.com,
 Peter Oh <peter.oh@eero.com>, Arend van Spriel <aspriel@gmail.com>,
 Marek Vasut <marex@denx.de>, alagusankar@silex-india.com
Subject: Re: [PATCH v3] ath10k: high latency fixes for beacon buffer
References: <20210818232627.2040121-1-festevam@denx.de>
 <CAOMZO5CJC0=iH4zzJGj0e82GexBN7suOehz8ajKK8bK3ZcMOSg@mail.gmail.com>
Date: Thu, 16 Sep 2021 15:38:52 +0300
In-Reply-To: <CAOMZO5CJC0=iH4zzJGj0e82GexBN7suOehz8ajKK8bK3ZcMOSg@mail.gmail.com>
 (Fabio Estevam's message of "Thu, 26 Aug 2021 09:01:27 -0300")
Message-ID: <871r5ozodf.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210916_053948_964411_CC4CED2C 
X-CRM114-Status: GOOD (  12.96  )
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

Fabio Estevam <festevam@gmail.com> writes:

> Hello Kalle,
>
> On Wed, Aug 18, 2021 at 8:27 PM Fabio Estevam <festevam@denx.de> wrote:
>>
>> From: Alagu Sankar <alagusankar@silex-india.com>
>>
>> Beacon buffer for high latency devices does not use DMA. other similar
>> buffer allocation methods in the driver have already been modified for
>> high latency path. Fix the beacon buffer allocation left out in the
>> earlier high latency changes.
>>
>> Signed-off-by: Alagu Sankar <alagusankar@silex-india.com>
>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>> [fabio: adapt it to use ar->bus_param.dev_type ]
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>> ---
>> Changes since v2:
>> - Pick Alagu's patch:
>> https://patchwork.kernel.org/project/ath10k/patch/20190417191503.18814-3-erik.stromdahl@gmail.com/
>
> A gentle ping on this one.

This is on my queue, it's just that the queue is quite long at the
moment.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
