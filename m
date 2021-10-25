Return-Path: <SRS0=tAHh=PN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC0D3C433F5
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 13:06:22 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD83B60F9D
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 13:06:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AD83B60F9D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=T4pec9MEkbptcJMa/1DnsyrwEG6ulPGeJrvD3/+VPLM=; b=WqI5IZzHSiFDyZ
	Mnpa7JDgog4r9G20Kmxb1Op4GM+prqtu4zJcNId/3rZcfv1ij8gbCXBTyYZkiS00esUS+lE01ZCl8
	hJvSU3aFfAR12UnFg4JGoqur0WLkvxU5xtdSooXV+M3JITcVThv+nViEKyriZ/uE1xdLB9MCGyxHa
	ZoTK2SWdCxFR/clCQkXA2jy0VgxqreiXkSti6M+hF0y4P/EqFVma+gHfUPLAOjmoDda4K8uADDKh6
	G6RNmCnKmXb581dpD1w98YNz7L3e4ORL95JIRtkpEl2/BK+NUFAhfWhG8dA013jA4aJ3x6bxJAmZE
	q0NB850dE6IV1TMLISvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mezfj-00GURk-Tm; Mon, 25 Oct 2021 13:05:51 +0000
Received: from so254-9.mailgun.net ([198.61.254.9])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mezff-00GUQc-7X
 for ath10k@lists.infradead.org; Mon, 25 Oct 2021 13:05:50 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1635167149; h=Date: Message-ID: Cc: To: References:
 In-Reply-To: From: Subject: Content-Transfer-Encoding: MIME-Version:
 Content-Type: Sender; bh=cFrFbEafI5CQo4iomubSKXzrac2Ie+M1Onq1o7cTjkw=;
 b=qFVhHoY+rM2bdjsRDy/j0nUgUdir91xjOLStdDMdwfrLa9J8vrySOo0wAjrGB/D+wvbjqBXD
 jXS1/OzFKsU2eflikhHrHKB/lIWr/B2bnT8LpqNEWHDlWGdcGn5w54yqyS6nwp+5ii4+ZiNg
 5mKPudhIh4PuWFqRgPfsAEM44JA=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJiZDQ3OSIsICJhdGgxMGtAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6176ab915baa84c77b630331 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 25 Oct 2021 13:05:21
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B796DC43616; Mon, 25 Oct 2021 13:05:20 +0000 (UTC)
Received: from tykki.adurom.net (tynnyri.adurom.net [51.15.11.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested) (Authenticated sender: kvalo)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5E2E7C4338F;
 Mon, 25 Oct 2021 13:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 5E2E7C4338F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=codeaurora.org
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: fix module load regression with iram-recovery
 feature
From: Kalle Valo <kvalo@codeaurora.org>
In-Reply-To: <20211020075054.23061-1-kvalo@codeaurora.org>
References: <20211020075054.23061-1-kvalo@codeaurora.org>
To: Kalle Valo <kvalo@codeaurora.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.0-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <163516711712.3976.13862181936420068312.kvalo@codeaurora.org>
Date: Mon, 25 Oct 2021 13:05:20 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_060549_440756_902076FA 
X-CRM114-Status: GOOD (  15.58  )
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

Kalle Valo <kvalo@codeaurora.org> wrote:

> Commit 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
> introduced a new firmware feature flag ATH10K_FW_FEATURE_IRAM_RECOVERY. But
> this caused ath10k_pci module load to fail if ATH10K_FW_CRASH_DUMP_RAM_DATA bit
> was not enabled in the ath10k coredump_mask module parameter:
> 
> [ 2209.328190] ath10k_pci 0000:02:00.0: qca9984/qca9994 hw1.0 target 0x01000000 chip_id 0x00000000 sub 168c:cafe
> [ 2209.434414] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
> [ 2209.547191] ath10k_pci 0000:02:00.0: firmware ver 10.4-3.9.0.2-00099 api 5 features no-p2p,mfp,peer-flow-ctrl,btcoex-param,allows-mesh-bcast,no-ps,peer-fixed-rate,iram-recovery crc32 cbade90a
> [ 2210.896485] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id 0:1 crc32 a040efc2
> [ 2213.603339] ath10k_pci 0000:02:00.0: failed to copy target iram contents: -12
> [ 2213.839027] ath10k_pci 0000:02:00.0: could not init core (-12)
> [ 2213.933910] ath10k_pci 0000:02:00.0: could not probe fw (-12)
> 
> And by default coredump_mask does not have ATH10K_FW_CRASH_DUMP_RAM_DATA
> enabled so anyone using a firmware with iram-recovery feature would fail. To my
> knowledge only QCA9984 firmwares starting from release 10.4-3.9.0.2-00099
> enabled the feature.
> 
> The reason for regression was that ath10k_core_copy_target_iram() used
> ath10k_coredump_get_mem_layout() to get the memory layout, but when
> ATH10K_FW_CRASH_DUMP_RAM_DATA was disabled it would get just NULL and bail out
> with an error.
> 
> While looking at all this I noticed another bug: if CONFIG_DEV_COREDUMP is
> disabled but the firmware has iram-recovery enabled the module load fails with
> similar error messages. I fixed that by returning 0 from
> ath10k_core_copy_target_iram() when _ath10k_coredump_get_mem_layout() returns
> NULL.
> 
> Tested-on: QCA9984 hw2.0 PCI 10.4-3.9.0.2-00139
> 
> Fixes: 9af7c32ceca8 ("ath10k: add target IRAM recovery feature support")
> Signed-off-by: Abinaya Kalaiselvan <akalaise@codeaurora.org>
> Signed-off-by: Jouni Malinen <jouni@codeaurora.org>
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>

Patch applied to ath-next branch of ath.git, thanks.

6f8c8bf4c7c9 ath10k: fix module load regression with iram-recovery feature

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20211020075054.23061-1-kvalo@codeaurora.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
