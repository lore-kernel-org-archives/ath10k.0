Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1erY4Y-00040f-J2
 for ath10k@lists.infradead.org; Thu, 01 Mar 2018 23:57:16 +0000
Received: by mail-io0-x244.google.com with SMTP id l12so9027862ioc.10
 for <ath10k@lists.infradead.org>; Thu, 01 Mar 2018 15:57:03 -0800 (PST)
Date: Thu, 1 Mar 2018 15:56:59 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: fix use-after-free in ath10k_wmi_cmd_send_nowait
Message-ID: <20180301235655.GA127455@rodete-desktop-imager.corp.google.com>
References: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1518317805-5796-1-git-send-email-cjhuang@codeaurora.org>
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
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Carl Huang <cjhuang@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Sun, Feb 11, 2018 at 10:56:45AM +0800, Carl Huang wrote:
> The skb may be freed in tx completion context before
> trace_ath10k_wmi_cmd is called. This can be easily captured
> when KASAN(Kernel Address Sanitizer) is enabled. The fix is
> to add a reference count to the skb and release it after
> trace_ath10k_wmi_cmd is called.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/wmi.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 58dc218..e63aedb 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1,6 +1,7 @@
>  /*
>   * Copyright (c) 2005-2011 Atheros Communications Inc.
>   * Copyright (c) 2011-2017 Qualcomm Atheros, Inc.
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.

I agree with Felix that this seems excessive for a 2-line bugfix. But
I'm not a lawyer or a maintainer, and I have no power here :)

(On the practical side: it's annoying that the copyright line has to be
the one to provide conflicts when backporting.)

>   *
>   * Permission to use, copy, modify, and/or distribute this software for any
>   * purpose with or without fee is hereby granted, provided that the above
> @@ -1742,8 +1743,10 @@ int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
>  	cmd_hdr->cmd_id = __cpu_to_le32(cmd);
>  
>  	memset(skb_cb, 0, sizeof(*skb_cb));
> +	skb_get(skb);
>  	ret = ath10k_htc_send(&ar->htc, ar->wmi.eid, skb);
>  	trace_ath10k_wmi_cmd(ar, cmd_id, skb->data, skb->len, ret);
> +	dev_kfree_skb(skb);

Tested-by: Brian Norris <briannorris@chromium.org>

It does feel like capturing before the command is sent might make more
sense. Otherwise, you may be concurrently dumping the buffer and DMA'ing
to a device. If you really need to trace the return code, you could do
that separately.

Brian

>  
>  	if (ret)
>  		goto err_pull;

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
