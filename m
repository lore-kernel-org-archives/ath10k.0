Return-Path: <SRS0=IdeC=OZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD541C433F5
	for <ath10k@archiver.kernel.org>; Tue,  5 Oct 2021 14:27:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95D7A61154
	for <ath10k@archiver.kernel.org>; Tue,  5 Oct 2021 14:27:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95D7A61154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7xDxF1cLf6+U/IWhUBXCPDMPYX+kDRKJNjNL6NMrLDY=; b=1XepJ/xKudWWus
	Bo3fKZxscp8I5E9FWqdaxvFZMfndTDuOneEQ2QuJ0aCIMq+VFU+/+IPlvlBtIp/GgwHqh880SAyFS
	7RApsMYkXaMQSaDjydH+Lq/gC6MfXPL+v9cW/7UWmj4seepw4/Pc+UvgErc+gHh0teGhzyoKGKSiA
	pMvbPH3FzGyY5MSyhkLJOSRTt992rfNQgy42a5LPT1ItibP131wJYRovzq0n643e5WCo47rGgr5cP
	Cyha6YPeOojT06etwK8I+f9QME06Niriqt0nOcjK65zxFQiAhIlzvqYaZhpPWiN3gLU17QwkZkgYe
	yqVHNr9pO2DUVM1wtThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mXlPE-00ArH9-HF; Tue, 05 Oct 2021 14:26:56 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mXlPC-00ArG8-3Q
 for ath10k@lists.infradead.org; Tue, 05 Oct 2021 14:26:55 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1633444013; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=7qAebyYS3/yHi3zj4WopwoEdiogpKvoME2WoVInf0ek=;
 b=g7Ya8ngsK0BU8RvGq6rOt9bH1wrqdXCpDinreTlmM5kcu3gaV1bcDNxMQmnZ3lrR4xStwYF5
 K7ItUjyZLIi/W090veC1xSzyli08Oc0Bjx4xy+u4rInFhzm+6HI0M9aHFfaxURkY7wr9AHEn
 y8HUrN00Psc5eCvi5jfV/kkH1x8=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 615c60ac003e680efbb0ec52 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 05 Oct 2021 14:26:52
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id ACB47C43460; Tue,  5 Oct 2021 14:26:51 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A853CC4338F;
 Tue,  5 Oct 2021 14:26:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org A853CC4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: Don't always treat modem stop events as crashes
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210922233341.182624-1-swboyd@chromium.org>
References: <20210922233341.182624-1-swboyd@chromium.org>
To: Stephen Boyd <swboyd@chromium.org>
Cc: linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-arm-msm@vger.kernel.org,
 Youghandhar Chintala <youghand@codeaurora.org>,
 Abhishek Kumar <kuabhs@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Matthias Kaehlcke <mka@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-Id: <20211005142651.ACB47C43460@smtp.codeaurora.org>
Date: Tue,  5 Oct 2021 14:26:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211005_072654_267033_4DDD9D6E 
X-CRM114-Status: GOOD (  11.55  )
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

Stephen Boyd <swboyd@chromium.org> wrote:

> When rebooting on sc7180 Trogdor devices I see the following crash from
> the wifi driver.
> 
>  ath10k_snoc 18800000.wifi: firmware crashed! (guid 83493570-29a2-4e98-a83e-70048c47669c)
> 
> This is because a modem stop event looks just like a firmware crash to
> the driver, the qmi connection is closed in both cases. Use the qcom ssr
> notifier block to stop treating the qmi connection close event as a
> firmware crash signal when the modem hasn't actually crashed. See
> ath10k_qmi_event_server_exit() for more details.
> 
> This silences the crash message seen during every reboot.
> 
> Fixes: 3f14b73c3843 ("ath10k: Enable MSA region dump support for WCN3990")
> Cc: Youghandhar Chintala <youghand@codeaurora.org>
> Cc: Abhishek Kumar <kuabhs@chromium.org>
> Cc: Steev Klimaszewski <steev@kali.org>
> Cc: Matthias Kaehlcke <mka@chromium.org>
> Cc: Rakesh Pillai <pillair@codeaurora.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Reviewed-by: Rakesh Pillai <pillair@codeaurora.org>
> Tested-By: Youghandhar Chintala <youghand@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

747ff7d3d742 ath10k: Don't always treat modem stop events as crashes

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210922233341.182624-1-swboyd@chromium.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
