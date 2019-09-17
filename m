Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]
 helo=us-smtp-1.mimecast.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1iAKxI-0002Be-KT
 for ath10k@lists.infradead.org; Tue, 17 Sep 2019 21:24:14 +0000
Received: by mail-ed1-f70.google.com with SMTP id s3so2993779edr.15
 for <ath10k@lists.infradead.org>; Tue, 17 Sep 2019 14:24:07 -0700 (PDT)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
Subject: Re: [PATCH 4/4] mac80211: Sync airtime weight sum with per AC synced
 sta airtime weight together
In-Reply-To: <1568639388-27291-4-git-send-email-yiboz@codeaurora.org>
References: <1568639388-27291-1-git-send-email-yiboz@codeaurora.org>
 <1568639388-27291-4-git-send-email-yiboz@codeaurora.org>
Date: Tue, 17 Sep 2019 23:24:04 +0200
Message-ID: <87impqipl7.fsf@toke.dk>
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
To: Yibo Zhao <yiboz@codeaurora.org>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Yibo Zhao <yiboz@codeaurora.org> writes:

> Global airtime weight sum is updated only when txq is added/removed
> from rbtree. If upper layer configures sta weight during high load,
> airtime weight sum will not be updated since txq is most likely on the
> tree. It could a little late for upper layer to reconfigure sta weight
> when txq is already in the rbtree. And thus, incorrect airtime weight sum
> will lead to incorrect global virtual time calculation as well as global
> airtime weight sum overflow of airtime weight sum during txq removed.
>
> Hence, need to update airtime weight sum upon receiving event for
> configuring sta weight once sta's txq is on the rbtree.
>
> Besides, if airtime weight sum of ACs and sta weight is synced under the
> same per AC lock protection, there can be a very short window causing
> incorrct airtime weight sum calculation as below:
>
>     active_txq_lock_VO                          .
>     VO weight sum is syncd			.
>     sta airtime weight sum is synced		.
>     active_txq_unlock_VO			.
>     .						.
>     active_txq_lock_VI    			.
>     VI weight sum is syncd			.
>     sta airtime weight sum		active_txq_lock_BE
>     active_txq_unlock_VI	      Remove txq and thus sum
>     .				      is calculated with synced
>     .				      sta airtime weight
>     .					active_txq_unlock_BE
>
> So introduce a per ac synced station airtime weight synced with per
> AC synced weight sum together. And the per-AC station airtime weight
> is used to calculate weight sum.
>
> Signed-off-by: Yibo Zhao <yiboz@codeaurora.org>
> ---
>  net/mac80211/cfg.c      | 27 +++++++++++++++++++++++++--
>  net/mac80211/sta_info.c |  6 ++++--
>  net/mac80211/sta_info.h |  3 +++
>  net/mac80211/tx.c       |  4 ++--
>  4 files changed, 34 insertions(+), 6 deletions(-)
>
> diff --git a/net/mac80211/cfg.c b/net/mac80211/cfg.c
> index d65aa01..4b420bb 100644
> --- a/net/mac80211/cfg.c
> +++ b/net/mac80211/cfg.c
> @@ -1284,7 +1284,8 @@ static int sta_apply_parameters(struct ieee80211_local *local,
>  	int ret = 0;
>  	struct ieee80211_supported_band *sband;
>  	struct ieee80211_sub_if_data *sdata = sta->sdata;
> -	u32 mask, set;
> +	u32 mask, set, tid, ac;
> +	struct txq_info *txqi;
>  
>  	sband = ieee80211_get_sband(sdata);
>  	if (!sband)
> @@ -1452,8 +1453,30 @@ static int sta_apply_parameters(struct ieee80211_local *local,
>  	if (ieee80211_vif_is_mesh(&sdata->vif))
>  		sta_apply_mesh_params(local, sta, params);
>  
> -	if (params->airtime_weight)
> +	if (params->airtime_weight &&
> +	    params->airtime_weight != sta->airtime_weight) {
> +		for (ac = 0; ac < IEEE80211_NUM_ACS; ac++) {
> +			spin_lock_bh(&local->active_txq_lock[ac]);
> +			for (tid = 0; tid < IEEE80211_NUM_TIDS + 1; tid++) {
> +				if (!sta->sta.txq[tid] ||
> +				    ac != ieee80211_ac_from_tid(tid))
> +					continue;
> +
> +				sta->airtime_weight_synced[ac] =
> +							params->airtime_weight;
> +
> +				txqi = to_txq_info(sta->sta.txq[tid]);
> +				if (RB_EMPTY_NODE(&txqi->schedule_order))
> +					continue;
> +
> +				local->airtime_weight_sum[ac] = local->airtime_weight_sum[ac] +
> +								params->airtime_weight -
> +								sta->airtime_weight;
> +			}
> +			spin_unlock_bh(&local->active_txq_lock[ac]);
> +		}
>  		sta->airtime_weight = params->airtime_weight;

With this, airtime_weight is basically only used to return to and from
userspace, right? I.e., after the above loop has run, it will match the
contents of airtime_weight_synced; so why not just turn airtime_weight
into  a per-ac array? You could just use airtime_weight[0] as the value
to return to userspace...

-Toke


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
