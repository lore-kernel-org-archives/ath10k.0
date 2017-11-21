Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eH1om-0002bO-I6
 for ath10k@lists.infradead.org; Tue, 21 Nov 2017 06:14:02 +0000
MIME-Version: 1.0
Date: Tue, 21 Nov 2017 11:43:36 +0530
From: akolli@codeaurora.org
Subject: Re: ath10k: Fix reported HT MCS rates with NSS > 1
In-Reply-To: <87po8df8wc.fsf@kamboji.qca.qualcomm.com>
References: <20170511090930.18205-1-sven.eckelmann@openmesh.com>
 <1728147.6Xy77nSgBU@bentobox>
 <d27a10b1-6323-ebf0-5c2d-4a9c3b8d978d@dd-wrt.com>
 <1960925.hkIbv4gX65@bentobox>
 <bfcfa3eb-fb45-cb8d-ad87-a5fe6dc96fe3@bowerswilkins.com>
 <87po8df8wc.fsf@kamboji.qca.qualcomm.com>
Message-ID: <bcebd30e279840a62b53043865d4db29@codeaurora.org>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: linux-wireless-owner@vger.kernel.org, Anilkumar Kolli <akolli@qti.qualcomm.com>, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, Sebastian Gottschall <s.gottschall@dd-wrt.com>, Sven Eckelmann <sven.eckelmann@openmesh.com>, Peter Oh <peter.oh@bowerswilkins.com>

On 2017-11-20 17:40, Kalle Valo wrote:
> Peter Oh <peter.oh@bowerswilkins.com> writes:
> 
>> On 11/06/2017 01:02 AM, Sven Eckelmann wrote:
>>> On Montag, 6. November 2017 09:28:42 CET Sebastian Gottschall wrote:
>>>> Am 06.11.2017 um 09:23 schrieb Sven Eckelmann:
>>>>> On Sonntag, 5. November 2017 10:22:22 CET Sebastian Gottschall 
>>>>> wrote:
>>>>>> the assumption made in this patch is obviously wrong (at least for 
>>>>>> more
>>>>>> recent firmwares and 9984)
>>>>>> my log is flooded with messages like
>>>>>> [208802.803537] ath10k_pci 0001:03:00.0: Invalid VHT mcs 15 peer 
>>>>>> stats
>>>>>> [208805.108515] ath10k_pci 0001:03:00.0: Invalid VHT mcs 15 peer 
>>>>>> stats
>>>>>> [208821.747621] ath10k_pci 0001:03:00.0: Invalid VHT mcs 15 peer 
>>>>>> stats
>>>>>> [208822.516599] ath10k_pci 0001:03:00.0: Invalid VHT mcs 15 peer 
>>>>>> stats
>>>>>> [208841.257780] ath10k_pci 0001:03:00.0: Invalid VHT mcs 15 peer 
>>>>>> stats
>>> [...]
>>>>> This patch only splits WMI_RATE_PREAMBLE_HT & 
>>>>> WMI_RATE_PREAMBLE_VHT. And for
>>>>> WMI_RATE_PREAMBLE_HT (*not VHT*), it uses a slightly different 
>>>>> approach. But
>>>>> the WMI_RATE_PREAMBLE_VHT part (which you see in your logs) is 
>>>>> basically
>>>>> untouched.
>>>> then a question follows up. is this check really neccessary?
>>> Until we find out what the heck VHT MCS 15 should mean in this 
>>> context - maybe.
>>> But to the message - no, the message is most likely not necessary for 
>>> each
>>> received "invalid" peer tx stat.
>> 
>> This validation check expects peer tx stat packets from FW contain
>> reasonable values and gives warning if values are different from
>> expectation. The problem comes from the assumption that "it always
>> contains reasonable stat value" which is wrong at least based on my
>> results. For instance, the reason MCS == 15 is because all 4 bits of
>> mcs potion set to 1, not because FW really sets it to 15
>> intentionally. when the mcs potion bits are set to all 1s, the other
>> bits such as nss are also set to all 1s.
>> Hence it looks FW passed totally invalid stat info to me.
>> 
>> I don't have preference on whether it's better to split VHT and HT
>> check or not, but it is more appropriate to change that warning level
>> to debug level.
> 
> I think we should add a special case to not print the warning if mcs ==
> 15 until we figure out what it means.

Fix identified in Firmware and will push ASAP.

--
Anil.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
