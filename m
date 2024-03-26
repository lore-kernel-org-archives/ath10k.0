Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FCB6C6FD1F
	for <ath10k@archiver.kernel.org>; Tue, 26 Mar 2024 15:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xp0ZqxvoikI/gzbwx7ZxndebT/e0HiSQICaCfy/twKs=; b=Hx6ENeOFK1xAIPXGt26j/ojK+s
	wy27ook1TktGP0xZLI/Mp219ZXeY5Rvw8CG8zw59stKPXCPJsZeXvAJAfTsl2R8lr4CkChZx7eJpB
	B7wW1UDAmBeGy/UnxdzsbeZUgZmML5oIGEzi/tavr1CPkKpu900D1UyLIUHBPNjx96RiXnIjDb859
	aP6HkVcgMtMBoryr/JffN+6Sz6xmEcNIOmmVanU2xqsqw1TZCbp6ZDFyWof0sEP0y5wvnnO3O3lC2
	MqV2F9TSFkjU3jroQ7jCzXD7eZHf2lF6un0HbH0b7fUpdpq0s5X/736aRWGs/7s6hG4Z0GB5vZfjN
	odOfDIqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8Lt-000000053cx-0Bje;
	Tue, 26 Mar 2024 15:04:37 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp8Lp-000000053a6-3APR
	for ath10k@lists.infradead.org;
	Tue, 26 Mar 2024 15:04:36 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-414925ba76eso244035e9.0
        for <ath10k@lists.infradead.org>; Tue, 26 Mar 2024 08:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=freebox-fr.20230601.gappssmtp.com; s=20230601; t=1711465470; x=1712070270; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xp0ZqxvoikI/gzbwx7ZxndebT/e0HiSQICaCfy/twKs=;
        b=GAvulSwXSmh3AXWGDo2tE8Hjvusni2TSz4L+am4vNFEGWwNqDrmZIaLa6e6lkHpvW3
         fhCLbbBI44FyeeDyAtpP7UrIZYGusTWaeJippiVyxESpOYcCOlL4wiNgIMsKEoNQYeU+
         a+g0WpPREt9o0bCJw4y9O4LIWoZk2XmFH94t79Uq4jfIookDM/wbXyJXeVkNtMCI31Ef
         SMu+KTLBm/aH/77QsIXapq8vzc0jKKSwlMAm+PIlH4eukP0/F9C4x9hq4cj7a/hajWQi
         ceIboDTtWiDWIy8vnQKiv+V2wh12uHvUlFmP4aPKNy+aBCBqiX6ngqGrOdH7Mv3ZImXS
         lyJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465470; x=1712070270;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp0ZqxvoikI/gzbwx7ZxndebT/e0HiSQICaCfy/twKs=;
        b=SEZ3Y7HlJE3/SNpPuzNBntgZWoJ6cROkFxZsF598Rk53Enas6KF3P0SDpG/ZdBxJcH
         4bvEsIYMPM2SVLELu69CnAKncbKc7QTycjGTcwHQ6ae7eNImw7HU/ofuynPjzGloGlgY
         Y6AXgmkq3A89BfVux13Id54dZ8izr+lTuCFBvFI9g6GYLTLRtTrGYT+OPsuu6MlkY8kE
         oKDCnriCZZMZkTjHfiJKjbqUVcHjvEtoxty5RB+oeKGphaWnWTKQTv8fxYLilwn1Z0K0
         kXOn0YYqZ3hGpnn8/vaUUcs4jhtgzQODxsVn6SXYILoyeBj2oq5P+/TaaosnpITi+zpz
         ALnQ==
X-Gm-Message-State: AOJu0Yz1mJlpWEMHzcXv7wp3PjLn5+S42KrTnH/KhFvmgrQAJ5YyQt2u
	4L4STJFGqknGBrUPnxATcT/ows8uP/XxetSXvtd6q7eVOVlJlEvaspzRyjAqkxg=
X-Google-Smtp-Source: AGHT+IFGMFihtiw4m95cEeox2j0zeEgiSBGlNyWPJHtAxkpGn8kd+Xf3+XJOwlP4HoqRiME5wwJHMg==
X-Received: by 2002:a05:600c:4749:b0:414:902c:f8ba with SMTP id w9-20020a05600c474900b00414902cf8bamr1163281wmo.1.1711465469884;
        Tue, 26 Mar 2024 08:04:29 -0700 (PDT)
