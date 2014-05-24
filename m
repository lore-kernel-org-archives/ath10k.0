Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wi0-f173.google.com ([209.85.212.173])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wo4aE-0006kP-7i
 for ath10k@lists.infradead.org; Sat, 24 May 2014 05:33:29 +0000
Received: by mail-wi0-f173.google.com with SMTP id bs8so1753459wib.0
 for <ath10k@lists.infradead.org>; Fri, 23 May 2014 22:32:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQk_G=UA-FsXOU+eoveYWLCLqs67Xj6muNUPVzKBdEL0-Q@mail.gmail.com>
References: <CAJ+vNU23qE-H0cp9fGams0h3xVJqNJQKNgX-2r0mPiV8ioz_rA@mail.gmail.com>
 <CAJ+vNU09pWS9+mheetHtvQfQACHDNfjzchkCc3zGBOWD7ef02w@mail.gmail.com>
 <CA+BoTQnYB8JESb7cvmivMM0WY_OC51WcuGp3aynwcmQTUxztpA@mail.gmail.com>
 <CAJ+vNU2eHHBQBFBbiRjntMn9qg_tXMpVcnkKtsV7KvXtXizVDA@mail.gmail.com>
 <CA+BoTQk_G=UA-FsXOU+eoveYWLCLqs67Xj6muNUPVzKBdEL0-Q@mail.gmail.com>
