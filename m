Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YWRwu-00086q-8S
 for ath10k@lists.infradead.org; Fri, 13 Mar 2015 15:56:33 +0000
Message-ID: <55030897.4050606@candelatech.com>
Date: Fri, 13 Mar 2015 08:56:07 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: Specific tx rates with ath10k
References: <5501DAF7.1000800@candelatech.com>
 <20150313103721.13586092dzqt9w41@horde.inescporto.pt>
In-Reply-To: <20150313103721.13586092dzqt9w41@horde.inescporto.pt>
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
To: =?ISO-8859-1?Q?M=E1rio_Lopes?= <mjlopes@inescporto.pt>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

On 03/13/2015 02:37 AM, M=E1rio Lopes wrote:
> Hi.
> =

> You can change to fixed bitrate for all types of traffic for 802.11g/a mo=
des, even on ath10k:
> for 2.4 GHz @ 54 Mbit/s - iw dev wiface set bitrates legacy-2.4 54
> for 5 GHz @ 54 Mbit/s - iw dev wiface set bitrates legacy-5 54

Have you actually tried this with an ath10k AP and seen that beacons
and broadcast go out at 54Mbps?

If so, please let me know what firmware version you are using.

> Setting fixed speed for HT and VHT modes currently only takes effect on u=
nicast traffic, I would like that this could be applied to other types of t=
raffic in a
> future ath9k/ath10k driver.

I know beacons won't go out at HT speeds, at least not with the
logic that I tried in the firmware...but I have not checked to
see if my patch allows setting broadcast to HT speeds....

Thanks,
Ben

> =

> =

> Quoting Ben Greear <greearb@candelatech.com>:
> =

>> Ath10k firmware gives ability to set specific fixed rate-control rates
>> for beacons/mgt, multicast, broadcast, and regular traffic.
>>
>> The ath10k driver only sets regular traffic currently.
>>
>> I had previously hacked my firmware to just set all rate types when
>> ath10k driver requested to set the rate.
>>
>> But, that is not what my customer needs.
>>
>> So, I am now planning to add some debugfs entries to allow users to set
>> beacon/mgt, multicast and broadcast rates individually (I don't have tim=
e or interest
>> right now to try patching things top to bottom to try to get this feature
>> into mac80211 stack or 'iw').
>>
>> My question is, for when user just runs a command like this:
>>
>> ./local/sbin/iw dev vap1 set bitrates legacy-2.4 6 ht-mcs-2.4
>>
>> What is the desired behaviour?
>>
>> Set all rates (beacons/mgt, bcast, multicast, regular) to the same
>> fixed speed, or just a certain subset of these traffic types?
>>
>> I can make my firmware do whatever combination is required, and then
>> users can over-ride the values by using debugfs.....
>>
>> As a note, ath10k firmware will NOT send beacons at HT speeds, so
>> if you fix an HT rate, then firmware will ignore that for the beacons/mgt
>> ratecontrol type.
>>
>> Thanks,
>> Ben
>>
>> -- =

>> Ben Greear <greearb@candelatech.com>
>> Candela Technologies Inc  http://www.candelatech.com
>>
>> -- =

>> To unsubscribe from this list: send the line "unsubscribe linux-wireless=
" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>
> =

> =

> =

> ----------------------------------------------------------------
> This message was sent using IMP, the Internet Messaging Program.
> =



-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
