Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5N8l-00030L-IB
 for ath10k@lists.infradead.org; Wed, 04 Sep 2019 04:43:33 +0000
Subject: RE: [PATCH 2/7] ath10k: change max RX bundle size from 8 to 32 for
 sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Wed, 4 Sep 2019 04:43:21 +0000
Message-ID: <259d8d7f8c2a4c428ae14ff211c83c1a@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
 <87k1apnyyo.fsf@taht.net>
In-Reply-To: <87k1apnyyo.fsf@taht.net>
Content-Language: en-US
MIME-Version: 1.0
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
To: Dave Taht <dave@taht.net>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

> -----Original Message-----
> From: Dave Taht <dave@taht.net>
> Sent: Wednesday, September 4, 2019 12:10 AM
> To: Wen Gong <wgong@qti.qualcomm.com>; ath10k@lists.infradead.org;
> linux-wireless@vger.kernel.org
> Subject: [EXT] Re: [PATCH 2/7] ath10k: change max RX bundle size from 8 to
> 32 for sdio
> 
> 
> In terms of deeply grokking what increasing buffering to achieve high
> bandwidth on a testbench, vs what it can do to clobber latency in the
> real world at low bandwidths, I tend to point folk at:
> 
> https://www.youtube.com/watch?v=Rb-UnHDw02o&t=25m40s
> 
> where I got a whole bunch of hackers to stand up and act like packets
> in an aggregating FIFO wifi queue.
> 
> This key section is only 8 minutes long, and I promise, y'all laugh
> at least 3 times at the demonstration.
> 
> At the time, also, the ath10k was so overbuffered that on one test
> I could try to start 100 flows, and only get five.
> 
> https://lwn.net/Articles/705884/
> 
> and on my slides:
> 
> https://blog.linuxplumbersconf.org/2016/ocw//system/presentations/3963/
> original/linuxplumbers_wifi_latency-3Nov.pdf
> 
Hi Dave,
So your mean is change 8  to 32 will impact latency? It will increase latency of rx?

> 
> 0xFFFEFFFF

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
