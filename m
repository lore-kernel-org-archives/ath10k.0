Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F7AC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 14:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gzvgoWR+vm2xJ3FQ8Ub5O06VLbxj1N2tgIKs4gw9EXw=; b=2XAliSwVdN6mPETmQVP7bQbkdT
	ScArvW0iE/GoDygivp6MeJnMtuyQ90JJDUmo4Jmkzx0Fgn+dzrTmfre86BwddDRUbBhWMqnNH8ukN
	MIinq6cDe3lOgw8X24G+HlXFBKpo5EJdNoRzJeR/m2eQ9HzPcfagJSuTq8FHsYBdpuE5tD6LK0+NJ
	SkheJmAlQalsDKDmqp20dTq1IkW/jdbwlUerL8Ui5MbK1uwV8/yKL5sahD0SY+b+uVJ33wZvDxZ/J
	yVNPmNKgB+LR4Qbue9xowqhuI7SEmGs7PNqm36CfBe0nMZAfBqOHfCNov7gk8stmxnXXEpZYCx4Ms
	aGZ4ZWmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPu2-00EygS-1M;
	Wed, 13 Dec 2023 14:07:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPtz-00Eyew-1S
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 14:07:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E051061D62;
	Wed, 13 Dec 2023 14:07:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10AB6C433C7;
	Wed, 13 Dec 2023 14:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702476474;
	bh=PtZFRJJcVJkbhbkx4iaToZjgrTCpYdlxKV2w0wYAKFY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=cCpBWg6wAMHZhp2GTVmk71fUi+eAKeC3mEGNiOXbDZTUO0+NgDlm/0V0LOlOWuVUG
	 Me8bupI3YqTpJ2jqzu1GPIpEW7sTxzBf5iZ+xscT7755AsCJkmOtIpfQeYijgn3Fe8
	 Gb33MZpX95YXFrEn+TYGEHra/0HipjNOkLB+J8DvbIWoPH0vGSoYciRqmMh5trDIdM
	 vgsne7XSdcyATivlDQGyKleVGZfOe7f8ei6OGjwX8hJ4mrDXkjPiUF5e7ozXjs5OPe
	 q9i3eVxZbjfzRJ15oLmGK9H7A6P/XHm899G+P6aqX/GvqHMGNOiJ8+8NwH9EE1A8tf
	 +QBgaJQuF8kpQ==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm
 SDM845 MTP platform
References: <CAA8EJpqcWHQ7ri8M8Whby96RSpB8GNpcq+H0R0b2KzUvtq_qzg@mail.gmail.com>
Date: Wed, 13 Dec 2023 16:07:51 +0200
In-Reply-To: <CAA8EJpqcWHQ7ri8M8Whby96RSpB8GNpcq+H0R0b2KzUvtq_qzg@mail.gmail.com>
	(Dmitry Baryshkov's message of "Thu, 7 Dec 2023 17:56:54 +0200")
Message-ID: <87zfyemc08.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_060755_577158_407EF8C9 
X-CRM114-Status: GOOD (  18.08  )
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

Thanks. The attachment filename was wrong so I added it manually, please
check:

https://github.com/kvalo/ath10k-firmware/commit/77c5345a8420d002de9ee6b7180d465f94535186

New:
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 27 in total


-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

