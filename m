Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3216FC4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y391nlmoUrfwe6rKB9SrL1KudSNp5eBkDJMV9eiSgNQ=; b=w0AeXUIMdAz3QlAMX8mkEau626
	3tIb4Vv7lP4RjJktZxX3Nj1gnIdr2PM30i35eFnwhWt3Efy8sGCAZxiEw6B8NLEI+YVY5KIS6arEI
	D9XtymnGsoPe9lQLclvf9kHVXSfuHYQnIe7dUKTMLAx8HuvStzsZsBGnS9YmO/zdOlR7lc23ZCqnV
	DwZfpTZdV5YfAYyJ5QfBSg+UcQHDSG/RZzJ8s/NjbSJ17WWNJGZeR5hn2GtXyoByt6SgQtC33uVpM
	xcuom4SLWfhpb6VtRX7tayBad4MVM0zQC9JPc72BeEcof+8F/5ITy1VDFAKjmxEqxhz3lEVuT8HPi
	VPyeMBhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFqN-00D61o-2a;
	Thu, 07 Dec 2023 14:59:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFqL-00D61Q-0t
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:59:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 867B4620D0;
	Thu,  7 Dec 2023 14:59:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F75CC433C7;
	Thu,  7 Dec 2023 14:59:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701961152;
	bh=y6sbrC0UKWgFPnZhhuODfPQ13nP8OhJjDLMyQHLhdxU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=ZJSGJf5+qkZkZmvcigxY4/843aQv5gyy6SChop4yTEOEqVivwPEdAxxaXNmM/gEcL
	 X2IvBX2IFHYt/j9Vic1Rd98w0N8miYBRe0FBUgE5pIKSy6qQoA/POrNPZsr89wf34K
	 1WrO/wRVXm8hnaHV4yOzAaaqT9NdWO5cJu63DmqS9FuXr6+oNPgld6X7egeefmNq0w
	 3TDXfbFRF0ARYswuG5efYcMraS7J/qoSetvckdafTObDIzSa5PSLZExLarv9l/hohk
	 bnEeuXEDlsqKSPu2kbHv23NV9XkOI74xqOTvJy2DmTM1kond1uyYpSX5pOep9j06+E
	 J/Pwof4u5EGMg==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm
 SDM845 MTP platform
References: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
Date: Thu, 07 Dec 2023 16:59:09 +0200
In-Reply-To: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
	(Dmitry Baryshkov's message of "Mon, 28 Aug 2023 16:38:52 +0300")
Message-ID: <87wmtqm536.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065913_381439_BD1616FD 
X-CRM114-Status: GOOD (  18.35  )
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

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:

> We'd like to ask for inclusion of the board file for the Qualcomm
> SDM845 MTP board. It is a hardware development kit manufactured by
> Qualcomm, using the Snapdragon SDM845 SoC and a variant of wcn3990
> BT/WiFi chip.
>
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is SDM845-based platform
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference:
>
> ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001
> board_id 0x3f soc_id 0x40030001
> ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b
> fw_build_timestamp 2018-07-19 12:28 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> ath10k_snoc 18800000.wifi: failed to fetch board data for
> bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
> from ath10k/WCN3990/hw1.0/board-2.bin
> ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
> 0x00000000 sub 0000:0000
> ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc 18800000.wifi: firmware ver  api 5 features
> wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file
> max-sta 32 raw 0 hwcrypto 1
> ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
>
> * origin of the board file
>   - This file comes from the firmware package provided by Thundercomm for
> the RB3 platform (also sdm845-based), cross-checked to be the same as
> the file provided together with the sdm845-mtp board.
>
> * ids to be used with the board file
>
> bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
>
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of existing boards we are adding the
> calibration variant.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> c1f5ff1660cf6dcd74bff7b41c9e693f
> bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin
>
> $ sha256sum *
> 8b250ac1bea81825cc6f4a70105dea89b0952340a9c77a8ab37e99cbfa63e53d
> bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin

I don't see any attachments, forgot to attach to it? Please resend the
whole file.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

