Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A8E2C4332F
	for <ath10k@archiver.kernel.org>; Fri, 25 Nov 2022 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PNSaYBrCaASwvcY+6vy29aUs6czc69GOu733JkprHf0=; b=verb+FrcUPPtPC
	xKOYQATES66GyzyTy/J0eelWShkYNE2Er0Ls37eoTdPzPYV5+N8jM2q6Ds2ZMil2F8K/pegCMWVR7
	gIj5LwtRqoU31xoHlcoyN2SSdAgazOTVZ/vkOib8WUoVqSdeSeDx04U7Wf7AJ8r8jg/tVw4ZxnO5S
	+tfpTgZZnqM/ya/5X8/a6TZE7x8QbC1zR+gI/6+4N/XfA8wGjwOagvZPTqd/0yFixs6oaGmfiieSn
	dsV8ruuK2y0NalCYD7DT4ZPmpTkEDsQDMqZNZdtBbdSg7Lf3OrMeRRXiaxDtduBYuli0BHsbV2mRT
	Sk5pl8jerzm2nWyAd8fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWdT-00FxRy-VK; Fri, 25 Nov 2022 11:12:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyWdD-00FxLH-GH
	for ath10k@lists.infradead.org; Fri, 25 Nov 2022 11:12:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0887B6238E;
	Fri, 25 Nov 2022 11:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79789C433C1;
	Fri, 25 Nov 2022 11:12:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669374750;
	bh=9m4EnFNBor1yYAqAkFO0UeDEFHKaL2TeZP/4Uo5mhNo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Bqj0rO5YaVmUQNQSLSZW1fAQS+Be7JfSGoa1HBPYViNzyB6kBt0w78mlgnBO05/S+
	 cdWrpDrLe1gzhgnzdKULCfSN1bRX9Xt07Ml2iAf8y3sT3SbdL59mV9Zt0MzxK3BwmK
	 oeIYX1jPLpg80Z4Kcm08Xs79OUrg29e4wbZtQEbOeB7+rsZu4JNI0D8j0LkQ8x5P3O
	 KOA0tQ1xLEGNvjynuALT6dVv4vx/QlnnG56/bWkmEYOi2L5IjzMQOkEoCvZJViPvBV
	 AkItiGpv+1Qha2KYEkr59ysMgt9n7kaVne93AmPFiCHWVL8Fy8/tn/dxSMd7NcW62u
	 kAXdfajM7SjMw==
MIME-Version: 1.0
Subject: Re: [PATCH v4] wifi: ath10k: Store WLAN firmware version in SMEM
 image
 table
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20221117180534.2267-1-quic_youghand@quicinc.com>
References: <20221117180534.2267-1-quic_youghand@quicinc.com>
To: Youghandhar Chintala <quic_youghand@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <quic_mpubbise@quicinc.com>,
 <rameshn@qti.qualcomm.com>, Youghandhar Chintala <quic_youghand@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166937474408.28196.4056251112151371854.kvalo@kernel.org>
Date: Fri, 25 Nov 2022 11:12:28 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221125_031231_615657_0B366E51 
X-CRM114-Status: GOOD (  12.39  )
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

Youghandhar Chintala <quic_youghand@quicinc.com> wrote:

> In a SoC based solution, it would be useful to know the versions of the
> various binary firmware blobs the system is running on. On a QCOM based
> SoC, this info can be obtained from socinfo debugfs infrastructure. For
> this to work, respective subsystem drivers have to export the firmware
> version information to an SMEM based version information table.
> 
> Having firmware version information at one place will help quickly
> figure out the firmware versions of various subsystems on the device
> instead of going through builds/logs in an event of a system crash.
> 
> Fill WLAN firmware version information in SMEM version table to be
> printed as part of socinfo debugfs infrastructure on a Qualcomm based
> SoC.
> 
> This change is applicable only for SNOC/QMI based targets.
> 
> Example:
> cat /sys/kernel/debug/qcom_socinfo/cnss/name
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> 
> Signed-off-by: Youghandhar Chintala <quic_youghand@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4d79f6f34bbb wifi: ath10k: Store WLAN firmware version in SMEM image table

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20221117180534.2267-1-quic_youghand@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
