Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp3.ugent.be ([157.193.49.127])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cipdR-0004If-Sf
 for ath10k@lists.infradead.org; Tue, 28 Feb 2017 21:48:45 +0000
From: "Ralph Houthoofdt" <ralph.houthoofdt@ugent.be>
References: <00d001d291e2$dfb7d950$9f278bf0$@rora.be>
 <ef864ddb-87e0-5eb6-e8f0-6d4e7af2decf@candelatech.com>
 <00f501d291e9$3921a740$ab64f5c0$@ugent.be>
 <ff2defd2-5a79-06c6-d92b-2f546b037125@candelatech.com>
 <00f801d291ec$c7621910$56264b30$@ugent.be>
 <67dc016b-7533-8984-bbae-5283d261ca2f@candelatech.com>
In-Reply-To: <67dc016b-7533-8984-bbae-5283d261ca2f@candelatech.com>
Subject: RE: QCA9880 slow performance adhoc/IBSS mode
Date: Tue, 28 Feb 2017 22:48:42 +0100
Message-ID: <003c01d2920c$6df87cf0$49e976d0$@ugent.be>
MIME-Version: 1.0
Content-Language: nl-be
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: 'Ben Greear' <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Dear Ben,

The speeds I'm reporting are UDP using these commands for the client:
Iperf3 -uVc <serverAddress> -b0 -w128k
Iperf3 -uRVc <serverAddress> -b0 -w128k

I will try relocating the nodes and try different antenna positions and
angles.
As you see it, this problem is purely because of the environment, not
because of the configuration or drivers?

I will let you know what the results of relocation are tomorrow. Thanks for
your help!

Kind regards,
Met vriendelijke groeten,
Ralph Houthoofdt
Student master industri=EBle wetenschappen: informatica

-----Original Message-----
From: Ben Greear [mailto:greearb@candelatech.com] =

Sent: dinsdag 28 februari 2017 19:12
To: Ralph Houthoofdt <ralph.houthoofdt@ugent.be>
Cc: ath10k@lists.infradead.org
Subject: Re: QCA9880 slow performance adhoc/IBSS mode

You try UDP yet, or is this all TCP?

Also, with some better antenna positions and/or better other RF environment,
you should see NSS of 3, hopefully MCS of 6 or higher.

On 02/28/2017 10:02 AM, Ralph Houthoofdt wrote:
> Dear Ben,
>
> I ran the same test again, this time running the iperf3 server on my =

> laptop and the client on the node. I could indeed see CPU usage rise =

> to 40% on my laptop, the node stayed at roughly 10%. The speeds =

> remained roughly the same. 215Mbit one way, 40Mbit the other.
>
> As for the tx/rx rates I get these values:
> tx bitrate:     234.0 MBit/s VHT-MCS 3 80MHz VHT-NSS 2
> rx bitrate:     87.8 MBit/s VHT-MCS 2 80MHz VHT-NSS 1
>
> I set the 4 antennas facing different directions approximately at 135 =

> degree angles relative to the device.

You try UDP yet, or is this all TCP?

Also, with some better antenna positions and/or better other RF environment,
you should see NSS of 3, hopefully MCS of 6 or higher.

The 9880 has 3 antenna, so how did you get to 4?

Thanks,
Ben

>
> Thank you for your help so far. I will be leaving home for a few hours =

> and will be responding to any replies tomorrow morning.
>
> Met vriendelijke groeten,
> Ralph Houthoofdt
> Student industri=EBle wetenschappen informatica
>
> -----Original Message-----
> From: Ben Greear [mailto:greearb@candelatech.com]
> Sent: dinsdag 28 februari 2017 18:42
> To: Ralph Houthoofdt <ralph.houthoofdt@ugent.be>
> Cc: ath10k@lists.infradead.org
> Subject: Re: QCA9880 slow performance adhoc/IBSS mode
>
> Try UDP to make sure you are not hitting a TCP issue.
>
> Try running iperf server on another laptop so that CPU of your nodes =

> is less important.
>
> Check the tx/rx encoding rates to make sure you are getting good RF =

> behaviour.  'iw ... station dump'
>
> Ensure antennas are not pointing all in the same direction so that you =

> can get some diversity working.
>
> Thanks,
> Ben
>
> On 02/28/2017 09:36 AM, Ralph Houthoofdt wrote:
>> Dear Ben,
>>
>> Thank you for your quick reply.
>>
>> My mesh is running on channel 36  using VHT80 and a TX power of 20 =

>> dbm, the maximum allowed according to my regulatory settings from iw =

>> reg get. The hwmode is set as 11a.
>> I have also enable the following ht_capabilities on my radio in
>> /etc/config/wireless:
>>
>>         list ht_capab 'short_gi_80'
>>         list ht_capab 'max-mpdu-11454'
>>         list ht_capab 'TX-STBC-2BY1'
>>         list ht_capab 'RX-STBC1'
>>         list ht_capab 'RX-ANTENNA-PATTERN'
>>         list ht_capab 'TX-ANTENNA-PATTERN'
>>         list ht_capab 'MAX-A-MPDU-LEN-EXP7'
>>
>> I just finished running iperf3 from my laptop (2nd gen Core i7) to =

