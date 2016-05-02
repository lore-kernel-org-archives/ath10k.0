Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from g4t3427.houston.hp.com ([15.201.208.55])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axNFx-0002BV-Vd
 for ath10k@lists.infradead.org; Mon, 02 May 2016 23:28:02 +0000
Subject: Re: [Codel] iperf3 udp flood behavior at higher rates
References: <CAA93jw7uHvkKTUtXZqqWbDSWDxb=sZ+sfhdmMM1SZW3BsmZ1xA@mail.gmail.com>
From: Rick Jones <rick.jones2@hpe.com>
Message-ID: <5727E26B.3040201@hpe.com>
Date: Mon, 2 May 2016 16:27:39 -0700
MIME-Version: 1.0
In-Reply-To: <CAA93jw7uHvkKTUtXZqqWbDSWDxb=sZ+sfhdmMM1SZW3BsmZ1xA@mail.gmail.com>
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
To: Dave Taht <dave.taht@gmail.com>, Roman Yeryomin <leroi.lists@gmail.com>
Cc: make-wifi-fast@lists.bufferbloat.net, "codel@lists.bufferbloat.net" <codel@lists.bufferbloat.net>, ath10k <ath10k@lists.infradead.org>

On 05/02/2016 04:18 PM, Dave Taht wrote:
> Netperf does not have a multi-hop capable udp flood test (rick jones
> can explain why... )

Well, with an intro like that, how could I refuse?-)

In a nutshell, after repeated uses of the netperf UDP_STREAM test in 
non-air-gapped test setups with link up/down testing and a default route 
which pointed at the local "corporate/desktop/whathaveyou" network by QA 
engineers who should have known better, taking-out things like security 
camera video feeds, by default the data socket for a UDP_STREAM test is 
set SO_DONTROUTE.  This can be overridden with a test-specific -R 1 option.

This is not necessary if the test is UDP_RR or TCP_*.

happy benchmarking,

rick jones

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
