Return-Path: <SRS0=C/UJ=HN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 071CEC433DB
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 06:51:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A33B264E7A
	for <ath10k@archiver.kernel.org>; Thu, 11 Feb 2021 06:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A33B264E7A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=idwf/8Rz2umGtDgor3hLcG3BYh29mujMqKiB0Mw48Mo=; b=uv5igUcDYDUPMAJ8/rSUQm+Ab
	EMtKvYlNPocmilbdntFZBsiS1ojtMO17eFt6kTMm714om8JHYVKuZSNIhqiOyzgWHmmUWsbEDOilH
	d5C8XzOBSur4xw2KYU2kp5CkNXYFOGPe/4Rsv0Qjy9+S9oRYnT7gmgoiJDcIWHZRZ2dubd2Jl1Okc
	1n/Yx7KUQfQvmPQLTkyAewZfV5Q99rFOR3tOacUKr9mUtbMNOW0KXJGgyjrF9osoG46Wx+u5XVXFL
	hAeQORzoGVFq3GJeNuy9XmhuB7ZO+rhk7zVMD0MmI7bVbmtDYmY7ATaJMPwVLYaLMhaTJgWWjvDIQ
	dAMO59XOw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lA5og-0001lY-Vc; Thu, 11 Feb 2021 06:51:07 +0000
Received: from so15.mailgun.net ([198.61.254.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lA5oe-0001l9-62
 for ath10k@lists.infradead.org; Thu, 11 Feb 2021 06:51:05 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1613026264; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=2KpP5YTgEZT/MqWx9oBGC3EcB2HHt0YvagbBL1reDRU=;
 b=q0MYu82G1mEDEQu53wgcNu24Qy1i9bdSZn/GGUkxlMr6txrNpHQuCng5vjMBu2IkK+2/MR9o
 Yg3GrCn4y0BXfT6uG0MfXKQFBqFfolEVJbSW4vzj18Xv7xiiCLbGpWwQ/RJlFzvTFQyFwJUZ
 aasUySCaumdB5bC4Olea9LJxt3M=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 6024d3d3830f898bac43eb02 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 11 Feb 2021 06:50:59
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AD516C433C6; Thu, 11 Feb 2021 06:50:59 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E460C43461;
 Thu, 11 Feb 2021 06:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E460C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH 3/5] ath10k: change ath10k_offchan_tx_work() peer present
 msg to a warn
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <3b1f71272d56ee1d7f567fbce13bdb56cc06d342.1612915444.git.skhan@linuxfoundation.org>
References: <3b1f71272d56ee1d7f567fbce13bdb56cc06d342.1612915444.git.skhan@linuxfoundation.org>
To: Shuah Khan <skhan@linuxfoundation.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210211065059.AD516C433C6@smtp.codeaurora.org>
Date: Thu, 11 Feb 2021 06:50:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210211_015105_042911_E39759CE 
X-CRM114-Status: UNSURE (   8.11  )
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
Cc: netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 Shuah Khan <skhan@linuxfoundation.org>, kuba@kernel.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Shuah Khan <skhan@linuxfoundation.org> wrote:

> Based on the comment block in this function and the FIXME for this, peer
> being present for the offchannel tx is unlikely. Peer is deleted once tx
> is complete. Change peer present msg to a warn to detect this condition.
> 
> Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

83bae26532ca ath10k: change ath10k_offchan_tx_work() peer present msg to a warn

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/3b1f71272d56ee1d7f567fbce13bdb56cc06d342.1612915444.git.skhan@linuxfoundation.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
