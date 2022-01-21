Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0A95C433F5
	for <ath10k@archiver.kernel.org>; Fri, 21 Jan 2022 14:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ak8dQmdXZkE1Wz61kzzzTBU943v/PtHKABjkxose0tU=; b=Klx3NC44hg5q0y
	IatOYfC2DimwRp0qZ0ahKiqshzpL7xSNLHnuu1lWTRUwT979vlXPWedQsisdaY8i7vXzAvZ5Ep959
	PCImeo1a82Ymm78zzntS/6pY4UivP2kdOXpfF+21you4LP9WJeHLrw0WxaoOtinYTy9ezLLUoQz14
	wywEPCKAxU5zlE5Deq7e40wz6lNEuHQLmUneuTMCmIq8Ve4aBuQBY5K2CkatU/7sR8VEss7klFCKN
	w6bAvkhWrl6TsJ00AhjwvuoouxbEeKqfbStuhoYtMPMpDj4QxDDWDcVgkzpczC8YUSzvVBM9dAccK
	DhNHY+XIeLQluk+3uZ4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAuzK-00FNdF-Qz; Fri, 21 Jan 2022 14:34:02 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAuzH-00FNbz-6g
 for ath10k@lists.infradead.org; Fri, 21 Jan 2022 14:34:00 +0000
Received: by mail-wr1-x42f.google.com with SMTP id f17so16840wrx.1
 for <ath10k@lists.infradead.org>; Fri, 21 Jan 2022 06:33:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=nOo6JnqKgxdyyY6FR3CHB1GeagO4x89vJF9dRTohxbQ=;
 b=GKKKw2NofTp2lL3VP8CI+r78FyHqfCFECtDkZRU9NuK2p5W7LUL4CWsBsZfvDo5Dub
 zyMde8SOVWlE8vdqAGvB/8AshLtFWxj9IVoaVoVe8ulmY6x1E3zqfHz4aCJLNm3FPyIj
 ENE7dXb1qAru3vjeeYXB4QbEP900gXAtwwsztQO6QXgQCytMQLrkjeziMJrBo2yfjEVd
 pGI7wdWpegnWNJ8cCLx7ZOJagjbPKEOaiNbRVpa2Slq72eGCsbuUKWf0ZfkQdyFH8IUa
 n4vRI9ejdVKwGyYbnaADGsiW3fqglSUvf2yXOTZAGmgNClWMnOX7Dw86ro4ZSuhZqH6V
 Cvjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nOo6JnqKgxdyyY6FR3CHB1GeagO4x89vJF9dRTohxbQ=;
 b=mLMVa8bmz23R9ApmFFoYQ1FYNVNtAAb6H5MBuUVXP8STzy2FVpy/NyTtktYfSEqmmw
 5n79e0DER1JZrPzZgGmswsn7rnKzVOz4wRuL/6QRu4pDVFGkgdZbyV4V6ctYMJsCrCy7
 uXTlZ1lYlYMUKGUw39ea9WtmBlWBFLGGn6OPTBpiLzA0QbTvmkjMZK2I8j7ATj49RLW2
 4EnQGVWmSLcd3a3HzFwMXHI2lJSWbkoKZK+gpsxhRwq2/z0VBgLDFxNWQC8f/Inizt60
 pP6rJFvbQmJen6tSvtqjswnefhyHIOQ4M1PVE2K21CvfTjSUlSZ2xLWTRLCyp0DB4dcE
 1Gjw==
X-Gm-Message-State: AOAM5306PnvabsNZCizez/gzqW+RT2/1XR+YNaY04iTPpQ8KE4LyFdtU
 gCnH6GdH4zeuYmCVRNjytjEACu4kN6o=
X-Google-Smtp-Source: ABdhPJyFI2IQvm433H3CSzy5EGozpzticZcr/lLQcNbgM1puHts479+2RJN399d6Rlp5+s29dO/46Q==
X-Received: by 2002:a5d:64a6:: with SMTP id m6mr4388051wrp.282.1642775636393; 
 Fri, 21 Jan 2022 06:33:56 -0800 (PST)
Received: from debian64.daheim (p5b0d7860.dip0.t-ipconnect.de. [91.13.120.96])
 by smtp.gmail.com with ESMTPSA id
 1sm5030161wmo.37.2022.01.21.06.33.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 06:33:55 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nAuzD-0008ei-2r;
 Fri, 21 Jan 2022 15:33:55 +0100
Message-ID: <d865d506-f90d-9517-2c1f-26eb8a8ff14b@gmail.com>
Date: Fri, 21 Jan 2022 15:33:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: ath10k-firmware: QCA9980 hw2.0: add ASRock G10 specific BDFs
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org
References: <4031513.NO3PqbrPAa@debian64> <87zgnp9obf.fsf@kernel.org>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <87zgnp9obf.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220121_063359_393611_306EEDFD 
X-CRM114-Status: GOOD (  16.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hi Kalle,

On 21/01/2022 15:05, Kalle Valo wrote:
> Christian Lamparter <chunkeey@gmail.com> writes:
> 
>> this is a set of board.bin files for the ASRock G10,
>> which I wish to be added to the ath10k-firmware repository.
>>
>> As per the current "Submitting board files" guidelines [1]:
>>
>> * description for what hardware this is:
>>    - it is a IPQ8064 based board with
>>      - one QCA9980 radio is used as 2.4 GHz radio
>>      - one QCA9980 radio is used as 5 GHz radio
>>
>> * origin of the board file (did you create it yourself or where you downloaded
>>    all files were extracted from official vendor firmware which was on the device.
>>
>> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>>    - qca9980 hw2.0
>>      + bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>>      + bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
>> * md5sum of each new board file to add
>>
>> ae069744baeebfd6861e8080a92439ca  bus=pci,bmi-chip-id=1,bmi-board-id=1,variant=ASRock-G10
>> 9e196846841a186e61ea208cc873384c  bus=pci,bmi-chip-id=1,bmi-board-id=2,variant=ASRock-G10
> 
> There is no QCA9880 directory in ath10k-firmware, do you mean this
> should be added to QCA988X/hw2.0/board-2.bin?

It's a 9980 chip. This was 9984 predecessor.
         ^ = Watch out for that 9! <https://www.qualcomm.com/products/qca9980>

It would belong to the 99X0 directory of your ath10k-firmware repo:
https://github.com/kvalo/ath10k-firmware/tree/master/QCA99X0/hw2.0

But there's one issue: there is no v2 board-2.bin in there yet.

However the codeaurora's ath10k-firmware repo provides the board-2.bin here:
https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0/board-2.bin

(this also includes the reference bmi-board-id for 2, 4 and 6. I guess this
would help other people as well):
https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA99X0/hw2.0

So could you please add that board-2.bin from codeaurora and add
the ASRock G10 specific variant to it? That would be sweet.

Thank you,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
