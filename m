Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2B42C433EF
	for <ath10k@archiver.kernel.org>; Wed, 16 Feb 2022 21:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSo4AFILkkiUp1+xRT8JSPV8GfblofvHX1xW/BKPw7Y=; b=YCiGl4aUQxB2l8
	Vb7TQXaOMxXn8v/WQ5Ye1wi5zSloAMm9BbuXW+TsJ63Zw9qo4ZIRjp+f3eUOh7ILt2oDqfXdS8X6w
	2mberrAKAwGH0aKjFhu9FO6gETqVb+AFvB+MVTcLR4hLrZ+I8xeuKjvav0FpKVySULeeQXHHKKdlA
	6AEqOQoBVBQsYdhuHCPHzs4Zkv+uPRZFlaPND4K2S8n7j7tAyZwh0iAusuc6tYVPIc+E37fzLiVxA
	vEpenmVgqM8vdCyd0FoQN499BlSQdWg3rjC8LOEvsD1HmxFncJakErA228BqBuVBvT2+X9MrqUtDu
	GyIAC2Bk60ZInHef1BDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKRi5-008OGl-UW; Wed, 16 Feb 2022 21:19:37 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKRi2-008OGN-Rh
 for ath10k@lists.infradead.org; Wed, 16 Feb 2022 21:19:36 +0000
Received: by mail-ed1-x52d.google.com with SMTP id h18so6126217edb.7
 for <ath10k@lists.infradead.org>; Wed, 16 Feb 2022 13:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=eJjUepHMJ3XjQahPeLYVJZBCt2LbAJ4aSYQ6YGubxko=;
 b=DP/QUlXXfeSdvaRKWGaTlc/s7+ZUhVLvX/3c/4fdJGStyXeQaU1jElIqHVWGNMQC54
 nuroeJ5ffqSGp/e/lNI9mhobmCmgLsUhSWLSqQ6WOFKAAyo4boTA3Oh46Q4eHg8bxGyw
 Kz77Neo8vLJkADB25RB5Kgsy7keg7F7o8AGWRm/hXEl1gIMOQh2agSoRy/P/uNQMteKR
 TBJldYdkMDVUgU1W08HVzPeyR/oK5QWr2/Ktx7LC4tjHMtKIzkru+ANkCkwco9XzvbUl
 1on0ToQ4vm8Y9OZVvyhQYibwkmgghuWgxFMWb4mKFd0PDEc7c3YZfyvryVDP3o71uIm+
 P5VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=eJjUepHMJ3XjQahPeLYVJZBCt2LbAJ4aSYQ6YGubxko=;
 b=AsdIfGiqE4bwUmUM4EmVK8hAhAtPQ6nj51rORtJSSXc6noBBqr5nq/qUFXZTdpusIe
 CMiTOSP36FNxRpQjtTwepALbNWP13AI8Qmz2//s6GDQNq4lWy02dSXUsr2SVPYTjSBWE
 GOHEATfB+VKRtTYasPfmKUoaDx8r0UFBplai1alne65q247VwDs2xOKq4K9qIp54OYDW
 OqvvwQlb5CbZnRpX5y9X1vdynG/a8hYPHpcB5UFk/0hMIK/kps1h+AEbDV5hORj+Cbbd
 ytUeGXG5PQwovJAvg0UChWLWPwsw1mbAYW+kxK1rSX/CjNaSVMx5IjyIzLBpMDJVLeYK
 98Eg==
X-Gm-Message-State: AOAM530YojrA4sxXhHaka/fTJe3XR2kvh04ClQN/2dCx+6Z4NHDLWBKo
 P/HbfnNc6x7uo3Vg22CPLPI=
X-Google-Smtp-Source: ABdhPJzRG2TfWe37Jh6rpASb5zh3vWrjCq+6dAkgrboDf4ApNeLowDOsR1kV/dtbcxV1Zhw4ujwYkA==
X-Received: by 2002:aa7:d4ca:0:b0:410:d232:6b76 with SMTP id
 t10-20020aa7d4ca000000b00410d2326b76mr5105031edr.370.1645046372504; 
 Wed, 16 Feb 2022 13:19:32 -0800 (PST)
Received: from debian64.daheim (p5b0d7a4c.dip0.t-ipconnect.de. [91.13.122.76])
 by smtp.gmail.com with ESMTPSA id
 u2sm336886eje.119.2022.02.16.13.19.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 13:19:31 -0800 (PST)
Received: from localhost.daheim ([127.0.0.1])
 by debian64.daheim with esmtp (Exim 4.95)
 (envelope-from <chunkeey@gmail.com>) id 1nKRhz-0018wB-5X;
 Wed, 16 Feb 2022 22:19:31 +0100
Message-ID: <70a8dd7a-851d-686b-3134-50f21af0450c@gmail.com>
Date: Wed, 16 Feb 2022 22:19:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] ath10k: support bus and device specific API 1 BDF
 selection
Content-Language: de-DE
To: Robert Marko <robimarko@gmail.com>, Thibaut <hacks@slashdirt.org>
Cc: Kalle Valo <kvalo@kernel.org>, kvalo@codeaurora.org, davem@davemloft.net, 
 kuba@kernel.org, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, open list <linux-kernel@vger.kernel.org>
References: <20211009221711.2315352-1-robimarko@gmail.com>
 <163890036783.24891.8718291787865192280.kvalo@kernel.org>
 <CAOX2RU5mqUfPRDsQNSpVPdiz6sE_68KN5Ae+2bC_t1cQzdzgTA@mail.gmail.com>
 <09a27912-9ea4-fe75-df72-41ba0fa5fd4e@gmail.com>
 <CAOX2RU6qaZ7NkeRe1bukgH6OxXOPvJS=z9PRp=UYAxMfzwD2oQ@mail.gmail.com>
 <EC2778B3-B957-4F3F-B299-CC18805F8381@slashdirt.org>
 <CAOX2RU7FOdSuo2Jgo0i=8e-4bJwq7ahvQxLzQv_zNCz2HCTBwA@mail.gmail.com>
 <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
From: Christian Lamparter <chunkeey@gmail.com>
In-Reply-To: <CAOX2RU7d9amMseczgp-PRzdOvrgBO4ZFM_+hTRSevCU85qT=kA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_131934_944812_BEFD378C 
X-CRM114-Status: UNSURE (   9.44  )
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

Hi,

On 16/02/2022 14:38, Robert Marko wrote:
> Silent ping,
> 
> Does anybody have an opinion on this?

As a fallback, I've cobbled together from the old scripts that
"concat board.bin into a board-2.bin. Do this on the device
in userspace on the fly" idea. This was successfully tested
on one of the affected devices (MikroTik SXTsq 5 ac (RBSXTsqG-5acD))
and should work for all MikroTik.

"ipq40xx: dynamically build board-2.bin for Mikrotik"
<https://git.openwrt.org/?p=openwrt/staging/chunkeey.git;a=commit;h=52f3407d94da62b99ba6c09f3663464cccd29b4f>
(though I don't think this link will stay active for
too long.)

Regards,
Christian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
