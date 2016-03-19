Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85 #2 (Red Hat Linux))
 id 1ahJ2o-0003GI-6l
 for ath10k@lists.infradead.org; Sat, 19 Mar 2016 15:44:02 +0000
Message-ID: <56ED7382.4030107@candelatech.com>
Date: Sat, 19 Mar 2016 08:42:58 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Why does the driver configure only 2 keys per peer?
References: <56EC6456.2060007@candelatech.com>
 <CAJ-Vmo=C2Y+E4kELzHaAEYtxa3YZyy84cctvo+Rj_ndk1ixznQ@mail.gmail.com>
In-Reply-To: <CAJ-Vmo=C2Y+E4kELzHaAEYtxa3YZyy84cctvo+Rj_ndk1ixznQ@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>
Cc: ath10k <ath10k@lists.infradead.org>

No, the hardware can handle plenty of slots...looks to me like no one
actually tested to the configured limits and/or they got lucky while
testing.  As long as it is possible for user-space to (temporarily?)
configure 4 keys per peer, then the firmware can assert.  I'll just
increase the keys per peer.  Uses a bit more firmware memory, but
better than crashing.

Thanks,
Ben

On 03/18/2016 08:25 PM, Adrian Chadd wrote:
> I'm guessing it's because there were customers who er, "needed" more
> STAs, and there's only a fixed number of hardware slots in the MAC.
>
>
> -a
>
>
> On 18 March 2016 at 13:25, Ben Greear <greearb@candelatech.com> wrote:
>> For instance:
>>
>> #define TARGET_10_4_NUM_PEER_KEYS               2
>>
>> But, there are 4 key-ids, and so the driver can attempt to allocate 3 per
>> peer.
>>
>> Now, the self-peer probably only has one key ever (and that is blank key),
>> but that still averages to 5 per vdev (when vdev has 2 peers), and if AP
>> peers can have more than 2
>> keys, then the average is even worse for them.
>>
>> In 10.1, I ended up using '4' instead of 2.
>>
>> I guess I'm about to repeat that change for 10.4 firmware.
>>
>> But, I'm curious why someone thought 2 was OK to begin with?
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
