Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A4ACC433DB
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:31:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 373DD22D08
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 18:31:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 373DD22D08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u6suY+1JRZc+cBZzDySizBseKi1BW1eceW16wlJnuxA=; b=oQNsFAJ/kCJ0fJNIF03ROZeri
	NVJMSdpuBQRIic/ySM+u8q9o70GyUhXKHG4eU/UuOgZCCn2GpVqKc+4Aiul/YYI2K7qup8YPbnAdQ
	eD46xjdOrH6ZAbWiArgQgB2ISR3vA8oLyHVXv8hPQD1SoYPxdzxIslxPj4g3PL8pNnmMp6rVb90XB
	H41X6K7L6W6GmhjlXvnMsCY7Sn+izbKZ1HDW9uwKnDadhB278KIJyhX+kw2mlCvkDNf7Pmw7CZT0/
	diaDS7IVD3GY99E/DconAsC9Jl0/ltQmLnEWGsymH3fWrZF/6vny2mgK94o1hpoQcC3iXbu/LAWdc
	vJ8VYNuNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krPxM-0004ln-FW; Mon, 21 Dec 2020 18:30:53 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krPxH-0004kM-DE
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 18:30:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608575449; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=ec7SeXQDHx25dWwhw+YXkYHSs9dEI998KBUYdGlQym8=;
 b=w/DU/APGAdC3XjpQvFX6TdwNVwPBzr7r/0NzofZDPKsZIQrkyMzS8mwD3TZoo04xvQ13e1Lf
 0Vjr8SUKlCfBzol1DZg0fkLTO5fBKcfEqik+sm0XH4OynOKx2wB4ANmyGmyCHxd5uX0yoDhV
 KBbJXxL9Ysxqgz7v69ygIIe2sjo=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fe0e9d2cfe5dd67db08e52a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 18:30:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 89939C433C6; Mon, 21 Dec 2020 18:30:42 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0ABF3C43462;
 Mon, 21 Dec 2020 18:30:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0ABF3C43462
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: Per-chain rssi should sum the secondary
 channels
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20191217183343.25585-1-greearb@candelatech.com>
References: <20191217183343.25585-1-greearb@candelatech.com>
To: greearb@candelatech.com
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201221183042.89939C433C6@smtp.codeaurora.org>
Date: Mon, 21 Dec 2020 18:30:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_133049_543800_34AEADFA 
X-CRM114-Status: GOOD (  11.98  )
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
Cc: Ben Greear <greearb@candelatech.com>, linux-wireless@vger.kernel.org,
 ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

greearb@candelatech.com wrote:

> From: Ben Greear <greearb@candelatech.com>
> 
> This makes per-chain RSSI be more consistent between HT20, HT40, HT80.
> Instead of doing precise log math for adding dbm, I did a rough estimate,
> it seems to work good enough.
> 
> Tested on ath10k-ct 9984 firmware.
> 
> Signed-off-by: Ben Greear <greearb@candelatech.com>

Commented out code etc so I assume this is an RFC. Has anyone tested
this with upstream firmware?

Patch set to RFC.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20191217183343.25585-1-greearb@candelatech.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
