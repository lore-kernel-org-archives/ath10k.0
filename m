Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cYdfH-0000CC-9q
 for ath10k@lists.infradead.org; Tue, 31 Jan 2017 19:00:31 +0000
Subject: Re: [PATCH v2 2/2] mac80211: store tx power value from user to station
References: <1485888101-23454-1-git-send-email-arnagara@qti.qualcomm.com>
 <1485888101-23454-2-git-send-email-arnagara@qti.qualcomm.com>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <eff562d4-7dd8-4b5a-812c-58f4f690cde3@candelatech.com>
Date: Tue, 31 Jan 2017 11:00:06 -0800
MIME-Version: 1.0
In-Reply-To: <1485888101-23454-2-git-send-email-arnagara@qti.qualcomm.com>
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
To: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>, linux-wireless@vger.kernel.org
Cc: johannes@sipsolutions.net, arnagara@codeaurora.org, ath10k@lists.infradead.org

On 01/31/2017 10:41 AM, Ashok Raj Nagarajan wrote:
> This patch introduce a new driver callback drv_sta_set_txpwr. This API will
> copy the transmit power value passed from user space and call the driver
> callback to set the tx power for the station.
>
> Signed-off-by: Ashok Raj Nagarajan <arnagara@qti.qualcomm.com>
> ---
>  include/net/mac80211.h    |  6 ++++++
>  net/mac80211/cfg.c        |  7 +++++++
>  net/mac80211/driver-ops.c | 21 +++++++++++++++++++++
>  net/mac80211/driver-ops.h |  5 +++++
>  net/mac80211/trace.h      | 27 +++++++++++++++++++++++++++
>  5 files changed, 66 insertions(+)
>
> diff --git a/include/net/mac80211.h b/include/net/mac80211.h
> index 5345d35..e059d5a 100644
> --- a/include/net/mac80211.h
> +++ b/include/net/mac80211.h
> @@ -1777,6 +1777,8 @@ struct ieee80211_sta_rates {
>   *	This is defined by the spec (IEEE 802.11-2012 section 8.3.2.2 NOTE 2).
>   * @support_p2p_ps: indicates whether the STA supports P2P PS mechanism or not.
>   * @max_rc_amsdu_len: Maximum A-MSDU size in bytes recommended by rate control.
> + * @txpwr: indicates the tx power, in dBm, to be used when sending data frames
> + *	to the STA. Value of 0 means, automatic (default) tx power.

Atheros NICs use 1/2 dBm increments internally, so maybe pass down mBm to the driver so you don't
loose the granularity?  (Other NICs may potentially have even finer control.)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
