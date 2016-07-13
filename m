Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from rudy.puc.rediris.es ([2001:720:418:ca01::132])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bNMGP-00076l-A6
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 15:39:54 +0000
Received: from [84.88.62.208] (helo=leo)
 by rudy.puc.rediris.es with esmtpsa (TLS1.2:DHE_RSA_AES_256_CBC_SHA256:256)
 (Exim 4.80) (envelope-from <ipascual@cttc.cat>) id 1bNMG0-00079d-AA
 for ath10k@lists.infradead.org; Wed, 13 Jul 2016 17:39:28 +0200
Received: from [10.1.16.22] (pcipascual.cttc.es [10.1.16.22])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by leo (Postfix) with ESMTPSA id 9DE031FF67
 for <ath10k@lists.infradead.org>; Wed, 13 Jul 2016 17:39:26 +0200 (CEST)
Subject: Re: How to obtain Link Quality information
References: <57864BEA.4090202@cttc.cat> <578652F6.5030909@candelatech.com>
From: =?UTF-8?Q?I=c3=b1aki_Pascual?= <ipascual@cttc.cat>
Message-ID: <57866026.20504@cttc.cat>
Date: Wed, 13 Jul 2016 17:37:10 +0200
MIME-Version: 1.0
In-Reply-To: <578652F6.5030909@candelatech.com>
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
To: ath10k@lists.infradead.org

Hi Ben,

yes, I tried, it shows signal value but not link quality :(

onet@sc229:~$ iw dev wlan2 station dump
Station 04:f0:21:18:26:af (on wlan2)
     inactive time:    65 ms
     rx bytes:    3102896
     rx packets:    87403
     tx bytes:    0
     tx packets:    0
     tx retries:    0
     tx failed:    0
     signal:      -63 dBm
     signal avg:    -62 dBm
     tx bitrate:    6.0 MBit/s
     rx bitrate:    6.0 MBit/s
     authorized:    yes
     authenticated:    yes
     preamble:    long
     WMM/WME:    yes
     MFP:        no
     TDLS peer:    no
     connected time:    4476 seconds
monet@sc229:~$

Thanks,

I=F1aki

On 13/07/16 16:40, Ben Greear wrote:
> On 07/13/2016 07:10 AM, I=F1aki Pascual wrote:
>> Hi everyone,
>>
>> I am trying to get link quality information from an 802.11ac =

>> interface and it looks like the only way is to use "iw wlan2 scan". I =

>> don't like this solution as
>> it scans all channels and takes a while.
>>
>> If I try "cat /proc/net/wireless" (this would be my preferred option) =

>> the output is empty and I am not able to get this information with =

>> any other tool. Below
>> is the output for some commands I tried.
>>
>> I am using kernel 4.2 with ath10k and Candela firmware 10.1 on a =

>> Qualcomm Atheros QCA988x
>>
>> Any ideas on how can I get the link quality information?
>
> Did you try:
>
> iw dev wlan0 station dump
>
> If you want tx rate reporting, you need to run my driver patches as well
> as my firmware, but rx-rate should be reported with stock driver
> (and stock firmware, for that matter)...
>
> Thanks,
> Ben
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
