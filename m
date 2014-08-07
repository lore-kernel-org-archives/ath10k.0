Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFK1y-0002sv-5m
 for ath10k@lists.infradead.org; Thu, 07 Aug 2014 09:30:42 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 5/5] ath10k: flush hif buffers before recovery
References: <1407402308-29899-1-git-send-email-michal.kazior@tieto.com>
 <1407402308-29899-6-git-send-email-michal.kazior@tieto.com>
Date: Thu, 7 Aug 2014 12:30:07 +0300
In-Reply-To: <1407402308-29899-6-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Thu, 7 Aug 2014 11:05:08 +0200")
Message-ID: <8738d84pgg.fsf@kamboji.qca.qualcomm.com>
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

> Transport buffers weren't flushed and processed
> before queueing hw recovery request to mac80211.
>
> This could in theory result in an unwanted htt/wmi
> rx events being processed while mac80211 recovers
> the device and possibly interfere or even crash
> the system.
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

This one had a conflict in ath-next-test, I changed the patch to this:

--- a/drivers/net/wireless/ath/ath10k/core.c
+++ b/drivers/net/wireless/ath/ath10k/core.c
@@ -666,6 +666,7 @@ static void ath10k_core_restart(struct work_struct *work)
        case ATH10K_STATE_ON:
                ar->state = ATH10K_STATE_RESTARTING;
                ath10k_scan_finish(ar);
+               ath10k_hif_stop(ar);
                ieee80211_restart_hw(ar->hw);
                break;
        case ATH10K_STATE_OFF:

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
