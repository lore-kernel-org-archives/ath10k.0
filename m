Return-Path: <SRS0=X+kP=G7=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B195C433E0
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:19:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9E3D64DDB
	for <ath10k@archiver.kernel.org>; Thu, 28 Jan 2021 07:19:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A9E3D64DDB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Message-Id:To:References:In-Reply-To:From:
	Subject:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7egxRYMRo1pDVCrepRtEioIHgrEKW/UNy07yF2gyymA=; b=ztAEA9qM2Ots9sDbYaHrxtKPo
	gl+hFCSC8R7e23MCBSOAl5mT4d+4kh45s/lpS8toh4KxTOXNO5A4H8muqA9tp6mpU2Rck4QhLG6Km
	jZgyTM325WTiPhzAJj8fLzQA5IEs/RSRTB7q7MTz/g34uSZtLn7A9fnTITXRr9ruYOMFsxz1MTesx
	tADh0yBKZgIq02Fq2b2G73sFQ6sZr3oZgiLB3ARXhrhFi7buGjhg6dulojZSHJxSA+ZjyBa4EZwL0
	9m4exS+FSAiHu/NEd4+6LqIRD/EJ+p7YJ1LLbTqzsJmifFZ/n9PeykEm5XDh70sOek2rTL9Dwrobd
	CeFLSB7+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l51Zm-0007GI-9H; Thu, 28 Jan 2021 07:18:46 +0000
Received: from m42-8.mailgun.net ([69.72.42.8])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l51Zg-0007Fo-MY
 for ath10k@lists.infradead.org; Thu, 28 Jan 2021 07:18:44 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1611818319; h=Date: Message-Id: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=br0U6qOZfM/WO5fj2/vEmOrOoda1LXeAqowypE5hm90=;
 b=GsQBW/FmH+bVfKGI9xW6fih5AWwQ6isrhdBmPo+O0ttDo06MyLjcNnl4zdgSK7fXwlJ3OsY3
 d19ARMokdJu2IiJbQXoUprPhoFJ4RrHPUg2nDI4HWLNono9U/X2zpsSV4OjDfiYqn9GvENeL
 WRGy3C192ZxKXvJTEoON0u6jbR4=
X-Mailgun-Sending-Ip: 69.72.42.8
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6012654d91b605c2ed3bb4f7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 Jan 2021 07:18:37
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6FF47C433C6; Thu, 28 Jan 2021 07:18:37 +0000 (UTC)
Received: from potku.adurom.net (88-114-240-156.elisa-laajakaista.fi
 [88.114.240.156])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AE65AC433CA;
 Thu, 28 Jan 2021 07:18:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org AE65AC433CA
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
Message-Id: <20210128071837.6FF47C433C6@smtp.codeaurora.org>
Date: Thu, 28 Jan 2021 07:18:37 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210128_021840_862870_4A8460E7 
X-CRM114-Status: GOOD (  10.73  )
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

Patch applied to ath-next branch of ath.git, thanks.

442545ba5452 ath10k: allow dynamic SAR power limits via common API

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20201203103728.3034-4-cjhuang@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
