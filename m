Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from m43-7.mailgun.net ([69.72.43.7])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jnuSq-0004e5-Qg
 for ath10k@lists.infradead.org; Wed, 24 Jun 2020 01:44:41 +0000
MIME-Version: 1.0
Date: Wed, 24 Jun 2020 09:44:23 +0800
From: Wen Gong <wgong@codeaurora.org>
Subject: Re: [v2,08/13] ath10k: bring back the WMI path for mgmt frames
In-Reply-To: <87sgemdmve.fsf@codeaurora.org>
References: <88b587e85324b50a23a20676c7088d0c@codeaurora.org>
 <12d316171b15203f0242a13d5c690687@codeaurora.org>
 <87sgemdmve.fsf@codeaurora.org>
Message-ID: <9442934f08a514bbb7eda5753690874d@codeaurora.org>
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
Cc: ath10k@lists.infradead.org, bartosz.markowski@tieto.com

On 2020-06-23 19:48, Kalle Valo wrote:
> Wen Gong <wgong@codeaurora.org> writes:
> 
>> On 2020-06-17 16:25, Wen Gong wrote:
>>>> +
>>>> +			skb_queue_tail(&ar->wmi_mgmt_tx_queue, skb);
>>>> +			ieee80211_queue_work(ar->hw, &ar->wmi_mgmt_tx_work);
>>> https://patchwork.kernel.org/patch/2947291/
>>> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=5e00d31a0fb74c36f3b174ff0d4914cf09016e6f)
>>> 
>>> Do you know why this patch used ieee80211_queue_work, not use "struct
>>> workqueue_struct *workqueue" of ath10k?
>> 
>> No one know it?
> 
> This is a patch from 7 years ago, it's quite difficult to remember
> anything else than what's in the commit log. And I don't think the 
> email
> address for Bartosz works anymore.
Thanks Kalle.
I hit issue on ath11k, and I have fixed it.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
