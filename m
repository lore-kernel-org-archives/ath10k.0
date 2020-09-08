Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-186.smtp-out.us-west-2.amazonses.com ([54.240.27.186])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFUbN-0007bH-SD
 for ath10k@lists.infradead.org; Tue, 08 Sep 2020 03:47:26 +0000
MIME-Version: 1.0
Date: Tue, 8 Sep 2020 03:47:22 +0000
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [PATCH v4 1/2] ath10k: add refcount for ath10k_core_restart
In-Reply-To: <871rjd37kz.fsf@codeaurora.org>
References: <20200108031957.22308-1-wgong@codeaurora.org>
 <20200108031957.22308-2-wgong@codeaurora.org>
 <87imdlkuw8.fsf@codeaurora.org>
 <725b4377f63c76627e1e68604323cb74@codeaurora.org>
 <871rjd37kz.fsf@codeaurora.org>
Message-ID: <010101746bd345bf-d4e7a473-0c6b-4e0b-95ec-ece315da48a5-000000@us-west-2.amazonses.com>
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

On 2020-09-07 23:55, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> On 2020-08-15 01:19, Kalle Valo wrote:
>> ...
>>> 
>>> I have been thinking a different approach for this. I think another
>>> option is to have a function like this:
>>> 
>>> ath10k_core_firmware_crashed()
>>> {
>>>         queue_work(ar->workqueue, &ar->restart_work);
>>> }
>>> 
>>> In patch 1 we would convert all existing callers to call that
>>> function instead of queue_work() directly.
>>> 
>>> In patch 2 we would add a new flag to enum ath10k_dev_flags, or maybe
>>> should actually use existing ATH10K_FLAG_CRASH_FLUSH? Don't know yet
>>> which one is better. Now the function would do:
>> 
>> I thinks we can use test_and_set_bit for atomic operation athough it
>> is same with restart_count.
> 
> I didn't quite understand what you mean here, but using
> test_and_set_bit() is the correct methdo.
> 
>> and add a new flag, ATH10K_FLAG_CRASH_FLUSH is used for flush, if
>> still use ATH10K_FLAG_CRASH_FLUSH, it should change clear_bit of it
>> from ath10k_core_start to ath10k_reconfig_complete,because
>> ieee80211_reconfig(called by ieee80211_restart_work) of mac80211 do
>> many things and drv_start is 1st thing and drv_reconfig_complete is
>> last thing, drv_reconfig_complete done means the restart finished.
> 
> Ok, let's discuss about that in v5. I hope you added the analysis to 
> the
> commit log.
yes, v5 have alread sent in https://patchwork.kernel.org/patch/11728101/
[v5] ath10k: add atomic protection for device recovery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
