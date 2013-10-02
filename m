Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VREXd-0005SI-9w
 for ath10k@lists.infradead.org; Wed, 02 Oct 2013 05:00:08 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH net-next] net:drivers/net: Miscellaneous conversions to
 ETH_ALEN
References: <1380679480.2081.24.camel@joe-AO722>
Date: Wed, 2 Oct 2013 07:59:36 +0300
In-Reply-To: <1380679480.2081.24.camel@joe-AO722> (Joe Perches's message of
 "Tue, 01 Oct 2013 19:04:40 -0700")
Message-ID: <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Joe Perches <joe@perches.com>
Cc: ath10k@lists.infradead.org

(Cutting the CC smaller)

Joe Perches <joe@perches.com> writes:

> Convert the memset/memcpy uses of 6 to ETH_ALEN
> where appropriate.
>
> Also convert some struct definitions and u8 array
> declarations of [6] to ETH_ALEN.
>
> Signed-off-by: Joe Perches <joe@perches.com>

[...]

> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index 55f90c7..bee88e8 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1918,7 +1918,7 @@ int ath10k_wmi_peer_set_param(struct ath10k *ar, u32 vdev_id,
>  	cmd->vdev_id     = __cpu_to_le32(vdev_id);
>  	cmd->param_id    = __cpu_to_le32(param_id);
>  	cmd->param_value = __cpu_to_le32(param_value);
> -	memcpy(&cmd->peer_macaddr.addr, peer_addr, 6);
> +	memcpy(&cmd->peer_macaddr.addr, peer_addr, ETH_ALEN);
>  
>  	ath10k_dbg(ATH10K_DBG_WMI,
>  		   "wmi vdev %d peer 0x%pM set param %d value %d\n",

Acked-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
