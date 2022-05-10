Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF877C433EF
	for <ath10k@archiver.kernel.org>; Tue, 10 May 2022 15:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z1ekpNProLzdxANPrU3NMsi7wFJ7xv1AykheevDs7iM=; b=MzuwDJJKTGf8if
	hjhxDaN/akuVC/mqqFppEB4UOzt8XgA1j2FGNztSAgrL4Dwvul9VBVHua7h9UgOOXRvbDzR9dNoZq
	NzIkhKfQoA8TRGOzwd7kBo3TV2zwnXMQEGtLuja2fvcpgMNylnnaXmwJIJkb4K4e6oXJwn/9F6OmK
	y6ufnJMyFSnUHYrcTP7Eyo7HGNPfNgs/qczy8fJOC/lSKU9UKZg7r9r4esMlA7rlN0DbBt+WKoUu2
	DFjA2WpJ4G31BHpZZOj2BllmML9ifZ03KeWjqWnsUOGYm1qu8vb0lckLsvn1uB3j9rDHxGgSomPe0
	n7ptpRzBWEx6Y1QawBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noS4V-002pHk-9P; Tue, 10 May 2022 15:46:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noS4S-002pFt-6v
 for ath10k@lists.infradead.org; Tue, 10 May 2022 15:46:45 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 944B06138B;
 Tue, 10 May 2022 15:46:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28478C385CA;
 Tue, 10 May 2022 15:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652197603;
 bh=iM9Ex4unx0/YzERfc9oAu4GcZ0NigJ1gWR2pmH2XcN4=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ugH3wpnRjsF//gSIuN9fHMI/WKoVizf/Amq9iWzK4O8ou91ZKo0frRWgc9hjM+/r6
 62fZGhJQZ+Joc0BhraKFFwBgEJC4FKphLYsHtA8NDwYwtUzcxpzFLgpu+zQnReKPZN
 80UlWWAJouLOe4h59E+gj0DexBH6ge8FIm+FN92F+dnnkXFWuDoM/KufOvb3wGU4K4
 z7myCNbDvZePjtBC8LBjlFIIWRuEmSiue3+7k5hsH4laWsiwSCz4IW8+mGRuP7DyOP
 +i1D4vh/hRB79srG4EyQq8td6r6rAh+108nDUGVeILP6qFiyezKfkRW4bbmZifDvjF
 6k55GIN2dApAw==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: netdev@vger.kernel.org, dianders@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3] ath10k: improve BDF search fallback strategy
References: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
 <87a6bp8kfn.fsf@kernel.org>
Date: Tue, 10 May 2022 18:46:39 +0300
In-Reply-To: <87a6bp8kfn.fsf@kernel.org> (Kalle Valo's message of "Tue, 10 May
 2022 18:41:00 +0300")
Message-ID: <875ymd8k68.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220510_084644_319540_775A5A0A 
X-CRM114-Status: UNSURE (   9.48  )
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

Kalle Valo <kvalo@kernel.org> writes:

>>  static int ath10k_core_fetch_board_data_api_n(struct ath10k *ar,
>>  					      const char *boardname,
>> -					      const char *fallback_boardname1,
>> -					      const char *fallback_boardname2,
>>  					      const char *filename)
>>  {
>> -	size_t len, magic_len;
>> +	size_t len, magic_len, board_len;
>>  	const u8 *data;
>>  	int ret;
>> +	char temp_boardname[100];
>> +
>> +	board_len = 100 * sizeof(temp_boardname[0]);
>
> Why not:
>
> board_len = sizeof(temp_board-name);
>
> That way number 100 is used only once.

BTW I'm not sure if it makes sense to CC David, Eric, Jakub and Paolo.
I'm sure they get a lot of email already. And I would also drop netdev.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
