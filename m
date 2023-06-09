Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 559EDC7EE29
	for <ath10k@archiver.kernel.org>; Fri,  9 Jun 2023 11:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:To:From:Subject:Date:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=rke2CyY2H0c2oSFLJOg91G0gWvLkoCi6wefzBFGEdxw=; b=aNC
	/WO4m8qMuiWksIatncKsIa+qpRq3NGNfx0/FbnvgOGmq/jpQn1V/RdyTXDmtx9AbjXhvxvvx6VxD/
	IMd53HBlgNB2+uqF6lBLfiI10A/DpnGve7IPTwUwydJ5NNJWsVG43fKmpicVmyNTV6tJWZKlXnhe2
	J8uCZU1Mz7vnz+W4JWdkbhcjGNakmL6TzgcE7owpixmQTy2sNLj2NuPQH38iPpzcQ+wxYVylryGlQ
	bxyBWhFSnfigDKqfh1gUwmX8IgZjVLnLH+ApLTecZsAK3Q2rx2gVlVWrTaxKDps0HNerBS+l+aNv7
	vkFmPZIW2rSnONX0G2jr8vsnWLtisAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7aUm-00Co2t-1z;
	Fri, 09 Jun 2023 11:41:32 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7aUh-00Co0x-2L
	for ath10k@lists.infradead.org;
	Fri, 09 Jun 2023 11:41:30 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-9745d99cfccso295151066b.1
        for <ath10k@lists.infradead.org>; Fri, 09 Jun 2023 04:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1686310881; x=1688902881;
        h=message-id:to:from:subject:date:content-transfer-encoding
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HL4ICohmyGPnbb6eF1M8FGwJO256WzuYibl+/sU3mKw=;
        b=xhJYAvkKrEZIZM3ojLn34hr/2V3gTX9mQCSE3ln+L8mEuwmFzmo3ETjnol6/PoEzXy
         JCzgYpn0GKV/HgMpQvzCZFTJflNDJiZBeGzJcQe3p0k1BmUOE1L908npQamVOce6tMsc
         /atbyrpCyFWOA1ccp8z7D6FTvH8OqN97loLvWihAqcwTNbWEAFV+EDJZlHanGrPd2GOk
         0tkhlXOYaP1byzGUaBbpodf+vy5sy5vVRNEboQ1s3fAgKq9X3/XGaxcBhIHopqMRjmzV
         PsakDMJU6IJHDOdB7PHDsNmv4XW1ztIeAGwd0ChvDzXCMq3YVhqKDeEQW6nOLuNy4M6m
         98gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686310881; x=1688902881;
        h=message-id:to:from:subject:date:content-transfer-encoding
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HL4ICohmyGPnbb6eF1M8FGwJO256WzuYibl+/sU3mKw=;
        b=E4Tz9UkZkafP+iQEMNkmv3Dm3aQgeK9IpUAGahku2NaJRen7x2ZNxyFvl/u6TZqbtd
         D4RMb/Y7qRBBXezI3Xr5uYgjTv0NHIjW4HbxpCiiXQZTY0pMveTjmXvzFTxnvQKUL526
         rPvCLet3+SzDOX6DNBjdkSa3rNjEgoO4MpBCHM0IBfKDsY9rKu7pN7HA+CfLeoe0oA6X
         Stl+Lerfca/GFjt72g40YFAT7h1rs+WWvfYseC5nWA7MBXUo5qPiIZ6a226bRd/tmq1E
         dvU8T0AQDKzlksUtHjHgZ9LggHxen/ghqZNwamZgW7a6MReXd2AU+o0o6DNZdAMizxAS
         UBfg==
X-Gm-Message-State: AC+VfDzSJvmaTE6aZ4Se0Wt7CkuBHCkI+MdqdG6cMd11bMutKGXtaUFp
	df5fMZly+chhJpMkw9y6RpOrIw3s/IV+/+UOflKmPw==
X-Google-Smtp-Source: ACHHUZ6vOqRx9roLjwhnkQPHjUKCuKLvJjiFxmROAuBGg6vFej0TClkgbjD5Y6wbGUGB0S0yVd1vxg==
X-Received: by 2002:a17:907:25c4:b0:94f:250b:2536 with SMTP id ae4-20020a17090725c400b0094f250b2536mr1643938ejc.28.1686310880665;
        Fri, 09 Jun 2023 04:41:20 -0700 (PDT)
Received: from localhost (k10064.upc-k.chello.nl. [62.108.10.64])
        by smtp.gmail.com with ESMTPSA id ce14-20020a170906b24e00b00977cc3d37a2sm1171784ejb.133.2023.06.09.04.41.19
        for <ath10k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 09 Jun 2023 04:41:20 -0700 (PDT)
Mime-Version: 1.0
Date: Fri, 09 Jun 2023 13:41:16 +0200
Subject: chan info: invalid frequency 0 (idx 41 out of bounds)
From: "Luca Weiss" <luca.weiss@fairphone.com>
To: <ath10k@lists.infradead.org>
Message-Id: <CT83B4WXR0TL.3OREBDGKBT2IM@otso>
X-Mailer: aerc 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_044128_593242_1412EB0F 
X-CRM114-Status: UNSURE (   5.88  )
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

Hi all,

I'm seeing a problem(?) since a while with the following warning being
printed to dmesg regularly when running on sm7225-fairphone-fp4 with
e.g. v6.4 kernel:

[   44.891535] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)

To be clear this is not a regression, from what I recall I've always
seen this warning happening since bringing up wifi on this board, also
with older kernel versions.

Enabling some debug log for chan info shows the following behavior:

