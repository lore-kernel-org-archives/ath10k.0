Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN481-000115-Qc
 for ath10k@lists.infradead.org; Wed, 14 Nov 2018 22:59:29 +0000
Received: by mail-pg1-x544.google.com with SMTP id r9-v6so8048176pgv.6
 for <ath10k@lists.infradead.org>; Wed, 14 Nov 2018 14:59:16 -0800 (PST)
Date: Wed, 14 Nov 2018 14:59:11 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH v3] ath10k: support NET_DETECT WoWLAN feature
Message-ID: <20181114225910.GA220599@google.com>
References: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1534402113-14337-1-git-send-email-wgong@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org

Hi Wen,

You've introduced a regression in 4.20-rc1:

On Thu, Aug 16, 2018 at 02:48:33PM +0800, Wen Gong wrote:
> For WoWLAN support, it expect to support wake up based on discovery of
> one or more known SSIDs. This is the WIPHY_WOWLAN_NET_DETECT feature,
> which shows up as an NL80211 feature flag.
> 
> With an upgrade iw, this shows up in 'iw phy' as:
> WoWLAN support:
> * wake up on network detection, up to 16 match sets
> And it can use command:
> "iw phy0 wowlan enable net-detect interval 5000 delay 30 freqs 2412
> matches ssid foo" to configure the parameters of net detect.
> 
> Firmware will do scan by the configured parameters after suspend and
> wakeup if it found matched SSIDs. Tested with QCA6174 hw3.0 with
> firmware WLAN.RM.4.4.1-00110-QCARMSWPZ-1.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>
> ---
> V3:
> -fix the waring of alloc with no test
>  drivers/net/wireless/ath/ath10k/core.h    |   1 +
>  drivers/net/wireless/ath/ath10k/mac.c     |  12 ++
>  drivers/net/wireless/ath/ath10k/wmi-ops.h |  21 +++
>  drivers/net/wireless/ath/ath10k/wmi-tlv.c | 180 +++++++++++++++++++++++-
>  drivers/net/wireless/ath/ath10k/wmi-tlv.h | 226 ++++++++++++++++++++++++++++++
>  drivers/net/wireless/ath/ath10k/wmi.h     |  57 ++++++++
>  drivers/net/wireless/ath/ath10k/wow.c     | 174 +++++++++++++++++++++++
>  7 files changed, 670 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath10k/core.h b/drivers/net/wireless/ath/ath10k/core.h
> index 427ee57..7885462 100644
> --- a/drivers/net/wireless/ath/ath10k/core.h
> +++ b/drivers/net/wireless/ath/ath10k/core.h
> @@ -904,6 +904,7 @@ struct ath10k {
>  	u32 high_5ghz_chan;
>  	bool ani_enabled;
>  
> +	bool nlo_enabled;
>  	bool p2p;
>  
>  	struct {
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index 95243b4..ba9b9af 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -8361,6 +8361,18 @@ int ath10k_mac_register(struct ath10k *ar)
>  	ar->hw->wiphy->max_scan_ssids = WLAN_SCAN_PARAMS_MAX_SSID;
>  	ar->hw->wiphy->max_scan_ie_len = WLAN_SCAN_PARAMS_MAX_IE_LEN;
>  
> +	if (test_bit(WMI_SERVICE_NLO, ar->wmi.svc_map)) {
> +		ar->hw->wiphy->max_sched_scan_reqs = 1;
> +		ar->hw->wiphy->max_sched_scan_ssids = WMI_PNO_MAX_SUPP_NETWORKS;
> +		ar->hw->wiphy->max_match_sets       = WMI_PNO_MAX_SUPP_NETWORKS;
> +		ar->hw->wiphy->max_sched_scan_ie_len = WMI_PNO_MAX_IE_LENGTH;
> +		ar->hw->wiphy->max_sched_scan_plans = WMI_PNO_MAX_SCHED_SCAN_PLANS;
> +		ar->hw->wiphy->max_sched_scan_plan_interval =
> +			WMI_PNO_MAX_SCHED_SCAN_PLAN_INT;
> +		ar->hw->wiphy->max_sched_scan_plan_iterations =
> +			WMI_PNO_MAX_SCHED_SCAN_PLAN_ITRNS;

It seems like youre enabling SCHED_SCAN support? But you're not adding
the NL80211_FEATURE_SCHED_SCAN_RANDOM_MAC_ADDR feature flag. So it puts
us in a tough place on using randomization -- we either can't trust the
FEATURE flags, or else we can't use both SCHED_SCAN and scan
randomization.

I haven't played with this much at all yet (except to notice that my
tests no longer pass), but maybe you just need to add the FEATURE flag.

Brian

> +	}
> +
>  	ar->hw->vif_data_size = sizeof(struct ath10k_vif);
>  	ar->hw->sta_data_size = sizeof(struct ath10k_sta);
>  	ar->hw->txq_data_size = sizeof(struct ath10k_txq);

...

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
