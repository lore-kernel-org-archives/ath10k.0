Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8giO-0007lR-Ub
 for ath10k@lists.infradead.org; Thu, 20 Aug 2020 09:18:36 +0000
MIME-Version: 1.0
Date: Thu, 20 Aug 2020 17:18:26 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <87imdlkuw8.fsf@codeaurora.org>
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <87imdlkuw8.fsf@codeaurora.org>
Message-ID: <725b4377f63c76627e1e68604323cb74@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Kalle Valo <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 2020-08-15 01:19, Kalle Valo wrote:
...
> 
> I have been thinking a different approach for this. I think another
> option is to have a function like this:
> 
> ath10k_core_firmware_crashed()
> {
>         queue_work(ar->workqueue, &ar->restart_work);
> }
> 
> In patch 1 we would convert all existing callers to call that
> function instead of queue_work() directly.
> 
> In patch 2 we would add a new flag to enum ath10k_dev_flags, or maybe
> should actually use existing ATH10K_FLAG_CRASH_FLUSH? Don't know yet
> which one is better. Now the function would do:
I thinks we can use test_and_set_bit for atomic operation athough it is 
same with restart_count.
and add a new flag, ATH10K_FLAG_CRASH_FLUSH is used for flush,
if still use ATH10K_FLAG_CRASH_FLUSH, it should change clear_bit of it 
from
ath10k_core_start to ath10k_reconfig_complete,because 
ieee80211_reconfig(called by
ieee80211_restart_work)
of mac80211 do many things and drv_start is 1st thing and
drv_reconfig_complete is last thing, drv_reconfig_complete done means 
the restart
finished.

I will send patch v5 with above changes if not other advise.
> 
> ath10k_core_firmware_crashed()
> {
>         if (test_bit(flag))
>                 return
> 
>         set_bit(flag)
> 	queue_work(ar->workqueue, &ar->restart_work);
> }
> 
> That way restart_work queue would be called only one time.
> 
> Though I'm not sure how ATH10K_STATE_WEDGED would behave after this
> change, it might get broken. Ah, actually I think even this patch 
> breaks
> the WEDGED state. This firmware restart is tricky, difficult to say 
> what
> is the best approach. Michal, are you reading? :) Any ideas?
> 
> And after looking more about this patch I don't see the need for the 
> new
> ar->restart_count atomic variable. Checking for ATH10K_FLAG_CRASH_FLUSH
> would do the same thing AFAICS.
> 
> And related to this, (in a separate patch) I think we should utilise
> ATH10K_FLAG_CRASH_FLUSH more. For example in ath10k_wmi_cmd_send() to
> not even try to send a WMI command if the flag is set. Basically all
> hardware access should be disabled except what is needed to restart the
> firmware.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
