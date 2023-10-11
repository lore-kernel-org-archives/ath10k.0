Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69A71CD6E50
	for <ath10k@archiver.kernel.org>; Wed, 11 Oct 2023 09:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:To:
	Message-Id:Date:Mime-Version:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/28PNF7lxhjxyjMCggta4NaCWlU6ofdKJ+AZLl38II4=; b=cylnowDVhUgsjU
	xBbGE1xBVvgQKm9PUZ2N12VHL0UBm+FKKxC1TNR3LvwH6Hf9qzVenVdzTXFqt4LZ4/vNJDpRxQz/E
	YCFAjmxtC2O8c6MG+xnxdvy/gaIBkZtQUlGtPwXJG/bgfc7Shd14uh9w0ZyqzomUqPcjOjBzydmMe
	LlOJ3E+Py+PwISyWGVSMfTns8hEcfCoI+/YtI7GUnc+abHuSAe8y8dSHdvz+NyG/0XsIqzzp86/sP
	QrXAzUQuYM9mHFMEAz6PW40gW8J+CvtKUcPkuR61fvgpKCNjEtiTHB/f2p5uj2/q0p4DqvC/RNvpl
	T1lp+u3Z1BYWu3DTihqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVBQ-00FIx9-0M;
	Wed, 11 Oct 2023 09:07:12 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqVBL-00FIvv-37
	for ath10k@lists.infradead.org;
	Wed, 11 Oct 2023 09:07:10 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b2f73e3af3so1119830666b.3
        for <ath10k@lists.infradead.org>; Wed, 11 Oct 2023 02:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1697015222; x=1697620022; darn=lists.infradead.org;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dOLl2jUof3RQjipD9yz0QeuFwQ+t45LNDAt2+4rdvok=;
        b=BiX1Xyycbowp98tZeMn1+rSYstzoJvdVFZKQcUK4bDhK1XpNtXflZmtaWGG8w60DV0
         rymJfWrlg6aMlmEwwmn6BBqZYIel5j46uvvnVJihD5idKvYdDDNmWdqOEPl20H9DgIQe
         gGQqy9jLFeEk6ekDMLGWE8GNLPKxO+2btV9EF9vEJMKyQmIAJKjHUJn439XjCDUh+uDn
         5GG1WTbw8oRBhFkSmI37XouZRRjnTPWU6xQ1xBtIkoav/w6Ykl8UcbgXAJ2DLR2jwHUj
         FMpyyP4JMRF/5csuI6BdOXWNDcquLPKDB25lVo5fLeog8cF6ngsPr5ZdfO1JAe7v94Aa
         e6UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697015222; x=1697620022;
        h=in-reply-to:references:from:subject:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=dOLl2jUof3RQjipD9yz0QeuFwQ+t45LNDAt2+4rdvok=;
        b=Q/SXxGQV6j+rGXc+CsS9ZATn1T0cfQcujTX8rtBR2lX2gZ1iI7UFZljHRPo3CvWss2
         sZCLTrHsiHd1JgZermptbtsCfkDDUw/2iZZBPC74MNPIz6NHv4iDHFMJKn9ZB+QUH2rQ
         /56HLmt2htI1Nva5YEme7CJcvYy/eb72DUMwDh4ce7ZPXbLXkWVHajQcTPqDYdL7PIts
         m+zKDPzQ1SCQWTyl7QoY4jsEGp6tv4un34E2oFUeSv9t/qTbTwqs40V7NmytxsOKV0Wk
         8LDGoggq1qZXdVEUAPW3JaTz5jTWklsXG4IVe7e2KyHZ/3O43qBJSAXokk0CdNwxwcPa
         lBcw==
X-Gm-Message-State: AOJu0YzBjJ6oLt9uS8h/mTSEd1amcsBtW9NKZk1v9x0ZRLQEZrgsqkGB
	reorux1qtv2m4tOYyzK6pLyfTjgovcaYrt0ft3F1kA==
X-Google-Smtp-Source: AGHT+IEd+GNByetkoo9bnuz/G1s9qcZXQcOquCSn/Jxn4wW3xuhKmqQnu/ZZo7I/nNNJXTw2XAUz1w==
X-Received: by 2002:a17:906:1ba9:b0:9b8:7746:f176 with SMTP id r9-20020a1709061ba900b009b87746f176mr16645984ejg.34.1697015221804;
        Wed, 11 Oct 2023 02:07:01 -0700 (PDT)
