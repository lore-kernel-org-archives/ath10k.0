Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B67C04A95
	for <ath10k@archiver.kernel.org>; Wed, 28 Sep 2022 07:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Fl5m5P5ixCxgZizZbcgfX2Z95Ke+zGaGPOz1QCDUqCs=; b=PuZrewXEFecT87
	9g/TzYx8Vxz7eiGZ0zT/yOoRtEb/u7ywhhdbrhim2jbrEIXmxob027i7ss7RKRFeFMzXgUGCxgQJh
	rkkg3t16tTAoNrrIUbVSkH45iktdgIIyTDXmY3tQGcIX2r4ut8WLjv70LDtm0EfsNGJoaycaV6B3c
	yFZaqozPrSWlOHr6E5sblxlw44N5lE3CnjszuHvCI34bh4aU52msulw/bHO2ezOBfTGcl9aUpjX7F
	Txc1B7fN8MxnyovNf5BdqdP+wC0Qg1F6lJFZfnBqNxiI+ZMH1ok/neCB14yZxM9Qkaq9GcLmtmn6u
	LsKq/Vg/ex3Ud+5EqBCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRlP-00Ee8j-2F; Wed, 28 Sep 2022 07:45:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odRlM-00Ee71-4Q
	for ath10k@lists.infradead.org; Wed, 28 Sep 2022 07:45:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0383561D4D;
	Wed, 28 Sep 2022 07:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22E87C433C1;
	Wed, 28 Sep 2022 07:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664351146;
	bh=pJgBh3O1N8VrHVzs3TOgoSqQkabPRSZAlQTSu/F1cZc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=WiJCFnEZ/DxQefElj+fuIlrxtSaXDBQU/1PgoseqLeLuyRk7oY9a2qOCiuNc/bdcb
	 HKGNPNqVv07luWJhZDgkJgaQcwfr7d7NfgVqj4Fy3C2zJdkZ+TD6eX15b+sroPtATG
	 DU6uR/TIcRolyBP3O5Ih7cfH3lHW32I5U6tLqmTaf0O36UdUumvRzHKWfBIctkgW0f
	 8fuQsZEHwqnikly+Ra7U2RPMtao/INkdn7nSBVR+YgLgXHPzzMEzU5RgsifhD4sPVf
	 WM+J7/ccf8FPz0OGi5wlTOZcKajifhAMRHwmAo9TugQPMWQTqv7IPcZ0Y19x/4NfiJ
	 6q5ZaDySoLdKQ==
MIME-Version: 1.0
Subject: Re: [PATCH][next] ath10k: Replace zero-length arrays with
 DECLARE_FLEX_ARRAY() helper
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <YzIcoloIQBDqGlgc@work>
References: <YzIcoloIQBDqGlgc@work>
To: "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, ath10k@lists.infradead.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 linux-hardening@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <166435114224.3623.6648213708704694100.kvalo@kernel.org>
Date: Wed, 28 Sep 2022 07:45:43 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220928_004548_245719_7F651683 
X-CRM114-Status: UNSURE (   7.25  )
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

"Gustavo A. R. Silva" <gustavoars@kernel.org> wrote:

> Zero-length arrays are deprecated and we are moving towards adopting
> C99 flexible-array members, instead. So, replace zero-length arrays
> declarations in anonymous union with the new DECLARE_FLEX_ARRAY()
> helper macro.
> 
> This helper allows for flexible-array members in unions.
> 
> Link: https://github.com/KSPP/linux/issues/193
> Link: https://github.com/KSPP/linux/issues/212
> Link: https://gcc.gnu.org/onlinedocs/gcc/Zero-Length.html
> Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
> Reviewed-by: Kees Cook <keescook@chromium.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

00d942e779c2 wifi: ath10k: Replace zero-length arrays with DECLARE_FLEX_ARRAY() helper

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/YzIcoloIQBDqGlgc@work/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