Received: from [192.168.108.81] (freebox.vlq16.iliad.fr. [213.36.7.13])
        by smtp.gmail.com with ESMTPSA id cc6-20020a5d5c06000000b00341d1aa0245sm4103918wrb.106.2024.03.26.08.04.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Mar 2024 08:04:29 -0700 (PDT)
Message-ID: <243a97b7-c298-4307-9f06-8b3a7c3e24fd@freebox.fr>
Date: Tue, 26 Mar 2024 16:04:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
Content-Language: en-US
From: Marc Gonzalez <mgonzalez@freebox.fr>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>, Arnaud Vrac <avrac@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson
 <andersson@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
In-Reply-To: <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_080433_988272_F06A2CB2 
X-CRM114-Status: GOOD (  10.10  )
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

On 13/03/2024 16:09, Marc Gonzalez wrote:

> I'm still not quite sure where linux-firmware.git fits into all this.

https://packages.debian.org/sid/firmware-atheros

As far as I understand, Debian package "firmware-atheros (20230625-2)" includes:

  ath10k/WCN3990/hw1.0/firmware-5.bin
  ath10k/WCN3990/hw1.0/board-2.bin
  ath10k/WCN3990/hw1.0/wlanmdsp.mbn


# dmesg | grep ' fw '
[    2.769265] remoteproc remoteproc1: Booting fw image adsp.mdt, size 7260
[   14.923181] remoteproc remoteproc0: Booting fw image mba.mbn, size 234152
[   17.087567] ath10k_snoc 18800000.wifi: wifi fw qmi service found
[   17.087642] ath10k_snoc 18800000.wifi: qmi wifi fw qmi service connected
[   17.298173] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/board-2.bin': 0
[   20.995327] ath10k_snoc 18800000.wifi: wifi fw ready event received
[   21.189610] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/pre-cal-snoc-18800000.wifi.bin': -2
[   21.195201] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/cal-snoc-18800000.wifi.bin': -2
[   21.203285] ath10k_snoc 18800000.wifi: trying fw api 6
[   21.212893] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-6.bin': -2
[   21.216866] ath10k_snoc 18800000.wifi: trying fw api 5
[   21.229645] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-5.bin': 0
[   21.230840] ath10k_snoc 18800000.wifi: found fw timestamp 1539237028
[   21.274453] ath10k_snoc 18800000.wifi: found fw ie wmi op version 4
[   21.284111] ath10k_snoc 18800000.wifi: found fw ie htt op version 3
[   21.290301] ath10k_snoc 18800000.wifi: using fw api 5
[   21.939112] ath10k_snoc 18800000.wifi: qmi fw log request completed, mode: 0


$ ./ath10k-fwencoder --info /lib/firmware/ath10k/WCN3990/hw1.0/firmware-5.bin 
FileSize: 60
FileCRC32: b3d4b790
FileMD5: d16e3444f68ee48c548a891b9f9279e1
Timestamp: 2018-10-11 05:50:28
Features: wowlan,mgmt-tx-by-ref,non-bmi
WMIOpVersion: tlv
HTTOpVersion: tlv

    wowlan,mgmt-tx-by-ref,non-bmi = b6,b18,b19 = 0xc0040



However, the vendor kernel hard-codes value = 0x82E = b11,b5,b3,b2,b1
https://git.codelinaro.org/clo/la/kernel/msm-4.4/-/blob/caf_migration/kernel.lnx.4.4.r38-rel/drivers/net/wireless/ath/ath10k/hw.c#L529

WMI_10X (Deprecated)
HAS_WMI_MGMT_TX
NO_P2P
MULTI_VIF_PS_SUPPORT
SUPPORTS_ADAPTIVE_CCA


Not sure which value I should encode for this board's firmware-5.bin ...

I'll try the upstream value.

