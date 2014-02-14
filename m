Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WEKmU-0004OD-KK
 for ath10k@lists.infradead.org; Fri, 14 Feb 2014 15:34:23 +0000
Message-ID: <52FE3766.1080509@candelatech.com>
Date: Fri, 14 Feb 2014 07:33:58 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/2] ath10k:  add vdev-id, return code to error codes
References: <1392318562-32440-1-git-send-email-greearb@candelatech.com>
 <87bnya6xey.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87bnya6xey.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 02/13/2014 10:06 PM, Kalle Valo wrote:

> @@ -1542,20 +1542,20 @@ static int ath10k_station_assoc(struct ath10k *ar, struct ath10k_vif *arvif,
>
>   	ret = ath10k_setup_peer_smps(ar, arvif, sta->addr, &sta->ht_cap);
>   	if (ret) {
> -		ath10k_warn("failed to setup peer SMPS: %d\n", ret);
> +		ath10k_warn("failed to setup peer SMPS for vdev: %d\n", ret);
>   		return ret;
>   	}

Looks like that could use the vdev id in it...I must have missed it on my first attempt.

> @@ -3252,7 +3252,7 @@ static int ath10k_sta_state(struct ieee80211_hw *hw,
>   			   arvif->vdev_id, sta->addr);
>   		ret = ath10k_peer_delete(ar, arvif->vdev_id, sta->addr);
>   		if (ret)
> -			ath10k_warn("Failed to delete peer: %pM for VDEV: %d ret %i\n",
> +			ath10k_warn("Failed to delete peer %pM for vdev %d: %i\n",
>   				    sta->addr, arvif->vdev_id, ret);


While you are harmonizing the messages...maybe change all instances of "failed to "Failed ?

I wasn't sure what was preferred so I left that alone when doing my patch.


The rest of the changes look fine to me.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
