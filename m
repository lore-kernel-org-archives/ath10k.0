Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from arrakis.dune.hu ([78.24.191.176])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a9InL-0000WV-Pf
 for ath10k@lists.infradead.org; Wed, 16 Dec 2015 20:35:32 +0000
Subject: Re: [PATCH] ath10k: add modparam 'hw_csum' to make HW checksum
 configurable
References: <1450290051-15593-1-git-send-email-poh@qca.qualcomm.com>
 <5671AD10.70004@openwrt.org> <5671C99A.703@codeaurora.org>
From: Felix Fietkau <nbd@openwrt.org>
Message-ID: <5671CAF5.6010606@openwrt.org>
Date: Wed, 16 Dec 2015 21:35:01 +0100
MIME-Version: 1.0
In-Reply-To: <5671C99A.703@codeaurora.org>
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

On 2015-12-16 21:29, Peter Oh wrote:
> 
> On 12/16/2015 10:27 AM, Felix Fietkau wrote:
>> On 2015-12-16 19:20, Peter Oh wrote:
>>> Some hardwares such as QCA988X and QCA99X0 doesn't have
>>> capability of checksum offload when frame formats are not
>>> suitable for it such as Mesh frame.
>>> Hence add a module parameter, hw_csum, to make checksum offload
>>> configurable during module registration time.
>>>
>>> Signed-off-by: Peter Oh <poh@qca.qualcomm.com>
>> How about instead of inventing yet another crappy module parameter, you
>> call skb_checksum_help() in the driver in cases where the hardware is
>> unable to offload the checksum calculation.
>>
>> That way the user has to worry about less driver specific hackery ;)
> That will be good option for hardware not supporting HW checksum, but I 
> mind that using the function will add more workload per every packet on 
> critical data path when HW supports checksum resulting in throughput down.
I didn't mean calling it for every single frame in the data path.
What I'm suggesting is calling it selectively only for mesh frames, or
any other frames that the hardware cannot offload, and leaving the rest
for the hardware to process.

There should be no performance difference between disabling checksum
offload and calling skb_checksum_help from the driver.

- Felix

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
