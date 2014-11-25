Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XtB4v-0000vd-DV
 for ath10k@lists.infradead.org; Tue, 25 Nov 2014 08:02:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 3/3] ath10k: fix station count enforcement
References: <1416834909-7130-1-git-send-email-michal.kazior@tieto.com>
 <1416834909-7130-3-git-send-email-michal.kazior@tieto.com>
Date: Tue, 25 Nov 2014 10:01:55 +0200
In-Reply-To: <1416834909-7130-3-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Mon, 24 Nov 2014 14:15:09 +0100")
Message-ID: <87d28b3dzg.fsf@kamboji.qca.qualcomm.com>
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

> The number of peers isn't directly translatable to
> the number of stations because ath10k needs to
> reserve a few extra peers for special cases like
> multi-vif concurrency.
>
> The previous limit was 126 and 15 stations in AP
> mode for 10.x and main firmware branches
> respectively. The limit is now 128 and 16 which
> was the original intention.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

> +static void ath10k_core_init_max_sta_count(struct ath10k *ar)
> +{
> +	if (test_bit(ATH10K_FW_FEATURE_WMI_10X, ar->fw_features)) {
> +		ar->max_num_peers = TARGET_10X_NUM_PEERS;
> +		ar->max_num_stations = TARGET_10X_NUM_STATIONS;
> +	} else {
> +		ar->max_num_peers = TARGET_NUM_PEERS;
> +		ar->max_num_stations = TARGET_NUM_STATIONS;
> +	}
> +}
> +
>  int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>  {
>  	int status;
> @@ -939,6 +950,8 @@ int ath10k_core_start(struct ath10k *ar, enum ath10k_firmware_mode mode)
>  	else
>  		ar->free_vdev_map = (1LL << TARGET_NUM_VDEVS) - 1;
>  
> +	ath10k_core_init_max_sta_count(ar);

I don't see the need to call this during every firmware start as these
are not changed afterwards. I think it would be better to call this once
just after ath10k_core_fetch_firmware_files() is called.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
