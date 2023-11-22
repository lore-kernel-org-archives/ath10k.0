Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91644C61D9B
	for <ath10k@archiver.kernel.org>; Wed, 22 Nov 2023 18:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EifrOSNpn1NtjIb1b700s3JPsn4ZqJFsw4aK4jxsRRA=; b=1LuT2v2yj3oA8r
	GEDgnXhqRLqsmdzS4Fmb6H278YFIAzjsc1Lo1mu6xhl7mjHZJtma8WUGFLzmKxPPzPbz5p8ThY4ob
	BRNr1X0/ddFzJCcMylz9Lz5W+/KEeR12yJb0KSFvYbaxlJJ6TWnT76zSW/fVJJnLobYcUu7RDTNdy
	uyc+qhc0fQMEFoKD3hWZK8OhRDuk8vTi1l3uqWrKI8mDcilfIOfT+1cQVJOzkXMgkeTGIA0edPiNe
	RwmomTfPHv4hrRrNJfviKShH6zBhAY1f5tc0eRP4kLwZ+rHI4sOAjGlD08GIOTJbhUPD83096m1x6
	iTiWT/uCTAQ0rLCclzxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rsH-002oCw-2D;
	Wed, 22 Nov 2023 18:22:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5rsE-002oCX-2P
	for ath10k@lists.infradead.org;
	Wed, 22 Nov 2023 18:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8E50361EB2;
	Wed, 22 Nov 2023 18:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17796C433C8;
	Wed, 22 Nov 2023 18:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700677373;
	bh=BN7rd/tFqCbZXrOesCyWAkSFr6Mf/2JkzS1pjZzr/EI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=CQgVo1J1VdjQa0NfgheujtzrBa00ttQsAMm8T2MeXE74ANXCBsS9vAJbdwSsbiFYq
	 ZHXjBlZlaIQkyum9GA6jtkC0R8Q0eSSX/DwGFQyPlO6oJZgPriMcCNJiBS4yG6Geze
	 uF7Vng7pn+bDHMLBsZNPWAHhO8fHwOtOGDyrE84D5/4ES2AcpvduuIECgmMz6buc+g
	 bor25aDTNti3diNxO+qzyrQteX4mvYuXlVyTDOyzd4t5Ratwg1yQFl+gj86QXzjI9L
	 3U15gQt1tx8v/VID+ERyMRyVW7ioUf3U+Rhq5OrbRVkyT/48uFVq7c72m5nUVTmnKD
	 mZ2X0aXq9TFUg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: simplify __ath10k_htt_tx_txq_recalc()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231102115459.69791-1-dmantipov@yandex.ru>
References: <20231102115459.69791-1-dmantipov@yandex.ru>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, Dmitry Antipov <dmantipov@yandex.ru>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170067737021.158537.658295083023097640.kvalo@kernel.org>
Date: Wed, 22 Nov 2023 18:22:51 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_102254_853432_4931FC93 
X-CRM114-Status: UNSURE (   4.56  )
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

Dmitry Antipov <dmantipov@yandex.ru> wrote:

> Since 'ieee80211_txq_get_depth()' allows NULL for 2nd and
> 3rd arguments, simplify '__ath10k_htt_tx_txq_recalc()' by
> dropping unused 'frame_cnt'. Compile tested only.
> 
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

08500f6eaa91 wifi: ath10k: simplify __ath10k_htt_tx_txq_recalc()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231102115459.69791-1-dmantipov@yandex.ru/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
