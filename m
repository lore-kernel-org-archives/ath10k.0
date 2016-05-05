Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ayKhB-00009N-7I
 for ath10k@lists.infradead.org; Thu, 05 May 2016 14:56:05 +0000
Received: by mail-oi0-x243.google.com with SMTP id f63so14260505oig.0
 for <ath10k@lists.infradead.org>; Thu, 05 May 2016 07:55:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACiydbJcBxXXqMfFYp5jbDV_o2C=ai5rMpCGrovbYOZcD7pmzw@mail.gmail.com>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <57258F41.8040600@candelatech.com>
 <CAA93jw46O3CbURxyP7AENkOCnA71Bn6ddTJpdfzEjWcFKgnaAg@mail.gmail.com>
 <1462114043.512818296@apps.rackspace.com>
 <CACiydb+nNEWfO8XS63MnrW0LazORAGX+L+fF1xZ2_2sCLeRAsg@mail.gmail.com>
 <CAA93jw4vLUM8XLORoExUuSidaJ8HqzJJJ-FPi=5bXZGxe52y3A@mail.gmail.com>
 <CACiydbJcBxXXqMfFYp5jbDV_o2C=ai5rMpCGrovbYOZcD7pmzw@mail.gmail.com>
Date: Thu, 5 May 2016 17:55:44 +0300
Message-ID: <CACiydb+ZfROQ2p9ZJh_i9=c_54nwZxWA6HddbRVhBviGEHM1=Q@mail.gmail.com>
Subject: Re: [Make-wifi-fast] fq_codel_drop vs a udp flood
From: Roman Yeryomin <leroi.lists@gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, David Reed <dpreed@reed.com>, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On 5 May 2016 at 16:55, Roman Yeryomin <leroi.lists@gmail.com> wrote:
> On 2 May 2016 at 21:40, Dave Taht <dave.taht@gmail.com> wrote:
>> On Mon, May 2, 2016 at 7:03 AM, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>>> On 1 May 2016 at 17:47,  <dpreed@reed.com> wrote:
>>>> Maybe I missed something, but why is it important to optimize for a UDP flood?
>>>
>>> We don't need to optimize it to UDP but UDP is used e.g. by torrents
>>> to achieve higher throughput and used a lot in general.
>>
>> Torrents use uTP congestion control and won't hit this function at
>> all. And eric just made fq_codel_drop more efficient for tests that
>> do.
>>
>> There are potentially zillions of other issues with ampdu's, txop
>> usage, aggregate "packing", etc that can also affect and other
>> protocools.
>>
>>> And, again, in this case TCP is broken too (750Mbps down to 550), so
>>> it's not like Dave is saying that UDP test is broken, fq_codel is just
>>> too hungry for CPU
>>
>> "fq_codel_drop" was too hungry for cpu. fixed. thx eric. :)
>>
>> I've never seen ath10k tcp throughput in the real world (e.g not wired
>> up, over the air) even close to 750 under test on the ath10k (I've
>> seen 300, and I'm getting some better gear up this week)... and
>> everybody tests wifi differently.
>
> perhaps you didn't have 3x3 client and AP?
>
>> (for the record, what was your iperf tcp test line?). More people
>> testing differently = good.
>
> iperf3 -c <server_ip> -t600

actually `iperf3 -c <server_ip> -t600 -R` for download, client POV

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
