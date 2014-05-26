Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WorOm-0007v0-CU
 for ath10k@lists.infradead.org; Mon, 26 May 2014 09:40:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2 3/5] ath10k: drain tx before restarting hw
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-1-git-send-email-michal.kazior@tieto.com>
 <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
Date: Mon, 26 May 2014 12:40:21 +0300
In-Reply-To: <1400143324-14911-4-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 15 May 2014 10:42:02 +0200")
Message-ID: <87y4xoswsa.fsf@kamboji.qca.qualcomm.com>
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

> This makes sure no further tx requests are
> submitted to HTT before driver teardown.
>
> This should prevent invalid pointer/NULL
> dereference on htt tx pool in ath10k_htt_tx() in
> some cases of heavy traffic.
>
> Reported-By: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> ---
>  drivers/net/wireless/ath/ath10k/mac.c | 30 ++++++++++++++++++++++++------
>  1 file changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/net/wireless/ath/ath10k/mac.c b/drivers/net/wireless/ath/ath10k/mac.c
> index b5d75b8..577a3a5 100644
> --- a/drivers/net/wireless/ath/ath10k/mac.c
> +++ b/drivers/net/wireless/ath/ath10k/mac.c
> @@ -2289,6 +2289,21 @@ static void ath10k_tx(struct ieee80211_hw *hw,
>  /*
>   * Initialize various parameters with default vaules.
>   */
> +static void ath10k_drain_tx(struct ath10k *ar)
> +{
> +	/* workers can hold conf_mutex -- avoid deadlock */
> +	WARN_ON(lockdep_is_held(&ar->conf_mutex));

Based on the discussion I modified the function to this now. Are you ok
with that?

/* Must not be called with conf_mutex held as workers can use that also. */
static void ath10k_drain_tx(struct ath10k *ar)
{
	/* make sure rcu-protected mac80211 tx path itself is drained */
	synchronize_net();

	ath10k_offchan_tx_purge(ar);
	ath10k_mgmt_over_wmi_tx_purge(ar);

	cancel_work_sync(&ar->offchan_tx_work);
	cancel_work_sync(&ar->wmi_mgmt_tx_work);
}

Full patch:

https://github.com/kvalo/ath/commit/e3c513cd03802e75802a6ce5efbadaa0dbf04b27

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
