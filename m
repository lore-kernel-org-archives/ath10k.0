Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FE8DC7EE23
	for <ath10k@archiver.kernel.org>; Mon, 12 Jun 2023 08:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Y9rZrnuaQhr/vbz9IHsVUa/ZsAT4VjxN3AgrZXO19c=; b=oAjGtjrmL1JrDu
	XbFHcvHXgman67gvWheXIUxlgEBYX1ai4hCWKSth/3rYcKRg8TXg0Q1xnsEw5btepYlZ0nwpgQuvE
	DaMfhrYkjHFwyBvUfwqFmGroH1oILuzfRmrr4lZaYm8B26vMiXMVWLkck/IpQG/dSMwcTPCQtGoD+
	k3WwFlXC/a55dsvtMmrV99hnW1r/xdz2NH2AIzJ/gsy8Qb6+EuGik43qNPHZDMU1xQPn9fueIIkOl
	mM/PLKtsUB7Q97LO5M8cvrBoBvAH1ejJq9kdjNlSbKcOPQUSXtOredwdfzF1UvkPNxLqjYC1RkHdI
	GMbwyTAa4sgrgBVBK8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q8d7n-0038nj-20;
	Mon, 12 Jun 2023 08:42:07 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q8d7k-0038mL-0k
	for ath10k@lists.infradead.org;
	Mon, 12 Jun 2023 08:42:05 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-977d4a1cf0eso589106366b.1
        for <ath10k@lists.infradead.org>; Mon, 12 Jun 2023 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686559322; x=1689151322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NqLn9Z97H6qUCR5e4VRbV/fkvI7p6WynsZMjBmI9cNw=;
        b=N+35BL7PWpSboXRycO6wKpD7hz7h2rhvil78gLeY81mEACJCgjDQZqJ4TDbq6g3fLW
         6hjJSzlRTp41j9rPx7gh7KB3zgdKSH6KZ0oIW5QJlz6RmMfTnt9J8wAQB+fjsJ6NO5H3
         K7Ao8OfsMb3eehqnXF8GkWaLuw6J+Z6SqntOsxZWA99NwGJp2tlyE0m9Xvu8cmUsu6fx
         ZEHds7hQCSvy/piD/XiQBRjlKZUUegNkJyKQZEC1sZrdpfxd94zegAwP75eXb5halYp+
         kIk6SubT5xwN8EpKnzYOJHeErbEFpveS86wLdpPaKgeh6eBUEDW/TD4/8LSFaZvGymib
         1upw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686559322; x=1689151322;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NqLn9Z97H6qUCR5e4VRbV/fkvI7p6WynsZMjBmI9cNw=;
        b=Fl3SltRcg6aZE0V/WoXiFIQFLNBaMH818fW2ZDHdRR7Hj/wsvZP35YMgfboSKdHMBQ
         Q56NHpjqFznVh8ndna6r1PASPQQNZgj62FARzcZ59CoBAj57j5cCeYqTtiZ9VppF9g8I
         AxjNpmAyUvJHFr4Y4A/5skpjydj9hubEwgPD/JVwrlZ/O7PkbTaWXnsskWQmLZz1sg4S
         ajQgoO5yn/oVCUwoAWWA+y/FMYMtueIc0qLXYbBGzwDt0KQm+zcuAUGHnzygJbSpZYUn
         HN9209wUx0wEq/ei6dPjS2NPaxVGQerVfW+ZRX1a3AiKOhYBfCpJdVGsYwg/893FwgHd
         o87A==
X-Gm-Message-State: AC+VfDyVlorWfO4zvlJkcgFNSK9p4bsKGrkAztG0nA3bVX68mCO0aO83
	RbhbZg1R0PCdxuFYPkDI5NjtcQ==
X-Google-Smtp-Source: ACHHUZ4by/fBNXqrsLA2AMqwXNttwDsrsYEk8bmXT37szcY0HvEGsqbPAlWWEZOZa6tjTv0eqjfaOQ==
X-Received: by 2002:a17:907:3d8d:b0:973:344:6a39 with SMTP id he13-20020a1709073d8d00b0097303446a39mr9941744ejc.76.1686559322244;
        Mon, 12 Jun 2023 01:42:02 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id lr12-20020a170906fb8c00b00959b3c30f2csm4823007ejb.222.2023.06.12.01.42.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jun 2023 01:42:01 -0700 (PDT)
Message-ID: <bd95ab0c-402b-0914-0d3f-5309a63d8eea@linaro.org>
Date: Mon, 12 Jun 2023 10:42:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2] dt-bindings: net: wireless: ath10k: add
 ieee80211-freq-limit property
Content-Language: en-US
To: Christian Lamparter <chunkeey@gmail.com>, devicetree@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org
Cc: kvalo@kernel.org, conor+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org
References: <288fc9a0db6c292bc132e828611c41785b075078.1686486461.git.chunkeey@gmail.com>
 <c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <c33c928b7c6c9bb4e7abe84eb8df9f440add275b.1686486464.git.chunkeey@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230612_014204_274336_693962C4 
X-CRM114-Status: GOOD (  11.93  )
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

On 11/06/2023 14:37, Christian Lamparter wrote:
> This is an existing optional property that ieee80211.yaml/cfg80211
> provides. It's useful to further restrict supported frequencies
> for a specified device through device-tree.
> 
> For testing the addition, I added the ieee80211-freq-limit
> property with values from an OpenMesh A62 device. This is
> because the OpenMesh A62 has "special filters in front of
> the RX+TX paths to the 5GHz PHYs. These filtered channel
> can in theory still be used by the hardware but the signal
> strength is reduced so much that it makes no sense."
> 
> The driver supported this since ~2018 by
> commit 34d5629d2ca8 ("ath10k: limit available channels via DT ieee80211-freq-limit")
> 
> Link: https://git.openwrt.org/?p=openwrt/openwrt.git;a=commit;h=e3b8ae2b09e137ce2eae33551923daf302293a0c
> Signed-off-by: Christian Lamparter <chunkeey@gmail.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
