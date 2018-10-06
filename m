Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g8kr9-0002qn-DI
 for ath10k@lists.infradead.org; Sat, 06 Oct 2018 11:34:48 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [RFC v5 01/12] ath10k: add struct ath10k_bus_params
References: <20180603182029.8914-2-erik.stromdahl@gmail.com>
 <20180906161624.B4751606FA@smtp.codeaurora.org>
 <9de4aaff-a26c-cac3-bc73-069834820a14@gmail.com>
Date: Sat, 06 Oct 2018 14:34:32 +0300
In-Reply-To: <9de4aaff-a26c-cac3-bc73-069834820a14@gmail.com> (Erik
 Stromdahl's message of "Thu, 6 Sep 2018 20:22:08 +0200")
Message-ID: <87ftxjgvg7.fsf@kamboji.qca.qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> On 9/6/18 6:16 PM, Kalle Valo wrote:
>> Erik Stromdahl <erik.stromdahl@gmail.com> wrote:
>>
>>> This struct is used as argument to ath10k_core_register in order to
>>> make it easier to add more bus parameters in the future.
>>>
>>> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>
>>> Signed-off-by: Kalle Valo <kvalo@codeaurora.org>
>>
>> 12 patches applied to ath-next branch of ath.git, thanks.
>>
>> c0d8d565787c ath10k: add struct ath10k_bus_params
>> 7c2dd6154fc2 ath10k: add device type enum to ath10k_bus_params
>> 367c899f622c ath10k: add bus type check in ath10k_init_hw_params
>> 9faaa14387fb ath10k: use hw_params.num_peers for num_tids in TLV init
>> 4875e0b52085 ath10k: add per target config of max_num_peers
>> e66d5361127a ath10k: DMA related fixes for high latency devices
>> 852d1bf86a5b ath10k: add HTT TX HL ops
>> d4e7f553eec3 ath10k: add HTT RX HL ops
>> 4daacc950d4d ath10k: htt: RX ring config HL support
>> a2097d6444c3 ath10k: htt: High latency TX support
>> f88d49345040 ath10k: htt: High latency RX support
>> 37f62c0d5822 ath10k: wmi: disable softirq's while calling ieee80211_rx
>>
>
> I am afraid that one of the patches in this series causes a regression
> for PCI devices :(
>
> The patch is:
>
> 4875e0b52085 ath10k: add per target config of max_num_peers
>
> With this patch I got an error during driver load.
> Reverting the patch solved the problem.
>
> I discovered this yesterday when I was setting up a test AP with an
> ath10k pcie device.
> I thought it would be a good idea to use my own tree just to make sure
> it works with PCI, and apparently it didn't work.
> I did some bisecting and the patch mentioned above turned out to be the culprit.
> I have not looked into why it fails yet (I think it is related to a
> bad num_peers value in the ath10k_hw_params_list array),
> I just noticed that reverting the patch solved the problem
>
> I was actually planning on submitting a v6 series with this patch
> removed, but you were faster.

Yeah, sorry about this. I noticed you marked the patchset as RFC but as
they looked so good I decided to take them anyway :)

But thanks for the quick fixes which I have applied and I think
everything is good now, right?

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
