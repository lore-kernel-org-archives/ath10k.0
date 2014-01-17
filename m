Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W48aX-0007JA-Em
 for ath10k@lists.infradead.org; Fri, 17 Jan 2014 12:31:54 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: use VHT phymodes for 20/40MHz channels
References: <1389681497-18267-1-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 17 Jan 2014 14:31:27 +0200
In-Reply-To: <1389681497-18267-1-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Tue, 14 Jan 2014 12:08:17 +0530")
Message-ID: <87ppnqrdr4.fsf@kamboji.qca.qualcomm.com>
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> chandef does not provide 11n / 11ac split. Use the highest
> phymodes for 20/40MHz channels, firmware can operate on.
>
> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>

Is this just code cleanup and or does this actually fix something?

> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -256,10 +256,10 @@ chan_to_phymode(const struct cfg80211_chan_def *chandef)
>  			phymode = MODE_11A;
>  			break;
>  		case NL80211_CHAN_WIDTH_20:
> -			phymode = MODE_11NA_HT20;
> +			phymode = MODE_11AC_VHT20;
>  			break;
>  		case NL80211_CHAN_WIDTH_40:
> -			phymode = MODE_11NA_HT40;
> +			phymode = MODE_11AC_VHT40;
>  			break;
>  		case NL80211_CHAN_WIDTH_80:
>  			phymode = MODE_11AC_VHT80;

But doesn't this mean that we will use, for example, MODE_11AC_VHT20 on
11n mode? I think we need to investigate how MODE_11AC_VHT20 and
MODE_11NA_HT20 actually differ (and the same for 40 MHz channels).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
