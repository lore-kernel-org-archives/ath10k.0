Return-Path: <SRS0=RJ8i=HQ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2BBC433DB
	for <ath10k@archiver.kernel.org>; Sun, 14 Feb 2021 06:08:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 10C3B64E26
	for <ath10k@archiver.kernel.org>; Sun, 14 Feb 2021 06:08:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 10C3B64E26
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:Date:References:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0GeOhqn0OR5wg1BiYKreqlSmTHrXlNmH+ReTeOoxPUs=; b=EyDPSCMmFx4w0FvioXfU/qKsa
	jMV3HkSezqnOL9J+/gxY8V214tkCe15QzSBteK0IXle90lh3onKKqu57KPq9Jt8WaIRor4eCcuAdc
	g47k1QKpFzyegKyGQXRVGwth8twclXmyCQPd1QcIFLKMODKieP+dMcfT6z+9UL8fG416ogg7aWTRp
	/drQddoBvlVMT1BD3sczeabuSkW06QldTCqCPKGjIEwNAG7j1L83sR82rqIWcOH30OqYem1ZKiKyT
	jKMYaqY/Yz0BQW/TR1qHkqvfL6WbUD8OIwe/+tpJI9yFdwjrdS+Xljc1qWMEo1Lpgu6nqJm8oEPCt
	08LlpgxKA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lBAaC-0007aa-75; Sun, 14 Feb 2021 06:08:36 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lBAa8-0007Zm-RD
 for ath10k@lists.infradead.org; Sun, 14 Feb 2021 06:08:34 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613282912; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=e3eec5zLeqEMGut+FCmYCRWQIFaz4ukcUuaM5KHUywY=;
 b=ZNxlRrJoZLGap4AcUwa8ncCvVChrDaLnOhaYxpdWlPx5Yvh0kDRn55P5zNZl4sUmgaN/CDz1
 B+a2JudggNjX4JmZdpa2Du1Q1wupqjMSW9L9Y1b/z+8G9bxkfBDv6sBfyYelx5TPSql5A7f6
 hd1psh3jUyhF5baG75/tPxMepQk=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6028be5ce3df861f4be13a92 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sun, 14 Feb 2021 06:08:28
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 5CD44C43462; Sun, 14 Feb 2021 06:08:27 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 28C69C433C6;
 Sun, 14 Feb 2021 06:08:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 28C69C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/2] ath10k: detect conf_mutex held ath10k_drain_tx() calls
References: <cover.1613171185.git.skhan@linuxfoundation.org>
 <0686097db95ae32ce6805e5163798d912b394f37.1613171185.git.skhan@linuxfoundation.org>
Date: Sun, 14 Feb 2021 08:08:21 +0200
In-Reply-To: <0686097db95ae32ce6805e5163798d912b394f37.1613171185.git.skhan@linuxfoundation.org>
 (Shuah Khan's message of "Fri, 12 Feb 2021 16:28:43 -0700")
Message-ID: <877dnbrxka.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/24.5 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210214_010833_024454_E10FC78D 
X-CRM114-Status: GOOD (  14.63  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Cc: peterz@infradead.org, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, mingo@redhat.com, kuba@kernel.org, will@kernel.org,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> writes:

> ath10k_drain_tx() must not be called with conf_mutex held as workers can
> use that also. Add call to lockdep_assert_not_held() on conf_mutex to
> detect if conf_mutex is held by the caller.
>
> The idea for this patch stemmed from coming across the comment block
> above the ath10k_drain_tx() while reviewing the conf_mutex holds during
> to debug the conf_mutex lock assert in ath10k_debug_fw_stats_request().
>
> Adding detection to assert on conf_mutex hold will help detect incorrect
> usages that could lead to locking problems when async worker routines try
> to call this routine.
>
> Link: https://lore.kernel.org/linux-wireless/871rdmu9z9.fsf@codeaurora.org/
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>

This can go via the same tree as patch 1:

Acked-by: Kalle Valo <kvalo@codeaurora.org>

But I can also take this to my ath tree, once patch 1 has reached it.
Just let me know what is preferred.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
