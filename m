Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9335FC7618D
	for <ath10k@archiver.kernel.org>; Thu,  6 Apr 2023 07:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OxOlnecp9S37hV5zAfpZ0KIO8INPNkInoeZRtjJrrLI=; b=usOd7uwnXcg6+r
	BJoK5LpDNh66/ydDF5OSfSx4P6mBiWwUzQNodPFmIhx/Mt7EMh7lcDU7Vq13WYMFGjaT9Zs7HQYgp
	me/OGefDiQ7dG9NyEZpg25vVoWBoFntWZtCh2XyDYdEr5tLlzaG3O3O6I5vpdDPsWeca1PTiLQ9rl
	6xdr6ymwvwOLL6lnTZRIcTTTRhCenSKwrgj2OQz2iUpVmKc2VEZTKkVPs2cJbbbp8n2olZpwpFl1+
	/3xdez2zxSlhyJhe7Z18juwR5VPDSOwO+byp54YsV32cn3xOn/jPm1mNBRZnJoTNHlISs2uVllnGg
	E9HJ0hgKCGfQFT5wCQiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKWW-006gK8-1h;
	Thu, 06 Apr 2023 07:59:12 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkKWT-006gJP-12
	for ath10k@lists.infradead.org;
	Thu, 06 Apr 2023 07:59:10 +0000
Received: by mail-ed1-x52b.google.com with SMTP id 4fb4d7f45d1cf-5027e589e20so1144883a12.3
        for <ath10k@lists.infradead.org>; Thu, 06 Apr 2023 00:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680767947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eGOZy8VGjSJ+0BmelGLbUSEWfzbtc8+M0JiKbqs9pJA=;
        b=N9G4spykgdCCFRTeP0t+ub9hYU31XZs52jbiORIrT3M6P+ym5e2uaHZOmZBw1/WDWu
         baZy/UEPhDGMkehJveh1Mu+Khce4DDvvmc8U1i8hX4zLqaerboboiX6irXSsQN1JFYxn
         M5GLLDYqMs+2h2sSBlyRzhv6fUMyFSqtzs24z+sKVsRRHn26eykSjuJgIkNVMzxG+RXZ
         hyDVy5cjnG3vtksjzGRfq8xyNQNDG+Wd2sD0hLdkMq5qIrw4c/0sznC7yO/5AlVL2pcM
         F3SHCfiL2ubj8BWW7ckDNW1GL02kQhlbbc9xrSbAHBs7Hc/9AdgFqcM8uDzJGUSPO+/u
         gVtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680767947;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eGOZy8VGjSJ+0BmelGLbUSEWfzbtc8+M0JiKbqs9pJA=;
        b=jMVy/D1NNCq0WD6sK0pZZKTqHsteC5+sUvCINELO9/TkQMamnLF/y5BQmFGCgPoQSV
         7M7TOX8u5OdsIU3de13fy+pC8f7VIGikYhY53UpufthJkkW6j2RWMFpc1wedNwuhiY60
         5xGQ4dTGYHipza2ithRp1VghtiDRI0prK9Sq0FlsasZkn2xnqt+7eSI/KeTpPOIoWd2q
         byRKdnYYHiRvNtc0L2oLwAtIhMmOCFdMLwXbf6pprqDv4RQWWa1ihz9+gkXGjD/2rBB7
         D4v4COryo/cMGK2ntBmp9+CQqi+cbBiVXOYM1KHYEQ/vOSPlUoJITmOO/TUbfGgsQAoO
         2mcw==
X-Gm-Message-State: AAQBX9fiSGJ9FVSt4CFNoqmculkcr+5d1qsCfxMhbV9RsiyBiHWU2J4P
	7HZcjiwkNoNlGQBR7bxjtmmwWw==
X-Google-Smtp-Source: AKy350b1OxLYhmKxwlBHwx2zmsP1VmE6Ad6u8dVfEaQOoIeCNILRVP5Ym8zF9rUNNAkIPBP8KInS4A==
X-Received: by 2002:aa7:d3d5:0:b0:4fb:7ad6:907a with SMTP id o21-20020aa7d3d5000000b004fb7ad6907amr3913451edr.13.1680767946915;
        Thu, 06 Apr 2023 00:59:06 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed? ([2a02:810d:15c0:828:49e6:bb8c:a05b:c4ed])
        by smtp.gmail.com with ESMTPSA id t10-20020a50c24a000000b004aef147add6sm374853edf.47.2023.04.06.00.59.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Apr 2023 00:59:06 -0700 (PDT)
Message-ID: <7e1b0a58-55f4-8425-5d76-a5a3ace1edc1@linaro.org>
Date: Thu, 6 Apr 2023 09:59:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 2/2] arm64: dts: qcom: sdm845-polaris: Drop inexistent
 properties
Content-Language: en-US
To: Konrad Dybcio <konrad.dybcio@linaro.org>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230406-topic-ath10k_bindings-v1-0-1ef181c50236@linaro.org>
 <20230406-topic-ath10k_bindings-v1-2-1ef181c50236@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230406-topic-ath10k_bindings-v1-2-1ef181c50236@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_005909_387627_CC72FBFB 
X-CRM114-Status: UNSURE (   6.76  )
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

On 06/04/2023 02:59, Konrad Dybcio wrote:
> Drop the qcom,snoc-host-cap-skip-quirk that was never introduced to
> solve schema warnings.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
