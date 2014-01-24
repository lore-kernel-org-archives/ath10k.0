Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6c0d-0000Ph-Hy
 for ath10k@lists.infradead.org; Fri, 24 Jan 2014 08:21:04 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: implement channel switching
References: <1390473506-15677-1-git-send-email-michal.kazior@tieto.com>
 <1390473506-15677-2-git-send-email-michal.kazior@tieto.com>
Date: Fri, 24 Jan 2014 10:20:34 +0200
In-Reply-To: <1390473506-15677-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 23 Jan 2014 11:38:25 +0100")
Message-ID: <87ob314wq5.fsf@kamboji.qca.qualcomm.com>
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

> Until now channel change wasn't propagating to FW
> directly because operational channel is abstracted
> by VDEVs and it wasn't really necessary since
> ath10k implements hwscan and hwroc.
>
> This effectively fixes STA CSA and allows for
> future AP-like CSA as well.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -2559,15 +2676,18 @@ static void ath10k_bss_info_changed(struct ieee80211_hw *hw,
>  				 * this is never erased as we it for crypto key
>  				 * clearing; this is FW requirement
>  				 */
> -				memcpy(arvif->u.sta.bssid, info->bssid,
> -				       ETH_ALEN);
> +				memcpy(arvif->bssid, info->bssid, ETH_ALEN);
>  
>  				ath10k_dbg(ATH10K_DBG_MAC,
>  					   "mac vdev %d start %pM\n",
>  					   arvif->vdev_id, info->bssid);
>  
> -				/* FIXME: check return value */
>  				ret = ath10k_vdev_start(arvif);
> +				if (ret)
> +					ath10k_warn("failed to start vdev: %d\n",
> +						    ret);
> +				else
> +					arvif->is_started = true;
>  			}

I really don't like that if-else construct and I think it's just better
to bail out if an error happens, so I changed this to:

				ret = ath10k_vdev_start(arvif);
				if (ret) {
					ath10k_warn("failed to start vdev: %d\n",
						    ret);
					return;
				}

				arvif->is_started = true;

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
