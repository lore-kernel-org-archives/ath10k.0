Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VKA5w-0007dR-P4
 for ath10k@lists.infradead.org; Thu, 12 Sep 2013 16:50:17 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/7] ath10k: improve beacon submission latency
References: <1378821003-22925-1-git-send-email-michal.kazior@tieto.com>
 <1378821003-22925-6-git-send-email-michal.kazior@tieto.com>
Date: Thu, 12 Sep 2013 19:47:36 +0300
In-Reply-To: <1378821003-22925-6-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Tue, 10 Sep 2013 15:50:01 +0200")
Message-ID: <87sixadm1j.fsf@qca.qualcomm.com>
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

> The patch prevents beacon misses in some case of
> heavy load on a system.
>
> If a beacon can't be transmitted directly from an
> SWBA event it will be left in arvif->beacon and
> transmission will be retried once TX credits
> become available.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

[...]

>  static void ath10k_wmi_op_ep_tx_credits(struct ath10k *ar)
>  {
> +	ath10k_wmi_tx_beacons_nowait(ar);
>  	wake_up(&ar->wmi.tx_credits_wq);
>  }
>  
> @@ -131,6 +174,7 @@ static int ath10k_wmi_cmd_send(struct ath10k *ar, struct sk_buff *skb,
>  	int ret = -EINVAL;
>  
>  	wait_event_timeout(ar->wmi.tx_credits_wq, ({
> +		ath10k_wmi_tx_beacons_nowait(ar);
>  		ret = ath10k_wmi_cmd_send_nowait(ar, skb, cmd_id);
>  		(ret != -EAGAIN);

Please add a short comment to both calls of
ath10k_wmi_tx_beacons_nowait(). Something like "first transmit all
pending beacons" or similar.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
