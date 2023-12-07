Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6EBC4167B
	for <ath10k@archiver.kernel.org>; Thu,  7 Dec 2023 14:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YANcq6jL7UDJw9T4yp94MGPeD8628spT3GnT1iMtS8g=; b=ZOWc/6GiwdN8GbliC7oemGjMj2
	NZH11TSNoL1R3F46enhLFDdZWt+USSv5sTCDzCiDHWbYa/Ad0lYpX6UIz7CcYEbDq6q5RjtpTXM6Y
	yPo8vRsnH+27FT7kAPNxk519n/THMQ1yDadUUUboQp1ZeboSbUX6G7Uwda4ehY0cYXpsqW4AjALl2
	jYQdVPtJ0e10DhjPR7lo6TGYuo47M5Fm8pt4f6YYiVK7D1lLKz7mEXzOSXVeWzkK3iB7LStcOzte1
	iRyVXGvnX57zFIVdsNehbeKmCs68SJ+zP2C6xU8f1VKrvkGaIm4juGBvEUnvp+7oa4BL12cF0Wcvp
	aiza2UEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFkP-00D4tJ-2U;
	Thu, 07 Dec 2023 14:53:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBFkM-00D4sv-10
	for ath10k@lists.infradead.org;
	Thu, 07 Dec 2023 14:53:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BD37662003;
	Thu,  7 Dec 2023 14:53:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3766C433C7;
	Thu,  7 Dec 2023 14:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701960781;
	bh=LXSs+8RJL1znQ6oY9ZxWI0HONEsynqIj/M/NtbC+bsQ=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=AkJvStpkNbiCVcZG57zBkoP+C9BhLHF6WoB/YA22wpO11n9v0FeQOfAj89VAls3o0
	 oskhmfy1CubkTHkESeQF6u/GHinYDfE8JwlqLqVyx9aWYOgmTUGlX9/o461nh84qK4
	 y/9s+1y6NbhUw6dhXIqN0pQ4rNMdcj/ARrA2bC4D8jtwfXzc/vmJZK9md7Z3LDS+kZ
	 98Po47udv7sJLCkemxKHq2d95864AUf84mO2fv2TgEKEWVBoZ1EC4cITh7sHFr2z0a
	 UvKr3iSf+KmR6+m9LtuhQFhVYFgtI1rrdWy8hOiv2HGgsA27KhAPQ2PtIAqj6fAgRi
	 q7Giw7P1mtGcw==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: ath10k@lists.infradead.org,  "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <linux-arm-msm@vger.kernel.org>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm
 Robotics RB1 platform
References: <CAA8EJpoMoLTLz9UOFt4gwHcnyLVzBoUhAeRSs_Tkz=d3zzq_HA@mail.gmail.com>
Date: Thu, 07 Dec 2023 16:52:58 +0200
In-Reply-To: <CAA8EJpoMoLTLz9UOFt4gwHcnyLVzBoUhAeRSs_Tkz=d3zzq_HA@mail.gmail.com>
	(Dmitry Baryshkov's message of "Fri, 25 Aug 2023 00:50:03 +0300")
Message-ID: <87o7f2njxx.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_065302_413487_D019D07C 
X-CRM114-Status: GOOD (  15.25  )
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

> Hello Kalle,
>
> We'd like to ask for inclusion of the board file for the Qualcomm
> Robotics RB1 platform. It is
> an IOT platform manufactured by Thundercomm, using the Snapdragon QRB2210 SoC.
>
> Following the questions from the ath10k wiki page:
>
> * description for what hardware this is
> - It is an QRB2210-based platform (QRB2210)
> - It uses wcn3990 chip as a WiFi and BT radio
> - For the reference:
>
> ath10k_snoc c800000.wifi: qmi chip_id 0x120 chip_family 0x4007
> board_id 0xff soc_id 0x40670000
> ath10k_snoc c800000.wifi: qmi fw_version 0x337302d3 fw_build_timestamp
> 2023-01-06 01:50 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1
> ath10k_snoc c800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
> 0x00000000 sub 0000:0000
> ath10k_snoc c800000.wifi: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
> ath10k_snoc c800000.wifi: firmware ver  api 5 features
> wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> ath10k_snoc c800000.wifi: htt-ver 3.114 wmi-op 4 htt-op 3 cal file
> max-sta 32 raw 0 hwcrypto 1
>
> * origin of the board file
>   - It comes from the firmware package provided by Thundercomm for
> redistribution.
>
> * ids to be used with the board file
>
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1
>
> Note, the device comes with the board_id not changed from 0xff.
> Following the example of existing boards we are adding the
> calibration variant.
>
> * md5sum of each new board file to add
>
> $ md5sum *
> 5003239259d8cb68097a941dde86dcc7
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1.bin
>
> $ sha256sum *
> 0eeffb43040b216b0f3210b8db69e4558844dd9df52caf9c25f56a79401f442c
> bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1.bin

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=120,variant=Thundercomm_RB1

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 22 in total

https://github.com/kvalo/ath10k-firmware/commit/7d5e852d125d4ca3feba6a3fff9d04a0e488e584

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