Received: from localhost (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id g11-20020a17090613cb00b0099293cdbc98sm9653618ejc.145.2023.10.11.02.07.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Oct 2023 02:07:01 -0700 (PDT)
Mime-Version: 1.0
Date: Wed, 11 Oct 2023 11:07:01 +0200
Message-Id: <CW5HOU3XBPS7.1KO9C3VGQCX12@fairphone.com>
To: "Luca Weiss" <luca.weiss@fairphone.com>, <ath10k@lists.infradead.org>
Subject: Re: chan info: invalid frequency 0 (idx 41 out of bounds)
From: "Luca Weiss" <luca.weiss@fairphone.com>
X-Mailer: aerc 0.15.2
References: <CT83B4WXR0TL.3OREBDGKBT2IM@otso>
In-Reply-To: <CT83B4WXR0TL.3OREBDGKBT2IM@otso>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_020708_857888_C7FE040B 
X-CRM114-Status: GOOD (  12.61  )
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

Hi all,

Anybody have an idea about the issue I sent a few months ago?

Regards
Luca

On Fri Jun 9, 2023 at 1:41 PM CEST, Luca Weiss wrote:
> Hi all,
>
> I'm seeing a problem(?) since a while with the following warning being
> printed to dmesg regularly when running on sm7225-fairphone-fp4 with
> e.g. v6.4 kernel:
>
> [   44.891535] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>
> To be clear this is not a regression, from what I recall I've always
> seen this warning happening since bringing up wifi on this board, also
> with older kernel versions.
>
> Enabling some debug log for chan info shows the following behavior:
>
> [   44.048918] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2412 cmd_flags 0 noise_floor -96 rx_clear_count 1208242 cycle_count 5988267
> [   44.100461] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2417 cmd_flags 0 noise_floor -96 rx_clear_count 425031 cycle_count 6010605
> [   44.165736] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2422 cmd_flags 0 noise_floor -96 rx_clear_count 351782 cycle_count 6010443
> [   44.215593] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2427 cmd_flags 0 noise_floor -96 rx_clear_count 898429 cycle_count 6010242
> [   44.259399] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2432 cmd_flags 0 noise_floor -96 rx_clear_count 674101 cycle_count 6011164
> [   44.313452] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2437 cmd_flags 0 noise_floor -96 rx_clear_count 1927966 cycle_count 6010919
> [   44.366818] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2442 cmd_flags 0 noise_floor -96 rx_clear_count 752382 cycle_count 6011096
> [   44.415512] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2447 cmd_flags 0 noise_floor -96 rx_clear_count 283823 cycle_count 6011699
> [   44.468153] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2452 cmd_flags 0 noise_floor -96 rx_clear_count 113502 cycle_count 6010550
> [   44.532340] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2457 cmd_flags 0 noise_floor -96 rx_clear_count 114628 cycle_count 6010540
> [   44.574636] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2462 cmd_flags 0 noise_floor -96 rx_clear_count 2607035 cycle_count 6011370
> [   44.733290] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2467 cmd_flags 0 noise_floor -96 rx_clear_count 217628 cycle_count 18010493
> [   44.891491] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2472 cmd_flags 0 noise_floor -96 rx_clear_count 138280 cycle_count 18013512
> [   44.891523] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 0 cmd_flags 1 noise_floor 0 rx_clear_count 0 cycle_count 0
> [   44.891535] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
> [   45.065699] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5180 cmd_flags 0 noise_floor -96 rx_clear_count 5623 cycle_count 18011896
> [   45.207280] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5200 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18010178
> [   45.356698] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5220 cmd_flags 0 noise_floor -96 rx_clear_count 145755 cycle_count 18010585
> [   45.515675] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5240 cmd_flags 0 noise_floor -96 rx_clear_count 493478 cycle_count 18010598
> [   45.665588] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5260 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18009959
> [   45.815610] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5280 cmd_flags 0 noise_floor -96 rx_clear_count 1178 cycle_count 18010173
> [   45.967808] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5300 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18022249
> [   46.128716] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5320 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17987593
> [   46.277628] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5500 cmd_flags 0 noise_floor -96 rx_clear_count 88490 cycle_count 18018964
> [   46.432316] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5520 cmd_flags 0 noise_floor -96 rx_clear_count 66334 cycle_count 17993843
> [   46.520274] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5540 cmd_flags 0 noise_floor -96 rx_clear_count 269069 cycle_count 9322999
> [   46.663392] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5560 cmd_flags 0 noise_floor -96 rx_clear_count 188003 cycle_count 18019229
> [   46.814223] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5580 cmd_flags 0 noise_floor -96 rx_clear_count 28928 cycle_count 17997429
> [   46.966960] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5600 cmd_flags 0 noise_floor -96 rx_clear_count 1316 cycle_count 17995217
> [   47.120005] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5620 cmd_flags 0 noise_floor -96 rx_clear_count 37293 cycle_count 18018966
> [   47.272868] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5640 cmd_flags 0 noise_floor -96 rx_clear_count 47831 cycle_count 17993641
> [   47.426280] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5660 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17996612
> [   47.579031] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5680 cmd_flags 0 noise_floor -96 rx_clear_count 9674 cycle_count 18019336
> [   47.732133] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5700 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17994440
> [   47.885495] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5720 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17997310
> [   48.038263] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5745 cmd_flags 0 noise_floor -96 rx_clear_count 5758 cycle_count 18020498
> [   48.198999] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5765 cmd_flags 0 noise_floor -96 rx_clear_count 61887 cycle_count 17981691
> [   48.349005] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5785 cmd_flags 0 noise_floor -96 rx_clear_count 49557 cycle_count 17994194
> [   48.498973] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5805 cmd_flags 0 noise_floor -96 rx_clear_count 4139477 cycle_count 18019194
> [   48.650487] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5825 cmd_flags 0 noise_floor -96 rx_clear_count 6413 cycle_count 17982464
> [   48.803931] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5845 cmd_flags 0 noise_floor -96 rx_clear_count 3882 cycle_count 18022337
> [   48.803961] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 0 cmd_flags 1 noise_floor 0 rx_clear_count 0 cycle_count 0
> [   48.803969] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
>
> So from what I can tell this firmware sends freq 0 info, then
> freq_to_idx loops through the freqs and we arrive at the max value
> ATH10K_NUM_CHANS (41).
>
> Has this behavior been seen before or is this (to your knowledge)
> limited to this board?
>
> [   41.016338] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
> [   41.016356] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
> [   41.016363] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
> [   41.082577] ath10k_snoc 18800000.wifi: htt-ver 3.109 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
> [   42.276395] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
> [   42.276445] ath: EEPROM regdomain: 0x406c
> [   42.276446] ath: EEPROM indicates we should expect a direct regpair map
> [   42.276449] ath: Country alpha2 being used: 00
> [   42.276450] ath: Regpair used: 0x6c
>
> Anyone got an idea?
>
> Regards
> Luca


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
