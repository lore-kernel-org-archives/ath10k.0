Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6CEAC4332F
	for <ath10k@archiver.kernel.org>; Wed, 13 Dec 2023 14:12:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZC2wQ4h4rIr8MyRqomwE1kesmwyZ6DE9/fbuVAEnKMg=; b=CF3C4GZgr2eZ6MIqd/E58YhpFp
	XvxWN2ZmdRwtAAPo6ee1vpE1rQhNFSdkisR0Fe+W9eTqkSel+J5m4EJATyNLbnYYrIG2a2u32CplI
	d3ns4ou/sIWh/OmXlmGhXlZR7wqNiVTZPNrJA5LAxrW4ql6ZII+eL8No83zr9wTNGTFwABMzmUdU5
	+Bzeys+6ukc7ujqViFAuqlaNOS0D22K4Ff6TPdCH4Pi4hgWxbfO6xXmiXEekNsf49UgmIHh8ecGb+
	3IgVk/HuhrKmMvuzkPo99+P6Q/YemlhuN6QcsvN6MmPTPHqmOpcrqY2Z4M7LG7aeSczjomYnZLkMZ
	Vuu0EkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPxy-00F08l-2F;
	Wed, 13 Dec 2023 14:12:02 +0000
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDPxv-00F07M-11
	for ath10k@lists.infradead.org;
	Wed, 13 Dec 2023 14:12:00 +0000
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-5e2f9e9a2e8so4024657b3.3
        for <ath10k@lists.infradead.org>; Wed, 13 Dec 2023 06:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702476715; x=1703081515; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZC2wQ4h4rIr8MyRqomwE1kesmwyZ6DE9/fbuVAEnKMg=;
        b=J+fljcdTvYIBMtU5sb0JnGNH5msxRrLrhApJHBRYvsF7uWV3zQJZsFKBL7aMk+UQZJ
         y+C+lWq4J39yL70AluYyRdz0auC1o8Dhk+kWG97Dw7d6o8SGp+Wb820mCHu5N4pQF7cE
         xXy8UHayBfqw4iVLa6woRE99vei5EymiQZKEe8yLEG2K4AuInxuSscDiVnsJVQ1L3mFS
         nKuw09WUQTdltk7hbGTLnIzfzAzxtSUWDG6ZHsCmcUgNFNAXeKYvwCXnoXQSSagawcUk
         WWg0d2LLGhg6kqA4fyESAHaKRVkMMtt4hUi36tOczAVnn3GbKr82P43NFdRiblyEYqnA
         pJjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702476715; x=1703081515;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZC2wQ4h4rIr8MyRqomwE1kesmwyZ6DE9/fbuVAEnKMg=;
        b=Aa3T8QXsMwtHZuvk8XzG2iy1gzENMFm9/JXRprzKxGPTwqY1MrwB9y+/776QrCmUHL
         3OEZEhSlaKY6Mx3mTrAS6aavS0THN4RC4z5YcjCxJcxs0vkCzj1oBljFDkKINy/5znOY
         FWRBuKHopGU5rdDmUrXikSkexZzIJRxkci+tw6OCogjjDVJX8stHQEnQ1wgouUnyJRTr
         +dtflMz8p9mSMV2oSGfH6SClENZqMQFRCFG+sQVvw05QM1igooGBpWgTtM5GX/PbVS03
         4OqTgtqJYuhpL2CvwomeEQDvDsHMQoNGEnG8QSNPQicCJntDUZoQEwKp3SeI97qpKd8M
         4O8A==
X-Gm-Message-State: AOJu0Yy7MKzqXX+fjaxdnF6KfPxHWrGL0St106/xYzhJ7XpJxnwXj0iD
	P/C4pQBSqGxrfnWVlfE6NCp+r0zKmaWn/vpqtKB5Rg==
X-Google-Smtp-Source: AGHT+IEStZahJbLAE9wiGrGVosTa2iy+JuDcsIDEI314IOcxMdF49R08VMvTSTOlqvlhGfpPawPs9FyV7a4jnsVmxt4=
X-Received: by 2002:a81:df0b:0:b0:5cd:fd7c:274f with SMTP id
 c11-20020a81df0b000000b005cdfd7c274fmr6877248ywn.26.1702476715591; Wed, 13
 Dec 2023 06:11:55 -0800 (PST)
MIME-Version: 1.0
References: <CAA8EJpqcWHQ7ri8M8Whby96RSpB8GNpcq+H0R0b2KzUvtq_qzg@mail.gmail.com>
 <87zfyemc08.fsf@kernel.org>
In-Reply-To: <87zfyemc08.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 13 Dec 2023 16:11:44 +0200
Message-ID: <CAA8EJpq6RFQU8+J834ZJus+C=nVwr8W-XJ3QcYC-ZM2f9NLPrQ@mail.gmail.com>
Subject: Re: ath10k-firmware: WCN3990: Add board file for the Qualcomm SDM845
 MTP platform
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_061159_357038_1E7B0A34 
X-CRM114-Status: GOOD (  19.37  )
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

On Wed, 13 Dec 2023 at 16:07, Kalle Valo <kvalo@kernel.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
>
> > We'd like to ask for inclusion of the board file for the Qualcomm
> > SDM845 MTP board. It is a hardware development kit manufactured by
> > Qualcomm, using the Snapdragon SDM845 SoC and a variant of wcn3990
> > BT/WiFi chip.
> >
> > Following the questions from the ath10k wiki page:
> >
> > * description for what hardware this is
> > - It is SDM845-based platform
> > - It uses wcn3990 chip as a WiFi and BT radio
> > - For the reference:
> >
> > ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001
> > board_id 0x3f soc_id 0x40030001
> > ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b
> > fw_build_timestamp 2018-07-19 12:28 fw_build_id
> > QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> > ath10k_snoc 18800000.wifi: failed to fetch board data for
> > bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
> > from ath10k/WCN3990/hw1.0/board-2.bin
> > ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
> > 0x00000000 sub 0000:0000
> > ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
> > ath10k_snoc 18800000.wifi: firmware ver  api 5 features
> > wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> > ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file
> > max-sta 32 raw 0 hwcrypto 1
> > ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> >
> > * origin of the board file
> >   - This file comes from the firmware package provided by Thundercomm for
> > the RB3 platform (also sdm845-based), cross-checked to be the same as
> > the file provided together with the sdm845-mtp board.
> >
> > * ids to be used with the board file
> >
> > bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
> >
> > Note, the device comes with the board_id not changed from 0xff.
> > Following the example of existing boards we are adding the
> > calibration variant.
> >
> > * md5sum of each new board file to add
> >
> > $ md5sum *
> > c1f5ff1660cf6dcd74bff7b41c9e693f
> > bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin
> >
> > $ sha256sum *
> > 8b250ac1bea81825cc6f4a70105dea89b0952340a9c77a8ab37e99cbfa63e53d
> > bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin
>
> Thanks. The attachment filename was wrong so I added it manually, please
> check:
>
> https://github.com/kvalo/ath10k-firmware/commit/77c5345a8420d002de9ee6b7180d465f94535186

Looks correct, thank you! Please excuse me, I completely forgot about
the file name.

>
> New:
> bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
>
> Changed:
>
>
> Deleted:
>
> 1 board image(s) added, 0 changed, 0 deleted, 27 in total


-- 
With best wishes
Dmitry

