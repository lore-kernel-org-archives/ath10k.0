Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x230.google.com ([2607:f8b0:400c:c01::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkThf-0004nR-J4
 for ath10k@lists.infradead.org; Wed, 14 May 2014 07:34:16 +0000
Received: by mail-ve0-f176.google.com with SMTP id jz11so1873687veb.21
 for <ath10k@lists.infradead.org>; Wed, 14 May 2014 00:33:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEFj985-aiarmX1hTkgrUG1grLZ58ccLxsdSrr29_ONXoDRmTQ@mail.gmail.com>
References: <1399942355-19993-1-git-send-email-apenwarr@gmail.com>
 <1400015472-4647-1-git-send-email-apenwarr@gmail.com>
 <CAEFj984Lk-QK67koxUYx=7-xpM5Y_ATr2ZD-ogMsAs6Jfg5A0g@mail.gmail.com>
 <CAHqTa-23jdHZnpJFwKgqDC05yVHhQsgxHm+7qQd3Thp1qsUagg@mail.gmail.com>
 <CAEFj98471PcLD_qpZrWh93CejQzC=u+0dtsGUmkvMQy=OX+C0w@mail.gmail.com>
 <CAHqTa-3o2-4E+5kptgr-e2uPQLQ3ygCfB1SKEH+WZx6X-9semw@mail.gmail.com>
 <CAEFj985-aiarmX1hTkgrUG1grLZ58ccLxsdSrr29_ONXoDRmTQ@mail.gmail.com>
Date: Wed, 14 May 2014 15:33:52 +0800
Message-ID: <CAEFj987vqABssjVQ7tFOEkXjM7ieTnc2ZE07wJ6iQzuQsBQzpg@mail.gmail.com>
Subject: Re: [PATCH v3] ath10k: support get/set antenna configurations.
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Avery Pennarun <apenwarr@gmail.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

I also try to confirm using debug_mask in ath10k and it seems also 3
spatial streams:
[ 3826.320000] ath10k: rx skb 86533480 len 1534 vht80 rate_idx 7
vht_nss 3 freq 5180 band 1 flag 0x40600000 fcs-err 0mic-err 0

-----
Chun-Yeow

On Wed, May 14, 2014 at 3:22 PM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
> Here is the screenshot of my wireshark capture. I am seeing 3 spatial
> streams instead of 1 after setting the antennas.
>
> ---
> Chun-Yeow
>
> On Wed, May 14, 2014 at 3:18 PM, Avery Pennarun <apenwarr@gmail.com> wrote:
>> On Wed, May 14, 2014 at 2:25 AM, Yeoh Chun-Yeow <yeohchunyeow@gmail.com> wrote:
>>> Here is from the fw_stats:
>>>
>>>              ath10k PEER stats (1)
>>>              =================
>>>
>>>               Peer MAC address 04:f0:21:0c:a5:1c
>>>                      Peer RSSI 43
>>>                   Peer TX rate 877500
>>>                   Peer RX rate 877500
>>>
>>> TCP throughput is roughly around 151Mbps.
>>
>> In my tests it's easy to achieve >151 Mbps with a 40 MHz channel and
>> 2x2.  So if you're using an 80 MHz channel (twice the speed) and only
>> one antenna (half the speed) you could still get 151 Mbps pretty
>> easily.
>>
>> I wouldn't be surprised if your speed is being limited by something
>> else, maybe the host CPU or a slow interconnect on the station or AP
>> (USB perhaps?), so it doesn't look "worse" with only one antenna
>> because it should be at least twice as good when operating normally.
>>
>> If you use wireshark or tcpdump you should be able to check the MCS
>> level of the packets and see that it's lower with fewer antennas.
>>
>> Have fun,
>>
>> Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
