Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZtV8u-00047D-Bd
 for ath10k@lists.infradead.org; Tue, 03 Nov 2015 06:32:28 +0000
Message-ID: <563854E5.4010508@candelatech.com>
Date: Mon, 02 Nov 2015 22:32:05 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH] ath10k: fix invalid NSS for 4x4 devices
References: <1446531693-23453-1-git-send-email-rmanohar@qti.qualcomm.com>
In-Reply-To: <1446531693-23453-1-git-send-email-rmanohar@qti.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, stable@vger.kernel.org

I'm a bit embarrassed about that 0x15..thanks for catching that!

Ben

On 11/02/2015 10:21 PM, Rajkumar Manoharan wrote:
> The number of spatial streams that are derived from chain mask
> for 4x4 devices is using wrong bitmask and conditional check.
> This is affecting downlink throughput for QCA99x0 devices. Earlier
> cfg_tx_chainmask is not filled by default until user configured it
> and so get_nss_from_chainmask never be called. This issue is exposed
> by recent commit 166de3f1895d ("ath10k: remove supported chain mask").
> By default maximum supported chain mask is filled in cfg_tx_chainmask.
>
> Cc: stable@vger.kernel.org
> Fixes: 5572a95b4b ("ath10k: apply chainmask settings to vdev on
> creation")
> Signed-off-by: Rajkumar Manoharan <rmanohar@qti.qualcomm.com>
> ---
>   drivers/net/wireless/ath/ath10k/mac.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index a7411fe..95a55405 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -4225,7 +4225,7 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
>
>   static u32 get_nss_from_chainmask(u16 chain_mask)
>   {
> -	if ((chain_mask & 0x15) == 0x15)
> +	if ((chain_mask & 0xf) == 0xf)
>   		return 4;
>   	else if ((chain_mask & 0x7) == 0x7)
>   		return 3;
>

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
