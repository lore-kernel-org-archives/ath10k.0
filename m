Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vlgex-0006Lk-Iu
 for ath10k@lists.infradead.org; Wed, 27 Nov 2013 15:04:12 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 2/3] ath10k: implement sta_rc_update()
References: <1385126819-15311-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-1-git-send-email-michal.kazior@tieto.com>
 <1385474260-22385-3-git-send-email-michal.kazior@tieto.com>
Date: Wed, 27 Nov 2013 17:03:41 +0200
In-Reply-To: <1385474260-22385-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 26 Nov 2013 14:57:39 +0100")
Message-ID: <87li09ga42.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This should fix possible connectivity issues upon
> changes of channel width, number of streams or
> SMPS on connected stations.
>
> An example trigger would be an action frame with
> operation mode change notification.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Sorry, somehow missed these on my previous review:

> +	if (changed & IEEE80211_RC_BW_CHANGED) {
> +		switch (sta->bandwidth) {
> +		default:
> +			ath10k_warn("unsupported STA BW: %d\n", sta->bandwidth);
> +		case IEEE80211_STA_RX_BW_20:
> +			chwidth = WMI_PEER_CHWIDTH_20MHZ;
> +			break;
> +		case IEEE80211_STA_RX_BW_40:
> +			chwidth = WMI_PEER_CHWIDTH_40MHZ;
> +			break;
> +		case IEEE80211_STA_RX_BW_80:
> +			chwidth = WMI_PEER_CHWIDTH_80MHZ;
> +			break;
> +		}

I assume that the idea here is to use WMI_PEER_CHWIDTH_20MHZ for the
default case. Actually I would prefer to avoid using default case
altogether, that way the compiler will warn if there's an enum value we
don't check. So for example you could add "case IEEE80211_STA_RX_BW_160"
which prints a warning and uses 20 MHz.

> +	if (changed & IEEE80211_RC_SMPS_CHANGED) {
> +		smps = WMI_PEER_SMPS_PS_NONE;
> +
> +		switch (sta->smps_mode) {
> +		case IEEE80211_SMPS_NUM_MODES:
> +			ath10k_warn("invalid smps mode: %d\n", sta->smps_mode);
> +		case IEEE80211_SMPS_AUTOMATIC:
> +		case IEEE80211_SMPS_OFF:
> +			smps = WMI_PEER_SMPS_PS_NONE;
> +			break;
> +		case IEEE80211_SMPS_STATIC:
> +			smps = WMI_PEER_SMPS_STATIC;
> +			break;
> +		case IEEE80211_SMPS_DYNAMIC:
> +			smps = WMI_PEER_SMPS_DYNAMIC;
> +			break;
> +		}

This is better, but I think it would be clearer to have
IEEE80211_SMPS_NUM_MODES last and not "fall through" the cases.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
