Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail29.static.mailgun.info ([104.130.122.29])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jlqIZ-0006kH-8O
 for ath10k@lists.infradead.org; Thu, 18 Jun 2020 08:53:31 +0000
MIME-Version: 1.0
Date: Thu, 18 Jun 2020 16:53:12 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [v2,08/13] ath10k: bring back the WMI path for mgmt frames
In-Reply-To: <12d316171b15203f0242a13d5c690687@codeaurora.org>
References: <88b587e85324b50a23a20676c7088d0c@codeaurora.org>
 <12d316171b15203f0242a13d5c690687@codeaurora.org>
Message-ID: <5f4d61bf9447826178a7f3f554e1e9d3@codeaurora.org>
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
To: bartosz.markowski@tieto.com, ath10k@lists.infradead.org

On 2020-06-18 12:09, Wen Gong wrote:
> On 2020-06-17 16:25, Wen Gong wrote:
>>> +
>>> +			skb_queue_tail(&ar->wmi_mgmt_tx_queue, skb);
>>> +			ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
>> https://patchwork.kernel.org/patch/2947291/
>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5e00d31a0fb74c36f3b174ff0d4914cf09016e6f)
>> 
>> Do you know why this patch used ieee80211_queue_work, not use "struct
>> workqueue_struct *workqueue" of ath10k?
> No one know it?
ieee80211_queue_work is use local->workqueue of ieee80211_hw, if it is 
blocked by some function of
mac80211 which is wait some mutex, then the pending worker of the queue 
from ath10k will not be
executed again, this is a risk of not using workqueue of ath10k.

I have hit issue about this:
cfg80211_leave called wdev_lock(wdev) to occupy lock, then 
ieee80211_sta_rx_queued_mgmt which is running in
local->workqueue of ieee80211_hw acquire the same lock by function 
sdata_lock(sdata), then it entered wait state
and the workqueue of ieee80211_hw blocked and all pending worker of it 
can not executed.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
