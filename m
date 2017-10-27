Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1e87pJ-0001r8-UF
 for ath10k@lists.infradead.org; Fri, 27 Oct 2017 16:49:47 +0000
Subject: Re: Throughput drop with ath10k latest driver and
 firmware-5.bin_10.2.4.70.66
References: <20171026105416.M52662@cdot.in>
 <df6008fe-79e0-ce06-c191-8557e11f1b3a@candelatech.com>
 <20171027081929.M60415@cdot.in>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <258d5ee0-6225-e03c-6d1c-0c88f6c50c70@candelatech.com>
Date: Fri, 27 Oct 2017 09:49:20 -0700
MIME-Version: 1.0
In-Reply-To: <20171027081929.M60415@cdot.in>
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
To: KAVITA MATHUR <kavitam@cdot.in>, ath10k <ath10k@lists.infradead.org>

On 10/27/2017 01:25 AM, KAVITA MATHUR wrote:
> On Thu, 26 Oct 2017 07:48:18 -0700, Ben Greear wrote
>> On 10/26/2017 04:20 AM, KAVITA MATHUR wrote:
>>> Hi,
>>>
>>> In my AP , there are two radios, one ath9k based module WLE200NX and second ath10k based
>>> WLE600VX.
>>>
>>> I configured both the radios as AP in IEEE 802.11a 40 MHz HT mode and performed
>>> throughput test.
>>>
>>> Measured throughput with ath9k is 164Mbps while with ath10k it is 137Mbps. I could not
>>> understand the reason of this drop(27 Mbps)?
>>>
>>> My test setup was inside RF-Shield. There was no interference and system was associated
>>> at 300Mbps in both cases.
>>>
>>> ath10k driver was taken from ath10k git and firmware version is
>>> firmware-5.bin_10.2.4.70.66.
>>> ath9k drives was taken from stable backport release backport-4.4.2-1.
>>>
>>> kernel version : 3.12
>>> openwrt version : Chaos Calmer 15.05.0
>>>
>>> Please suggest me how can I increase the throughput of my AP.
>>
>> Does it work any better with different firmware/software, or is ath10k just
>> always slower for you?
>
> Yes. Measured throughput in the same configuration was 193 Mbps when used ath10k driver
> from backport stable release backport-4.4.2-1 and firmware version
> firmware-5.bin_10.2.4.70.63-2. But this version is not stable for ac mode and it does
> not support MESH. Please suggest appropriate ath10k driver version and firmware.

I would try just changing the firmware and see if it is the firmware or the
driver change that causes decreased performance.

>
>>
>> How much attenuation are you using?
> Received Signal strength is -38 dBm and tx power is 5dBm in all these testcases.

That would seem to be a good RSSI, so attenuation is probably not the issue.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
