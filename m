Return-Path: <SRS0=gRR+=G6=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5E78C433DB
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:53:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 506E620724
	for <ath10k@archiver.kernel.org>; Wed, 27 Jan 2021 10:53:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 506E620724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TWvcSgyaKqi9kGmAME2sKbs/qrNqhP/GrqAdepNle9Y=; b=fKvKR8RRPh1+30fT3+z0tH7uU
	6B6dXa4rH6/vBuKt/JYW0LD5WPqP9r+kC4ekOF1ZSo1tDdiOHZ7++PQnO7+bhsSAh9XXbvIjwmESF
	mZj62UWRCaZIiRP0Pqty/ACXs9EQjT3Lq/BkzGZug+i5K/Ew3BToiYxDvD6VIsXXACL+W46lVD3cf
	3dBtr7xyKowY+zTgDPPPlasYMclqHAsH6pRYsacyiK+zM2cuesI6BnchCd8DdKMfiGhqI+JCWZe13
	E9H8pRevhZF7kga7Nynz9qx5f/J/ALw04CPW2biHnR/iJ/stynGYJgJKRfFZDBYP6ePRaf7ReGCjG
	Y09xYmF7A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l4iSD-0002Sd-EX; Wed, 27 Jan 2021 10:53:41 +0000
Received: from a1.mail.mailgun.net ([198.61.254.60])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l4iS9-0002Rg-Ox
 for ath10k@lists.infradead.org; Wed, 27 Jan 2021 10:53:39 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611744813; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=SheNhVtT9eDL5luFgog3R/47oD2k+j9pqHrgMva/o9Y=;
 b=q1WaeOSrDyHTeVOReCPMD8Jba0X2WHPHDhu3UxKCjvqIehzw75VuN/8REctGaWEP/BD7rkgl
 gXHFliJ3nOxW3F6cSxXMD5ZaqNh8z9oETFn2RhP2dqsjIP3YzQgW5+QnQ3j0BY6ZgAmqQwCS
 EihO6NhYVZrSeuTMt6FFAtzAXgg=
X-Mailgun-Sending-Ip: 198.61.254.60
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 601146276287154b87f41423 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 Jan 2021 10:53:27
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 2128EC43461; Wed, 27 Jan 2021 10:53:27 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 69528C433CA;
 Wed, 27 Jan 2021 10:53:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 69528C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kvalo@codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v4 3/3] ath10k: allow dynamic SAR power limits via common
 API
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20201203103728.3034-4-cjhuang@codeaurora.org>
References: <20201203103728.3034-4-cjhuang@codeaurora.org>
To: Carl Huang <cjhuang@codeaurora.org>
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.5.2
Message-Id: <20210127105327.2128EC43461@smtp.codeaurora.org>
Date: Wed, 27 Jan 2021 10:53:27 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210127_055337_864224_473B64B2 
X-CRM114-Status: GOOD (  11.11  )
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
Cc: briannorris@chromium.org, linux-wireless@vger.kernel.org,
 dianders@chromium.org, ath10k@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Carl Huang <cjhuang@codeaurora.org> wrote:

> ath10k assigns ath10k_mac_set_sar_specs to ath10k_ops, and
> this function is called when user space application calls
> NL80211_CMD_SET_SAR_SPECS. ath10k also registers SAR type,
> and supported frequency ranges to wiphy so user space can
> query SAR capabilities.
> 
> This SAR power limitation is compared to regulatory txpower
> and selects the minimal one to set when station is connected.
> Otherwise, it delays until the station is connected. If the
> station is disconnected, it returns to regulatory txpower.
> 
> This feature is controlled by hw parameter: dynamic_sar_support.
> 
> Tested-on: QCA6174 hw3.2 PCI WLAN.RM.4.4.1-00110-QCARMSWP-1
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> Reviewed-by: Brian Norris <briannorris@chromium.org>
> Reviewed-by: Abhishek Kumar <kuabhs@chromium.org>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

In the pending branch removed test for !sar->sub_specs based on Dan's report.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201203103728.3034-4-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
