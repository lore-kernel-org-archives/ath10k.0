Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F25CC433F5
	for <ath10k@archiver.kernel.org>; Wed, 11 May 2022 13:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MpTLSkm4cC3aaIzRkBuNAlJXROe49J12+4afr3SNZg=; b=pDazkfnkq2019j
	lW8FNFfewjASSDbIiPq3LQ2oKeIXL3r9qr8cluS5ZEGjXKRmSItpQxcbF0SpdB5l5YMX77IKx9OM5
	G4f/9rqlWD7k0RQDOI+SeITujkr8m4Y3L8nfdI8/d6XigaL0vTPhbaftOTXUoVK8YU/0vftSSQNKC
	SFc5BJ2z5SS44I4tLFZUScqaQCIJyBbf3Vh/jc8ynrMWIc3Z9jxUg3+bVXOvxa3t8P85We8zycnFb
	OTHTkfBidzkinfdWL8h1C9oZ+E2h42A5iDX89tAPMxW7jj4pNv5yAKy4yQwWl5jUcZVzuP2ydjCvx
	kt/r5qSsBjcH/8ESB+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nomUA-0070IP-0w; Wed, 11 May 2022 13:34:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nomU6-0070HL-OH
 for ath10k@lists.infradead.org; Wed, 11 May 2022 13:34:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id BF2CF60C7A;
 Wed, 11 May 2022 13:34:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48793C34113;
 Wed, 11 May 2022 13:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652276073;
 bh=4NUdmq88v8DAbB7Vn40eqVC9dvLwvBx3ZTm5NvdS1lI=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=ptGl5zmLXOimnEN9XDeoridZtaiSiUjU68mS4DhfkCvTZXuARKEiJkBwbQUqCKcYA
 AaahO4sMKdvIZWm3i37K7F/HaJq2p/1OrOSTjHdY/NbUFU4HlHvlTcRh8vxUU6ngcP
 8QU5QFZELewgz4HMDUz44o5dLRzFin8IPdO//NONc1JmJRsNVQjflbU2gjShXvek0/
 gRtn8HdsXDLFv40Gbv2Vy4rxYbJophPrbQdYhsoX1AfmJkfaElmNjHNcfDhsYUmDT1
 e+0owWzk++VeOydD9U6fQdpjYi5fZNyaIFc2nmf33T9Iv9URQnXNoipqMm/xvXGxpF
 ZsXmklYGN0qKw==
