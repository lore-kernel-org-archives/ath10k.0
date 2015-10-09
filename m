Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zka8B-0006ph-2E
 for ath10k@lists.infradead.org; Fri, 09 Oct 2015 16:02:51 +0000
From: "Manoharan, Rajkumar" <rmanohar@qti.qualcomm.com>
Subject: Re: [PATCH 0/7] ath10k: add copy engine fast path support
Date: Fri, 9 Oct 2015 16:02:14 +0000
Message-ID: <1444406541089.12284@qti.qualcomm.com>
References: <1443164016-3612-1-git-send-email-rmanohar@qti.qualcomm.com>,
 <87612gqcnn.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87612gqcnn.fsf@kamboji.qca.qualcomm.com>
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> > Below patchset adds fast path support for uplink traffic by bypassing
> > HTC layer processing. This is enabled by making use of unused copy
> > engine 5 to receive HTT messages directly from HIF layer. From initial
> > validation in VHT80/5G mode TCP UL is improved to 900Mbps from ~840Mbps
> > in conducted test.
> >
> > -Rajkumar
> >
> > Rajkumar Manoharan (7):
> >   ath10k: export htc tx rx handlers
> >   ath10k: register per copy engine send completion callbacks
> >   ath10k: register per copy engine receive callbacks
> >   ath10k: export htt tx rx handlers
> >   ath10k: Configure copy engine 5 for HTT messages
> >   ath10k: remove unused dl_is_polled
> >   ath10k: remove htc polling for tx completion
> 
> With these patches I'm seeing a DMA warning every time with qca988x
> during firmware boot (tested three out of three times, rebooted after
> every test):
> 
> [   60.458260] ------------[ cut here ]------------
> [   60.458374] WARNING: CPU: 1 PID: 0 at lib/dma-debug.c:1090 check_unmap+0x815/0x940()
> [   60.458457] ath10k_pci 0000:02:00.0: DMA-API: device driver tries to free an invalid DMA memory address
> [   60.458557] Modules linked in: ath10k_pci ath10k_core ath mac80211 cfg80211 [last unloaded: cfg80211]
> [   60.458941] CPU: 1 PID: 0 Comm: swapper/1 Not tainted 4.3.0-rc3-wl-ath+ #1082
> [   60.458981] Hardware name: Hewlett-Packard HP ProBook 6540b/1722, BIOS 68CDD Ver. F.04 01/27/2010

Thanks for reporting this issue. Will post revised patchset asap.

-Rajkumar
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
