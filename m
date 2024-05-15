Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754DDC25B75
	for <ath10k@archiver.kernel.org>; Wed, 15 May 2024 08:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nvz5SHo5nE7SvEfzip4A9aWoA+l9oApwHJwxYhnCiTs=; b=tavCraigatcBppcGgmLGVhTuUC
	X1gO2UDsu4tSuWT8mKap+M1NQYO9sx6FiVItiSOChxG28qC9CChjw0h/tRD2iQ6Vw4v4FqGHgV2dC
	vCIP14yalEhpbaN7d2lgvU5d83q8GzwKr878Q9Qy74DhNVHEq0O8iOi6dpNk7K8170f2LkK23Uqdj
	l9ozprH0RVeK2FLJgRwoOff//IdSr8FbsEMPpo+qNcZw3WfZJ104FsnRzIfhSxSRa74PUh3C0gr1w
	2rXzhpq4bGh4qTtuiRVwkIqnv8HmP4uPvnXX9R8voPnUltQmSY7vTjVjBGWqfUCXZ12z5kEUL9ujP
	xBCxnOWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ATz-000000011Ol-1WtN;
	Wed, 15 May 2024 08:59:31 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7ATw-000000011NX-3VAm
	for ath10k@lists.infradead.org;
	Wed, 15 May 2024 08:59:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EABD3CE13D4;
	Wed, 15 May 2024 08:59:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 370CBC32786;
	Wed, 15 May 2024 08:59:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715763566;
	bh=wrhjNhMt1xp79b7iWBTzWLqdX0VxB4XNriKu8JSvx7A=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=PhDIlP+aiGt58su60LswgrQBw2yVfWrQypyefTD2zTRmGwkeot72P85JQ/WHMN+VG
	 0Sr1jzszzJwV8sf8J2jKx5Y2i1V1mejk5VuuRDqRO9b/aBWEqm9k2TxOf62JFe5DTX
	 caZrJCXPqpRfhhX/RXZ1mNjt3duGrLSkTJWoSYWMbP3Y0WI+FA8uQeVYM7Jo6Q3YyK
	 U424J2buUMXG/iAPXHqxPfVIUtWj2ITzSR5rNqUcC5tu7W8up8A3B0fGttcL7BcG3t
	 a/aVdn+2agHYjRT4GH3AGwmVTKWNl3yIV3IicTIXkaKZtlpqJJwz0l6xTLRmybSLKD
	 DwAPxUxz72TJA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14] ath10k: add LED and GPIO controlling support for
 various
 chipsets
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230611080505.17393-1-ansuelsmth@gmail.com>
References: <20230611080505.17393-1-ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>,
 Steve deRosier <derosier@cal-sierra.com>, Kalle Valo <kvalo@codeaurora.org>,
 Christian Marangi <ansuelsmth@gmail.com>,
 Stefan Lippers-Hollmann <s.l-h@gmx.de>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171576356159.2271935.2917787444907693936.kvalo@kernel.org>
Date: Wed, 15 May 2024 08:59:23 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_015929_089094_6AE08C67 
X-CRM114-Status: UNSURE (   7.61  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Christian Marangi <ansuelsmth@gmail.com> wrote:

> Adds LED and GPIO Control support for 988x, 9887, 9888, 99x0, 9984
> based chipsets with on chipset connected led's using WMI Firmware API.
> The LED device will get available named as "ath10k-phyX" at sysfs and
> can be controlled with various triggers.
> Adds also debugfs interface for gpio control.
> 
> Signed-off-by: Sebastian Gottschall <s.gottschall@dd-wrt.com>
> Reviewed-by: Steve deRosier <derosier@cal-sierra.com>
> [kvalo: major reorg and cleanup]
> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
> [ansuel: rebase and small cleanup]
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Tested-by: Stefan Lippers-Hollmann <s.l-h@gmx.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

8e1debd82466 wifi: ath10k: add LED and GPIO controlling support for various chipsets

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230611080505.17393-1-ansuelsmth@gmail.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


