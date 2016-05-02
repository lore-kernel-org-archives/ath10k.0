Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from lang.hm ([66.167.227.134] helo=bifrost.lang.hm)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axJoo-00018V-98
 for ath10k@lists.infradead.org; Mon, 02 May 2016 19:47:46 +0000
Date: Mon, 2 May 2016 12:47:06 -0700 (PDT)
From: David Lang <david@lang.hm>
Subject: Re: [Make-wifi-fast] fq_codel_drop vs a udp flood
In-Reply-To: <CACiydb+nNEWfO8XS63MnrW0LazORAGX+L+fF1xZ2_2sCLeRAsg@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1605021246080.28791@nftneq.ynat.uz>
References: <CAA93jw6QLyx9EaS+ntB0D3duoysu_Z-UYyQfHnRa=pfqPDfWOw@mail.gmail.com>
 <57258F41.8040600@candelatech.com>
 <CAA93jw46O3CbURxyP7AENkOCnA71Bn6ddTJpdfzEjWcFKgnaAg@mail.gmail.com>
 <1462114043.512818296@apps.rackspace.com>
 <CACiydb+nNEWfO8XS63MnrW0LazORAGX+L+fF1xZ2_2sCLeRAsg@mail.gmail.com>
MIME-Version: 1.0
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
To: Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, dpreed@reed.com, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, Ben Greear <greearb@candelatech.com>, ath10k <ath10k@lists.infradead.org>

On Mon, 2 May 2016, Roman Yeryomin wrote:

> On 1 May 2016 at 17:47,  <dpreed@reed.com> wrote:
>> Maybe I missed something, but why is it important to optimize for a UDP flood?
>
> We don't need to optimize it to UDP but UDP is used e.g. by torrents
> to achieve higher throughput and used a lot in general.
> And, again, in this case TCP is broken too (750Mbps down to 550), so
> it's not like Dave is saying that UDP test is broken, fq_codel is just
> too hungry for CPU

while I wouldn't do it via wifi, syslog to/from relay systems can result in a 
lot of UDP traffic that could look like a flood.

David Lang

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
