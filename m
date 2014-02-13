Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WE1jY-0001eq-N5
 for ath10k@lists.infradead.org; Thu, 13 Feb 2014 19:14:05 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: implement drv_get_tsf for ibss merging
References: <1392197844-1223-1-git-send-email-yeohchunyeow@gmail.com>
Date: Thu, 13 Feb 2014 21:13:35 +0200
In-Reply-To: <1392197844-1223-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Wed, 12 Feb 2014 17:37:24 +0800")
Message-ID: <87r4767rmo.fsf@kamboji.qca.qualcomm.com>
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
To: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Chun-Yeow Yeoh <yeohchunyeow@gmail.com> writes:

> Implement the get TSF by simply returning 0 so that IBSS
> merging is happening. Otherwise, IBSS nodes that have similar
> SSID naming won't merge. This is simply fooling the mac80211
> that the TSF in the received beacon is higher than the local TSF.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

Yeah, this extremely ugly but don't really know any better way to handle
this now.

> +static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
> +{
> +	struct ath10k *ar = hw->priv;
> +	u64 tsf;
> +
> +	mutex_lock(&ar->conf_mutex);
> +	/* FIXME: Return 0 for time being. Need to figure out whether FW has
> +	 * the API to fetch 64-bit TSF
> +	 */
> +	tsf = 0;
> +	mutex_unlock(&ar->conf_mutex);
> +
> +	return tsf;
> +}

But why do you need to take conf_mutex? Isn't this enough:

+static u64 ath10k_get_tsf(struct ieee80211_hw *hw, struct ieee80211_vif *vif)
+{
+       /*
+        * FIXME: Return 0 for time being. Need to figure out whether FW
+        * has the API to fetch 64-bit TSF
+        */
+
+       return 0;
+}

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
