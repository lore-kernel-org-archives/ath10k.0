Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XWPgq-0005Eo-VI
 for ath10k@lists.infradead.org; Tue, 23 Sep 2014 12:59:33 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: support 32+ stations.
References: <1411149890-12618-1-git-send-email-greearb@candelatech.com>
 <1411149890-12618-3-git-send-email-greearb@candelatech.com>
Date: Tue, 23 Sep 2014 15:59:06 +0300
In-Reply-To: <1411149890-12618-3-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Fri, 19 Sep 2014 11:04:50
 -0700")
Message-ID: <874mvyebmt.fsf@kamboji.qca.qualcomm.com>
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
To: greearb@candelatech.com
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Support up to 32 stations when using CT firmware.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

[...]

> -	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
> +		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS_CT) - 1;
> +	else if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features))
>  		ar->free_vdev_map = (1LL << TARGET_10X_NUM_VDEVS) - 1;
>  	else
>  		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;

[...]

> +/* Over-rides for Candela Technologies firmware */
> +#define TARGET_10X_NUM_VDEVS_CT			32
> +#define TARGET_10X_NUM_PEERS_CT			(32 + (TARGET_10X_NUM_VDEVS_CT))
> +#define TARGET_10X_AST_SKID_LIMIT_CT		(TARGET_10X_NUM_PEERS_CT * TARGET_10X_NUM_PEER_AST)

[...]

> +		if (test_bit(ATH10K_FW_FEATURE_WMI_10X_CT, ar->fw_features))
> +			max_num_peers = TARGET_10X_NUM_PEERS_CT - 1;

Like I said before, this hardcoding of values using feature bits is not
going to work in the long run. It's better that these values come
directly from FW IEs as integers, that gives us a lot more flexibility
between firmware versions.

That's why I'll drop patches 2 and 3.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
