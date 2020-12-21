Return-Path: <SRS0=1k1S=FZ=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E69DC433E0
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 17:24:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3699222B45
	for <ath10k@archiver.kernel.org>; Mon, 21 Dec 2020 17:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3699222B45
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ZfcFuc/LQqfEDGYPF005W7nxEeC0xRnrBI889xLmbMU=; b=Zd+yhsVJRjyie9pE13pkVg4yR
	Qys5M2g0gK+0v/E+G+x32GINday7LkE4WMNkreU8MZ1S8SjDXVIV+NgH59aRNbgP3nTHFJMRG5901
	NA9SY6JIcLLM4uImOqsODXrMXw94gzdpMDpCALiO74Lmu+ZHwgkdBCNEj5HZCIvXNXNmKkE9mCevp
	+6xBYWLUiAiVjQ33larMq4C7P31k90LJDBB/xviHfkS6Fm11Lth9b4WGjOgZRhPd1dZ/kl5ODuylx
	5NUlOKKnKUez8iZIUni4zN9mgXck2oXH9uVYjzveRQnS/B2RciyySZ9KaydXVNemyt9EqH6r2a3zM
	9RbLWeEFg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1krOtt-0007M8-CG; Mon, 21 Dec 2020 17:23:13 +0000
Received: from m43-15.mailgun.net ([69.72.43.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1krOtq-0007Lj-0Y
 for ath10k@lists.infradead.org; Mon, 21 Dec 2020 17:23:12 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1608571391; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=nRplA0GM+S1toO2K7L2GukZoxCvaEsFY25Lc8DWp+Sk=;
 b=InhjNwMRF1qkf2TM5ZUJ/qd6Kbt04eIO7/12UtNeV+2UIyz10y7SQUQlCQaE50DhCyxw1M42
 6HKD8n10B04RYuMsyGH0lTLtPYTMxo7KY0fUm4tpY/tsxkJW/uSgT2ungzT0LU9tUS1+SRCd
 9WHOTa845jIxyFfHmfUTO/sS/8Y=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5fe0d9f66d2f42c6667631d5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 21 Dec 2020 17:23:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 1A038C433ED; Mon, 21 Dec 2020 17:23:02 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id DF24BC433CA;
 Mon, 21 Dec 2020 17:22:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DF24BC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k:add support for multicast rate control
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <1523505886-14695-1-git-send-email-pradeepc@codeaurora.org>
References: <1523505886-14695-1-git-send-email-pradeepc@codeaurora.org>
To: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20201221172302.1A038C433ED@smtp.codeaurora.org>
Date: Mon, 21 Dec 2020 17:23:02 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201221_122311_563155_6BDD4F44 
X-CRM114-Status: UNSURE (   9.29  )
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
Cc: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Pradeep Kumar Chitrapu <pradeepc@codeaurora.org> wrote:

> Issues wmi command to firmware when multicast rate change is received
> with the new BSS_CHANGED_MCAST_RATE flag.
> 
> Signed-off-by: Pradeep Kumar Chitrapu <pradeepc@codeaurora.org>

(Cleaning up my backlog, this is from 2018.) I don't understand the
issue from commit log, please clarify and resend if this is still valid.

Patch set to Changes Requested.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/1523505886-14695-1-git-send-email-pradeepc@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
