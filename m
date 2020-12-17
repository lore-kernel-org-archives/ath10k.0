Return-Path: <SRS0=w3s1=FV=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61DF1C4361B
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 06:51:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0D3A623603
	for <ath10k@archiver.kernel.org>; Thu, 17 Dec 2020 06:51:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0D3A623603
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r6zYC3qnHcYhq2TfTquRtKDDce/MtglezsoFg1KupSc=; b=fHR8WUkzUJ+LqXzcpCMSpiqW4
	+9SagR64FKopHc8W5dImWbD3FczJTCltOav/9VECUq3mGu0gGnCjOK0aGEc76OHiCIo65wW+U8z4W
	miCrU0JBYn+VJd0ywq44GZbC1Z6KhuBTBjoMhlAs0ccjRTL12GTFUEK2zIMTOOYHbIe8bsP+2WvSa
	yPCQjRYmV3g7UsILlTwXnJmxJAczdg1ru0KwQDcabfRscFJ4m7v7kj/qVCiWNo0nn5FFoQdBkLyNp
	YVe3j0eolmOCvK0jn9+1ScTcnnE1mDenoZkxYwahcjISIp4RW+ss2/ecDkxzeg91UbJRx37FpKrWf
	iE5DgEsvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kpn7Y-0001wC-AZ; Thu, 17 Dec 2020 06:50:40 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kpn7T-0001vb-Kn
 for ath10k@lists.infradead.org; Thu, 17 Dec 2020 06:50:38 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608187837; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=Ww4v7MTHov39K9UP8xOZg3TU6Ab9s0FmA5nCrJFB4IA=;
 b=IMYTKfP35meqhXaP62XYHsD1lUJFgJ0BwQ8gQSoeakDwhdGlu1ufZSZbHtjqASvf1lvhDv+X
 of1APfRzjWreLe0h54kft/U+XOkgAXgRNZBOv4ji+40ToY3ORtkBXDPeyQSvOI4iyJ/td3ku
 JRSfOZZaSJeXdELeEfaKMud/Zog=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5fdaffacbfd08afb0ddb7944 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Dec 2020 06:50:20
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 7F580C43461; Thu, 17 Dec 2020 06:50:19 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D36C2C433CA;
 Thu, 17 Dec 2020 06:50:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D36C2C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Remove voltage regulator votes during wifi
 disable
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1607713230-18382-1-git-send-email-pillair@codeaurora.org>
References: <1607713230-18382-1-git-send-email-pillair@codeaurora.org>
To: Rakesh Pillai <pillair@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201217065019.7F580C43461@smtp.codeaurora.org>
Date: Thu, 17 Dec 2020 06:50:19 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201217_015037_151367_EFC335D8 
X-CRM114-Status: UNSURE (   9.27  )
X-CRM114-Notice: Please train this message.
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
Cc: kuabhs@chromium.org, youghand@codeaurora.org, briannorris@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, dianders@chromium.org,
 Rakesh Pillai <pillair@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Rakesh Pillai <pillair@codeaurora.org> wrote:

> When the wlan is disabled, i.e when all the interfaces are
> deleted, voltage regulator votes are not removed. This leads
> to more power consumption even when wlan is disabled.
> 
> Move the adding/removing of voltage regulator votes as part
> of hif power on/off in SNOC targets, so that these voltage
> regulator votes are there only when wlan is enabled.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

5f1aa93ffa1f ath10k: Remove voltage regulator votes during wifi disable

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1607713230-18382-1-git-send-email-pillair@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
