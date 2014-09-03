Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XP3ri-0005t7-IC
 for ath10k@lists.infradead.org; Wed, 03 Sep 2014 06:16:23 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
Date: Wed, 3 Sep 2014 09:14:47 +0300
In-Reply-To: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
 (greearb@candelatech.com's message of "Tue, 5 Aug 2014 10:58:57
 -0700")
Message-ID: <87zjehjkmg.fsf@kamboji.qca.qualcomm.com>
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
Cc: ath10k@lists.infradead.org

Hi,

This was "[PATCH] ath10k: Support 32+ stations." but I'll change the
subject as this a bigger discussion. I'll also drop linux-wireless for
now, I assume they are not interested about our discussion how to manage
firmware interfaces.

greearb@candelatech.com writes:

> From: Ben Greear <greearb@candelatech.com>
>
> Implement 64-bit vdev map to support larger numbers
> of virtual devices.  Support up to 32 stations
> (actual limit will be determined when loading firmware,
> as different firmwares have different limits)
>
> Enable larger limits when using Candela Technologies
> firmware.
>
> Signed-off-by: Ben Greear <greearb@candelatech.com>

So what this firmware does is that it changes these values:

> +/* Over-rides for Candela Technologies firmware */
> +#define TARGET_10X_NUM_VDEVS_CT			32
> +#define TARGET_10X_NUM_PEERS_CT			(32 + (TARGET_10X_NUM_VDEVS_CT))
> +#define TARGET_10X_AST_SKID_LIMIT_CT		(TARGET_10X_NUM_PEERS_CT * TARGET_10X_NUM_PEER_AST)

I think it would be better to provide these through FW IEs, one u32 for
each. I guess we need one also for the skid limit? That way it's easier
to maintain this in ath10k.

Of course that would mean we have to create struct ieee80211_iface_limit
and struct ieee80211_iface_combination runtime, instead of statically
how it's done now. But shouldn't be a problem, right?

Also I have been thinking that using firmware feature bits (for example
ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
version is not the best way. I think it's easier to manage all this if
we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
at some point.

Example:

enum ath10k_fw_wmi_version {
	ATH10K_FW_WMI_VERSION_MAIN = 0,
	ATH10K_FW_WMI_VERSION_10_1 = 1,
	ATH10K_FW_WMI_VERSION_10_2 = 2,
}

And then wmi.c would set correct interface based on this version.

We would still use feature bits to enable and disable smaller changes
like ATH10K_FW_FEATURE_HAS_WMI_MGMT_TX does. But for bigger WMI changes
we would change the WMI version, for example if we have a new firmware
branch with significant changes or similar.

And for backwards comptability we need to do so that
ATH10K_FW_FEATURE_WMI_10X sets ATH10K_FW_WMI_VERSION_10_1 and
ATH10K_FW_FEATURE_WMI_10_2 sets ATH10K_FW_WMI_VERSION_10_2.

Thoughts?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
