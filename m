Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91E38606A327
	for <ath10k@archiver.kernel.org>; Fri, 27 Nov 2026 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=tZNnWWAw;
	dkim=pass (2048-bit key) header.d=8devices.com header.i=@8devices.com header.a=rsa-sha256 header.s=8devices header.b=M5iJzaTF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=; b=tZNnWWAwFf0A+8
	0uEjdKVXrJbC36iHHxAw4yHVlL0PzdWuhX9Z9My5enbVoz3mtyFPUFo60ynT7r0huFc1sHvPziRnN
	k9nLfbJsnJMWlGaZLRaKD8InDrMrZrotodj+XsIRBW8MQ42U1aZsmAP3GPnfNwTpYOATcyuM3EGqL
	xCe+uUslBxYRLDtBGr2ZxOa9r1F5QSfdrsqhfvRzZ/e0W4G3w/q4FR9TZMpp07+xBIxGitFnVaTcR
	HTwvDASyjp81A1lmujlYkoxze3ekFq16Xo75VoVxOpXmY/+0AW3LPEWGcvFJpDdj0RTCUoQuUTpfm
	INR+L1dapO0Qo1cHQ2CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw4y-0000000GHV7-36xd;
	Fri, 27 Nov 2026 13:33:32 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWw4w-0000000GHUf-0Ieq
	for ath10k@lists.infradead.org;
	Fri, 27 Nov 2026 13:33:31 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-c4322d310e7so373352266b.0
        for <ath10k@lists.infradead.org>; Fri, 27 Nov 2026 05:33:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=8devices.com; s=8devices; t=1795786408; x=1796391208; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=;
        b=M5iJzaTFs5ZKegra4O7wsT0M6+KZ6xEUuR9hqpHTKcikZzin2g9SaLck0tb+5VVoFn
         XmZO2ovOuZvP2id/2zx1gwF1Qjz9SJrXltTvUOXTkayj+qpGGBnR5W67JkOfp43eDmFA
         rcYDT02ox7z/EcQaedp2WmDI60xmzistFPEzbtHZYoGw71MOeKsJf3lLbX6SUrtDd2gy
         /RcdHMeyIHKasuJnok+m+SwgPFtatNd+IEX5GLKZyJOz0+mF8NJvUdildadg5yl8ldxa
         F1wYwmKPIR9TQ4tYLOg4U/sZLXqOfSgPr2r+aRJuVxom65TV8kxXBHx2rEb/Hinktpa0
         JSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795786408; x=1796391208;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fkhXrSoo6SmjstzLtiB9ByiPrCU8LhrgRp55NAhAc8g=;
        b=UgPThMyC4VYUH5ij+kcE/VfANyqrzeH7pf+suif7WQXe350QFEWjzKhA0uoqRDztj+
         6abVpj43EOsbqIxMObqpXuWRTONLNWE77rc++fkdri0lb5MfKyP69yjBSF2IaTukt7kB
         lj2dyEZ9kXK2VObTG1Xdl7wugK73191DEGoxicCY5uZqvXq8Ws5Yo/nbmZFwZzwRK7Cm
         uLvs71uucuKtUvu4OVniEI7hNYuWybNHr/ND92AgVG9fVqHoO8dTW5rZqOhkz2cx/b/8
         OaEwEc2GvBa8tlA69xtDx4gdzU/C7oNt8rBlcg1YSDVOu9kmeBskyXS/KafX4/ZhMkim
         CBfg==
X-Gm-Message-State: APuU4Z+JVdjspmdmV7beCIJ+wywj2r0+s82luEAJUE+xqqIlSj4al+p2
	DPWDZz2oUNhG1BPXd80kh51YuKyhxsShr1fCf9w3O8YPnAubXKUmZgSLGr2dpCZbtXk=
X-Gm-Gg: AZFdTZfUxQZq9BJQOX46kyVtR/vScPYfaZeIeunbxRJ09hHFjEgtBHLQ7TkZyXkUDH4
	ftTLX+K1hwwOKzpMXUfziRHRYV/093ee1EweMMq7+pGASxt8rizJlMyqENJZ5roWDlHMfijysWJ
	ZucA9e2eyMPtxFISq5lJalaNJnasxrlK59/5ssqVmpm3QvYNWq+71tmh3lahTYVIHbthp2cFue1
	7cy9/kNkaOFzZqKPyqwSR680Dg0miUW0IcKduOj6pguDD4VqvyJvZM0mrtrinA/ftccGqB9QTIG
	1CqxRNL2fJIDRev8UundA4NnY4ZOQ70gSVZEXZi8MW9zCknjBM/lQa/mAp/Xzk1PCw4Uxgi43RZ
	ncczTjI2BxcjkAL0qttdM7U4S74W4UGCwl5u7pltFKDCwmh7P+KyO4wH75A7vTQ7Y+bddOsRhVY
	uIhtKm284ogU/zp0bNnXEHtC+YVP3FhjVBbUTqC/ayDvDFBIoZTwW5UkKns1VZAitAiIDSi70gg
	VR+vPaIUcVFFNoLKtRw3QV7DxCD/U5ppDhLN0933Ihyq9nFT6mhaRx15fZSG/cpBlS2t4vvw5HA
	5Ta3hg5nk3i9om42Gu1H4MCW2b8vpFdDK5g=
X-Received: by 2002:a17:906:3896:b0:c48:1977:e1bf with SMTP id a640c23a62f3a-c513aae225dmr1384824566b.24.1795786408121;
        Fri, 27 Nov 2026 05:33:28 -0800 (PST)
Received: from [192.168.100.86] ([84.15.37.222])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513b030ed9sm880006366b.86.2026.11.27.05.33.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 05:33:27 -0800 (PST)
Message-ID: <a7eeafad-5b49-4ff7-ac4e-38a7f67eb661@8devices.com>
Date: Fri, 27 Nov 2026 15:33:27 +0200
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: tomaspaukrt@email.cz
Cc: ath10k@lists.infradead.org, jjohnson@kernel.org,
 linux-wireless@vger.kernel.org
References: <20261114090737.64348-1-tomaspaukrt@email.cz>
Subject: Re: [PATCH ath-next 0/6] wifi: ath10k: make USB support work for
 QCA9377
Content-Language: en-US
From: Andrey Bondar <a.bondar@8devices.com>
In-Reply-To: <20261114090737.64348-1-tomaspaukrt@email.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_053330_456369_D5D067F1 
X-CRM114-Status: UNSURE (   2.41  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Reviewed-by: Andrey Bondar <a.bondar at 8devices.com>


