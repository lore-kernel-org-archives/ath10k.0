Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wr1-f46.google.com ([209.85.221.46])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hRMnZ-0005v8-Q9
 for ath10k@lists.infradead.org; Thu, 16 May 2019 20:16:19 +0000
Received: by mail-wr1-f46.google.com with SMTP id r4so4727451wro.10
 for <ath10k@lists.infradead.org>; Thu, 16 May 2019 13:16:17 -0700 (PDT)
MIME-Version: 1.0
References: <e11b8d7f-bc28-bc66-fb8c-ff4db22d7c46@candelatech.com>
 <daaad6d3-cf60-4ddc-af20-279a0cbbbe0c@newmedia-net.de>
 <10ed4e39-4364-c8ef-2b38-15ea7672ad94@candelatech.com>
 <2ec6f626-6391-f9b5-918c-99ad7e6b3e31@newmedia-net.de>
 <ad97576c-d6dd-e29c-10d4-00b8aff77805@candelatech.com>
 <55b50a9a-49f4-d669-22d4-84e2efabf451@candelatech.com>
 <CAJ-Vmo=MgeKdUj+d7L6oJKfdSMb84D_nYHZ+BMSr6guB4Q_Y2Q@mail.gmail.com>
 <a41b74e9-230d-1094-cb86-3b105e602788@candelatech.com>
In-Reply-To: <a41b74e9-230d-1094-cb86-3b105e602788@candelatech.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Thu, 16 May 2019 13:16:04 -0700
Message-ID: <CAJ-VmokYa4LpQCokRu_7gp1LsV+-1fS=UmWd=6SZ07F-O5cw+w@mail.gmail.com>
Subject: Re: Problem with 9984 in routed mode with 512b frames.
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
Cc: Sebastian Gottschall <s.gottschall@newmedia-net.de>, ath10k <ath10k@lists.infradead.org>

You can't do AMPDU with OFDM/CCK. If they're setting the AMPDU bit
then that's wrong. it needs to be individual MPDU/PPDUs.

There's a benefit for CCK. OFDM 6M is I think roughly the same as OFDM
MCS0. But CCK is a lot more reliable.


-adrian

On Thu, 16 May 2019 at 13:10, Ben Greear <greearb@candelatech.com> wrote:
>
> On 5/16/19 12:55 PM, Adrian Chadd wrote:
> > You can totally go down to OFDM yeah but you then need to send it at
> > 20MHz and non-AMPDU.
> >
> > Is it maybe the retry code + rate control code is retagging an AMPDU
> > at a lower rate and it's transitioning down to CCK/OFDM without
> > breaking the AMPDU apart?
>
> It was sending a one-frame AMPDU, and one frame AMSDU for that matter.  Maybe
> there is some bit in the tx descriptor that needed to be twiddled as well
> to make OFDM able to work, but I don't know what that would be.
>
> Is there any advantage of (any) OFDM over MCS0 HT 20Mhz as far as range or
> SNR goes?  The chart I found made it look like there was not, and if
> not, then why bother at all with OFDM if peer advertises HT/VHT rates?
>
> Thanks,
> Ben
>
> >
> >
> > -a
> >
> > On Thu, 16 May 2019 at 12:40, Ben Greear <greearb@candelatech.com> wrote:
> >>
> >> On 5/15/19 6:00 AM, Ben Greear wrote:
> >>> On 5/15/19 5:26 AM, Sebastian Gottschall wrote:
> >>>>
> >>>> Am 15.05.2019 um 14:20 schrieb Ben Greear:
> >>>>> On 05/14/2019 09:26 PM, Sebastian Gottschall wrote:
> >>>>>> can you send me a detailed instruction for testing this on my devices? so which commands have been used for generating the traffic etc. (iperf3?)
> >>>>>
> >>>>> I am using our own traffic generator, but I imagine iperf3 should work fine too.
> >>>>>
> >>>>> I am testing on x86-64 and so forth.  Maybe you can test with UDP small-packet load on your platform
> >>>>> in routed mode (ie, external iperf generator through your AP) and see if you see issues?
> >>>> thats the plan. can you do a test with iperf3 to see if its reproduceable. i mean i will test it on ipq based boards and x64. but to make sure that the scenario
> >>>> is identical which raised up your issue, it would be find if we have identical software for testing including the same options
> >>
> >> I think I found the issue.  The rate-ctrl logic in the firmware allows a transition from HT/VHT 20 MCS0 down to OFDM rates.
> >> It seems the hardware does not like to see an AMPDU with an OFDM rate for 20Mhz and a VHT rate for 80Mhz (or maybe just the
> >> single OFDM rate is the fault).
> >>
> >> If you can edit firmware, then setting this to 0 probably fixes the issue.
> >>
> >> g_rc_cck_rate_allowed
> >>
> >> I think to reproduce you'd need to send high speed traffic in a situation where the
> >> RF environment is going to make rate-ctrl fail quite a bit.  (Slow speed should
> >> work too, but it would likely take a lot longer).
> >>
> >> And, it is always possible that whatever I saw when testing mostly-stock FW is different
> >> from what I eventually debugged to in my firmware.  Still, from looking at MCS vs SNR
> >> charts, there seems to be no advantage to trying OFDM vs MCS0 for 20Mhz.
> >>
> >> Thanks,
> >> Ben
> >>
> >> --
> >> Ben Greear <greearb@candelatech.com>
> >> Candela Technologies Inc  http://www.candelatech.com
> >>
> >>
> >> _______________________________________________
> >> ath10k mailing list
> >> ath10k@lists.infradead.org
> >> http://lists.infradead.org/mailman/listinfo/ath10k
> >
>
>
> --
> Ben Greear <greearb@candelatech.com>
> Candela Technologies Inc  http://www.candelatech.com
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
