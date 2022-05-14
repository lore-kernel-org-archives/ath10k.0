Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF8C433EF
	for <ath10k@archiver.kernel.org>; Sat, 14 May 2022 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X0RCBTokFx6D9sTyMsKSrtPKcpNGh3xo8BReh1U66EU=; b=NURFYJSbuyiBiG
	2XlqDep7DPOWOTqv9sg2bazD4SMr5hTfPjb252XivkJ1ILH4N5cdi0s6lyOdd6IdW9dxtCt91tnRg
	ngrnJahSFFbe5LCNnRLx55NyD+Wopyi16ItARhVbbYGaneWDxvo0gigWJCmGrG2F4bdoqx5ad378Y
	2cQXgy+MmvxIGqKxxWuDou5zp+7E0I7/xBs0G4C7QwZw6DU4JEeaeqhzPKOW7KBsHErnEFOuqoQHB
	ODzx0+WmT4VoBYlxwZZwTS/EtjlUlwnuu2S7coAkHHyaT2ZccxV96u0FgsC4uOfqhx3dv1q9NvvVv
	KQIanMAecLewq16BmrZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npxUt-0029Zg-F6; Sat, 14 May 2022 19:32:15 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npxUr-0029ZA-9P
 for ath10k@lists.infradead.org; Sat, 14 May 2022 19:32:14 +0000
Received: by mail-lf1-x12e.google.com with SMTP id b18so19703101lfv.9
 for <ath10k@lists.infradead.org>; Sat, 14 May 2022 12:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=fXzV1fpic6FIBZFtsxUjhfRXDG+va5qpRFfngHIik8E=;
 b=WMwBL9u+A7cVFaSFpoSvfQhotjddSY3EEfSStc/go3iWLy7T4NqDaod58gnHU1T6tR
 wCYfEEHhQ5L1xTZcF8uiyLWh2mJET+ibN/8dtyMkATHs1Y+W/rIhs+qVls6IG+J1Qnyf
 0wRGdwZhCF3ZFyfePovHpgZYVssiFt1X4SnGLnQkPv6o9t+0fWEUzT05nVparICioHLg
 FWsIDfC7Ta3IiKHQS81GQyErMdey8NdrKvgB3l4VDgqAS8V9XoOSMI7dCIbBcuRMHP0V
 OkWnBgClT2qMSjiFN4LPWsNPbZAiwo+XJJ6Qd2muplhM2Mqi3MCQECnKH13Cx5WN6Ib6
 PQkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fXzV1fpic6FIBZFtsxUjhfRXDG+va5qpRFfngHIik8E=;
 b=IOxW5GiYQs0pCr1aTG2VjOvvbV+yEOJZIZSXzcMvcdGF/xc6o/dabTjoadF72c0kKU
 Qet/8WTl3QRZHjFjjZuRpJ1D8PgM2ggPKyQJClud900O2yBCV2p+SrsIsGFdvpfroc8y
 v22/bsrwr3RTjFpwdGScr1psImjwfiYD1QDMK6JEKsDhoG00Zs+7u72Y6dC1Oze1+X8e
 2HwcllBt0SRczv7vazC9lwmdLyEOTyQ3ik51FwZ4sKZag+JX3KWNIkFxrDCD+gTM2hMg
 S8yHbJX0vmdKitmP9dHdu5GZEXHN4HFo14h4FszoJGc8iL9/2JozRN7CuICLTivEk2yR
 5/qA==
X-Gm-Message-State: AOAM530CAlAkM6POXneXemk8h/y0ipnYKqmMPJm3OgBuTl7Jgm/gfAff
 U/KecjKPWHRgQbhOV1ZrMZy7Lg==
X-Google-Smtp-Source: ABdhPJwe5i88awrmyIJNqgBJD6YgpXCrsim3T+efhyaQX+lVYDbU3HXxwumOjap7znAZcwsvxAG5iA==
X-Received: by 2002:a05:6512:3f8c:b0:45d:cb2a:8779 with SMTP id
 x12-20020a0565123f8c00b0045dcb2a8779mr7745769lfa.499.1652556729330; 
 Sat, 14 May 2022 12:32:09 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 f13-20020a2eb5ad000000b0024f3d1daedfsm896630ljn.103.2022.05.14.12.32.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 14 May 2022 12:32:08 -0700 (PDT)
Message-ID: <93181c1d-16a7-697e-976c-190b1c99f2c2@linaro.org>
Date: Sat, 14 May 2022 21:32:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Govind Singh <govinds@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 <87zgjl4e8t.fsf@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <87zgjl4e8t.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_123213_442937_D71F9E53 
X-CRM114-Status: GOOD (  12.82  )
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

On 13/05/2022 17:57, Kalle Valo wrote:
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:
> 
>> Interrupt line can be configured on different hardware in different way,
>> even inverted.  Therefore driver should not enforce specific trigger
>> type - edge rising - but instead rely on Devicetree to configure it.
>>
>> All Qualcomm DTSI with WCN3990 define the interrupt type as level high,
>> so the mismatch between DTSI and driver causes rebind issues:
>>
>>   $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/unbind
>>   $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/bind
>>   [   44.763114] irq: type mismatch, failed to map hwirq-446 for interrupt-controller@17a00000!
>>   [   44.763130] ath10k_snoc 18800000.wifi: error -ENXIO: IRQ index 0 not found
>>   [   44.763140] ath10k_snoc 18800000.wifi: failed to initialize resource: -6
> 
> So you tested on WCN3990? On what firmware version?


I run it on a Qualcomm RB3 board with Qualcomm SDM845 and WCN3990.
However on that kernel I did not manage to WiFi actually work -
regardless of that patch - so I would no count it yet as fully tested.

It would be great if someone would provide some tests. I saw Steev's
replies - thanks!

Best regards,
Krzysztof

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
