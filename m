Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRaNY-0006Yo-Cf
 for ath10k@lists.infradead.org; Thu, 03 Oct 2013 04:19:09 +0000
Received: by mail-pa0-f43.google.com with SMTP id hz1so1986308pad.30
 for <ath10k@lists.infradead.org>; Wed, 02 Oct 2013 21:18:45 -0700 (PDT)
Message-ID: <1380773924.19002.131.camel@edumazet-glaptop.roam.corp.google.com>
Subject: Re: [PATCH net-next] ath10k: wmi: Convert use of 6 to ETH_ALEN
From: Eric Dumazet <eric.dumazet@gmail.com>
Date: Wed, 02 Oct 2013 21:18:44 -0700
In-Reply-To: <1380771551.2081.93.camel@joe-AO722>
References: <1380679480.2081.24.camel@joe-AO722>
 <87k3hw469z.fsf@kamboji.qca.qualcomm.com>
 <1380696054.2081.35.camel@joe-AO722>
 <CAB=NE6V3b4+B06hzPjhww52wp1FHho3329cP25=5Cy833bysvg@mail.gmail.com>
 <1380736969.2081.72.camel@joe-AO722>
 <alpine.DEB.2.02.1310030034030.2162@localhost6.localdomain6>
 <1380758954.2081.79.camel@joe-AO722> <1380760114.2081.81.camel@joe-AO722>
 <1380771110.2081.89.camel@joe-AO722> <1380771551.2081.93.camel@joe-AO722>
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
To: Joe Perches <joe@perches.com>
Cc: "Luis R. Rodriguez" <mcgrof@do-not-panic.com>, netdev <netdev@vger.kernel.org>, "John W.
 Linville" <linville@tuxdriver.com>, ath10k@lists.infradead.org, Julia Lawall <julia.lawall@lip6.fr>, Kalle Valo <kvalo@qca.qualcomm.com>

On Wed, 2013-10-02 at 20:39 -0700, Joe Perches wrote:
> Use the appropriate define instead of 6.
> 
> Signed-off-by: Joe Perches <joe@perches.com>
> Noticed-by: Julia Lawall <julia.lawall@lip6.fr> via spatch script
> 
> ---
> 
>  drivers/net/wireless/ath/ath10k/wmi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/wmi.c b/drivers/net/wireless/ath/ath10k/wmi.c
> index bee88e8..48d44e7 100644
> --- a/drivers/net/wireless/ath/ath10k/wmi.c
> +++ b/drivers/net/wireless/ath/ath10k/wmi.c
> @@ -1758,7 +1758,7 @@ int ath10k_wmi_vdev_up(struct ath10k *ar, u32 vdev_id, u32 aid, const u8 *bssid)
>  	cmd = (struct wmi_vdev_up_cmd *)skb->data;
>  	cmd->vdev_id       = __cpu_to_le32(vdev_id);
>  	cmd->vdev_assoc_id = __cpu_to_le32(aid);
> -	memcpy(&cmd->vdev_bssid.addr, bssid, 6);
> +	memcpy(&cmd->vdev_bssid.addr, bssid, ETH_ALEN);
>  
>  	ath10k_dbg(ATH10K_DBG_WMI,
>  		   "wmi mgmt vdev up id 0x%x assoc id %d bssid %pM\n",

I don't get it.

Why leaving this then ?

struct wmi_mac_addr {
        union {
                u8 addr[6];
                struct {
                        u32 word0;
                        u32 word1;
                } __packed;
        } __packed;
} __packed;




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
