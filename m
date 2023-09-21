Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC9B6E706FB
	for <ath10k@archiver.kernel.org>; Thu, 21 Sep 2023 09:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gh91PrJ4XiGBa/Ugi+t3EQY9j7HLcQr+HfKY6ENsQDU=; b=SpeCmOZQ87HFGP
	zDYPhv/bRrUW2NgeGLnyIkRzAf52Xlb74aZ/R2Ob3T5Ir17yG2ca+EHl+83CUA2tX5R0x2azUxk1I
	0rpi+7am9p2TjfLu8kWQbI0GiwLZgrvukfb2qkTYfiEAzWuylZPtpS2s7cj+Y5ezY9YPJrPI01YrZ
	VHBg7W1hLTkZv0HlzBVRgrDvF+0UoPYRyIVayh6svDaINzg9sy5aS3I4WqKcfj288VxbBgBI+FK7K
	8/GC4hp7gikDvk38NWSik0jJQ4zU3KnOupl5oSOXg8ud2iAKXDgsBcXiLuEiYxoN988hEEMLJ/Ktg
	Su64iReTxblHvGV8EixQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG3u-005bS4-3A;
	Thu, 21 Sep 2023 09:33:31 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjG3r-005bQd-1Y
	for ath10k@lists.infradead.org;
	Thu, 21 Sep 2023 09:33:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 9C58ACE1D41;
	Thu, 21 Sep 2023 09:33:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA16C3277E;
	Thu, 21 Sep 2023 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695288803;
	bh=FiyvDDyQXOk9mEoVrRM/ZvJn/EUsTPSIK411BiFrc0Y=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=YD+izcjPV92elhwxpEyPnheRz4LMTobpTbkhbgPcr3+cHmjGMpZwdXNu7WvedEyqW
	 FK8d8Degn8Nx/io9BYLzxM4ZzkTB85UuzLUig+mcOQ5TeZ/JvA7BlNWKjYtRaEwDdV
	 7WzhkLVXHrIFYeeoKpu9bzblzK/smIfhaIZBml3oBDiTb6ausWw1nG4F6JMqLEjZ/K
	 Xu/0qmPx62v3P47FyN9T0T7a18s60PpwzEE8Oljl3wbkp5rZgmkNKtSGjzcVXFembG
	 rluYTVFhvr0pcC5kuTmh9R16Fw9EwytIe/GpKWkxMucVGDr2EnhMnHjxtvfVWCJGWI
	 R9/TeuU0Dhw+g==
From: Kalle Valo <kvalo@kernel.org>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,
  linux-wireless@vger.kernel.org,  lvc-project@linuxtesting.org,
  ath10k@lists.infradead.org
Subject: Re: [PATCH 1/6] [v3] wifi: ath10k: cleanup CE ring initialization
References: <997f4b09-7087-4788-aa2a-ef835ce6ebb3@quicinc.com>
	<20230824055117.42309-1-dmantipov@yandex.ru>
	<874jjpashn.fsf@kernel.org>
	<75483209-4ac1-305f-83fb-9e9affc104fe@yandex.ru>
Date: Thu, 21 Sep 2023 12:33:20 +0300
In-Reply-To: <75483209-4ac1-305f-83fb-9e9affc104fe@yandex.ru> (Dmitry
	Antipov's message of "Thu, 21 Sep 2023 11:58:13 +0300")
Message-ID: <87sf77an1b.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_023327_693643_E8653D69 
X-CRM114-Status: GOOD (  12.80  )
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

Dmitry Antipov <dmantipov@yandex.ru> writes:

>> If most/all of the functions return the same error value type as int
>> it makes a lot easier to read the code.
>
> ...but still not sure that this is reasonable for any non-trivial piece
> of the source code.

What's the concrete benefit from having few functions which return void
instead of 'return 0'? For me the benefit would have to be significant
justifying the code churn and the time used.

> OTOH if both you and Jeff are agreed on preserving existing ath1x style,
> I will definitely take this decision into account and try to redesign
> this series in attempt to fit the current design as much as possible.

Please stop fixing the design (unless you are the driver maintainer or
asked specifically by one) as that doesn't really benefit anyone,
actually the opposite. Instead focus on fixing actual bugs. But if you
have no means for testing your fixes then stick to compiler warnings and
similar.

For example, didn't I suggest you about fixing all sparse warnings in
wireless code? I would be very happy to get such patches as we really
would want to be sparse warning free.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