Date: Fri, 23 May 2014 22:32:59 -0700
Message-ID: <CAJ+vNU0KuGgGYVUyNbO=TTwH_P0zGszmFt6dBMWLNiO7APW0kw@mail.gmail.com>
Subject: Re: help troubleshooting low throughput
From: Tim Harvey <tharvey@gateworks.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Fri, May 23, 2014 at 12:42 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 22 May 2014 20:37, Tim Harvey <tharvey@gateworks.com> wrote:
>> On Thu, May 22, 2014 at 3:08 AM, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> On 22 May 2014 11:46, Tim Harvey <tharvey@gateworks.com> wrote:
>>>> On Thu, May 22, 2014 at 2:39 AM, Tim Harvey <tharvey@gateworks.com> wrote:
>>>>> Greetings,
>>>>>
>>>>> I could use some help troubleshooting a low throughput issue. I'm
>>>>> currently using the following:
>>>>>  - UNEX DAXA-O1 11ac/n/a 3x3 MIMO qca988x hw2.0
>>>>> http://www.unex.com.tw/product/daxa-o1
>>>>>  - 80MHz channel w/o local interference
>>>>>  - ath10k git 0dbbb028a7c461777bf4a0d53780e539e6f40e14 (May 16)
>>>>>  - up-to-date git of hostapd/wpa_supplicant/iw
>>>>>  - fw 10.1.467.2-1 api 2 htt 2.1
>>>>>  - infrastructure mode using
>>>>> http://wireless.kernel.org/en/users/Drivers/ath10k/configuration#Full_hostapd_configuration
>>>
>>> Did you just copy&paste the example config file (and updated
>>> interface=) or did you do something extra?
>>
>> Hi Michal,
>>
>> I disabled bridge mode, DFS, wpa, wps and added
>> 'vht_oper_centr_freq_seg0_idx=42' which appears to be something new
>> that is required or hostapd bails out:
>
> VHT requires a generic center frequency (or rather channel number in
> hostapd) to be provided. Since you have channel=36 then the center
> frequency for 80MHz bandwidth is 36+6 = 42.
>
>
>> ### hostapd configuration file
> [..]
>
> I'd try simply:
>
>> ht_capab=[HT40+][SHORT-GI-20][SHORT-GI-40]
>> vht_capab=[MAX-MPDU-11454][SHORT-GI-80][MAX-A-MPDU-LEN-EXP7]
>
> Otherwise it looks fine to me.
>
>
> [...]
>
>> Its showing 80Mhz MCS 5 (between 5 and 8)
>>
>> root@sta-97:~# iw wlan0 station dump
>> Station 60:02:b4:9d:99:7f (on wlan0)
>>         inactive time:  590 ms
>>         rx bytes:       160004
>>         rx packets:     1824
>>         tx bytes:       9832
>>         tx packets:     87
>>         tx retries:     0
>>         tx failed:      0
>>         signal:         -53 dBm
>>         signal avg:     -52 dBm
>>         tx bitrate:     6.0 MBit/s
>>         rx bitrate:     975.0 MBit/s VHT-MCS 7 80MHz short GI VHT-NSS 3
>>         authorized:     yes
>>         authenticated:  yes
>>         preamble:       long
>>         WMM/WME:        yes
>>         MFP:            no
>>         TDLS peer:      no
>>
>> ap is showing 80MHz width between MCS 5 and MCS 8:
>>
>> root@ap-99:~# iw wlan0 station dump
>> Station 60:02:b4:9d:99:62 (on wlan0)
>>         inactive time:  0 ms
>>         rx bytes:       275591916
>>         rx packets:     182178
>>         tx bytes:       4394890
>>         tx packets:     50807
>>         tx retries:     0
>>         tx failed:      0
>>         signal:         -60 dBm
>>         signal avg:     -60 dBm
>>         tx bitrate:     6.0 MBit/s
>>         rx bitrate:     702.0 MBit/s VHT-MCS 5 80MHz VHT-NSS 3
>>         authorized:     yes
>>         authenticated:  yes
>>         preamble:       long
>>         WMM/WME:        yes
>>         MFP:            no
>>         TDLS peer:      no
>
> This looks good. So rate control is doing rather fine. 3 spatial
> streams (VHT-NSS 3) are at work.
>
>
>>>>> I'm using iperf for throughput tests and getting no more than 220mbps
>>>>> best case, typically more like 120mbps. The rx bitrate bounces around
>>>>> MCS 5 to 8 and shows 3 spatial streams so I would be expecting a much
>>>>> higher throughput. The cards are in boards with a quad-core ARM 1GHz
>>>>> Cortex-A9 CPU and there is no indication the system is bottle-necked.
>>>>> There are no other kernel modules loaded other thank
>>>>> ath10k_pci/ath10k_core/ath and debugging is disabled.
>>>
>>> Currently ath10k doesn't really scale much with number of CPUs. There
>>> are basically two tasklets that could split the work just a little
>>> bit, but this requires interrupt spreading. From what I know some ARM
>>> chips can't do that so ath10k ends up using only single CPU all the
>>> time. 1GHz of an A9 should still be enough to get you 500mbps+ though.
>>
>> interesting. I see [ath10k_wq] in ps, what is the other task? ath10k
>> will just register 1 interrupt for PCI, how would you spread that if
>> only 1 ath10k device is in the system?
>
> ath10k_wq is the workqueue. It is not related to tasklets at all.
>
> Even if you have a single interrupt your controller may spread
> interrupts across sockets/cores/threads. So one time device issues an
> interrupt CPU0 gets interrupted and another time CPU1 gets
> interrupted.
>
>
>> I would agree that a 1GHz CortexA9 should be able to do well. The top
>> application shows that only CPU0 is being utilized and never more than
>> 25% or so (softirq mostly) and mostly idle. So I don't think this is
>> any sort of CPU bottleneck.
>
> The 25% sound fishy considering you have quad-core CPU. I'm not really
> sure if top (or top you use for that matter) reports percent wrt to a
> single CPU or globally. I would certainly investigate this. I recall
> vmstat sums everything up, i.e. if it says "25% sys" then it means
> "25% of your entrie CPU set is doing sys, regardless which core it
> is".
>
>
>>> Did you run TCP and/or UDP tests? What direction did you test
>>> (station->ap / ap->station)?
>>
>> both - the best throughput I see is appx 220mbps TCP and 260mbps UDP
>> and this is consistent in both directions.
>
> Did you try using the -P switch to send parallel streams? E.g. -u -b
> 100M -P5 for UDP?
>
> Also, now that I think about you don't have a bridge. This means your
> AP system has to perform a lot more packet mangling which I guess can
> be pretty taxing for the A9.
>

yep - turns out it is a cpu bottleneck. I'm not sure what I was
looking at when I checked the performance before but now I see that I
am hitting 100% utilization.

Putting the AP in a bridge and moving iperf off of it, brings up my
TCP bandwidth to 240mbps (at which point the STA running iperf is 100%
pegged) and 463mbps UDP (at which point the AP was 100% pegged).
Trying to move iperf off the STA to try to see what I could get TCP
bandwidth up to, I found that putting the STA in a bridge of the
(10.1...) firmware crashes which is the subject of another current
thread (http://lists.infradead.org/pipermail/ath10k/2014-May/002042.html),
so I'll respond about that there.

thanks for the help Michal!

Tim

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
