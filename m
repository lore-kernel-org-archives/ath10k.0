Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F04EB64DD
	for <ath10k@archiver.kernel.org>; Mon, 24 Jul 2023 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:From:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jQ0hhZD9lVw0muzC/2arsvaiuTcwwYeaiHG8JVbmy8=; b=sh74y9ztbiJFS3
	xEUexapBDHaGY4Wcr26AgB+HsX5/eX1fipKQFymiPvh35spG0Vi+7E2SKLZtCU8fOwPcTJpmHmtLA
	iPkQS/k3ajjK1WOGfu715m2kxbQUNOAXDY147FU42STjDwIcv8cJ+oFPw7ISBDwVPuwN19eWAwPoA
	0mkxby42iSWx7hoE0jfqRgSNExA8adou2M5UHe7gDQc9ZLXQoRXOrX5xfQwV55tzNf6+fiDVUhnXl
	1Y0I78D5WrrY7GYlBK6Rb7ETwOa4gqcAPvF4ZzDi2Um1ypWIgrT1Gidv3k+/ccdVHHVlP7mfE163A
	tdKzurVqSnc1E1TDKWvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1l4-005M12-2C;
	Mon, 24 Jul 2023 20:02:18 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1l1-005Lzy-0L
	for ath10k@lists.infradead.org;
	Mon, 24 Jul 2023 20:02:16 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b701e41cd3so67818861fa.3
        for <ath10k@lists.infradead.org>; Mon, 24 Jul 2023 13:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690228931; x=1690833731;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8rorXpCCF7HsEeC7GBM3kSJkHjogG78spyJWEiO7j3Q=;
        b=Nf9OB1AWcqOuKCAm8pG1QuILeso+kRZ5NZ0bX3dhm0LS7CSUvvN9OObilm6N1cgcR7
         5Ptq07CrsGmxZ17I+Tsnic0U1zxStPoCsXPUREXv9sMWAlHaYVe5DfvsL+FK8veDI/84
         aXQP2r1UDutVbPRmi4+OFYONb7erGwkKoP9zOxvQG27WO9++Eb+xYE9jY+isk81YYAC5
         QoOmN7XpbLM9vWVOk4b5j7CUXTxCcrvSduBEyWF1nAEeD/T3FklGx2FG4Ytfo+feoB/8
         l1QeTJwfV2WJ33mwZfwZJanWgXMPPSA/VRwKJpjT9MSpe9IOEVjS3bcmdr5VGWDLN46Q
         h8gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690228931; x=1690833731;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8rorXpCCF7HsEeC7GBM3kSJkHjogG78spyJWEiO7j3Q=;
        b=FDWIgwoLLE9ikUJpwp67cE1dDSxMK9v2YQBYUrJOFoacNBZwFl6RLAbt3kN4ntEfMN
         VjAC4eO4Kc2uX4/geOZ3r+1eTQYnZybRMvXXUhwpEBGfJW4VuZQIZBpJfRSAfjVQ+TFM
         CxDq1XZuR7No/M/PsTfyzxnDkyXBDbSdCozJJbJm2Uh3MOPFW5R58SwOjhPxZrLAbhqy
         6Wytf9trfk8DqzSWKYAhrPo5kya/oggkPV4CVdpnYVlECxPcyw0Jf3m4YP2l/rfJAW12
         mTMpFaEm1bSllKOlohRSlatdrzN+gdUMNfrwtrWEQ0EYon9NQdIjj5WmCpRLt01OwD94
         Rx3g==
X-Gm-Message-State: ABy/qLaIS7akRmQG7vKlzXST9qAH87woMTVKZzY7duJoLtEMUMlj9zTo
	gTtfK5ROY9Cc6+FwsUyUILc6Qn/H6259Jcyd2tsBFg==
X-Google-Smtp-Source: APBJJlGpcmR/oRD1E5u9oeFyIcfO6lkUwJz7Sq/o8fsPDuSLCVFS09W/BI4wektCIX8c+mc25fw1nQ==
X-Received: by 2002:a2e:7a14:0:b0:2b6:fe3c:c3af with SMTP id v20-20020a2e7a14000000b002b6fe3cc3afmr6494398ljc.27.1690228931025;
        Mon, 24 Jul 2023 13:02:11 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z9-20020a2e9649000000b002b69b44fd52sm3080601ljh.5.2023.07.24.13.02.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 13:02:10 -0700 (PDT)
Message-ID: <8990bf1c-32c8-e582-7aa1-d207eba7d7d6@linaro.org>
Date: Mon, 24 Jul 2023 23:02:10 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: wcn3990 firmware
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 Kalle Valo <kvalo@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
References: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
In-Reply-To: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_130215_171271_7BFCFCC0 
X-CRM114-Status: GOOD (  14.25  )
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

On 24/07/2023 22:38, Dmitry Baryshkov wrote:
> Hello Kalle, colle
> 
> Yet-another firmware question (I remember the standard answer of not 
> using firmware not coming from your side). I see that for wcn3990/hw1.0 
> we have wlanmdsp.mbn with the version WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 
> We have got the newer wlanmdsp.mbn released under 
> redistribution-permissive license (LICENSE.qcom from linux-firmware). 
> The file has the version WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was 
> released for the ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.

Update: with the current wlanmdsp.mbn I'm getting the following error 
from the DSP:

[   22.468121] qcom_q6v5_pas 6080000.remoteproc: fatal error received: 
EX:kernel:0x0:SigVerify:0x173:PC=0xc10dd460

The board is not fused, but the signature format was changed (and so 
were some of the fields).

It seems we will have to provide the updated file somehow to 
linux-firmware. What would be the preferred way for us to do so?

> Would you like to update and/or receive the file? Should we still stick 
> to the older wlanmdsp.mbn?

-- 
With best wishes
Dmitry


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
