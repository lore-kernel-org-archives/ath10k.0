Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F74C433F5
	for <ath10k@archiver.kernel.org>; Wed, 22 Dec 2021 11:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkymcilnKV/InXJ3spNw4G1c4AbjJYqPsw0eMdG0KdE=; b=mzEcydJOJILYOD
	MYWFGSwc3hHMrKZjQLsnif1k2r99A7N7wUNRSf1/BV2KJS7XUKkswzSYhssrw1Cd0FO8bJLchr8HY
	1YrhAj3W9jEZTk6b1svixDd3zjflNBThUssj4j0LuBSkC+vRQ6orI0KWVYIIY+Tc0pTZuLZNhcmjF
	M6PxVrw9nhUZVvgXUFYyqHYfMGCFNCpI13gLIDmcFxEE8LJsQNZ5q7eYs8Z0tXkQoHvChccVxX14w
	eQJr/rVG5Kvy5O2c3Af1seHDOSlIReb5Sq2+aefTwqiU46s141EZ8ss0UohZdg4onm8fvSUvt85Af
	MSUxYvOFKSeDXMpKwBDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzzcL-00A5wy-Gf; Wed, 22 Dec 2021 11:17:09 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzzcI-00A5uz-P6
 for ath10k@lists.infradead.org; Wed, 22 Dec 2021 11:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sb5Qc+GscYGAZKT3zRpL2xaJQHjtFgXyZ36fz2qmxnw=; b=ACe/to6El0tOh9S8I205MWS2Sk
 QVLGBrcI2+PkfLP04iO6Q2ba03rWzH8vKJitQOJVwGzTY/MZYnfYjvN1g3VFossJlX8WGIX2SVFR/
 05gFpu1LOnKldKL7F1qr5b3l1YTAE8WNVjdooNqXePEkbUDM8WcReMVKYJBcXVlzWyrc=;
Received: from p54ae97a7.dip0.t-ipconnect.de ([84.174.151.167] helo=nf.local)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1mzzc3-0002Du-4V; Wed, 22 Dec 2021 12:16:51 +0100
Message-ID: <c156c75f-5797-917c-a8f7-ad7620903bf1@nbd.name>
Date: Wed, 22 Dec 2021 12:16:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.4.1
Subject: Re: [PATCH] ath10k: enable threaded napi on ath10k driver
Content-Language: en-US
To: Abhishek Kumar <kuabhs@chromium.org>, kvalo@codeaurora.org,
 briannorris@chromium.org
Cc: linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 dianders@chromium.org, pillair@codeaurora.org,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 ath10k@lists.infradead.org, netdev@vger.kernel.org
References: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
From: Felix Fietkau <nbd@nbd.name>
In-Reply-To: <20211214223901.1.I777939e0ef1e89872d4ab65340f3fd756615a047@changeid>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211222_031707_055427_73659667 
X-CRM114-Status: UNSURE (   8.18  )
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

On 2021-12-14 23:39, Abhishek Kumar wrote:
> NAPI poll can be done in threaded context along with soft irq
> context. Threaded context can be scheduled efficiently, thus
> creating less of bottleneck during Rx processing. This patch is
> to enable threaded NAPI on ath10k driver.
> 
> Tested-on: WCN3990 hw1.0 SNOC WLAN.HL.3.2.2-00696-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
The name of the dummy device should be filled in as well. How about
something like this:

--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -3576,6 +3576,9 @@ struct ath10k *ath10k_core_create(size_t priv_size, struct device *dev,
  		  ath10k_core_set_coverage_class_work);
  
  	init_dummy_netdev(&ar->napi_dev);
+	snprintf(ar->napi_dev.name, sizeof(ar->napi_dev.name), "%s",
+		 wiphy_name(ar->hw->wiphy));
+	ar->napi_dev.threaded = 1;
  
  	ret = ath10k_coredump_create(ar);
  	if (ret)

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
