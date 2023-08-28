Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4222C71153
	for <ath10k@archiver.kernel.org>; Mon, 28 Aug 2023 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=Q1Eq1wNOVJwNNMmTgkp6YoksG9MNDEvnsFcUP/1jBYI=; b=SMo
	iQ5suIi2CaGgjS+goQJmdC4N+mSHN4FWPDgraHW2RnL5Vo8jNnwTmKD5fSSBEqtm8nbXk1FokLjG2
	675yGy4PYs0qn4pGdiLM4r16QFe+qpQhEn/VLT58kcz4Ce19C2brQmsoI0E6s370gtKaXr03tbE9W
	mZPfW3KjRhSMzofZD/6EqFEIetOrWzrQQrDO7/eewcxx97ov1LUrsqVtQNuNAABkzhqAGjEGWbpl0
	ae5jBMnA2KtqKL8pHtcBoJYNKy1zyrojZLDiA5IJ4u4fkM7cy4iyCWqENX0SLN0bsEzoKITk3JkxF
	a9FLDhdDebM+tFk5tmTlBfUXHOo67nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qacST-009eMp-0H;
	Mon, 28 Aug 2023 13:39:09 +0000
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qacSP-009eM1-0x
	for ath10k@lists.infradead.org;
	Mon, 28 Aug 2023 13:39:06 +0000
Received: by mail-yb1-xb2a.google.com with SMTP id 3f1490d57ef6-d746ea563f9so3071334276.1
        for <ath10k@lists.infradead.org>; Mon, 28 Aug 2023 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693229943; x=1693834743;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pio6VoOm/5lpUbXzpkLDCulsDT3sYv4Dh7mQt0x57W8=;
        b=A3T23trTU/csXttC9AWpmWnSFJQTiD6RwJSakxXH+VW0ZEkV5S546tO0Ho0iWKzgEn
         5gZnUxrBeFtapp1leDnMHRJVH+BgcViVN3vugk9eKJbNZXoUAG9bSEo2nwl/tscDkJR+
         shy2elGHulln2vkU6G1IjRMdxAPwnAqFmq5rO9m50F6ubMge5TWwULdJZABQLJIL1Sdv
         T1UhdEg/QtW+68ZEnpnonEOBao6wrIEtDXY9R1IAUyY+3aDRWjkf3+6r3ghypXCbnDfT
         IwXX3/ED0ylWpLfMF5mI0cfwq45+19rmZIMLuQXF3XD7Pq+SOlFhnOJl3AulW4hzFS/f
         H5uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693229943; x=1693834743;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pio6VoOm/5lpUbXzpkLDCulsDT3sYv4Dh7mQt0x57W8=;
        b=kXv2mzE+LbaVAp142jMO8RyDBcS7iWVR0N/nf6tdaJclwgYe3PStCtrb24tAG8TpFc
         6oo17eRoBTRqOAWNILrLs3nt7fwDGB8UREXx9fDIQXygDjVKGLAw0IEG2xdMlqZG6AQU
         Xgz8Z8lbqzouU8w2iw6jT2PJ5Yi97V6TsngBJLCrIKw5BZJWWxBsnijJF5RmRH9xpKKp
         qGLj6PJPpVVG2tODMBmDD/URXkT4nJI2FsxmgbTAuX7k91sALhzpSJ3WEG8N12zzaP4z
         qhR+tIA9iJzNQepNDy08OGgX1+NVDB6OC8MfmubnfheDUvm715t+8A+nggkwzZ+mb1QC
         WfQQ==
X-Gm-Message-State: AOJu0YwLgm1Hcu0PKMq9cjYabJPC61fLjJu4UOeGyh8d8bQF7dV07+I9
	PNTE5gRVMzx0bIGLYTlgtU27hc1HtQ5BYBSi59biN8OXFMuvAoy1GPI=
X-Google-Smtp-Source: AGHT+IH09vDBNafmWZFBy2GTAoRBCiNtc0u/e6CGk0mBt8uS0MwUCIk9yBV1ux9wBv4Z1OoCAEPrZImbLV7Q9GhtSo4=
X-Received: by 2002:a25:240f:0:b0:d53:f88a:dc09 with SMTP id
 k15-20020a25240f000000b00d53f88adc09mr24600029ybk.2.1693229943197; Mon, 28
 Aug 2023 06:39:03 -0700 (PDT)
MIME-Version: 1.0
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 28 Aug 2023 16:38:52 +0300
Message-ID: <CAA8EJpqg-CrbzpSqO9W6W2c=V6TN0Yx5mfih3j4cYeOLNRz+Ng@mail.gmail.com>
Subject: ath10k-firmware: WCN3990: Add board file for the Qualcomm SDM845 MTP platform
To: ath10k@lists.infradead.org, 
	"open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_063905_360834_9B212613 
X-CRM114-Status: UNSURE (   8.91  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello Kalle,

We'd like to ask for inclusion of the board file for the Qualcomm
SDM845 MTP board. It is a hardware development kit manufactured by
Qualcomm, using the Snapdragon SDM845 SoC and a variant of wcn3990
BT/WiFi chip.

Following the questions from the ath10k wiki page:

* description for what hardware this is
- It is SDM845-based platform
- It uses wcn3990 chip as a WiFi and BT radio
- For the reference:

ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001
board_id 0x3f soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b
fw_build_timestamp 2018-07-19 12:28 fw_build_id
QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
ath10k_snoc 18800000.wifi: failed to fetch board data for
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp
from ath10k/WCN3990/hw1.0/board-2.bin
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id
0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features
wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file
max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

* origin of the board file
  - This file comes from the firmware package provided by Thundercomm for
the RB3 platform (also sdm845-based), cross-checked to be the same as
the file provided together with the sdm845-mtp board.

* ids to be used with the board file

bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp

Note, the device comes with the board_id not changed from 0xff.
Following the example of existing boards we are adding the
calibration variant.

* md5sum of each new board file to add

$ md5sum *
c1f5ff1660cf6dcd74bff7b41c9e693f
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin

$ sha256sum *
8b250ac1bea81825cc6f4a70105dea89b0952340a9c77a8ab37e99cbfa63e53d
bus=snoc,qmi-board-id=3f,qmi-chip-id=30214,variant=Qualcomm_sdm845mtp.bin

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
