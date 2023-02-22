Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F353C6379F
	for <ath10k@archiver.kernel.org>; Wed, 22 Feb 2023 10:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u3Qnh50P3KX0wY1LwtfNLw8zT8ixhudVRbtWFxRXIEk=; b=kmd9FgujWxRTyO
	DJ4Q4AesqtonvLK2yj4CmMe7/3nYN/e1OoiaI9QVz+ot+hQnHdXb8Zwyx384OiYfZJXcF90iAMPLv
	f95hBd32sWBQSZA1E9p0v/97o1s+0Ulmi/evuTTv/O6P2nPkkjJJSAL3hAtq0JtKUgkCqbb76fjqu
	VWrzNG3o1SXsGdo9rsg7jOGbASejE5dVhilqTOL0eqpJ+CSZIuyAk79DGP8+4/MWXbtAZFeMmQ8F4
	nn/OZBJeY664pZ4TLp4sHsJKhBhmye2COOyFrO/H2B4jQS+nmNhCoigEXN1cIzbixSTuH20HUbIt8
	in8LP5+pZp/xSFaUMfLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUmNv-00Bw8Y-7v; Wed, 22 Feb 2023 10:30:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUlse-00Bg9g-9m
	for ath10k@lists.infradead.org; Wed, 22 Feb 2023 09:57:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA0CF612FD;
	Wed, 22 Feb 2023 09:57:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF3A9C433EF;
	Wed, 22 Feb 2023 09:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677059863;
	bh=fazYg7qTznisnA7g2km7hrq93t29unz91OkcRJ7inDU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=hW8g7JbgkrzHrLoFa52q1sPdU/6b8fmnOeVE5TBpQ2KyuDUP+zL+Pm5dlqjNoW3j1
	 BcxaZquKk6x2pgJCBVRz4/RbyEA5m3ZI3L61yLS/V9oX/wQTBY8ZGegC0gxytf6ujz
	 AYm7iwzOz7lv6j39ubMSt7obke72yxOiq1zWYZPTKgZ/lg6HI+1EOvjvG1jylKBqgr
	 t4t1Q0jOspKQjKEFK11RZ9nrMzZU44+Jif3OMrxd9zBHt9FbEyBO2S4P/IE4B1z8Kv
	 OssPClXWs5HpfYvrpJ8V/H+Zf2CPTFRQV2KDuT5N2ukPtahT+5F60rRX8jmPVM+BNq
	 pwagfsZnqVGvw==
MIME-Version: 1.0
Subject: Re: [PATCH v2] ath10k: snoc: enable threaded napi on WCN3990
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To:  <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
References:  <20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: kuabhs@chromium.org, davem@davemloft.net, ath10k@lists.infradead.org,
 quic_mpubbise@quicinc.com, netdev@vger.kernel.org, kuba@kernel.org,
 linux-wireless@vger.kernel.org, pabeni@redhat.com,
 linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <167705985871.5928.5239693232532337781.kvalo@kernel.org>
Date: Wed, 22 Feb 2023 09:57:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_015744_477345_446C9A38 
X-CRM114-Status: GOOD (  11.77  )
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

Abhishek Kumar <kuabhs@chromium.org> wrote:

> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
> 
> Based on testing, it was observed that on WCN3990, the CPU0 reaches
> 100% utilization when napi runs in softirq context. At the same
> time the other CPUs are at low consumption percentage. This
> does not allow device to reach its maximum throughput potential.
> After enabling threaded napi, CPU load is balanced across all CPUs
> and following improvments were observed:
> - UDP_RX increase by ~22-25%
> - TCP_RX increase by ~15%
> 
> Here are some of the additional raw data with and without threaded napi:
> ==================================================
> udp_rx(Without threaded NAPI)
> 435.98+-5.16 : Channel 44
> 439.06+-0.66 : Channel 157
> 
> udp_rx(With threaded NAPI)
> 509.73+-41.03 : Channel 44
> 549.97+-7.62 : Channel 157
> ===================================================
> udp_tx(Without threaded NAPI)
> 461.31+-0.69  : Channel 44
> 461.46+-0.78 : Channel 157
> 
> udp_tx(With threaded NAPI)
> 459.20+-0.77 : Channel 44
> 459.78+-1.08 : Channel 157
> ===================================================
> tcp_rx(Without threaded NAPI)
> 472.63+-2.35 : Channel 44
> 469.29+-6.31 : Channel 157
> 
> tcp_rx(With threaded NAPI)
> 498.49+-2.44 : Channel 44
> 541.14+-40.65 : Channel 157
> ===================================================
> tcp_tx(Without threaded NAPI)
> 317.34+-2.37 : Channel 44
> 317.01+-2.56 : Channel 157
> 
> tcp_tx(With threaded NAPI)
> 371.34+-2.36 : Channel 44
> 376.95+-9.40 : Channel 157
> ===================================================
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8c68fe00344c wifi: ath10k: snoc: enable threaded napi on WCN3990

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230203000116.v2.1.I5bb9c164a2d2025655dee810b983e01ecd81c14e@changeid/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
