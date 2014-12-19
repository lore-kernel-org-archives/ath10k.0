Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1ySK-0006hN-Kd
 for ath10k@lists.infradead.org; Fri, 19 Dec 2014 14:23:01 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/5] ath10k: implement support for ap beacon offloading
References: <1418829711-19713-1-git-send-email-bartosz.markowski@tieto.com>
 <1418829711-19713-6-git-send-email-bartosz.markowski@tieto.com>
Date: Fri, 19 Dec 2014 16:22:18 +0200
In-Reply-To: <1418829711-19713-6-git-send-email-bartosz.markowski@tieto.com>
 (Bartosz Markowski's message of "Wed, 17 Dec 2014 16:21:51 +0100")
Message-ID: <87lhm3iusl.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> From: Michal Kazior <michal.kazior@tieto.com>
>
> New firmware revisions support beacon and probe
> response templates instead. This means SWBA events
> are no longer delivered for these firmware
> revisions.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +	ret = ath10k_mac_setup_bcn_p2p_ie(arvif, bcn);
> +	if (ret) {
> +		ath10k_warn(ar, "failed to setup p2p go bcn ie: %d\n", ret);
> +		kfree_skb(bcn);
> +		return ret;
> +	}
> +
> +	ath10k_mac_remove_vendor_ie(bcn, WLAN_OUI_WFA, WLAN_OUI_TYPE_WFA_P2P,
> +				    offsetof(struct ieee80211_mgmt,
> +					     u.beacon.variable));

A comment would be nice why you are removing the P2P IE. I guess because
there's a different command to set that IE?
 
-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
