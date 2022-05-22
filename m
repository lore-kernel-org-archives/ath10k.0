Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 933EEC433F5
	for <ath10k@archiver.kernel.org>; Sun, 22 May 2022 12:23:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=c3Z09jg/GA51014Hj6w2/vZdaAvlLi8b0f9YQEejCGU=; b=XPTLhSgohDAthJ
	96bKfSILN1Z8dSjzZpQEGC9nDAnN+d7RT4mEGZ0f8kBe77pJWybEuESJ6nM8MmI/7TIJjVC8ToYmz
	q7EQ+t2mOrRDvktH+l1xmvJp0E+0wDQ3Q/DK2XO+PeVP9iaz9mhXOqwye0xo2E7bgfki8wTB0f21c
	6rsoheth6YLfeU3dkAeo+DezImG21YO4cBdTJ9kxv4HsBD3TR4X/umD86aOTh+wpoc98pWd0/j2B1
	SPgO9H5rdJMIQG+FZPI9fL/UO5M0e+awdjrdOYXZeroBkW/cDa+gsIiIw8XqVxVRdW630RA9kRqwX
	VPg1aOLnqBX6dzKeAvBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nskbU-001Ihs-7d; Sun, 22 May 2022 12:22:36 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nskbI-001Ich-Bj
 for ath10k@lists.infradead.org; Sun, 22 May 2022 12:22:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8C17FB80B34;
 Sun, 22 May 2022 12:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8980EC385AA;
 Sun, 22 May 2022 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653222139;
 bh=Mfo0m4hywKPiCkbJC9Y94IuwEqZd7gBdjqZR9nR3ImA=;
 h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
 b=oPLBRLUW8NAnzWitefrHXNP5m6s6TJXvVI1/cuJft5+KabX5BlIvZFC/mDwceWP8A
 0goICNZ0uEiVd3NfLswcqUTIq2ULS3Oo/xooWVY3o1vt1YTTE0PDpXOmAeGX0+aJSl
 KQdOL8aS6ET76aTf37oHSht1TaJwQxD2Ctj/zF2has+e5rO176lGOsBbSwTUAnFWjj
 wBWdYFTHD2pgiuku6A2o34SbwqFyfqB8BdNRujiTgR4nCMgoe9NoK3WsdO78Wqnchs
 /Ljpmm+wLyl0c64oFtbMHCTmW1GiQOqKofxvjMRplMefk0h/iJsvRwfdF9A1n4EVwn
 eUD62H5gc4eUA==
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: do not enforce interrupt trigger type
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
References: <20220513151516.357549-1-krzysztof.kozlowski@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Govind Singh <govinds@codeaurora.org>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, linux-arm-msm@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <165322213441.774.12044822958989724904.kvalo@kernel.org>
Date: Sun, 22 May 2022 12:22:16 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220522_052224_580159_D0855515 
X-CRM114-Status: UNSURE (   9.64  )
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

Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

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
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.0.c8-00009-QCAHLSWSC8180XMTPLZ-1
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
> 
> Fixes: c963a683e701 ("ath10k: add resource init and deinit for WCN3990")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Tested-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

1ee6c5abebd3 ath10k: do not enforce interrupt trigger type

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20220513151516.357549-1-krzysztof.kozlowski@linaro.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
