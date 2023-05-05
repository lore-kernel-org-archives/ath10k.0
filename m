Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A662C77B7C
	for <ath10k@archiver.kernel.org>; Fri,  5 May 2023 13:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdJ8xZhEYSSUXQrsZoQ0FHHjJ2gfMxjM94dW+zZCQu0=; b=ewVrd/FS92Qv66
	2fi6l8t4EfVNUOcZSL6PoInAHrHyQEAK+X5NjAoPZQMBfeJ5SoHv0kT4UARJ8X8sXkp6xEN8hdMLI
	ZzCvRVUdlUcjD4b/JR0nu+ST37Ovg5h1yGUYzGqakWdOGoqDecdQAX8S18D1VitgjdMtPcGDce2uG
	D81UHlTe3KQot6TKIB+fH1Q43aJKycsKjBb5AW7DucInpm27vfwwnJMFZXiabKKpQ9HaRXFT9iAUD
	xFyeKkWwgKHVknglBoWokNAM5YMAhM3rcnsekRopLcMSa4+J43q/9NFCoCRcmGxLsomWZtvVq6mjP
	4e2ZpV2WXvMOe50L5qow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puvfo-00B0jC-25;
	Fri, 05 May 2023 13:40:36 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puvfe-00B0gl-0I
	for ath10k@bombadil.infradead.org;
	Fri, 05 May 2023 13:40:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=klj6WyzfTmE6ZEwFgAOmwFx4RXycJwMdZUPgQqo4PrA=; b=NVJmMsWrxblpQ2f+xX5pPp/Fp3
	ZHRCQtpwTKgehFsBhLSX2qiEBosd2do1C01eHRRQRfwPRUj7gjWM8FaTIBC9F5St/q+7/OBNsjzVF
	tG2X0z/wG/5ik+1aRc/CGZfGip8TUaqNpfvyTZqA/bSqF8KwyL+nOq9rzVw5iTVN/q12kgkiLAWBf
	L11FJyWx/30+oCrCcEq6AP20Zixpon8l1T8DoLxJY+Yh4Zdw/x6s9QCfSqtA8UjPuOB7qDUmsVhW1
	21pXNflXMoLSv7Mw2mgcTtjQRTWbdFq7qUZCht55bsxSZg+Iyt2t1GIR+VtxYzglXJ12zeU35wG2I
	O25RgRBg==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puv49-003FlR-20
	for ath10k@lists.infradead.org;
	Fri, 05 May 2023 13:01:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 45F006140C;
	Fri,  5 May 2023 13:01:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31970C4339B;
	Fri,  5 May 2023 13:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683291695;
	bh=/jJRR7zmYd2NwUUaRgBBZHi/LSaazlrrBn7yHDLa/LU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=t/mbZcq+P0886LZVkw2H1mTTOmyup06UBoiSTdWhIW6Pn6ti/K1wrQluxmIYHiFX/
	 Z6FgPgYD8y39GyFjDQSwKPs5E9q8akELmhuy6/C30zOz6E6QbpX09JfjrNgpkBVJo3
	 v7n5MDbBuyMfZdrYXOk+WApl27ejJx/RxVFnvu3xea9Pr+Nw9Fsvdel9d9vurJuakS
	 CDMCra2j+xn6DXRQqMJJlRuDmxAFX5Y3Z2toQDTG4zyQH50hs+mXV04eFVZlzrOkiv
	 zq0mlLy21GDgKPClAGK8mSRk+kr1Q/I90ANi4oH4NLMHNqN76yucZXW6dY3nitoEh5
	 m6RzZgD6N6qsQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath10k: Serialize wake_tx_queue ops
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230323165527.156414-1-alexander@wetzel-home.de>
References: <20230323165527.156414-1-alexander@wetzel-home.de>
To: Alexander Wetzel <alexander@wetzel-home.de>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 =?utf-8?q?Toke_H=C3=B8iland-J=C3=B8rgens?=
	=?utf-8?q?en?= <toke@toke.dk>, Alexander Wetzel <alexander@wetzel-home.de>,
 Felix Fietkau <nbd@nbd.name>, stable@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.7.3
Message-ID: <168329168628.4336.2281740515872835038.kvalo@kernel.org>
Date: Fri,  5 May 2023 13:01:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230505_140141_923213_EFEAF916 
X-CRM114-Status: GOOD (  11.38  )
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

Alexander Wetzel <alexander@wetzel-home.de> wrote:

> Serialize the ath10k implementation of the wake_tx_queue ops.
> ath10k_mac_op_wake_tx_queue() must not run concurrent since it's using
> ieee80211_txq_schedule_start().
> 
> The intend of this patch is to sort out an issue discovered in the discussion
> referred to by the Link tag.
> 
> I can't test it with real hardware and thus just implemented the per-ac queue
> lock Felix suggested. One obvious alternative to the per-ac lock would be to
> bring back the txqs_lock commit bb2edb733586 ("ath10k: migrate to mac80211 txq
> scheduling") dropped.
> 
> Fixes: bb2edb733586 ("ath10k: migrate to mac80211 txq scheduling")
> Reported-by: Felix Fietkau <nbd@nbd.name>
> Link: https://lore.kernel.org/r/519b5bb9-8899-ae7c-4eff-f3116cdfdb56@nbd.name
> CC: <stable@vger.kernel.org>
> Signed-off-by: Alexander Wetzel <alexander@wetzel-home.de>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b719ebc37a1e wifi: ath10k: Serialize wake_tx_queue ops

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230323165527.156414-1-alexander@wetzel-home.de/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
