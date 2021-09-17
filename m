Return-Path: <SRS0=iK1b=OH=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 289D6C433EF
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 17:38:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4C2C610D1
	for <ath10k@archiver.kernel.org>; Fri, 17 Sep 2021 17:38:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E4C2C610D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=yBGwNBg6GT8ZDYWVbBdH5qYBHQUFfohnj07CWv3AhaI=; b=sDeHeYDnE3MYpH
	/vWMexGmO2hjEEGwnNV/5zT3K5PNIr1mj91qGjbmJio0IFTOAVap6M3OrNFTZJWEWIwciyjlMnDvc
	TickrSl7t5lghbCA3ixRfQz13HSkrFVaTZ6r7ITez2YGDZiIJLDtj71bMGavI5ie91hAi/jwYIoUg
	COdKt+Or5xVteC+k/rnVLqXYqzLFrjdKF4UYb7l4QItHvA+aDpaxMBIGprKV97LJMcI97SW3VG+mh
	lbQuuKI+fTrAemS1O0uQp2fV+BBpNfCEcvMruz3BfD7Lih1pna1sxkeKq9wVPNwKreFQEpksiWI/f
	bI2pOYQXVc4SZX4rcMxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mRHoO-00EkKA-1N; Fri, 17 Sep 2021 17:38:08 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mRHoL-00EkJd-Jp
 for ath10k@lists.infradead.org; Fri, 17 Sep 2021 17:38:07 +0000
Received: by mail-lf1-x12d.google.com with SMTP id c8so35842439lfi.3
 for <ath10k@lists.infradead.org>; Fri, 17 Sep 2021 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=8Ic9heAFWQvWHlsysjr0qtULCH+dzNXX6SwRzJsLh7A=;
 b=VODqn+dPezLqCkknge6fHDw1JXg8ocx1DxEQ8l7BOoEZ0mBZqDGF55bP5K8F53sNG3
 H79MiNTZpZD+ncW6wt8FHqGNJKdw0DETqBGkcnqrm69ougytiMsOhvdimSMnhiDOrgUb
 c8Y83Y0miwoNgUwIJMksl5Ik/fcyOzFLFk1pyDD/nLMGSnbWM4K7qthZVHUs8EvgcLy6
 EdFvPBhQ5+5DyoeIcTcCOEs5VofpmLhCQNEZBnuMVIVMgR+Bvogm0jwBq/PrsDyy7QJH
 u9vUd/BgtX0tWi3Mmr+83qwaL6U8LL2IeTt+3vUc6WTEhxeoOASR6XoH510M7N3azPA6
 RnAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=8Ic9heAFWQvWHlsysjr0qtULCH+dzNXX6SwRzJsLh7A=;
 b=GRiXUYqrTQ4K8cI/i+m7cn8GVHaSvdAQbtyLE7OAwoKj5mzH2+HrMPFHiPW+SRscEY
 tcPgZSMFwxE6ZLMbo0O3VSXkc9WZkwD62VKyD7XGvRQjRNPBE62zILvEh7ySwFRXVlom
 iCcRODUAJHQrINWWeb2X5+EBJZsY/KlhW+SLSsil2D+Kc5ja3gckbLDIAeAvF1H7xu5Q
 lKIazCGZ1UHgVpiOSEjic+3WeRTZBD09bMmTDHH306+NMiysYKKfUWgu7QKvk/9rAFBv
 kP8TyuSBQ7hxElYl/zmIzi2iz3c3090vkFcltOeOC0YneuRIM5vJehBqmfVSQPCNbLeI
 +dgA==
X-Gm-Message-State: AOAM533TsUS+Kb0pfUKqJshm9nAGQSdqGj1r0KamIKMQ46PrZ6MwxJUd
 IzgV43UbU8GLPAPxrdplLw8Jqi+gwelVfnvVQ/M=
X-Google-Smtp-Source: ABdhPJxTHBCQsAfHoZec+mfLpPPlQ4mFgEuhYjpomdT9+1VDUN79GuGeOKHuD/+mzokceEOdGQspxJI3UtBCFbHW+dc=
X-Received: by 2002:a05:651c:4d4:: with SMTP id
 e20mr10841946lji.402.1631900283008; 
 Fri, 17 Sep 2021 10:38:03 -0700 (PDT)
MIME-Version: 1.0
From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 17 Sep 2021 14:37:52 -0300
Message-ID: <CAOMZO5BROh1wET6vcif_8Q+aMQUFqRMP5uttBBLV8nJnbOv8rg@mail.gmail.com>
Subject: ath10k_sdio: failed to write to address
To: Kalle Valo <kvalo@codeaurora.org>, wgong@codeaurora.org
Cc: erik.stromdahl@gmail.com, niklas.cassel@wdc.com, 
 ath10k@lists.infradead.org, linux-wireless <linux-wireless@vger.kernel.org>, 
 alagusankar@silex-india.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210917_103805_699773_6F060248 
X-CRM114-Status: UNSURE (   5.17  )
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

Hi,

On an i.MX7-based board, I see the following "failed to write to address" error:

ath10k_sdio mmc2:0001:1: qca9377 hw1.1 sdio target 0x05020001 chip_id
0x00000000 sub 0000:0000
ath10k_sdio mmc2:0001:1: kconfig debug 0 debugfs 0 tracing 0 dfs 0 testmode 0
ath10k_sdio mmc2:0001:1: firmware ver WLAN.TF.1.1.1-00061-QCATFSWPZ-1
api 5 features ignore-otp crc32 7746e551
EXT4-fs (mmcblk0p1): re-mounted. Opts: (null)
 ath10k_sdio mmc2:0001:1: failed to fetch board data for
bus=sdio,vendor=0271,device=0701,subsystem-vendor=0000,subsystem-device=0000
from ath10k/QCA9377/hw1.0/board-2.bin
ath10k_sdio mmc2:0001:1: board_file api 1 bmi_id N/A crc32 544289f7
ath10k_sdio mmc2:0001:1: htt-ver 3.32 wmi-op 4 htt-op 3 cal otp
max-sta 32 raw 0 hwcrypto 1
ath10k_sdio mmc2:0001:1: failed to write to address 0x12ff5: -84
ath10k_sdio mmc2:0001:1: failed to write skb to 0x12ff5 asynchronously: -84

The wifi is functional despite the errors.

I tried applying Erik's patch:
https://github.com/erstrom/linux-ath/commit/6507fd8df431e1d1f1ea344224956387dc1d35aa

and the one from Niklas:
https://github.com/erstrom/linux-ath/commit/4e794a12fa89e353e38528d1ada5d86f19672c3c

but it did not help.

Does anyone have any suggestions as to how to fix it?

Thanks,

Fabio Estevam

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
