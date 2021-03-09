Return-Path: <SRS0=r5Bi=IH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 065E6C433E0
	for <ath10k@archiver.kernel.org>; Tue,  9 Mar 2021 10:50:26 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EC1364FB8
	for <ath10k@archiver.kernel.org>; Tue,  9 Mar 2021 10:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EC1364FB8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:Cc:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9e51JHbvo6368YsDATjgFu6OBN0ntFbywEmqfv6dx5E=; b=BYe4KEOqON/yO0ou3cKasVgxW
	C6YafGUzOORC6BSi45oSKebJo8KKHHesnWM1+qtJ4iD7lcQbNBUNFloRNNPsAm3Ih1fVmlOQh+DwL
	JDXHZ7pwsRZP/BekVkfE1hfcaJ56Q/e3ZL9pKzsEA7seL2+Ew1nQ+NGjQMiYqN/YJbEL71BynaSfy
	T4Ybjkfe3kAV9dz6ncbMLEvC9iG9iTmlrmzeuph6lCk2oOmwrZxM//cp5qYKUNX7xE+Bq+RfJtJqp
	pSJkXWZT7DT1E8S/8mcyAQrO/BGu1t5/XtqR2m+gn5BJvGWa6WXn7ENrVPEVNxBZwoN7Mw2Vpq6Ci
	obFfnN33g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJZwF-004ExT-Ib; Tue, 09 Mar 2021 10:50:07 +0000
Received: from m42-2.mailgun.net ([69.72.42.2])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJZw1-004Ewc-2l
 for ath10k@lists.infradead.org; Tue, 09 Mar 2021 10:50:04 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1615286993; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=262kPBkfPskEU7H8i6yK0y3xXTvs+et/XQylcPjZ9UU=;
 b=vMLxaGbrOJXvGP5dOnXM11tt7PeIoalJtJ6yEMBVxTXdlw3Dk0AWrqMcAtSKRT6gx+Y/ImFq
 cgeTdFADMkRJikFI9Ax6f49SnDsHwxkGZxCUECpw6dVg0ZlPrzEEKVpLimcPJ2wsLqxO4kOK
 3/9BXHoQfKKYh7cCmfWP5k89g/o=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 604752bf166f1a15f88dfcf5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 09 Mar 2021 10:49:35
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 099C3C43461; Tue,  9 Mar 2021 10:49:35 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id B3619C433CA;
 Tue,  9 Mar 2021 10:49:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B3619C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v3] ath10k: skip the wait for completion to recovery in
 shutdown path
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20210223142908.23374-1-youghand@codeaurora.org>
References: <20210223142908.23374-1-youghand@codeaurora.org>
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: ath10k@lists.infradead.org, ath10k-review.external@qti.qualcomm.com,
 davem@davemloft.net, kuba@kernel.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kuabhs@chromium.org,
 dianders@chromium.org, briannorris@chromium.org,
 Youghandhar Chintala <youghand@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210309104935.099C3C43461@smtp.codeaurora.org>
Date: Tue,  9 Mar 2021 10:49:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210309_105001_886456_41817F8A 
X-CRM114-Status: UNSURE (   8.98  )
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

Youghandhar Chintala <youghand@codeaurora.org> wrote:

> Currently in the shutdown callback we wait for recovery to complete
> before freeing up the resources. This results in additional two seconds
> delay during the shutdown and thereby increase the shutdown time.
> 
> As an attempt to take less time during shutdown, remove the wait for
> recovery completion in the shutdown callback and added an API to freeing
> the reosurces in which they were common for shutdown and removing
> the module.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.1-01040-QCAHLSWMTPLZ-1
> 
> Signed-off-by: Youghandhar Chintala <youghand@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

018e3fa8e7ff ath10k: skip the wait for completion to recovery in shutdown path

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20210223142908.23374-1-youghand@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
