Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNahx-0003DH-N9
 for ath10k@lists.infradead.org; Fri, 16 Nov 2018 09:46:39 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath: fix frequent flase radar detection
References: <1539580047-22512-1-git-send-email-tamizhr@codeaurora.org>
 <b0e823e3-275c-86ab-dce0-dd522ebd3711@bowerswilkins.com>
Date: Fri, 16 Nov 2018 11:46:20 +0200
In-Reply-To: <b0e823e3-275c-86ab-dce0-dd522ebd3711@bowerswilkins.com> (Peter
 Oh's message of "Mon, 15 Oct 2018 17:47:36 +0000")
Message-ID: <87wopd73tf.fsf@codeaurora.org>
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
To: Peter Oh <peter.oh@bowerswilkins.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Tamizh chelvam <tamizhr@codeaurora.org>

Peter Oh <peter.oh@bowerswilkins.com> writes:

> On 10/14/2018 10:07 PM, Tamizh chelvam wrote:
>> Many number of false radar detection occurred in a noisy
>> environment in QCA4019, QCA9888 devices. By reducing
>> PRI_TOLERANCE to 6 and flushing out pulse queue by dpd_reset
>> if timestamp between current and previous pulse is lesser than
>> 100ms helps to avoid/reduce this false radar detection
>> in the noisy environment.
>>
>> Tested ath10k hw and fw:
>> 	* QCA9888(10.4-3.5.1-00052)
>> 	* QCA4019(10.4-3.2.1.1-00017)
>> 	* QCA9984(10.4-3.6-00104)
>> 	* QCA988X(10.2.4-1.0-00041)
>>
>> Tested ath9k hw: AR9300
>
> Please post the radar detection rate results before and after this change.
> Especially for ETSI at 30% channel load.
>
>> Signed-off-by: Tamizh chelvam <tamizhr@codeaurora.org>
>> ---
>>   drivers/net/wireless/ath/ath.h                  | 2 ++
>>   drivers/net/wireless/ath/ath10k/mac.c           | 4 ++++
>>   drivers/net/wireless/ath/ath9k/init.c           | 1 +
>>   drivers/net/wireless/ath/dfs_pattern_detector.c | 4 +++-
>>   drivers/net/wireless/ath/dfs_pattern_detector.h | 2 +-
>>   5 files changed, 11 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/net/wireless/ath/ath.h b/drivers/net/wireless/ath/ath.h
>> index 7a364ec..2bf2d0c 100644
>> --- a/drivers/net/wireless/ath/ath.h
>> +++ b/drivers/net/wireless/ath/ath.h
>> @@ -184,6 +184,8 @@ struct ath_common {
>>   
>>   	int last_rssi;
>>   	struct ieee80211_supported_band sbands[NUM_NL80211_BANDS];
>> +
>> +	int dfs_pulse_valid_diff_ts;
>>   };
>>   
>>   static inline const struct ath_ps_ops *ath_ps_ops(struct ath_common *common)
>> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
>> index a1c2801..c93b81c 100644
>> --- a/drivers/net/wireless/ath/ath10k/mac.c
>> +++ b/drivers/net/wireless/ath/ath10k/mac.c
>> @@ -8275,6 +8275,8 @@ struct ath10k_vif *ath10k_get_arvif(struct ath10k *ar, u32 vdev_id)
>>   #define WRD_METHOD "WRDD"
>>   #define WRDD_WIFI  (0x07)
>>   
>> +#define ATH10K_DFS_PULSE_VALID_DIFF_TS 100
>> +
>>   static u32 ath10k_mac_wrdd_get_mcc(struct ath10k *ar, union acpi_object *wrdd)
>>   {
>>   	union acpi_object *mcc_pkg;
>> @@ -8642,6 +8644,8 @@ int ath10k_mac_register(struct ath10k *ar)
>>   	if (IS_ENABLED(CONFIG_ATH10K_DFS_CERTIFIED)) {
>>   		/* Init ath dfs pattern detector */
>>   		ar->ath_common.debug_mask = ATH_DBG_DFS;
>> +		ar->ath_common.dfs_pulse_valid_diff_ts =
>> +					ATH10K_DFS_PULSE_VALID_DIFF_TS;
>>   		ar->dfs_detector = dfs_pattern_detector_init(&ar->ath_common,
>>   							     NL80211_DFS_UNSET);
>>   
>> diff --git a/drivers/net/wireless/ath/ath9k/init.c b/drivers/net/wireless/ath/ath9k/init.c
>> index c070a9e..7ea4460 100644
>> --- a/drivers/net/wireless/ath/ath9k/init.c
>> +++ b/drivers/net/wireless/ath/ath9k/init.c
>> @@ -696,6 +696,7 @@ static int ath9k_init_softc(u16 devid, struct ath_softc *sc,
>>   	common->debug_mask = ath9k_debug;
>>   	common->btcoex_enabled = ath9k_btcoex_enable == 1;
>>   	common->disable_ani = false;
>> +	common->dfs_pulse_valid_diff_ts = 0;
>
> Why it's 0 here while ath10k is using 100us?

Tamizh, please reply to Peter's comments. I'll drop this patch now,
please resubmit once you have reached a conclusion in the discussion.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
