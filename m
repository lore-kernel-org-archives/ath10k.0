Return-Path: <SRS0=tAHh=PN=lists.infradead.org=ath10k-bounces+ath10k=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6306EC433F5
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 12:17:40 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37CB5610FD
	for <ath10k@archiver.kernel.org>; Mon, 25 Oct 2021 12:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37CB5610FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=denx.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9UW/tXv7l/mdGNgzEbYmlMG6sHMk0IdGVoYn8IAjyUE=; b=q/TnQI4K5k6LNgcSZvmCdALNiJ
	CHltVRH+Rp90izazja5ukYPW5SpqrFpKPKpOgsHiUgjYtKByusVVNTRz4i7Kt0nCrduC1qoj6h43T
	yvGr9QNZi6eJkP97n9y0gx//1nFEm78l64bHapT9osOG3hE8Fk4V/gB/MG20vxdnIQvWBKVLPH9Ec
	3OWvpwmLusvvuhHsbrfLwjaonpmchroULxf0kVOlGDmOhEs7NTD8T1zHvrv7O8a88x64DLeJ3T0sm
	+wnw9VPzQ/tEOKNuf7jZLgDq4t4z8jQX5gvBO2+f53peecnLr2FgR1PEUILQ94oqvNjO5DEaFrt+g
	8/IshXig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meyuO-00GNyT-9O; Mon, 25 Oct 2021 12:16:56 +0000
Received: from phobos.denx.de ([85.214.62.61])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meyuL-00GNwf-3F
 for ath10k@lists.infradead.org; Mon, 25 Oct 2021 12:16:54 +0000
Received: from mail.denx.de (unknown
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: festevam@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B29E383458;
 Mon, 25 Oct 2021 14:16:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1635164208;
 bh=/bi2Lna2q3if+ZR8iIXkezIgXIztKk7HdQozvn7cW8A=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=EVsSpL665IR13w58rNPUH6aO7jhthC4qeNUpwba0EGXliRXEsWCkgg0uHUwl815qu
 vr/pv9yHWpidrFqUciY3NRcJdrwVrLYMZLFdhLomYEmQFJaLFkgHc+ZS59PvhJUYm+
 +iR42X3rh2uxGTkAc/Kax+F/Vm6qO0+tb5w/a2AtKn6uYLSWgBeuhpPxQ/jjPY8oDn
 DPsNFi7bni1784DUKT5LPHxdKYEmtTI29TCrROIgLWugDrYSR66wkVLw8PL+zMGHW0
 bQkcy46BN+Taa61NF/tCljl0bU4RJG+S/jS0elJnsl2MgEp8FIEaXCOvOSqc29YNpB
 dgFPZyR64MB/w==
MIME-Version: 1.0
Date: Mon, 25 Oct 2021 09:16:47 -0300
From: Fabio Estevam <festevam@denx.de>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Kalle Valo <kvalo@codeaurora.org>, Alagu Sankar
 <alagusankar@silex-india.com>, Arnd Bergmann <arnd@arndb.de>, "David S.
 Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, Brian
 Norris <briannorris@chromium.org>, Wen Gong <wgong@codeaurora.org>, Tamizh
 Chelvam <tamizhr@codeaurora.org>, Carl Huang <cjhuang@codeaurora.org>,
 Miaoqing Pan <miaoqing@codeaurora.org>, Ben Greear
 <greearb@candelatech.com>, Erik Stromdahl <erik.stromdahl@gmail.com>,
 ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ath10k: fix invalid dma_addr_t token assignment
In-Reply-To: <20211014075153.3655910-1-arnd@kernel.org>
References: <20211014075153.3655910-1-arnd@kernel.org>
Message-ID: <82b2d5d74674379c3346c00ffb352c8b@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_051653_356389_527DEE8B 
X-CRM114-Status: GOOD (  13.59  )
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

On 14/10/2021 04:51, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Using a kernel pointer in place of a dma_addr_t token can
> lead to undefined behavior if that makes it into cache
> management functions. The compiler caught one such attempt
> in a cast:
> 
> drivers/net/wireless/ath/ath10k/mac.c: In function 
> 'ath10k_add_interface':
> drivers/net/wireless/ath/ath10k/mac.c:5586:47: error: cast from
> pointer to integer of different size [-Werror=pointer-to-int-cast]
>  5586 |                         arvif->beacon_paddr =
> (dma_addr_t)arvif->beacon_buf;
>       |                                               ^
> 
> Looking through how this gets used down the way, I'm fairly
> sure that beacon_paddr is never accessed again for ATH10K_DEV_TYPE_HL
> devices, and if it was accessed, that would be a bug.
> 
> Change the assignment to use a known-invalid address token
> instead, which avoids the warning and makes it easier to catch
> bugs if it does end up getting used.
> 
> Fixes: e263bdab9c0e ("ath10k: high latency fixes for beacon buffer")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Reviewed-by: Fabio Estevam <festevam@denx.de>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
