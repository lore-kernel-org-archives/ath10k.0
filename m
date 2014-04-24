Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WdEw1-0003kx-Bh
 for ath10k@lists.infradead.org; Thu, 24 Apr 2014 08:23:09 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: don't allow stand alone monitor mode for non-AP
 firmware
References: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
Date: Thu, 24 Apr 2014 11:22:39 +0300
In-Reply-To: <1398327250-12923-1-git-send-email-yeohchunyeow@gmail.com>
 (Chun-Yeow Yeoh's message of "Thu, 24 Apr 2014 16:14:10 +0800")
Message-ID: <87d2g7m90w.fsf@kamboji.qca.qualcomm.com>
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

> Firmware 999.999.0.636 does not allow stand alone monitor
> mode. This means that bridging the STA mode and put it into
> promiscuous mode will also cause the firmware to crash. Avoid
> this.
>
> Signed-off-by: Chun-Yeow Yeoh <yeohchunyeow@gmail.com>

[...]

> @@ -647,10 +647,15 @@ static int ath10k_monitor_vdev_delete(struct ath10k *ar)
>  
>  static int ath10k_monitor_start(struct ath10k *ar)
>  {
> -	int ret;
> +	int ret = -1;

I prefer to avoid initialising ret variables. And -1 is not a proper
error value.

>  	lockdep_assert_held(&ar->conf_mutex);
>  
> +	if (ar->fw_version_build == 636) {

Checking for firmware version in ath10k is a big no. For a functinality
change like this you should add a new feature flag to enum
ath10k_fw_features (and I need to then recreate the firmware image).

> +		ath10k_warn("stand alone monitor mode is not supported\n");

I would prefer not to print a warning for a situation like this. Can't
we instead return an error value back to the caller?

> +		return ret;

return -EOPNOTSUPP or similar is better approach than initialising ret
to -1.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
