Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92166C00528
	for <ath10k@archiver.kernel.org>; Wed,  2 Aug 2023 11:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fHS2Vxs8uRy1/LOzal6xg3odJr1yo+1dzQBsVL7qODg=; b=pvP9lSJCU3d2wC
	YMHPqIiGeXrZJ0d0PpLM/wFgfoyuBvUuIPuAKqWFImfftfiMN4h7Hy2mPtY+Jrt9zgTjd33yjQEBz
	a+qEeZIOsGi+C+J6v8pU8Bm25Yh/upaU6xCI7aEvWlhv+W3QYifvxY/vdyQCacq3hLiR/VMwZDbhg
	3MbNpXx5otHCyXof4D6V35NSbj9ZE/y1TXSussXgtivWH+YJ283XBnx6NeW07oocPKVvbHX/CTCAU
	Rj3rU0taPqjlLL5cEOFjJYCRfJzI99CgP/zzuSK/uf3/2EmRaIkI+DchAN0sw09oRxVyAW6+FNfsS
	doYGsxPRWl4WYD6cVSVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9xF-004nL7-2u;
	Wed, 02 Aug 2023 11:23:49 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9xC-004nKU-2S
	for ath10k@lists.infradead.org;
	Wed, 02 Aug 2023 11:23:48 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2b9b904bb04so107285001fa.1
        for <ath10k@lists.infradead.org>; Wed, 02 Aug 2023 04:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690975424; x=1691580224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Fwxeup/atHNvD6NjsB9M0duEvhBEp/aeXuvjVlSGTi4=;
        b=Dwn1vBqQDAloJTTvzziIOlrcCGPFENaSifjOv3tvhrNpAq/x6iNBCvZvXPUqMYT+Ot
         u3D1By1r4INJw2Otn36ria6+rEgdqxmWAimNdar7daxcL2gAR4vIhRDCJUWqER7TIVW0
         Eqz0BXkz6Jqwpk3765MA/vzIRNtu6KgxgsxRpRVFMXrH+JV15QKQN+ttJRO9Rm3jdnh7
         WUEI039NknurjUUKnvUvxd+pJsZ0Dx0sQC+BWQkRR1zTs7ymQ0fVcnZv/rq7n6rUfWaD
         ZO4iqasMbG+PExp0LJEfl417w9ut8XpIbCXkmn1yOP3xNTbmLMqCK6C7a+BbMeL2qYtw
         0MFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690975424; x=1691580224;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fwxeup/atHNvD6NjsB9M0duEvhBEp/aeXuvjVlSGTi4=;
        b=Ghh2f9x+A0qBfjx1WUALBLf2EoCgYlwO8dQ311b+zzs3MHKAsNrhv7dvVJ0BXExzzn
         gU0uAQV4+ALptXAe5OquXqtId4+awvulM2DxydJftY90JPq6eSa6S3hSEHZhFaU+b9CI
         sIoTxgJI/zyLNkXMfziaU3X3LF05PIgG5gpRwclVpJKUUauDO7n9yH6EMBZXRdTpKCpT
         ZPfLQASVdd2noGVbOsMx9EjIy1eRD5NSvLq+EUpDfpmBgSluryV0VLVMSwbBbZXWpekt
         3zCsuTCHpk9OH5A64gLQ2vLSeLnjyB5fjCzSfdmIIiG7NGtjklSoXFxVjTmtjg0OZ54O
         Z73A==
X-Gm-Message-State: ABy/qLbnawZx1DG4w7VWcugSfh0g8nBzvWBO5BpFCOEsxRwmSvVGGy9v
	eCuK0PON+jooHUxrRi7VJEVlTMUcpnwKTqYqaH0=
X-Google-Smtp-Source: APBJJlGDBGk8CvLSjjR6D/i7pJBCkWhAwzefcKtPV+g0vDnQMROjrQpPhGIXI3YH6djefko0en7iFw==
X-Received: by 2002:a05:6512:3ca6:b0:4f8:711b:18b0 with SMTP id h38-20020a0565123ca600b004f8711b18b0mr5305175lfv.3.1690975424381;
        Wed, 02 Aug 2023 04:23:44 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id 20-20020ac24834000000b004fb7acaa2e6sm2938844lft.265.2023.08.02.04.23.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Aug 2023 04:23:43 -0700 (PDT)
Message-ID: <f0ef6af9-b648-cc64-0165-eb135f0de578@linaro.org>
Date: Wed, 2 Aug 2023 14:23:43 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: wcn3990 firmware
Content-Language: en-GB
To: Kalle Valo <kvalo@kernel.org>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 Vinod Koul <vkoul@kernel.org>
References: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
 <8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org> <87cz05wxfm.fsf@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <87cz05wxfm.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_042346_860982_15D57EF7 
X-CRM114-Status: GOOD (  18.57  )
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

On 02/08/2023 13:28, Kalle Valo wrote:
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> writes:
> 
>> On 24/07/2023 22:38, Dmitry Baryshkov wrote:
>>> Hello Kalle, colle
>>> Yet-another firmware question (I remember the standard answer of not
>>> using firmware not coming from your side). I see that for
>>> wcn3990/hw1.0 we have wlanmdsp.mbn with the version
>>> WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
>>> We have got the newer wlanmdsp.mbn released under
>>> redistribution-permissive license (LICENSE.qcom from
>>> linux-firmware). The file has the version
>>> WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was released for the
>>> ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.
>>
>> Update: with the current wlanmdsp.mbn I'm getting the following error
>> from the DSP:
>>
>> [   22.468121] qcom_q6v5_pas 6080000.remoteproc: fatal error received:
>> EX:kernel:0x0:SigVerify:0x173:PC=0xc10dd460
>>
>> The board is not fused, but the signature format was changed (and so
>> were some of the fields).
>>
>> It seems we will have to provide the updated file somehow to
>> linux-firmware. What would be the preferred way for us to do so?
> 
> I cannot take firmware files from a 3rd party.

Ack

> Also I don't follow the
> WCN3990 firmware development so I can't really comment how that firmware
> release works with different WCN3990 hardware, board files and/or
> calibration data.

It seems to work pretty normal. I have pointed out the only issue we 
have stumbled so far in 
https://bugzilla.kernel.org/show_bug.cgi?id=217748 (the warning during 
scan).

> But if you think that release should be submitted to
> linux-firmware that's up to you.

This obviously means that we should not push it to 
<linux-firmware>/ath10k/WCN3990, correct?

-- 
With best wishes
Dmitry


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
