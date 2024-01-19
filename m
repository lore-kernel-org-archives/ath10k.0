Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 106CDC4725D
	for <ath10k@archiver.kernel.org>; Fri, 19 Jan 2024 17:43:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WCl/xszbOO1jhRdppwpv6KUZfnbA9ts5eu5zCfGCetc=; b=eSFEr/1M+mhPMDE8NlhlwTKRuP
	7TxLu9X8M5V7t/LcXZtIwO6SDHzSVQJr6x1RZkqPSvbFytkN55CBug4pU0mtkSVIzc4dsZUlHgt9V
	psEJ9RhstQCT+BEWMrAD+O4KuiHCCvU6ku7pQAQGzUeTRC6+FKm3Rmms5g/a//g6/xYYspYodBV9x
	ZSMukOLjaJ9ZKIWDJSzaFXlHAVE5QNVvLSJDlGDd07gu+E9Y8uFD24Sl/KVVIDwdBj88eNfM9wmop
	3Jhh655g/sBMWOMZP0qC0RavdQo4gB1cjhjx9tQHUAR9yALQDvE5Pu0IXliL80Mc/DwxsgePvv8W2
	2Ftw40Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsu3-006IKo-3B;
	Fri, 19 Jan 2024 17:43:39 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsu1-006IKS-1p
	for ath10k@lists.infradead.org;
	Fri, 19 Jan 2024 17:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C10EDCE22C1;
	Fri, 19 Jan 2024 17:43:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5BBAC433C7;
	Fri, 19 Jan 2024 17:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705686215;
	bh=8eib39R3f1kc8kZCT64S7x3ik4cRTqlb2P5ftC04SY0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fLQGOxdf0pd1ILAovZrADoSukz1u0fMOgHcOvR2D0IaQZB/vsFSZGuX6sc2WVA618
	 iFkFWomAN8lfPQgG2QpQzPUYqU1L4Bp75diIbL46zygESfJX+iSKqe5F19dwvlH8I/
	 TvMddAMfwC5IaA+gHyro/WPhYpb6krnppGISim+IzMnVVKVNQ5M3Qc6HOLhjUn1noX
	 p3y35GfQFKlfzuVC9ycXRuYe6cYLw/WQmgvsrhH/YTRtfLwEgnjgx5vPO8WA9E+qpO
	 VsGXYpVSo2UcohIg8uiTaOzIJMlbkQQHXOj/BSpuMKxsd8PV33/XD4anmR/soCp1t1
	 O9sXKSzEO7tYQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/5] wifi: ath10k: add missing wmi_10_4_feature_mask
 documentation
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240118-ath10k-kerneldoc-v1-1-99c7e8d95aad@quicinc.com>
References: <20240118-ath10k-kerneldoc-v1-1-99c7e8d95aad@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170568621204.3238594.1557348320781318513.kvalo@kernel.org>
Date: Fri, 19 Jan 2024 17:43:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_094337_799788_873235BE 
X-CRM114-Status: UNSURE (   6.38  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently kernel-doc reports the following issues:
> drivers/net/wireless/ath/ath10k/wmi.h:3033: warning: Enum value 'WMI_10_4_EXT_PEER_TID_CONFIGS_SUPPORT' not described in enum 'wmi_10_4_feature_mask'
> drivers/net/wireless/ath/ath10k/wmi.h:3033: warning: Enum value 'WMI_10_4_REPORT_AIRTIME' not described in enum 'wmi_10_4_feature_mask'
> 
> Update the kernel-doc for enum wmi_10_4_feature_mask to add the
> missing documentation.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

5 patches applied to ath-next branch of ath.git, thanks.

1779487e72e0 wifi: ath10k: add missing wmi_10_4_feature_mask documentation
5f813b0447fe wifi: ath10k: correctly document enum wmi_tlv_tx_pause_id
75dd17fdef11 wifi: ath10k: fix htt_q_state_conf & htt_q_state kernel-doc
c80cc5cfefba wifi: ath10k: Fix htt_data_tx_completion kernel-doc warning
f020c3029932 wifi: ath10k: Fix enum ath10k_fw_crash_dump_type kernel-doc

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240118-ath10k-kerneldoc-v1-1-99c7e8d95aad@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


