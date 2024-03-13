Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0BA7C54791
	for <ath10k@archiver.kernel.org>; Wed, 13 Mar 2024 15:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q3XCjorAqzhcxtTE1akOhucpm0x01G9s1mIo5Dg2lCY=; b=q+7FXyN5z4Rj93hhiBYPjJHprN
	NUCT833xWkwtMK248v9Yjsl4T7MXwFyd8jHqV+iuQCPd2HsIWAV1TCfttLG7sX8G2NORsIkv3EF6b
	Gbe26HBMoZSqvyhJQQaVmkmW3lD2mAwLV+rcj5WJ9iHT7wU6kMGRgsIESmzHnsuaulsfFSwF3BueM
	JJcZtgbkVx12+iIJXy4N6rDOGCsl1gBK9rPGoNqDyjh1P2Sg9Ndf6O98AFZi4Gros5zYjUPp8uQF6
	kzL+7a37v/TuiqpGSTIRifmksc2tX9HwtsGkUhP2NFrvtu709vB6Z7MDOUsfKcsMNS93XLJ/eyo5/
	sAJkEjyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQqj-0000000AfDZ-2Vsk;
	Wed, 13 Mar 2024 15:49:01 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkQqg-0000000AfCh-0e2M
	for ath10k@lists.infradead.org;
	Wed, 13 Mar 2024 15:48:59 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-513c8b72b24so870531e87.3
        for <ath10k@lists.infradead.org>; Wed, 13 Mar 2024 08:48:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710344934; x=1710949734; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q3XCjorAqzhcxtTE1akOhucpm0x01G9s1mIo5Dg2lCY=;
        b=RBSBfGRZEIzeDKzxsDQVpWtJfFjfYBlu2IXT5npYPpIAoTV/wsBIehGLd94IwFdbWV
         et8Z/YL6e+FRQpwW0SXlv/y6d9MEAc1OuNDkuwH/75PeoVImsI5x0gsoXtXABBuJaw3v
         /W6jgun5/vo0j53jbWIRunGSqaGf01niYfVvP/EBA0hZKM2SwBrRUmMAQvGOUIVVE9Uj
         HBR9Y1Nt86UbqCG8lVbuknbQ3wtjZ2//PkJkEVnw6kOtLwRjdDbynhwj1kCd45v8CD2a
         dG/OrzFRXmZQx/BsvaJ7nUgNXYQ62BK2raJfWUAJ78gtgGL6ov4xVr99fPHxBhmEWA8J
         7JYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710344934; x=1710949734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q3XCjorAqzhcxtTE1akOhucpm0x01G9s1mIo5Dg2lCY=;
        b=vYEufesJ7e93o5HOJWuwjgbffTE/kQkkGlWGaj5qcUPG6u5M8jCQmyqJui2vPHCOQK
         tXu83e2A8NJ5hyHRiESSq0B+DXEmr3QGocZD/6KJm/EeRvnfUXsftwV6EqPs0BHvyiE5
         OHT8SjsgterdeHmQh5SP4LBeH6d11f6FukKxHBjva+3YMf9AlZKMGQQm2rh12yfU3oXt
         TycKUuPQepcSeeZxOscYcO4SfqNgBOgVW/C9tNnPv/eqzouDKTWKXwfleGh1gLV8dw9f
         q9fR6QRCYuvmERkRSf1QdZ4fJlSOC/bIvqu/bIDfAsg4T29dUqVhTPp0/gBowupkKtmu
         c9nQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3p5HAoZokkGkNrTGevrTtj7WcumXuMmbqS7GwduqeM9jhjoKBiP3HvsJEh43NbdDqLmAUR6C4Y+GhXqOzh1yd1o53soK/nGfgrQ==
X-Gm-Message-State: AOJu0Yw/TEMfATCnMAQYK+WE1URpzacRQnFvUSq/tTb95XsBsdANFDy5
	7qPKNOx10tycnIA/LhoPu64eqSELOOOaMzZD/dPOk69ssrGaNxGW4VKBqk3W/K4=
X-Google-Smtp-Source: AGHT+IHHLDk70u2yvkuLwHNM/FOf86eDOT5Ekd8mF4BEzMYEvlggbO2zOgvdld4YCTq7vDP+w97Lzg==
X-Received: by 2002:ac2:4823:0:b0:513:4705:a4f3 with SMTP id 3-20020ac24823000000b005134705a4f3mr3726441lft.65.1710344933982;
        Wed, 13 Mar 2024 08:48:53 -0700 (PDT)
