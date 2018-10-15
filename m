Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-eopbgr00051.outbound.protection.outlook.com ([40.107.0.51]
 helo=EUR02-AM5-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gC6y9-0004OL-M0
 for ath10k@lists.infradead.org; Mon, 15 Oct 2018 17:48:05 +0000
From: Peter Oh <peter.oh@bowerswilkins.com>
Subject: Re: [PATCH] ath: fix frequent flase radar detection
Date: Mon, 15 Oct 2018 17:47:36 +0000
Message-ID: <b0e823e3-275c-86ab-dce0-dd522ebd3711@bowerswilkins.com>
References: <1539580047-22512-1-git-send-email-tamizhr@codeaurora.org>
In-Reply-To: <1539580047-22512-1-git-send-email-tamizhr@codeaurora.org>
Content-Language: en-US
Content-ID: <F4CED3A77DA9D4498185070E429BD565@eurprd04.prod.outlook.com>
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
To: Tamizh chelvam <tamizhr@codeaurora.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>



On 10/14/2018 10:07 PM, Tamizh chelvam wrote:
> Many number of false radar detection occurred in a noisy
> environment in QCA4019, QCA9888 devices. By reducing
> PRI_TOLERANCE to 6 and flushing out pulse queue by dpd_reset
> if timestamp between current and previous pulse is lesser than
> 100ms helps to avoid/reduce this false radar detection
> in the noisy environment.
>
> Tested ath10k hw and fw:
> 	* QCA9888(10.4-3.5.1-00052)
> 	* QCA4019(10.4-3.2.1.1-00017)
> 	* QCA9984(10.4-3.6-00104)
> 	* QCA988X(10.2.4-1.0-00041)
>
> Tested ath9k hw: AR9300
Please post the radar detection rate results before and after this change.
Especially for ETSI at 30% channel load.
> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
> ---
>   drivers/net/wireless/ath/ath.h                  | 2 ++
>   drivers/net/wireless/ath/ath10k/mac.c           | 4 ++++
>   drivers/net/wireless/ath/ath9k/init.c           | 1 +
>   drivers/net/wireless/ath/dfs_pattern_detector.c | 4 +++-
>   drivers/net/wireless/ath/dfs_pattern_detector.h | 2 +-
>   5 files changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
> index 7a364ec..2bf2d0c 100644
> --- a/drivers/net/wireless/ath/ath.h
> +++ b/drivers/net/wireless/ath/ath.h
> @@ -184,6 +184,8 @@ struct ath_common {
>   
>   	int last_rssi;
>   	struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
> +
> +	int dfs_pulse_valid_diff_ts;
>   };
>   
>   static inline const struct ath_ps_ops *ath_ps_ops(struct ath_common *common)
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index a1c2801..c93b81c 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8275,6 +8275,8 @@ struct ath10k_vif *ath10k_get_arvif(struct ath10k *ar, u32 vdev_id)
>   #define WRD_METHOD "WRDD"
>   #define WRDD_WIFI  (0x07)
>   
> +#define ATH10K_DFS_PULSE_VALID_DIFF_TS 100
> +
>   static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
>   {
>   	union acpi_object *mcc_pkg;
> @@ -8642,6 +8644,8 @@ int ath10k_mac_register(struct ath10k *ar)
>   	if (IS_ENABLED(CONFIG_ATH10K_DFS_CERTIFIED)) {
>   		/* Init ath dfs pattern detector */
>   		ar->ath_common.debug_mask = ATH_DBG_DFS;
> +		ar->ath_common.dfs_pulse_valid_diff_ts =
> +					ATH10K_DFS_PULSE_VALID_DIFF_TS;
>   		ar->dfs_detector = dfs_pattern_detector_init(&ar->ath_common,
>   							     NL80211_DFS_UNSET);
>   
> diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
> index c070a9e..7ea4460 100644
> --- a/drivers/net/wireless/ath/ath9k/init.c
> +++ b/drivers/net/wireless/ath/ath9k/init.c
> @@ -696,6 +696,7 @@ static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
>   	common->debug_mask = ath9k_debug;
>   	common->btcoex_enabled = ath9k_btcoex_enable == 1;
>   	common->disable_ani = false;
> +	common->dfs_pulse_valid_diff_ts = 0;
Why it's 0 here while ath10k is using 100us?
>   
>   	/*
>   	 * Platform quirks.
> diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.c b/drivers/net/wireless/ath/dfs_pattern_detector.c
> index d52b31b..3dbf0ab 100644
> --- a/drivers/net/wireless/ath/dfs_pattern_detector.c
> +++ b/drivers/net/wireless/ath/dfs_pattern_detector.c
> @@ -273,6 +273,7 @@ static void dpd_exit(struct dfs_pattern_detector *dpd)
>   {
>   	u32 i;
>   	struct channel_detector *cd;
> +	int diff_ts;
>   
>   	/*
>   	 * pulses received for a non-supported or un-initialized
> @@ -285,8 +286,9 @@ static void dpd_exit(struct dfs_pattern_detector *dpd)
>   	if (cd == NULL)
>   		return false;
>   
> +	diff_ts = event->ts - dpd->last_pulse_ts;
>   	/* reset detector on time stamp wraparound, caused by TSF reset */
> -	if (event->ts < dpd->last_pulse_ts)
> +	if (diff_ts < dpd->common->dfs_pulse_valid_diff_ts)
This is only valid when 1 radar pattern detected at a time.
But there are many locations that overlapped with multiple radar equipment.
How this change handles if 2 different radars detected at the same time?
Check out the radar operation center deployed.
https://www.roc.noaa.gov/WSR88D/Maps.aspx
>   		dpd_reset(dpd);
>   	dpd->last_pulse_ts = event->ts;
>   
> diff --git a/drivers/net/wireless/ath/dfs_pattern_detector.h b/drivers/net/wireless/ath/dfs_pattern_detector.h
> index 18db6f4..6f419d4 100644
> --- a/drivers/net/wireless/ath/dfs_pattern_detector.h
> +++ b/drivers/net/wireless/ath/dfs_pattern_detector.h
> @@ -24,7 +24,7 @@
>   /* tolerated deviation of radar time stamp in usecs on both sides
>    * TODO: this might need to be HW-dependent
>    */
> -#define PRI_TOLERANCE	16
> +#define PRI_TOLERANCE	6
What is this number 6 come from?

Thanks,
Peter
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
