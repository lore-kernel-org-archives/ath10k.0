Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XS5CG-0003nE-Ku
 for ath10k@lists.infradead.org; Thu, 11 Sep 2014 14:18:05 +0000
Message-ID: <5411AF03.9010008@candelatech.com>
Date: Thu, 11 Sep 2014 07:17:39 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC] ath10k: use raw tx
References: <1408693965-29858-1-git-send-email-michal.kazior@tieto.com>	<5400F497.7070904@candelatech.com>	<CA+BoTQnhqxtHcX46-U+TjQBMDm27jM11xCJ956UFM_gjMvvs+A@mail.gmail.com>
 <87ha0e302p.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87ha0e302p.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/11/2014 03:47 AM, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> On 29 August 2014 23:45, Ben Greear <greearb@candelatech.com> wrote:
>>> On 08/22/2014 12:52 AM, Michal Kazior wrote:
>>>> This is just a reference for anyone interested in
>>>> getting injection working with ath10k.
>>>
>>> Did you try this with encryption?  I can reproduce the crash
>>> in open mode on my CT firmware, but I couldn't even get
>>> DHCP to complete with wpa2 enabled.
>>
>> Hi,
>>
>> Late reply, sorry.
>>
>> I've just did a quick test on 10.2 (both AP and STA) with WPA2.
>> Apparently the raw tx mode requires IV to be set up on host and packet
>> length (reported in HTT Tx command header) must be re-adjusted
>> differently, otherwise frames are broken (incorrect FCS, too long,
>> somewhat encrypted except LLC/SNAP). The best I could get were
>> FCS-correct undecryptable frames on air. Perhaps someone will figure
>> that out..
>>
>> Another way around this would be to perform software crypto for tx
>> entirely on host.
>
> BTW, it would be nice to get software crypto support to ath10k, for
> example with a nohwcrypt module parameter like ath9k has.

You have to hack the firmware (and patch driver) to make this work.  I have patches to make
rx-sw-crypt work with my CT firmware.  Been releasing this only for non-commercial
use, but I'd be willing to make it supported without restriction and instead
limit number of stations to < 16 when sw-crypt was enabled.  This leaves my
commercial offering worth paying for for the few people that might compete against
our testing products.

I had all sorts of trouble, similar to what you describe trying to get raw tx
to work, and eventually gave up entirely.  My method of rx-sw-crypt uses normal tx
(with hardware offload), but decrypts on the host.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
