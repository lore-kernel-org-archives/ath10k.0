Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B1CC433F5
	for <ath10k@archiver.kernel.org>; Fri, 13 May 2022 15:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1AfTnodumUEvc0tkyXQJSrb0CGYNcvGInYAY0vRre/0=; b=ApsxOazzVHI/11
	MFpVa2Of9CdclBmKw0MMRsZ7RABQLVD9te1Q9BgjpvPabCak+qiwG4jehNSR8Dui7ubztp1wii4IV
	kzoS1OfFbLJOTiISHogkF2sOuulper4wIJyt80XEAIgltw15/2USM5XJQvWlP14y2e9U7WiRAdC5S
	vEqd+d/h444vtDQQ7Rj8dlVI8V/UjZey4Tdw3B/xbE0RZ6wvzKPqt08Xre1JBA1IxtqYS9DPKFMYr
	gxte1yEINf0uxfIWsREiokMmiCLC4ne0WFa/rWGpMoz98PTGmtMqmQXkprsuMbQVG0m4Xjh+z1+5d
	9KFDk4xNGklj6uPqldig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1npXfZ-00Gmdh-Tv; Fri, 13 May 2022 15:57:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1npXfX-00Gmd8-KC
 for ath10k@lists.infradead.org; Fri, 13 May 2022 15:57:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F28DC61D0C;
 Fri, 13 May 2022 15:57:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D57C34100;
 Fri, 13 May 2022 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652457450;
 bh=inFWBKZ2hLGY2XuT1PW3OLXnYsuMwC9oDE6tzFgnnbY=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=l3lnbu8RQyakdlKidWtlRtKUk/OPBmDr34NuMgc+l/K8Yv7KoZfFFfox58XAvT00O
 V0+5mFRHSXYwOihOKacp9N37ZyNHgX3PQXgMM0xn2F/mdm+9Tdj3vi57mcg5TxtlQ3
 TBBZ5ZvzAHg/3CX+3HGFb8fYD6HQgm0A7jd5dAP9rgbHTk0JdpodmuCJzx8pjG+XpD
 /woHIaW9aNAvclnuUKfLUQt9IQiYBLlR/4iAEv16eP8uIBRsZXwSqnrV9xM3HnqGHe
 j+0Nap862r7n2MEtSxO+LFc1fs/rB9YRY/MCvuTFdbvL97lmO/rwcX8AUCDrYzfmt4
 wS0SU6x/ey6Bg==
From: Kalle Valo <kvalo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Govind Singh <govinds@codeaurora.org>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
Date: Fri, 13 May 2022 18:57:22 +0300
In-Reply-To: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
 (Krzysztof Kozlowski's message of "Fri, 13 May 2022 17:15:16 +0200")
Message-ID: <87zgjl4e8t.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220513_085731_737473_E8332BAB 
X-CRM114-Status: GOOD (  11.34  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> writes:

> Interrupt line can be configured on different hardware in different way,
> even inverted.  Therefore driver should not enforce specific trigger
> type - edge rising - but instead rely on Devicetree to configure it.
>
> All Qualcomm DTSI with WCN3990 define the interrupt type as level high,
> so the mismatch between DTSI and driver causes rebind issues:
>
>   $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/unbind
>   $ echo 18800000.wifi > /sys/bus/platform/drivers/ath10k_snoc/bind
>   [   44.763114] irq: type mismatch, failed to map hwirq-446 for interrupt-controller@17a00000!
>   [   44.763130] ath10k_snoc 18800000.wifi: error -ENXIO: IRQ index 0 not found
>   [   44.763140] ath10k_snoc 18800000.wifi: failed to initialize resource: -6

So you tested on WCN3990? On what firmware version? I can add the
Tested-on tag if you provide that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
