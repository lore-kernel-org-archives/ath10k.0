Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3667EE4993
	for <ath10k@archiver.kernel.org>; Wed, 23 Aug 2023 14:06:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SAcBRQyTD1TgTN/VIY4MLUqfJwLQj8GTPQRTGWRIII=; b=wWbcVFq+Velrsb
	6AB0jsX2tq7ljndKqRUjaRAqm8ATUCZVwH2dCAQKMIEaVVPciP2WkkN3ENW89DCmycYICPs7x2kKo
	60NZNOH98Xj0AhuoI53QRqTcjYo0WwscrQfqS8SiksGp7LujN4cmvMlNNJn+hGi+QIBHcojikEicl
	6iBfpX2vi6/nypGH4P/ndWwK05CBhtJQuxIgbiP1BsFEZnXfUOf2WCAR0YO0efB/n1ENxvGYluObI
	AwxyePHV5JuLL8SLaj1DTN6rLkFwqzsVDTG8ebrCNOf388xdXfFyc6TrS+dH10WgBU5T2O1AziUkO
	qxjXLM+FR0aMySHoweiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoUy-000o9M-25;
	Wed, 23 Aug 2023 14:06:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYoUv-000o8u-37;
	Wed, 23 Aug 2023 14:06:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 615EE61072;
	Wed, 23 Aug 2023 14:06:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C310C433C8;
	Wed, 23 Aug 2023 14:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692799572;
	bh=wn2siE3uN6pWAkKWnir+ZgoWOBFDb8FchTv2dj6tr9E=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=p8vyoehhyovBAx/1WHouvuktyN+2LcZUAWeO0ZU5xbHKnii9KFY2i+Oyv2wl/vuNE
	 NgC/PbRjxiGE7Uxan/r04XtjJU8falzd5iRx+qOekQ8IhIiSLXbXvAJwc/+0NiUNVg
	 ZgQUA8Cu55c3GXuvLIHspRBFQ0G7R/e/NyXew2QNL6ahTgo89W+JQd6PMRH5sgex3Y
	 8zFcczIHxvocs+P+lBXxJj5umKG3F7cZu8nDvnfBg86Bu/MtjpJNiWLmNgI0+U7Xhb
	 IJKLmRh523+pvV/Fy92ExOJVtYm4hDB3ff0VVyLaYnSXPWqYbfc/XKKGvhaJMitsfB
	 TniXGBWI6FrwA==
MIME-Version: 1.0
Subject: Re: [PATCH 1/3] wifi: ath10k: Fix a few spelling errors
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
References: <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath10k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <ath11k@lists.infradead.org>, <ath12k@lists.infradead.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169279956875.1241462.11254897741265211259.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:06:10 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_070614_043608_DE96B4F6 
X-CRM114-Status: UNSURE (   5.83  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Fix a few issues flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Acked-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

3ced39049d4d wifi: ath10k: Fix a few spelling errors
d68a283bfc39 wifi: ath11k: Fix a few spelling errors
4f1dbb4904c3 wifi: ath12k: Fix a few spelling errors

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230822-ath_spelling-v1-1-8e2698759564@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
