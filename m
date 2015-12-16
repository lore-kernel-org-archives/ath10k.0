Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9LzJ-0008Mh-7m
 for ath10k@lists.infradead.org; Thu, 17 Dec 2015 00:00:08 +0000
Subject: Re: [PATCH] ath10k: add modparam 'hw_csum' to make HW checksum
 configurable
References: <1450290051-15593-1-git-send-email-poh@qca.qualcomm.com>
 <5671AD10.70004@openwrt.org> <5671C99A.703@codeaurora.org>
 <5671CAF5.6010606@openwrt.org> <5671CDBD.5060006@codeaurora.org>
 <5671CF63.9040308@openwrt.org> <5671D56F.8030903@codeaurora.org>
 <5671DDA1.5030709@openwrt.org> <5671F8B7.2060801@codeaurora.org>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <5671FADD.6010009@openwrt.org>
Date: Thu, 17 Dec 2015 00:59:25 +0100
MIME-Version: 1.0
In-Reply-To: <5671F8B7.2060801@codeaurora.org>
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
To: Peter Oh <poh@codeaurora.org>, Peter Oh <poh@qca.qualcomm.com>, ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

On 2015-12-17 00:50, Peter Oh wrote:
> 
> On 12/16/2015 01:54 PM, Felix Fietkau wrote:
>> On 2015-12-16 22:19, Peter Oh wrote:
>>> On 12/16/2015 12:53 PM, Felix Fietkau wrote:
>>>> On 2015-12-16 21:46, Peter Oh wrote:
>>>>> On 12/16/2015 12:35 PM, Felix Fietkau wrote:
>>>>>> On 2015-12-16 21:29, Peter Oh wrote:
>>>>>>> On 12/16/2015 10:27 AM, Felix Fietkau wrote:
>>>>>>>> On 2015-12-16 19:20, Peter Oh wrote:
>>>>>>>>> Some hardwares such as QCA988X and QCA99X0 doesn't have
>>>>>>>>> capability of checksum offload when frame formats are not
>>>>>>>>> suitable for it such as Mesh frame.
>>>>>>>>> Hence add a module parameter, hw_csum, to make checksum offload
>>>>>>>>> configurable during module registration time.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
>>>>>>>> How about instead of inventing yet another crappy module parameter, you
>>>>>>>> call skb_checksum_help() in the driver in cases where the hardware is
>>>>>>>> unable to offload the checksum calculation.
>>>>>>>>
>>>>>>>> That way the user has to worry about less driver specific hackery ;)
>>>>>>> That will be good option for hardware not supporting HW checksum, but I
>>>>>>> mind that using the function will add more workload per every packet on
>>>>>>> critical data path when HW supports checksum resulting in throughput down.
>>>>>> I didn't mean calling it for every single frame in the data path.
>>>>>> What I'm suggesting is calling it selectively only for mesh frames, or
>>>>>> any other frames that the hardware cannot offload, and leaving the rest
>>>>>> for the hardware to process.
>>>>>>
>>>>>> There should be no performance difference between disabling checksum
>>>>>> offload and calling skb_checksum_help from the driver.
>>>>> To call it selectively for Mesh frame or interface, we need to add it on
>>>>> mac80211 layer such as ieee80211_build_hdr() since driver layer does not
>>>>> care the interface type in data path.
>>>> No need to change mac80211 - it only touches the headers, and
>>>> skb_checksum_help does not care about that. The skb has enough
>>>> information for it to find the right range to calculate the checksum and
>>>> the place to store it.
>>> If mentioned to use the function to mesh frame only without touching
>>> mac80211, then how do you suggest it to apply it only to mesh frame
>>> without interfere other data frames?
>>> Can you share your example?
>> It's trivial - in ath10k_tx you do this:
>>
>> if (vif->type == NL80211_IFTYPE_MESH_POINT &&
>>      skb->ip_summed == CHECKSUM_PARTIAL)
>> 	skb_checksum_help(skb);
> Thank you Felix for the quick response.
> I agree on your user experience opinion,
> but what do you think when ath10k has a new chip supporting HW checksum 
> for Mesh?
Then you simply update the checks. What's the big deal?

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
