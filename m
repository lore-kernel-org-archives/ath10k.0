Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YQjJX-00072z-4J
 for ath10k@lists.infradead.org; Wed, 25 Feb 2015 21:16:15 +0000
Message-ID: <54EE3B89.6070803@candelatech.com>
Date: Wed, 25 Feb 2015 13:15:53 -0800
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Question on setting tx-power in ath10k.
References: <54EE1355.3010306@candelatech.com>
 <CAJ-VmoncKPbb+D0Z0N9ntov71B-UX8AT2pOyvCgcH1tYAsu+kA@mail.gmail.com>
In-Reply-To: <CAJ-VmoncKPbb+D0Z0N9ntov71B-UX8AT2pOyvCgcH1tYAsu+kA@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

On 02/25/2015 11:55 AM, Adrian Chadd wrote:
> Yeah I remember this stuff. ath9k did the same thing too; it subtracts
> TX power based on 2-chain and 3-chain; assuming that the max transmit
> power in the EEPROM is actually the 3-chain value so it can get the
> per-chain transmit power.
> 
> Thing is, whenever I actually looked at the output on a spectrum
> analyser, the target power differed from what the card was rated at by
> exactly 3 and 5 dBm respectively. Grr.
> 
> In FreeBSD I look at the number of configured chains for that TX
> attempt and set the TX power cap appropriately per-packet. Grr.

We have a spectrum analyzer now, but I'm not sure if I can even force
the NIC to run at a specific HT or VHT rate, so not so sure how to
test the changes properly.

Either way, even if I adjust this as I am trying to do now
(on a per-rate basis based on number of chains that rate uses)
the min/max power restraints stay in place, so it should still
be fine as far as regulations are concerned.

Thanks for the info.

Ben

> 
> 
> -adrian
> 
> On 25 February 2015 at 10:24, Ben Greear <greearb@candelatech.com> wrote:
>> I have added some debugging in my CT firmware based on 10.1.467, and I have noticed
>> that anything below 5db is treated as zero by the firmware.  This is due primarily to
>> subtracting a fixed amount based on the NIC's configured chainmask.
>>
>> I am guessing this is not entirely correct, since at /b rates, for instance, we
>> will be transmitting on only a single chain, so it does not matter how many
>> chains the hardware has?
>>
>> Anyone have any insight on how this stuff is *supposed* to work?
>>
>> If you have access to firmware source, plz contact me off the mailing list
>> and I can provide more details about the code that looks broken.
>>
>> Thanks,
>> Ben
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
> 


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
