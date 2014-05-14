Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wkegu-0004yw-Uy
 for ath10k@lists.infradead.org; Wed, 14 May 2014 19:18:13 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 4/5] ath10k: protect wep tx key setup
References: <1399637749-13489-1-git-send-email-michal.kazior@tieto.com>
 <1399637749-13489-5-git-send-email-michal.kazior@tieto.com>
Date: Wed, 14 May 2014 22:17:44 +0300
In-Reply-To: <1399637749-13489-5-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 9 May 2014 14:15:48 +0200")
Message-ID: <87ha4scgpz.fsf@kamboji.qca.qualcomm.com>
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

> All configuration sequences should be protected
> with conf_mutex to avoid concurrent/conflicting
> requests.
>
> This should make sure that wep tx key setup is not
> performed while hw is restarted (at least).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> @@ -1902,10 +1904,12 @@ static void ath10k_tx_wep_key_work(struct work_struct *work)
>  		ath10k_warn("failed to update wep key index for vdev %d: %d\n",
>  			    arvif->vdev_id,
>  			    ret);
> -		return;
> +		goto unlock;
>  	}
>  
>  	arvif->def_wep_key_idx = keyidx;
> +unlock:
> +	mutex_unlock(&arvif->ar->conf_mutex);
>  }

Empty line before the label, please.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
