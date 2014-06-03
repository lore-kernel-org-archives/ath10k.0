Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtprelay0007.hostedemail.com ([216.40.44.7]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wrrqs-0003KV-Hd
 for ath10k@lists.infradead.org; Tue, 03 Jun 2014 16:46:19 +0000
Message-ID: <1401813944.18833.6.camel@joe-AO725>
Subject: Re: [RFC 2/4] ath10k:  save firmware debug log messages.
From: Joe Perches <joe@perches.com>
Date: Tue, 03 Jun 2014 09:45:44 -0700
In-Reply-To: <1401812719-25061-2-git-send-email-greearb@candelatech.com>
References: <1401812719-25061-1-git-send-email-greearb@candelatech.com>
 <1401812719-25061-2-git-send-email-greearb@candelatech.com>
Mime-Version: 1.0
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On Tue, 2014-06-03 at 09:25 -0700, greearb@candelatech.com wrote:
> They may be dumped through the firmware dump debugfs
> file.
[]
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
[]
> @@ -1084,11 +1084,14 @@ static void ath10k_wmi_event_echo(struct ath10k *ar, struct sk_buff *skb)
>  
>  static int ath10k_wmi_event_debug_mesg(struct ath10k *ar, struct sk_buff *skb)
>  {
> +	u32 *m = (u32 *)(skb->data);
>  	ath10k_dbg(ATH10K_DBG_WMI, "wmi event debug mesg len %d\n",
>  		   skb->len);
>  
>  	trace_ath10k_wmi_dbglog(skb->data, skb->len);
>  
> +	ath10k_dbg_save_fw_dbg_buffer(ar, (u8 *)(&(m[1])), skb->len - 4);
> +
>  	return 0;
>  }
>  

That last line looks an overly complicated way of writing

	ath10k_dbg_save_fw_dbg_buffer(ar, skb->data + 4, skb->len - 4);

btw: why skip the first 4 bytes?



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
