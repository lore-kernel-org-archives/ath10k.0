Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from [208.74.158.174] (helo=mail3.candelatech.com)
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRbLv-0000RQ-Pz
 for ath10k@lists.infradead.org; Fri, 17 May 2019 11:48:45 +0000
Subject: Re: Problem with 9984 in routed mode with 512b frames.
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <cdfa7b09-4e32-a62d-1bb6-d6128ba6594b@candelatech.com>
Date: Fri, 17 May 2019 04:48:41 -0700
MIME-Version: 1.0
In-Reply-To: <2ef800e2-5ce6-f579-ded5-65dc82827e4d@newmedia-net.de>
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
To: Sebastian Gottschall <s.gottschall@newmedia-net.de>, ath10k@lists.infradead.org



On 05/16/2019 09:21 PM, Sebastian Gottschall wrote:
>
> Am 16.05.2019 um 21:40 schrieb Ben Greear:
>> On 5/15/19 6:00 AM, Ben Greear wrote:
>>> On 5/15/19 5:26 AM, Sebastian Gottschall wrote:
>>>>
>>>> Am 15.05.2019 um 14:20 schrieb Ben Greear:
>>>>> On 05/14/2019 09:26 PM, Sebastian Gottschall wrote:
>>>>>> can you send me a detailed instruction for testing this on my devices? so which commands have been used for generating the traffic etc. (iperf3?)
>>>>>
>>>>> I am using our own traffic generator, but I imagine iperf3 should work fine too.
>>>>>
>>>>> I am testing on x86-64 and so forth.  Maybe you can test with UDP small-packet load on your platform
>>>>> in routed mode (ie, external iperf generator through your AP) and see if you see issues?
>>>> thats the plan. can you do a test with iperf3 to see if its reproduceable. i mean i will test it on ipq based boards and x64. but to make sure that the scenario
>>>> is identical which raised up your issue, it would be find if we have identical software for testing including the same options
>>
>> I think I found the issue.  The rate-ctrl logic in the firmware allows a transition from HT/VHT 20 MCS0 down to OFDM rates.
>> It seems the hardware does not like to see an AMPDU with an OFDM rate for 20Mhz and a VHT rate for 80Mhz (or maybe just the
>> single OFDM rate is the fault).
>>
>> If you can edit firmware, then setting this to 0 probably fixes the issue.
>>
>> g_rc_cck_rate_allowed
>
> according to the code this variable has only effect on 2.4 ghz. the fallback to cck rates will only be done if phymode is 2.4 ghz

Ok, maybe the symptom I saw with stock-ish firmware was due to some other cause.  In my firmware,
I had "fixed" that cck-fallback to use OFDM rates in case CCK was not available, so mine was
definitely trying to use an OFDM rate.

That said, very likely the same bug exists in upstream QCA firmware for 2.4Ghz radios where CCK is available,
so still might be worth fixing or at least adding API to let the user disable the fallback in case strange
problems are seen.

I am guessing that if it really wants to send OFDM/CCK rates, then it will have to use a different
TID that is not set up for AMPDUs, and the current code does not deal with that as far as I can tell.

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
