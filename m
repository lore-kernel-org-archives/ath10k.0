Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6278DEB64DD
	for <ath10k@archiver.kernel.org>; Mon, 24 Jul 2023 19:38:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:From:Cc:To:MIME-Version:Date:Message-ID:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=P/M6QVpEdM3uGfngcdvqBK3uujmRmUC/pixT11Zc8hM=; b=TqUcdQHglp99zqzCkzdUvhw8n4
	PDt25QdLZndSJdAY/ZZHFl6z+N6a32ZvxA0Eopc/FTdeXrB8pYS5PgRVh8omoaru7f9wiWx1g8zA3
	igrbSO30MHHKyq9mK8yKE3vH27lyjm3EEVsus/5UkuTN1Hoqw1tEnKq4xMc/H0oyh6GxvOKgVHrWJ
	LuxCO8RMPGTbTDhqkqGrxNGC233KG8SuQMpgpb+xT0zx8ooDh7p0DUR5oj+iHW50Hd4rFMrXmqzej
	Alemv2RpgWmyGPOHrnL8nhvH6G/A1F9uDiLJ77KeEVEJ6oEzhuKd8WPfTnDpKRiBku4phUgmXisNM
	mzk9RYBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1Nw-005JSd-1H;
	Mon, 24 Jul 2023 19:38:24 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qO1Nt-005JS4-02
	for ath10k@lists.infradead.org;
	Mon, 24 Jul 2023 19:38:22 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b700e85950so67272151fa.3
        for <ath10k@lists.infradead.org>; Mon, 24 Jul 2023 12:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690227496; x=1690832296;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BWTiUez8iThFAWg0nLkMds+yVAsUycesPJt3FdOpRN0=;
        b=YguxSR305lTNeez3fQiiu+Wiy+4ige7/AHPJMfCL5GJSNP7few/nhZRhAabzcG1c/r
         NyRYt+hm+e6blaMBhxeRfNS9uD4xTki42dVAnaakxyQsDyom1bL+IaWl1P4lDZMDKNOT
         B0WCSO4DspQ4pq1Irofj0AtTnYgqRZVk5uJoTdPcY04Ffj9XPD56QXaxtuawvr/fkjSr
         IZkNhW0c3yfAyhxkDk93X66ZRb0Os07LntLA79NZMp2l4kelfxX2jrQD1t2BIxDIh+Go
         jJldh3DNRioueDtGP2FlSe8AkVQZFs0I4D6KLgKeuP5zH6VBSQIMQ+IpkFz8EY5jPAS3
         Thyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690227496; x=1690832296;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BWTiUez8iThFAWg0nLkMds+yVAsUycesPJt3FdOpRN0=;
        b=ZjTmfVgaamEcUBiUqN3tSphfE5/gAH/m+Cc0fpFsTSg1CDhQdwQbbJie8d250eK7Ej
         BVaORG2j2eSBNgMEYWNDRDR69rqh308HyvPPrmIjgbbpo+B462wtuIRoOJEv8oBTM2pa
         Sq/1e8XSq6IZRYZnADSNb898oYTVTmgXyOvfXNqVrYR7Dj4A83Lqyxj06mY2UoxnQSQo
         CJc2Unfh7MJ18HjLAZUGLvZh/Smm6Nggw2vnGWNtBUoCn7A/KRuyZkexKNDp12J6Heij
         RHoLvH3BCW4mOkq/k4aRiCMJVzXC9P/nyfUD0N4Im2M4SleCcyDjr4lWvsBbTAULvQmC
         BY7A==
X-Gm-Message-State: ABy/qLYORapcxKqOFYEfGTPy5VX8Ne+h20+NDO7slarDc1w7+dDEzslG
	hfFpDWEeLZ9QrXhixcQ6JN32bWfoHRtUfuZSCfe2yA==
X-Google-Smtp-Source: APBJJlF3cp/ESYIG71PQk8ROjN8Z3rFHCG0drPHLyLA365OJoaUGhJmweFZpAlv70aWdvuyl0budPg==
X-Received: by 2002:a2e:9649:0:b0:2b7:14d4:ce6d with SMTP id z9-20020a2e9649000000b002b714d4ce6dmr7290948ljh.48.1690227495708;
        Mon, 24 Jul 2023 12:38:15 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id z9-20020a2e9649000000b002b69b44fd52sm3070206ljh.5.2023.07.24.12.38.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 12:38:15 -0700 (PDT)
Message-ID: <22075892-6518-ba53-8021-9500d22e5722@linaro.org>
Date: Mon, 24 Jul 2023 22:38:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Content-Language: en-GB
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>,
 Kalle Valo <kvalo@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: wcn3990 firmware
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_123821_093717_39DE202E 
X-CRM114-Status: UNSURE (   5.82  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Hello Kalle, colle

Yet-another firmware question (I remember the standard answer of not 
using firmware not coming from your side). I see that for wcn3990/hw1.0 
we have wlanmdsp.mbn with the version WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1

We have got the newer wlanmdsp.mbn released under 
redistribution-permissive license (LICENSE.qcom from linux-firmware). 
The file has the version WLAN.HL.3.3.7.c2-00723-QCAHLSWMTPLZ-1. It was 
released for the ath10k embedded into Qualcomm QRB2210 / QRB4210 SoCs.

Would you like to update and/or receive the file? Should we still stick 
to the older wlanmdsp.mbn?

-- 
With best wishes
Dmitry

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