[   44.048918] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2412 cmd_flags 0 noise_floor -96 rx_clear_count 1208242 cycle_count 5988267
[   44.100461] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2417 cmd_flags 0 noise_floor -96 rx_clear_count 425031 cycle_count 6010605
[   44.165736] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2422 cmd_flags 0 noise_floor -96 rx_clear_count 351782 cycle_count 6010443
[   44.215593] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2427 cmd_flags 0 noise_floor -96 rx_clear_count 898429 cycle_count 6010242
[   44.259399] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2432 cmd_flags 0 noise_floor -96 rx_clear_count 674101 cycle_count 6011164
[   44.313452] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2437 cmd_flags 0 noise_floor -96 rx_clear_count 1927966 cycle_count 6010919
[   44.366818] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2442 cmd_flags 0 noise_floor -96 rx_clear_count 752382 cycle_count 6011096
[   44.415512] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2447 cmd_flags 0 noise_floor -96 rx_clear_count 283823 cycle_count 6011699
[   44.468153] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2452 cmd_flags 0 noise_floor -96 rx_clear_count 113502 cycle_count 6010550
[   44.532340] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2457 cmd_flags 0 noise_floor -96 rx_clear_count 114628 cycle_count 6010540
[   44.574636] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2462 cmd_flags 0 noise_floor -96 rx_clear_count 2607035 cycle_count 6011370
[   44.733290] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2467 cmd_flags 0 noise_floor -96 rx_clear_count 217628 cycle_count 18010493
[   44.891491] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 2472 cmd_flags 0 noise_floor -96 rx_clear_count 138280 cycle_count 18013512
[   44.891523] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 0 cmd_flags 1 noise_floor 0 rx_clear_count 0 cycle_count 0
[   44.891535] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)
[   45.065699] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5180 cmd_flags 0 noise_floor -96 rx_clear_count 5623 cycle_count 18011896
[   45.207280] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5200 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18010178
[   45.356698] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5220 cmd_flags 0 noise_floor -96 rx_clear_count 145755 cycle_count 18010585
[   45.515675] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5240 cmd_flags 0 noise_floor -96 rx_clear_count 493478 cycle_count 18010598
[   45.665588] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5260 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18009959
[   45.815610] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5280 cmd_flags 0 noise_floor -96 rx_clear_count 1178 cycle_count 18010173
[   45.967808] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5300 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 18022249
[   46.128716] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5320 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17987593
[   46.277628] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5500 cmd_flags 0 noise_floor -96 rx_clear_count 88490 cycle_count 18018964
[   46.432316] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5520 cmd_flags 0 noise_floor -96 rx_clear_count 66334 cycle_count 17993843
[   46.520274] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5540 cmd_flags 0 noise_floor -96 rx_clear_count 269069 cycle_count 9322999
[   46.663392] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5560 cmd_flags 0 noise_floor -96 rx_clear_count 188003 cycle_count 18019229
[   46.814223] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5580 cmd_flags 0 noise_floor -96 rx_clear_count 28928 cycle_count 17997429
[   46.966960] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5600 cmd_flags 0 noise_floor -96 rx_clear_count 1316 cycle_count 17995217
[   47.120005] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5620 cmd_flags 0 noise_floor -96 rx_clear_count 37293 cycle_count 18018966
[   47.272868] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5640 cmd_flags 0 noise_floor -96 rx_clear_count 47831 cycle_count 17993641
[   47.426280] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5660 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17996612
[   47.579031] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5680 cmd_flags 0 noise_floor -96 rx_clear_count 9674 cycle_count 18019336
[   47.732133] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5700 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17994440
[   47.885495] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5720 cmd_flags 0 noise_floor -96 rx_clear_count 0 cycle_count 17997310
[   48.038263] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5745 cmd_flags 0 noise_floor -96 rx_clear_count 5758 cycle_count 18020498
[   48.198999] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5765 cmd_flags 0 noise_floor -96 rx_clear_count 61887 cycle_count 17981691
[   48.349005] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5785 cmd_flags 0 noise_floor -96 rx_clear_count 49557 cycle_count 17994194
[   48.498973] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5805 cmd_flags 0 noise_floor -96 rx_clear_count 4139477 cycle_count 18019194
[   48.650487] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5825 cmd_flags 0 noise_floor -96 rx_clear_count 6413 cycle_count 17982464
[   48.803931] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 5845 cmd_flags 0 noise_floor -96 rx_clear_count 3882 cycle_count 18022337
[   48.803961] ath10k_snoc 18800000.wifi: chan info err_code 0 freq 0 cmd_flags 1 noise_floor 0 rx_clear_count 0 cycle_count 0
[   48.803969] ath10k_snoc 18800000.wifi: chan info: invalid frequency 0 (idx 41 out of bounds)

So from what I can tell this firmware sends freq 0 info, then
freq_to_idx loops through the freqs and we arrive at the max value
ATH10K_NUM_CHANS (41).

Has this behavior been seen before or is this (to your knowledge)
limited to this board?

[   41.016338] ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
[   41.016356] ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 0 tracing 0 dfs 0 testmode 0
[   41.016363] ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
[   41.082577] ath10k_snoc 18800000.wifi: htt-ver 3.109 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
[   42.276395] ath10k_snoc 18800000.wifi: invalid MAC address; choosing random
[   42.276445] ath: EEPROM regdomain: 0x406c
[   42.276446] ath: EEPROM indicates we should expect a direct regpair map
[   42.276449] ath: Country alpha2 being used: 00
[   42.276450] ath: Regpair used: 0x6c

Anyone got an idea?

Regards
Luca

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
