Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by merlin.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNMLT-00040n-Lr
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 15:45:08 +0000
Subject: Re: How to obtain Link Quality information
References: <57864BEA.4090202@cttc.cat> <578652F6.5030909@candelatech.com>
 <57866026.20504@cttc.cat>
From: Ben Greear <greearb@candelatech.com>
Message-ID: <578661D7.9050804@candelatech.com>
Date: Wed, 13 Jul 2016 08:44:23 -0700
MIME-Version: 1.0
In-Reply-To: <57866026.20504@cttc.cat>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: =?UTF-8?Q?I=c3=b1aki_Pascual?= <ipascual@cttc.cat>, ath10k@lists.infradead.org

On 07/13/2016 08:37 AM, I=F1aki Pascual wrote:
> Hi Ben,
>
> yes, I tried, it shows signal value but not link quality :(

Link 'quality' is mostly just a made-up number anyway. Signal quality
is probably the most similar value, but tx and rx bitrates give you the
best idea of how RF is performing in my opinion.  Those rates are only
accurate when sending at least modest amounts of packets though.

Thanks,
Ben


>
> onet@sc229:~$ iw dev wlan2 station dump
> Station 04:f0:21:18:26:af (on wlan2)
>      inactive time:    65 ms
>      rx bytes:    3102896
>      rx packets:    87403
>      tx bytes:    0
>      tx packets:    0
>      tx retries:    0
>      tx failed:    0
>      signal:      -63 dBm
>      signal avg:    -62 dBm
>      tx bitrate:    6.0 MBit/s
>      rx bitrate:    6.0 MBit/s
>      authorized:    yes
>      authenticated:    yes
>      preamble:    long
>      WMM/WME:    yes
>      MFP:        no
>      TDLS peer:    no
>      connected time:    4476 seconds
> monet@sc229:~$
>
> Thanks,
>
> I=F1aki
>
> On 13/07/16 16:40, Ben Greear wrote:
>> On 07/13/2016 07:10 AM, I=F1aki Pascual wrote:
>>> Hi everyone,
>>>
>>> I am trying to get link quality information from an 802.11ac interface =
and it looks like the only way is to use "iw wlan2 scan". I don't like this=
 solution as
>>> it scans all channels and takes a while.
>>>
>>> If I try "cat /proc/net/wireless" (this would be my preferred option) t=
he output is empty and I am not able to get this information with any other=
 tool. Below
>>> is the output for some commands I tried.
>>>
>>> I am using kernel 4.2 with ath10k and Candela firmware 10.1 on a Qualco=
mm Atheros QCA988x
>>>
>>> Any ideas on how can I get the link quality information?
>>
>> Did you try:
>>
>> iw dev wlan0 station dump
>>
>> If you want tx rate reporting, you need to run my driver patches as well
>> as my firmware, but rx-rate should be reported with stock driver
>> (and stock firmware, for that matter)...
>>
>> Thanks,
>> Ben
>>
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k
>


-- =

Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