>> one of my nodes. The results were indeed a bit different.
>> Iperf server was running on my node and my laptop was the client.
>> UDP:
>> Normal: average result of 221Mbit, which is pretty normal I think.
>> Reverse: average result of 41Mbit, which is better than the average =

>> 20Mbit I got when running iperf3 using 2 nodes.
>> TCP:
>> Normal: average result of 49Mbit
>> Reverse: average result of 35.4Mbit
>>
>> In terms of congestion, I'm not sure what you mean, but I'm in a low =

>> populated area with few wireless access points. I disabled all my =

>> 5GHz devices except for the mesh nodes. InSSIDer only shows my nodes =

>> in the 5GHz range.
>>
>> Is there anything else I could try for you?
>>
>> Met vriendelijke groeten,
>> Ralph Houthoofdt
>> Student industri=EBle wetenschappen informatica
>>
>> -----Original Message-----
>> From: ath10k [mailto:ath10k-bounces@lists.infradead.org] On Behalf Of =

>> Ben Greear
>> Sent: dinsdag 28 februari 2017 17:56
>> To: Ralph Houthoofdt <ralph@rora.be>; ath10k@lists.infradead.org
>> Subject: Re: QCA9880 slow performance adhoc/IBSS mode
>>
>> Run iperf on a separate machine, as the apu2 have too weak of a CPU =

>> to drive the wifi network at full speed.  And, publish what results =

>> you do get, including RF information such as channel and how =

>> congested is your test area.  Try udp as well as tcp.
>>
>> Thanks,
>> Ben
>>
>> On 02/28/2017 08:51 AM, Ralph Houthoofdt wrote:
>>> Dear all,
>>>
>>> I=92m currently doing me masters thesis on the subject of Wireless =

>>> Mesh Networks and how to optimize them for home use.
>>> The devices I use are 5x PC Engine APU2c4 with 2x QCA9880 chip =

>>> (Compex WLE900VX). All of them are running LEDE (OpenWRT fork).
>>>
>>> The problem I=92m experiencing is the same as =

>>> http://lists.infradead.org/pipermail/ath10k/2017-January/009075.html .
>>> Using the tips mentioned I did not come to a better performance. I=92m =

>>> thinking it=92s driver related..
>>> When running iperf3 only one direction is running at a reasonable =

>>> throughput. Since I am using adhoc mode primarily I decided to use =

>>> these
>>> packages:
>>> -	Kmod-ath10k-ct
>>> -	Ath10k-firmware-qca988x-ct
>>> Some sources on the internet said that using the Candela Tech =

>>> drivers should result in better support for adhoc/mesh networks.
>>>
>>> As suggested in the other issue linked above, I switched TCP =

>>> congestion control to =91Reno=92 instead of the default =91Cubic=92.
>>> I also did try the command =93iw reg set BE=94 since I am from Belgium, =

>>> but running =93iw reg get=94 right after still gave me US as a result.
>>>
>>> Let me know what additional command info I should post. Any help =

>>> would be greatly appreciated.
>>>
>>> Iwconfig:
>>> adhoc0    IEEE 802.11  ESSID:"mesh"
>>>           Mode:Ad-Hoc  Frequency:5.18 GHz  Cell: 02:CA:FE:CA:CA:40
>>>           Tx-Power=3D20 dBm
>>>           RTS thr:off   Fragment thr:off
>>>           Encryption key:off
>>>           Power Management:off
>>>
>>>
>>> Iw reg get (I=92m from Belgium):
>>> global
>>> country BE: DFS-ETSI
>>>         (2402 - 2482 @ 40), (N/A, 20), (N/A)
>>>         (5170 - 5250 @ 80), (N/A, 20), (N/A), AUTO-BW
>>>         (5250 - 5330 @ 80), (N/A, 20), (0 ms), DFS, AUTO-BW
>>>         (5490 - 5710 @ 160), (N/A, 27), (0 ms), DFS
>>>         (57000 - 66000 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#1
>>> country US: DFS-FCC
>>>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>>>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>>>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>>>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>>>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>>>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>>>
>>> phy#0
>>> country US: DFS-FCC
>>>         (2402 - 2472 @ 40), (N/A, 30), (N/A)
>>>         (5170 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>>>         (5250 - 5330 @ 80), (N/A, 23), (0 ms), DFS, AUTO-BW
>>>         (5490 - 5730 @ 160), (N/A, 23), (0 ms), DFS
>>>         (5735 - 5835 @ 80), (N/A, 30), (N/A)
>>>         (57240 - 63720 @ 2160), (N/A, 40), (N/A)
>>>
>>>
>>> Kind regards,
>>> Met vriendelijke groeten,
>>> Ralph Houthoofdt
>>> Student industri=EBle wetenschappen informatica
>>>
>>>
>>> _______________________________________________
>>> ath10k mailing list
>>> ath10k@lists.infradead.org
>>> http://lists.infradead.org/mailman/listinfo/ath10k
>>>
>>
>> --
>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
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
>

--
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
