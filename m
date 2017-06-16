Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dLnIS-0008Tz-Ab
 for ath10k@lists.infradead.org; Fri, 16 Jun 2017 09:12:06 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ath10k: Configure rxnss_override for 10.4 firmware.
Date: Fri, 16 Jun 2017 08:50:13 +0000
Message-ID: <87o9toz58b.fsf@kamboji.qca.qualcomm.com>
References: <20170609110750.14950-1-sven.eckelmann@openmesh.com>
 <20170609110750.14950-2-sven.eckelmann@openmesh.com>
In-Reply-To: <20170609110750.14950-2-sven.eckelmann@openmesh.com> (Sven
 Eckelmann's message of "Fri, 9 Jun 2017 13:07:49 +0200")
Content-Language: en-US
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Ben Greear <greearb@candelatech.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> From: Ben Greear <greearb@candelatech.com>
>
> QCA9984 hardware can do 4x4 at 80Mhz, but only 2x2 at 160Mhz.
>
> First, report this to user-space by setting the max-tx-speed
> and max-rx-speed vht capabilities.
>
> Second, if the peer rx-speed is configured, and if we
> are in 160 or 80+80 mode, and the peer rx-speed matches
> the max speed for 2x2 or 1x1 at 160Mhz (long guard interval),
> then use that info to set the peer_bw_rxnss_override appropriately.
>
> Without this, a 9984 firmware will not use 2x2 ratesets when
> transmitting to peer (it will be stuck at 1x1), because
> the firmware would not have configured the rxnss_override.
>
> This could use some testing....

Sven, I assume you have tested this so I removed the last sentence.

> @@ -4408,6 +4422,23 @@ static struct ieee80211_sta_vht_cap ath10k_create_vht_cap(struct ath10k *ar)
>  	vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(mcs_map);
>  	vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(mcs_map);
>  
> +	/* If we are supporting 160Mhz or 80+80, then the NIC may be able to do
> +	 * a restricted NSS for 160 or 80+80 vs what it can do for 80Mhz.  Give
> +	 * user-space a clue if that is the case.
> +	 */
> +	if (vht_cap.cap & IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_MASK) {
> +		switch (ar->dev_id) {
> +		case QCA9984_1_0_DEVICE_ID:
> +			/* Can do only 2x2 VHT160 or 80+80.
> +			 * 1560Mbps is 4x4 80Mhz or 2x2 160Mhz,
> +			 * long-guard-interval
> +			 */
> +			vht_cap.vht_mcs.rx_highest = 1560;
> +			vht_cap.vht_mcs.tx_highest = 1560;
> +			break;
> +		}
> +	}

We have hw_params for stuff like this so I changed this and the
following patch to use that. Please review:

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=81f55f2a3e1837287a52de6577ca89a2c7393456

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=09ce674529472c8deca41fbb28bad59e03330321

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
