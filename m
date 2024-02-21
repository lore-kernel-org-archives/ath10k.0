Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC367C5478A
	for <ath10k@archiver.kernel.org>; Wed, 21 Feb 2024 18:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6eaQTcUoeKL7PqXkEqP+E59DQs9+SQ8x5ErceTOTabM=; b=geUo7WDXDLdTY/RXNaDSDdCarS
	L9Umq8qWsJ6y2tH2tK2AsLOZQu40J2g1sePzsyPzFiYRRtDsT4SY5RTiu+8LyBtoV/AuMLZ0Y2kcz
	MlrsDI/+jAqhSky3WJAV46ccd4sY9Lu+OvS7LpxHOmQvZPeDDgrLYGZQ1XBs5/4jeNYhp+qTxe95v
	/+Cdf0/CfYYf85+zUqgN6k20G7Y/YByqt1Gv4E1GP7xM0KBBq1BFD0TAFG7AAPIn++3ktRPHhAB0R
	NKXn7TPbp3Uk4vrmnKajiTrjJpNsnYDFBm3zTRn/rtWrMLRiPLKJyXVhwHHhQUTdSbDUfJzwm3UBn
	w/ShyaNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrcu-00000002Axg-0ZIl;
	Wed, 21 Feb 2024 18:47:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcrcr-00000002AwX-0fNH;
	Wed, 21 Feb 2024 18:47:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D3B89CE1F52;
	Wed, 21 Feb 2024 18:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60FE2C433F1;
	Wed, 21 Feb 2024 18:47:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708541240;
	bh=gqoAm28ysMhQcEAAi5Gh3dH2gq6BWAr+ceiJbrjqTLw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=B4a49GRxpgPJI2ECisO/VeUOxKUutVCrIW4oXYFeemxKREmjO4ZIBHQwmxTMuu7ir
	 yWvYvDsaJBjexF4S7mUZpUOzTsS4NBr+uTRcHfInbw1OBtpPytvT6RIXETNCb5mO2/
	 /ChAOFz+Ta+Fw2oFV9YNv+LwyTnbZtw/mLHJtUuZ5PP04y9iCQvrqGuxGNCIlA0gef
	 iva8GpSCKQ3C9EX70Hz6GpvLL090bHj3ALKDJizvIKsbiisDEGG+77r7Srefr+nnCL
	 4xQNz+H+8cDIc+jFSuE4U2l+Td9+nXv6AFe2X8YOiD1eUFTSKDOrEmViJtR+l1tAhL
	 Ns/2jC9pyTBgQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [1/2] MAINTAINERS: wifi: update Jeff Johnson e-mail address
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240217-update-maintainer-v1-1-1426cf7a8bb1@quicinc.com>
References: <20240217-update-maintainer-v1-1-1426cf7a8bb1@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath10k@lists.infradead.org>, <ath11k@lists.infradead.org>,
 <ath12k@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170854123612.1848588.403515299525075943.kvalo@kernel.org>
Date: Wed, 21 Feb 2024 18:47:18 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240221_104725_935466_A308AAF0 
X-CRM114-Status: UNSURE (   5.64  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> I now have a @kernel.org e-mail address, so use that for my
> maintenance activities.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>

2 patches applied to wireless.git, thanks.

27dc4c6ee5fe MAINTAINERS: wifi: update Jeff Johnson e-mail address
1b7d9ab3e666 MAINTAINERS: wifi: Add N: ath1*k entries to match .yaml files

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240217-update-maintainer-v1-1-1426cf7a8bb1@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


