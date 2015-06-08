Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z23GO-0002B3-03
 for ath10k@lists.infradead.org; Mon, 08 Jun 2015 20:03:16 +0000
Message-ID: <5575F4EE.9010700@candelatech.com>
Date: Mon, 08 Jun 2015 13:02:54 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Does the reg_addr/reg_value reading work?
References: <5575BEB1.4010706@candelatech.com> <5575C6E4.6050809@dd-wrt.com>
 <5575F0E2.202@candelatech.com>
In-Reply-To: <5575F0E2.202@candelatech.com>
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
To: Sebastian Gottschall <s.gottschall@dd-wrt.com>
Cc: ath10k@lists.infradead.org

On 06/08/2015 12:45 PM, Ben Greear wrote:
> On 06/08/2015 09:46 AM, Sebastian Gottschall wrote:
>> Am 08.06.2015 um 18:11 schrieb Ben Greear:
>>> I am not getting expected values when I try to read registers
>>> through the ath10k reg_addr/reg_value API.
>>>
>>> For instance, I tried reading a particular register 0x80e0
>>> (as defined in the firmware), and I get a zero value.  With a different
>>> API that I wrote to dump some specific registers over the WMI API,
>>> I get the expected value.
>>>
>>> # echo 0x80e0 > /debug/ieee80211/wiphy0/ath10k/reg_addr
>>> # cat /debug/ieee80211/wiphy0/ath10k/reg_value
>>> 0x000080e0:0x00000000
>>> # cat /debug/ieee80211/wiphy0/ath10k/fw_regs
>>>
>>>     ath10k Target Register Dump
>>>               =================
>>>
>>>             MAC-FILTER-ADDR-L32 0xd7ffffff
>>> ...
>>>
>>> Is there some trick I am missing?
>> 0x20000 offset makes the voodoo. you will find this offset within your firmware source too. take a look at the preconfigured register tables. these contain
>> already the ack,slot etc. settings.
>> but with a special macro surrounding it which defines that offset
>>
>> echo 0x2080e0 > /debug/ieee80211/wiphy0/ath10k/reg_addr
> 
> This crashes my kernel....I instrumented the place that crashed in ath10k/pci.h:
> 
> [  100.676013] ath10k-pci-read32: ar ffff88020279ae20  ar_pci ffff88020279df08  offset: 0x2080e0
> [  100.676016]   ar_pci->mem: 0xffffc90019c80000
> [  100.676031] BUG: unable to handle kernel paging request at ffffc90019e880e0
> [  100.681752] IP: [<ffffffff81364ad4>] ioread32+0x9/0x2f
> 
> Have you tried this on a 10.1.467 firmware?
> 
> And, what kernel?  I'm trying 4.0.4+

I was using the wrong address value..it should be 0x280e0.  Maybe the driver should still keep us from
crashing the whole kernel (while holding locks!), but at least it works when I put in
the right value.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
