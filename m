Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailfront3.rz.tu-bs.de ([134.169.12.134] helo=tu-bs.de)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1awBnt-0007l5-2l
 for ath10k@lists.infradead.org; Fri, 29 Apr 2016 17:02:09 +0000
Received: from [217.247.128.186] (account hanharms@tu-braunschweig.de HELO
 [172.17.10.21]) by tu-braunschweig.de (CommuniGate Pro SMTP 6.1.10f)
 with ESMTPA id 45907094 for ath10k@lists.infradead.org;
 Fri, 29 Apr 2016 19:01:45 +0200
Subject: Re: ath10k IBSS and A-MSDU throuput
References: <5723831A.7010607@tu-bs.de> <572389ED.6080306@candelatech.com>
From: Hannes Harms <hannes.harms@tu-bs.de>
Message-ID: <57239376.2090701@tu-bs.de>
Date: Fri, 29 Apr 2016 19:01:42 +0200
MIME-Version: 1.0
In-Reply-To: <572389ED.6080306@candelatech.com>
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
To: ath10k@lists.infradead.org


To sniff frames on air I would need additional hardware, right?
Or maybe there is a possibility to debug  in / outgoing  amsdu frames in 
the ath10k driver?
Unfortunately my kernel programming skills are very limited,
but maybe I will continue testing next week.

Thanks,
Hannes

Am 29.04.2016 um 18:21 schrieb Ben Greear:
>
>
> On 04/29/2016 08:51 AM, Harms, Hannes wrote:
>> Hi everyone,
>>
>> I have set up two Compex WLE900 in ad-hoc mode, 80MHz channel width, 
>> channel 100.
>> I am using kernel 3.17 from Gateworks for imx6 and
>> my own compat_wirless (4.4.2) with all patches from Candela for 
>> ath10k and all patches for mac80211 from the
>> Candela 4.4 kernel tree.
>>
>> The upload for TCP is about 200 MBit/s and the download is about 250 
>> MBit/s, tested with iperf3.
>>
>> Now I am trying to enable A-MSDU as described in the firmware release 
>> 10.1.467-ct-15 from Candela,
>> but I can not measure anydifference  in throughput.
>>
>> Could anyone confirm that A-MSDU is really working with IBSS?
>
> You can sniff it and see if you can sniff amsdu frames on air?
>
> I only tested it a bit when developing that feature for another user
> (who eventually decided to not use it anyway since it required linux
> kernel hacks to make it work), so possibly there was a regression...
>
> Thanks,
> Ben
>


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