From: Kalle Valo <kvalo@kernel.org>
To: Abhishek Kumar <kuabhs@chromium.org>
Cc: netdev@vger.kernel.org, dianders@chromium.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 ath10k@lists.infradead.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH v3] ath10k: improve BDF search fallback strategy
References: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
Date: Wed, 11 May 2022 16:34:26 +0300
In-Reply-To: <20220509022618.v3.1.Ibfd52b9f0890fffe87f276fa84deaf6f1fb0055c@changeid>
 (Abhishek Kumar's message of "Mon, 9 May 2022 02:26:36 +0000")
Message-ID: <878rr86vml.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_063434_923747_9DD6517F 
X-CRM114-Status: GOOD (  37.76  )
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

> Board data files wrapped inside board-2.bin files are
> identified based on a combination of bus architecture,
> chip-id, board-id or variants. Here is one such example
> of a BDF entry in board-2.bin file:
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
> It is possible for few platforms none of the combinations
> of bus,qmi-board,chip-id or variants match, e.g. if
> board-id is not programmed and thus reads board-id=0xff,
> there won't be any matching BDF to be found. In such
> situations, the wlan will fail to enumerate.
>
> Currently, to search for BDF, there are two fallback
> boardnames creates to search for BDFs in case the full BDF
> is not found. It is still possible that even the fallback
> boardnames do not match.
>
> As an improvement, search for BDF with full BDF combination
> and perform the fallback searches by stripping down the last
> elements until a BDF entry is found or none is found for all
> possible BDF combinations.e.g.
> Search for initial BDF first then followed by reduced BDF
> names as follows:
> bus=snoc,qmi-board-id=67,qmi-chip-id=320,variant=GO_XXXX
> bus=snoc,qmi-board-id=67,qmi-chip-id=320
> bus=snoc,qmi-board-id=67
> bus=snoc
> <No BDF found>
>
> Tested-on: WCN3990/hw1.0 WLAN.HL.3.2.2.c10-00754-QCAHLSWMTPL-1
> Signed-off-by: Abhishek Kumar <kuabhs@chromium.org>
> ---
>
> Changes in v3:
> - As discussed, instead of adding support for default BDF in DT, added
> a method to drop the last elements from full BDF until a BDF is found.
> - Previous patch was "ath10k: search for default BDF name provided in DT"
>
>  drivers/net/wireless/ath/ath10k/core.c | 65 +++++++++++++-------------
>  1 file changed, 32 insertions(+), 33 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/core.c b/drivers/net/wireless/ath/ath10k/core.c
> index 688177453b07..ebb0d2a02c28 100644
> --- a/drivers/net/wireless/ath/ath10k/core.c
> +++ b/drivers/net/wireless/ath/ath10k/core.c
> @@ -1426,15 +1426,31 @@ static int ath10k_core_search_bd(struct ath10k *ar,
>  	return ret;
>  }
>  
> +static bool ath10k_create_reduced_boardname(struct ath10k *ar, char *boardname)


"static int" as you use error values. Strange that the compiler doesn't
warn about that.

> +{
> +	/* Find last BDF element */
> +	char *last_field = strrchr(boardname, ',');
> +
> +	if (last_field) {
> +		/* Drop the last BDF element */
> +		last_field[0] = '\0';
> +		ath10k_dbg(ar, ATH10K_DBG_BOOT,
> +			   "boardname =%s\n", boardname);
> +		return 0;
> +	}
> +	return -ENODATA;

I would invert the check:

	if (!last_field)
        	return -ENODATA;

	/* Drop the last BDF element */
	last_field[0] = '\0';
	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boot reduced boardname %s\n",
		   boardname);

	return 0;

Also I changed the style used in the debug message.

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#debug_messages

>  	data += magic_len;
>  	len -= magic_len;
>  
> -	/* attempt to find boardname in the IE list */
> -	ret = ath10k_core_search_bd(ar, boardname, data, len);
> +	memcpy(temp_boardname, boardname, board_len);
> +	ath10k_dbg(ar, ATH10K_DBG_BOOT, "boardname :%s\n", boardname);

"boot boardname %s\n"

>  
> -	/* if we didn't find it and have a fallback name, try that */
> -	if (ret == -ENOENT && fallback_boardname1)
> -		ret = ath10k_core_search_bd(ar, fallback_boardname1, data, len);
> +retry_search:
> +	/* attempt to find boardname in the IE list */
> +	ret = ath10k_core_search_bd(ar, temp_boardname, data, len);
>  
> -	if (ret == -ENOENT && fallback_boardname2)
> -		ret = ath10k_core_search_bd(ar, fallback_boardname2, data, len);
> +	/* If the full BDF entry was not found then drop the last element and
> +	 * recheck until a BDF is found or until all options are exhausted.
> +	 */
> +	if (ret == -ENOENT)
> +		if (!ath10k_create_reduced_boardname(ar, temp_boardname))
> +			goto retry_search;
>  
>  	if (ret == -ENOENT) {
>  		ath10k_err(ar,
>  			   "failed to fetch board data for %s from %s/%s\n",
> -			   boardname, ar->hw_params.fw.dir, filename);
> +			   temp_boardname, ar->hw_params.fw.dir, filename);
>  		ret = -ENODATA;
>  	}

This is hard to read, what about the loop below? Though I'm sure I
missed some corner case but I hope you get the idea. It's always good to
have a limit for the loops to avoid looping forever.

	for (i = 0; i < 20; i++) {
		/* attempt to find boardname in the IE list */
		ret = ath10k_core_search_bd(ar, temp_boardname, data, len);
		if (ret != -ENOENT)
			/* found it or something was wrong */
			break;

		/* If the full BDF entry was not found then drop the last element and
		 * recheck until a BDF is found or until all options are exhausted.
		 */
		ret = ath10k_create_reduced_boardname(ar, temp_boardname);
		if (ret) {
			ath10k_err(ar,
				   "failed to fetch board data for %s from %s/%s\n",
				   temp_boardname, ar->hw_params.fw.dir, filename);
			ret = -ENODATA;
			break;
		}
	};

	if (ret)
		goto err;

        return 0;

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