diff --git a/tools/scripts/ath10k/ath10k-fwencoder b/tools/scripts/ath10k/ath10k-fwencoder
index ceb26b4..44fef64 100755
--- a/tools/scripts/ath10k/ath10k-fwencoder
+++ b/tools/scripts/ath10k/ath10k-fwencoder
@@ -65,7 +65,9 @@ ATH10K_FW_FEATURE_MGMT_TX_BY_REF = 18
 ATH10K_FW_FEATURE_NON_BMI = 19
 ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL = 20
 ATH10K_FW_FEATURE_PEER_FIXED_RATE = 21
-ATH10K_FW_FEATURE_MAX = 22
+ATH10K_FW_FEATURE_IRAM_RECOVERY = 22
+ATH10K_FW_FEATURE_NO_MSA_READY = 23
+ATH10K_FW_FEATURE_MAX = 24
 
 feature_map = {
     'ext-wmi-mgmt-rx': ATH10K_FW_FEATURE_EXT_WMI_MGMT_RX,
@@ -91,6 +93,8 @@ feature_map = {
     'non-bmi': ATH10K_FW_FEATURE_NON_BMI,
     'single-chan-info-per-channel': ATH10K_FW_FEATURE_SINGLE_CHAN_INFO_PER_CHANNEL,
     'peer-fixed-rate': ATH10K_FW_FEATURE_PEER_FIXED_RATE,
+    'iram-recovery': ATH10K_FW_FEATURE_IRAM_RECOVERY,
+    'no-msa-ready': ATH10K_FW_FEATURE_NO_MSA_READY,
 }
 
 # from enum ath10k_fw_wmi_op_version in ath10k/hw.h


$ ./ath10k-fwencoder -d --modify --features=wowlan,mgmt-tx-by-ref,non-bmi,no-msa-ready firmware-5.bin 
DEBUG: adding id 1 len(value) 4padding_len 0
DEBUG: adding id 2 len(value) 3padding_len 1
DEBUG: adding id 5 len(value) 4padding_len 0
DEBUG: adding id 6 len(value) 4padding_len 0
firmware-5.bin modified: 60 B

$ ./ath10k-fwencoder --info firmware-5.bin 
FileSize: 60
FileCRC32: 3ec1ac4b
FileMD5: dcfd93d86255c481d908af85c30a23b5
Timestamp: 2024-03-26 13:45:25
Features: wowlan,mgmt-tx-by-ref,non-bmi,no-msa-ready
WMIOpVersion: tlv
HTTOpVersion: tlv


Don't know how to say:
"Use THIS firmware-5.bin for all msm8998 platforms"


Testing patch proposed on March 5...
"Houston, we have a problem."

QMI stuff happens much EARLIER than firmware-5.bin handling.
(ar->running_fw is still NULL)


[   14.547563] ath10k_snoc 18800000.wifi: qmi wifi fw qmi service connected
[   14.555054] ath10k_snoc 18800000.wifi: qmi indication register request completed
[   14.561406] ath10k_snoc 18800000.wifi: qmi host capability request completed
[   14.568365] ath10k_snoc 18800000.wifi: qmi msa mem region 0 addr 0x0x0000000094400000 size 0x4000 flag 0x00000001
[   14.573775] ath10k_snoc 18800000.wifi: qmi msa mem region 1 addr 0x0x0000000094404000 size 0xfc000 flag 0x00000000
[   14.583896] ath10k_snoc 18800000.wifi: qmi msa mem info request completed
[   14.630179] ath10k_snoc 18800000.wifi: qmi msa mem ready request completed
[   14.681647] ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40010002
[   14.681726] ath10k_snoc 18800000.wifi: qmi fw_version 0x100204b2 fw_build_timestamp 2019-09-04 03:01 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.1.0-01202-QCAHLSWMTPLZ-1.221523.2
*** ATH10K_QMI_EVENT_SERVER_ARRIVE is handled at this point
[   14.690657] ath10k_snoc 18800000.wifi: DT bdf variant name not set.
[   14.706423] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
[   14.712587] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
[   14.722309] ath10k_snoc 18800000.wifi: boot using board name 'bus=snoc,qmi-board-id=ff'
[   14.745634] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/board-2.bin': 0
... snip boards dump
[   15.560607] ath10k_snoc 18800000.wifi: boot found match for name 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
[   15.570590] ath10k_snoc 18800000.wifi: boot found board data for 'bus=snoc,qmi-board-id=ff,qmi-chip-id=30214'
[   15.580393] ath10k_snoc 18800000.wifi: using board api 2
[   15.591465] ath10k_snoc 18800000.wifi: qmi bdf download request completed
[   15.595786] ath10k_snoc 18800000.wifi: qmi cal report request completed
[   18.667441] ath10k_snoc 18800000.wifi: wifi fw ready event received
[   18.667519] ath10k_snoc 18800000.wifi: ath10k_snoc_hif_power_up:WCN3990 driver state = 0
[   18.672579] ath10k_snoc 18800000.wifi: soc power on
[   18.684550] ath10k_snoc 18800000.wifi: qmi mode 0 config 00000000313ae0ca
[   18.692591] ath10k_snoc 18800000.wifi: qmi config request completed
[   18.748262] ath10k_snoc 18800000.wifi: qmi wlan mode req completed: 0
[   18.748370] ath10k_snoc 18800000.wifi: boot init ce src ring id 0 entries 16 base_addr 00000000b9feff9c
[   18.753792] ath10k_snoc 18800000.wifi: boot ce dest ring id 1 entries 512 base_addr 000000005f850e88
[   18.762971] ath10k_snoc 18800000.wifi: boot ce dest ring id 2 entries 64 base_addr 000000002467084e
[   18.772375] ath10k_snoc 18800000.wifi: boot init ce src ring id 3 entries 32 base_addr 00000000ded78c3f
[   18.781122] ath10k_snoc 18800000.wifi: boot init ce src ring id 4 entries 2048 base_addr 00000000c9e8883a
[   18.790482] ath10k_snoc 18800000.wifi: boot ce dest ring id 5 entries 512 base_addr 00000000309e9375
[   18.800220] ath10k_snoc 18800000.wifi: boot init ce src ring id 7 entries 2 base_addr 00000000e5e3fb73
[   18.809395] ath10k_snoc 18800000.wifi: boot ce dest ring id 7 entries 2 base_addr 00000000c08890b2
[   18.818507] ath10k_snoc 18800000.wifi: boot ce dest ring id 8 entries 128 base_addr 000000006af0777e
[   18.827466] ath10k_snoc 18800000.wifi: boot ce dest ring id 9 entries 512 base_addr 00000000f2c0ce43
[   18.836770] ath10k_snoc 18800000.wifi: boot ce dest ring id 10 entries 512 base_addr 00000000269a2564
[   18.845863] ath10k_snoc 18800000.wifi: boot ce dest ring id 11 entries 512 base_addr 00000000f4a8c90e
[   18.855002] ath10k_snoc 18800000.wifi: Hardware name wcn3990 hw1.0 version 0x8
[   18.865605] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/pre-cal-snoc-18800000.wifi.bin': -2
[   18.871747] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/cal-snoc-18800000.wifi.bin': -2
[   18.880307] ath10k_snoc 18800000.wifi: trying fw api 6
[   18.889520] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-6.bin': -2
[   18.894020] ath10k_snoc 18800000.wifi: trying fw api 5
*** firmware-5.bin is handled at this point
[   18.904176] ath10k_snoc 18800000.wifi: boot fw request 'ath10k/WCN3990/hw1.0/firmware-5.bin': 0
[   18.907802] ath10k_snoc 18800000.wifi: found fw timestamp 1539237028
[   18.916460] ath10k_snoc 18800000.wifi: found firmware features ie (3 B)
[   18.923027] ath10k_snoc 18800000.wifi: Enabling feature bit: 6
[   18.929373] ath10k_snoc 18800000.wifi: Enabling feature bit: 18
[   18.935279] ath10k_snoc 18800000.wifi: Enabling feature bit: 19
[   18.941085] ath10k_snoc 18800000.wifi: features
[   18.946975] ath10k_snoc 18800000.wifi: 00000000: 40 00 0c 00 00 00 00 00                          @.......
[   18.951534] ath10k_snoc 18800000.wifi: found fw ie wmi op version 4
[   18.961235] ath10k_snoc 18800000.wifi: found fw ie htt op version 3
[   18.967390] ath10k_snoc 18800000.wifi: using fw api 5



I don't know how to solve this problem.
(If we just skip waiting for MSA_READY, there is no problem)

Kalle, Jeff, do you see a way out of this conundrum?


Regards.


