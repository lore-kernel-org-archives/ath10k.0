Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WXPuq-00007d-F7
 for ath10k@lists.infradead.org; Tue, 08 Apr 2014 06:53:53 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: refactor monitor code
References: <1396610305-5229-1-git-send-email-michal.kazior@tieto.com>
 <87y4zgmifa.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 8 Apr 2014 09:53:10 +0300
In-Reply-To: <87y4zgmifa.fsf@kamboji.qca.qualcomm.com> (Kalle Valo's message
 of "Tue, 08 Apr 2014 09:42:01 +0300")
Message-ID: <87ob0cmhwp.fsf@kamboji.qca.qualcomm.com>
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

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> It was possible to create/delete/start/stop
>> monitor vdev from a few places that were not
>> exclusively protected against each other. This
>> resulted in monitor vdev being stopped/removed by
>> one call origin while another one was expecting it
>> to continue running.
>>
>> For example if CAC was started and interface's
>> promiscuous mode was toggled monitor vdev was
>> removed from the driver meaning no radar would be
>> detected. In additional a warning would be printed
>> upon CAC completion complaining it tried to stop
>> non-running monitor vdev.
>>
>> The patch simplifies monitor code by removing
>> IEEE80211_HW_WANT_MONITOR_VIF (which wasn't really
>> ever needed) and improves state tracking. It also
>> unifies prints.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>
> Thanks, applied.

Actually there were two checkpatch warnings which I had missed:

drivers/net/wireless/ath/ath10k/mac.c:2587: WARNING: line over 80 characters
drivers/net/wireless/ath/ath10k/mac.c:2852: WARNING: line over 80 characters

I amended it like this:

--- a/drivers/net/wireless/ath/ath10k/mac.c
+++ b/drivers/net/wireless/ath/ath10k/mac.c
@@ -2584,7 +2584,8 @@ static int ath10k_config(struct ieee80211_hw *hw, u32 changed)
                        ar->monitor = true;
                        ret = ath10k_monitor_start(ar);
                        if (ret) {
-                               ath10k_warn("failed to start monitor (config): %d\n", ret);
+                               ath10k_warn("failed to start monitor (config): %d\n",
+                                           ret);
                                ar->monitor = false;
                        }
                } else if (!(conf->flags & IEEE80211_CONF_MONITOR) &&
@@ -2849,7 +2850,8 @@ static void ath10k_configure_filter(struct ieee80211_hw *hw,
                ar->promisc = true;
                ret = ath10k_monitor_start(ar);
                if (ret) {
-                       ath10k_warn("failed to start monitor (promisc): %d\n", ret);
+                       ath10k_warn("failed to start monitor (promisc): %d\n",
+                                   ret);
                        ar->promisc = false;
                }
        } else if (!(ar->filter_flags & FIF_PROMISC_IN_BSS) && ar->promisc) {

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
