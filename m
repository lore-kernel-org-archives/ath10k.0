Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr1.cc.ipv6.vt.edu ([2607:b400:92:8300:0:c6:2117:b0e]
 helo=omr1.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bDdQv-0004wm-SM
 for ath10k@lists.infradead.org; Thu, 16 Jun 2016 19:58:34 +0000
Received: from mr5.cc.vt.edu (mr5.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:2b8:b328:9234])
 by omr1.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5GJw53E009522
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 15:58:05 -0400
Received: from mail-lf0-f69.google.com (mail-lf0-f69.google.com
 [209.85.215.69])
 by mr5.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5GJvxbK010036
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 15:58:04 -0400
Received: by mail-lf0-f69.google.com with SMTP id g18so31201095lfg.2
 for <ath10k@lists.infradead.org>; Thu, 16 Jun 2016 12:58:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5758FD6B.40409@candelatech.com>
References: <CAFc9h7uxTOUxONvW-gvgkFLUNR9OBn09kfetF9gqAtcNqN3SLg@mail.gmail.com>
 <5758FD6B.40409@candelatech.com>
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Thu, 16 Jun 2016 15:57:57 -0400
Message-ID: <CAFc9h7s69rVpMNUx553zsHfLf2uLcqx0jhKqma-+SxA6EkybMA@mail.gmail.com>
Subject: Re: Dynamic Bandwidth in hw rate control
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Hi Ben,

Thanks for your reply.

I wanted to know if the dynamic bandwidth option implemented in ath10k
is the same as that mentioned in the standard, or does it deviate? I
tried to look for any documentation on ath10k dynamic bandwidth, but
could not find any.

If I am not wrong, on the secondary channel, the sender senses the
channel for PIFS interval of time immediately preceding the start of
the TXOP (9.19.2.8 in the standard). In the static mode, if the
secondary channel is sensed busy, the sender waits until all channels
become idle; but in the dynamic mode, the sender sends on the primary
and (adjacent) secondary channel that are not busy.

However, the documentation for dynamic bandwidth in ath10k/mac.c seems
to suggest that the transmission retries are carried over narrower
bandwidth in dynamic mode. Does this mean the same as what is given in
the standard? Or is the dynamic mode implemented differently? Any help
is appreciated.

Thanks,
Gaurang.

On Thu, Jun 9, 2016 at 1:23 AM, Ben Greear <greearb@candelatech.com> wrote:
>
>
> On 06/08/2016 08:10 PM, Gaurang Ramesh Naik wrote:
>>
>> Hi,
>>
>> I needed a small clarification related to dynamic bandwidth setup. The
>> documentation in wmi.h says " When enabled HW rate control tries
>> different bandwidths when retransmitting frames."
>>
>> Does this mean that each packet is first always tried over VHT80 and
>> if that fails it goes to HT40 and then to HT20? I tried this with one
>> AP-Sta operating in VHT80 and one AP operating in its first secondary
>> channel. When I check the rx rate info using "iw dev wlanx station
>> dump", the bandwidth seems to sometimes alternate between 20 and 80,
>> but sometimes it stays fixed at 20. Hence, I was wondering what really
>> happens.
>
>
> For one thing, if the hardware detects interference on secondary channels,
> then it may decide to transmit a 20Mhz encoding.
>
> The rate-ctrl algs in the firmware differ from release to release, but
> the general goal is to transmit with the fastest encoding rate.
>
> Thanks,
> Ben
>
>>
>> Thanks,
>> Gaurang.
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k
>>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
