Return-Path: <SRS0=oQud=OO=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D428C433EF
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C229A61100
	for <ath10k@archiver.kernel.org>; Fri, 24 Sep 2021 15:18:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C229A61100
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c9i5j9nRfyAv0JQMV12MH1+OIkHeS42ntmVYBEoq74U=; b=Qau3Ic0112b472
	TzjkhuFGr+QS1SMPMO7XIkCnX5K4lLbAzpgDYhf1YDLhn6rOyC8Mj+Bmr1QebcLKX3zJqWFlMa7rK
	SCRNkcgBlvfCdBibJY5QssTfem+FlivmuX5Tn7Avt/OtXnBlRwCEz09A1LWRvoJSv3eGGS1bU8aNI
	NOyLh9KC1vFR5XiDSF761apUR+qwV72IviCRKBarhqK4X9bSDoSZlZ6TjcXBR+/apRsgK+AjC95D7
	na2t22/0AqxWkH3ZLqmZAoAbew2OB7DLGKmtsNLwWgmIlYIaPkPIjVtAmLLtFEa21aH5b0wNJLYK4
	RZVmRYGxIkSxiv6uY+BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mTmxq-00EwP9-MV; Fri, 24 Sep 2021 15:18:14 +0000
Received: from m43-7.mailgun.net ([69.72.43.7])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mTmxm-00EwOb-5l
 for ath10k@lists.infradead.org; Fri, 24 Sep 2021 15:18:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1632496691; h=Content-Type: MIME-Version: Message-ID:
 In-Reply-To: Date: References: Subject: Cc: To: From: Sender;
 bh=5qolC4jFcMwSFM7kapELzpfX73mIYRcPlbRNqrVXTXg=;
 b=fH4XUxQSBbeWhkpjO8KrfTf+SlS7Tx5Y+KTlHS0VwKQg4NxsuxBUEapwpVcld3LIuzBkiltW
 mX+Ep7xkHEHIIrWrQtXDmOqO1lrO2W94PppBZECMPNcxC1HYVz64FjTpfwAyAHC7LM63DGTu
 Gcdd2FlhT5imxjxgqdPxOncPY44=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 614dec25ec62f57c9a7ee445 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 24 Sep 2021 15:17:57
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 98B55C43616; Fri, 24 Sep 2021 15:17:56 +0000 (UTC)
Received: from tykki (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5DC86C4338F;
 Fri, 24 Sep 2021 15:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5DC86C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
From: Kalle Valo <kvalo@codeaurora.org>
To: Youghandhar Chintala <youghand@codeaurora.org>
Cc: Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhishek Kumar <kuabhs@chromium.org>, Steev Klimaszewski <steev@kali.org>,
 Matthias Kaehlcke <mka@chromium.org>, Rakesh Pillai <pillair@codeaurora.org>
Subject: Re: [PATCH v3] ath10k: Don't always treat modem stop events as crashes
References: <20210922233341.182624-1-swboyd@chromium.org>
 <98706efc03c88b54bfb44161566c8e4b@codeaurora.org>
Date: Fri, 24 Sep 2021 18:17:49 +0300
In-Reply-To: <98706efc03c88b54bfb44161566c8e4b@codeaurora.org> (Youghandhar
 Chintala's message of "Fri, 24 Sep 2021 18:13:48 +0530")
Message-ID: <871r5eroiq.fsf@codeaurora.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210924_081811_908574_3B7F3551 
X-CRM114-Status: GOOD (  10.74  )
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

Youghandhar Chintala <youghand@codeaurora.org> writes:

> I pulled the latest patch changes and tested them on SC7180. Which
> works as expected.
> Do not see this error message during reboot and can be seen while
> doing SSR.
>
> Tested-By: Youghandhar Chintala <youghand@codeaurora.org>

Thanks for testing. But this style of replies makes it hard to use
patchwork:

https://patchwork.kernel.org/project/linux-wireless/patch/20210922233341.182624-1-swboyd@chromium.org/

So please do not top post and always edit your quotes, thank you, Same
request also to Rakesh.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
