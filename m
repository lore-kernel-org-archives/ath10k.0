Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eszH1-000482-IK
 for ath10k@lists.infradead.org; Mon, 05 Mar 2018 23:12:05 +0000
Received: by mail-pl0-x244.google.com with SMTP id 93-v6so10676428plc.9
 for <ath10k@lists.infradead.org>; Mon, 05 Mar 2018 15:11:52 -0800 (PST)
Date: Mon, 5 Mar 2018 15:11:49 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v2] ath10k: fix use-after-free in
 ath10k_wmi_cmd_send_nowait
Message-ID: <20180305231147.GA144261@rodete-desktop-imager.corp.google.com>
References: <1520232242-24132-1-git-send-email-cjhuang@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1520232242-24132-1-git-send-email-cjhuang@codeaurora.org>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Felix Fietkau <nbd@nbd.name>

+ Felix, who had feedback on the last version

On Mon, Mar 05, 2018 at 02:44:02PM +0800, Carl Huang wrote:
> The skb may be freed in tx completion context before
> trace_ath10k_wmi_cmd is called. This can be easily captured when
> KASAN(Kernel Address Sanitizer) is enabled. The fix is to move
> trace_ath10k_wmi_cmd before the send operation. As the ret has no
> meaning in trace_ath10k_wmi_cmd then, so remove this parameter too.
> 
> Signed-off-by: Carl Huang <cjhuang@codeaurora.org>
> ---
>  drivers/net/wireless/ath/ath10k/trace.h | 12 ++++--------
>  drivers/net/wireless/ath/ath10k/wmi.c   |  2 +-
>  2 files changed, 5 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/trace.h b/drivers/net/wireless/ath/ath10k/trace.h
> index e40edce..7d2fac3 100644
> --- a/drivers/net/wireless/ath/ath10k/trace.h
> +++ b/drivers/net/wireless/ath/ath10k/trace.h
> @@ -152,10 +152,9 @@ TRACE_EVENT(ath10k_log_dbg_dump,
>  );
>  
>  TRACE_EVENT(ath10k_wmi_cmd,
> -	TP_PROTO(struct ath10k *ar, int id, const void *buf, size_t buf_len,
> -		 int ret),
> +	TP_PROTO(struct ath10k *ar, int id, const void *buf, size_t buf_len),
>  
> -	TP_ARGS(ar, id, buf, buf_len, ret),
> +	TP_ARGS(ar, id, buf, buf_len),
>  
>  	TP_STRUCT__entry(
>  		__string(device, dev_name(ar->dev))
> @@ -163,7 +162,6 @@ TRACE_EVENT(ath10k_wmi_cmd,
>  		__field(unsigned int, id)
>  		__field(size_t, buf_len)
>  		__dynamic_array(u8, buf, buf_len)
> -		__field(int, ret)
>  	),
>  
>  	TP_fast_assign(
> @@ -171,17 +169,15 @@ TRACE_EVENT(ath10k_wmi_cmd,
>  		__assign_str(driver, dev_driver_string(ar->dev));
>  		__entry->id = id;
>  		__entry->buf_len = buf_len;
> -		__entry->ret = ret;
>  		memcpy(__get_dynamic_array(buf), buf, buf_len);
>  	),
>  
>  	TP_printk(
> -		"%s %s id %d len %zu ret %d",
> +		"%s %s id %d len %zu",
>  		__get_str(driver),
>  		__get_str(device),
>  		__entry->id,
> -		__entry->buf_len,
> -		__entry->ret
> +		__entry->buf_len
>  	)
>  );
>  
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 58dc218..fc9f50d 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1742,8 +1742,8 @@ int ath10k_wmi_cmd_send_nowait(struct ath10k *ar, struct sk_buff *skb,
>  	cmd_hdr->cmd_id = __cpu_to_le32(cmd);
>  
>  	memset(skb_cb, 0, sizeof(*skb_cb));
> +	trace_ath10k_wmi_cmd(ar, cmd_id, skb->data, skb->len);
>  	ret = ath10k_htc_send(&ar->htc, ar->wmi.eid, skb);
> -	trace_ath10k_wmi_cmd(ar, cmd_id, skb->data, skb->len, ret);
>  
>  	if (ret)
>  		goto err_pull;

Tested-by: Brian Norris <briannorris@chromium.org>
Reviewed-by: Brian Norris <briannorris@chromium.org>

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
