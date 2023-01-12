Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF96C54EBC
	for <ath10k@archiver.kernel.org>; Thu, 12 Jan 2023 10:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0EiciPy6GDZDoFsAt2Jw8fsc9J737z+Ps8Q7Eo9lf2A=; b=N/1oli65vD+X9E
	QylhPZPEH6SJWza+2tK0VH6c5J7mfmNQiOWYZZYlv5nKDzOarh+cqFCutAH1+IxIeb5xYlm1NkfSW
	hhtAS3YynCxgkOqL9iTkSsC1NnniJpygc/sBQomHf9073Ao/iMdgTLI5K5waR6IXPf4BAOM2Djydv
	TX/yZpMMlVKupr2KE920VlNDpFkg97h7vk7pXG/2WdJKOzG1tgAnLppVkWage5HNacvlfsSqOFda/
	hJYtLPgxCFK6oryVmQ6nNePE9f/vdj1h2UKoktDq0KASMU/coQR6xed620gBBUJsUCaTx+5u44ysi
	aNnDBT9sR79tmg2Q6Vmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFucn-00EXfD-6s; Thu, 12 Jan 2023 10:15:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFucj-00EXe7-2U
	for ath10k@lists.infradead.org; Thu, 12 Jan 2023 10:15:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7212161FDB;
	Thu, 12 Jan 2023 10:15:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCBCC433EF;
	Thu, 12 Jan 2023 10:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673518551;
	bh=eZSAfDKuRBo0xGVikbboiQneetQV4uSvYjwwu4EYGa0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=WyHIKPds/xpQeQuBcbJcgTRVOWErVVr9bdlytmSVrh8GXxP84ll9AGmqGGdZ9hCR3
	 nzkwBoAxRLsYKBhMa5rvZhg6LUbHNhDc1eDEkO7E8iOEVT4Sr421gJlWPvyR/9kChw
	 /tQzlqY8OCLcJ9UL9sJfZryQbVNxD5Zc3dFv7aivqlGkfR6XBb2Jjm0HSksIXH4b5z
	 Hs8FP8OeXz+pyzN2Q3i9WgfRHz0OKiwsk+WJgiWu/bIl3G8Y8lAv/t5k+93Nh+rl0H
	 DIPCYmLJ1MwL+7au6LbsizTKzRQs47Oil/CbPkeNvIqvdljdK+4LKVt0ZDR615CWne
	 v+GFMCyekccUg==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: Manikanta Pubbisetty <quic_mpubbise@quicinc.com>,  ath10k@lists.infradead.org,  linux-wireless@vger.kernel.org,  linux-kernel@vger.kernel.org,  netdev@vger.kernel.org,  "David S. Miller" <davem@davemloft.net>,  Eric Dumazet <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH] ath10k: snoc: enable threaded napi on WCN3990
References: <20221220075215.1.Ic12e347e0d61a618124b742614e82bbd5d770173@changeid>
	<56d4941a-ad35-37ca-48ca-5f1bf7a86d25@quicinc.com>
	<CACTWRwt7oQrCyHf=ZF6dW8TtRhOfa14XMZW39cYZWi4hhszcqg@mail.gmail.com>
Date: Thu, 12 Jan 2023 12:15:42 +0200
In-Reply-To: <CACTWRwt7oQrCyHf=ZF6dW8TtRhOfa14XMZW39cYZWi4hhszcqg@mail.gmail.com>
	(Abhishek Kumar's message of "Wed, 28 Dec 2022 16:01:38 -0800")
Message-ID: <87tu0wcb3l.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_021553_490562_E0DB5169 
X-CRM114-Status: GOOD (  18.57  )
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

Abhishek Kumar <kuabhs@chromium.org> writes:

>> > --- a/drivers/net/wireless/ath/ath10k/snoc.c
>> > +++ b/drivers/net/wireless/ath/ath10k/snoc.c
>> > @@ -927,6 +927,9 @@ static int ath10k_snoc_hif_start(struct ath10k *ar)
>> >
>> >       bitmap_clear(ar_snoc->pending_ce_irqs, 0, CE_COUNT_MAX);
>> >
>> > +     if (ar->hw_params.enable_threaded_napi)
>> > +             dev_set_threaded(&ar->napi_dev, true);
>> > +
>>
>> Since this is done in the API specific to WCN3990, we do not need
>> hw_param for this.
>
> Just so that I am clear, are you suggesting to enable this by default
> in snoc.c, similar to what you did in
>
> https://lore.kernel.org/all/20220905071805.31625-2-quic_mpubbise@quicinc.com/
>
> If my understanding is correct and there is no objection, I can remove
> hw_param and enable it by default on snoc.c . I used hw_param because,
> as I see it, threaded NAPI can have some adverse effect on the cache
> utilization and power.

WCN3990 is the only device using SNOC bus so the hw_param is not needed.
It's safe to call dev_set_threaded() in ath10k_snoc_hif_start()
unconditionally as it only affects WCN3990.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