Received: from [87.246.221.223] (netpanel-87-246-221-223.pol.akademiki.lublin.pl. [87.246.221.223])
        by smtp.gmail.com with ESMTPSA id u12-20020ac25bcc000000b00513c68b20e9sm470609lfn.188.2024.03.13.08.48.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 08:48:53 -0700 (PDT)
Message-ID: <111bc38e-aa9f-4be6-9415-9d510e66250b@linaro.org>
Date: Wed, 13 Mar 2024 16:48:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: net: wireless: ath10k: add
 qcom,no-msa-ready-indicator prop
To: Marc Gonzalez <mgonzalez@freebox.fr>,
 Jeffrey Hugo <quic_jhugo@quicinc.com>, Bjorn Andersson <andersson@kernel.org>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>,
 ath10k <ath10k@lists.infradead.org>,
 wireless <linux-wireless@vger.kernel.org>, DT <devicetree@vger.kernel.org>,
 Pierre-Hugues Husson <phhusson@freebox.fr>,
 Jami Kettunen <jamipkettunen@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <14daa98e-7fd3-4ebb-87bb-5d2c1fba679f@freebox.fr>
 <b8de96c7-cbb6-4a09-a4d4-2c11b3ab3e01@freebox.fr> <871q8wk7o3.fsf@kernel.org>
 <3392f356-7b19-483d-b9f8-3bd84068fa52@freebox.fr> <87wmqoilzf.fsf@kernel.org>
 <c58e67e6-6a7f-4963-86b9-580165bf05ba@freebox.fr> <87cyse8j9m.fsf@kernel.org>
 <6d4b1381-c121-4cda-a8c9-9ccac56bd447@freebox.fr> <87plw87nsc.fsf@kernel.org>
 <0816f7bb-3c97-4b90-8e19-191552ea6e26@freebox.fr> <87h6hk7aee.fsf@kernel.org>
 <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <fb0ffdd9-923a-4191-8304-583243ad528b@freebox.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_084858_243983_CBDBE485 
X-CRM114-Status: GOOD (  13.96  )
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



On 3/13/24 16:09, Marc Gonzalez wrote:
> [ Dropping the DT fellows ]
> 
> On 05/03/2024 20:20, Kalle Valo wrote:
> 
>> Marc Gonzalez wrote:
>>
>>> I need to build a kernel + rootfs + FW to test the proposed solution,
>>> then I can spin a formal submission.
>>
>> Yeah, please do test this to make sure we are not missing anything :)
> 
> I used buildroot ( https://buildroot.org ) to generate a kernel + rootfs
> for my board (a variation of qcom/msm8998-mtp.dts)
> 
> Not sure if I must use the vendor FW blobs? Or if I can use the blobs
> from linux-firmware-20240115.tar.xz (as supported by BR2).
> 
> 
> All I see from the ath10k driver (with debugging cranked to the max) is:
> 
> [    0.539801] ath10k_snoc 18800000.wifi: Adding to iommu group 0
> [    0.541941] ath10k_snoc 18800000.wifi: snoc xo-cal-data return -22
> [    0.543633] ath10k_snoc 18800000.wifi: supply vdd-3.3-ch1 not found, using dummy regulator
> [    0.544002] ath10k_snoc 18800000.wifi: qmi msa.paddr: 0x0000000094400000 , msa.vaddr: 0x(____ptrval____)
> [    0.544271] ath10k_snoc 18800000.wifi: snoc probe
> 
> 
> # ip link
> 1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue qlen 1000
>      link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
> 2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc pfifo_fast qlen 1000
>      link/ether 34:27:92:82:48:ec brd ff:ff:ff:ff:ff:ff
> 
> No wlan device at this point.
> 
> I got shell-shock from reading these setup steps:
> 
> https://wiki.postmarketos.org/wiki/Qualcomm_Snapdragon_835_(MSM8998)#WLAN
> https://github.com/jhugo/linux/blob/5.5rc2_wifi/README
> 
> 
> Jeffrey, Bjorn, Konrad,
> Has someone written idiot-proof (such as myself) steps to enable
> the ath10k core on a msm8998 board?

$ cat /tmp/x.json
[
         {"names": ["bus=snoc,qmi-board-id=stinkyboard"], "data": "board_stink.bin"}
]


$ ls -lh board_stink.bin
-rw-rw-r-- 1 konrad konrad 19K Mar 13 16:42 board_stink.bin


$ python3 ~/qca-swiss-army-knife/tools/scripts/ath10k/ath10k-bdencoder -c /tmp/x.json -o board-2.bin
board binary file 'board-2.bin' is created

I believe Kalle aggregates these boardfiles and then uploads a big
combined board-2.bin to linux-firmware nowadays?

Konrad

