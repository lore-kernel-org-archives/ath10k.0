Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-02.qualcomm.com ([103.229.16.227])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1i5olK-0003Nu-Ml
 for ath10k@lists.infradead.org; Thu, 05 Sep 2019 10:13:12 +0000
Subject: RE: [PATCH 2/7] ath10k: change max RX bundle size from 8 to 32 for
 sdio
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Thu, 5 Sep 2019 10:12:17 +0000
Message-ID: <6ffd391176154f72a964b22090d89f9d@aptaiexm02f.ap.qualcomm.com>
References: <1566302108-18219-1-git-send-email-wgong@codeaurora.org>
 <1566302108-18219-3-git-send-email-wgong@codeaurora.org>
 <87k1apnyyo.fsf@taht.net>
 <259d8d7f8c2a4c428ae14ff211c83c1a@aptaiexm02f.ap.qualcomm.com>
 <87lfv4chi2.fsf@taht.net>
In-Reply-To: <87lfv4chi2.fsf@taht.net>
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
To: Dave Taht <dave@taht.net>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: Dave Taht <dave@taht.net>
> Sent: Wednesday, September 4, 2019 9:34 PM
> To: Wen Gong <wgong@qti.qualcomm.com>
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org
> Subject: [EXT] Re: [PATCH 2/7] ath10k: change max RX bundle size from 8 to
> 32 for sdio
> 
> > Hi Dave,
> > So your mean is change 8  to 32 will impact latency? It will increase latency
> of rx?
> 
> Heh. for rx, in this case, probably not!
> 
> I just get twitchy every time folk fiddle with buffer sizes. In one
> recent case someone had fiddled with the interrupt polling interval on
> something, going from 1ms to 10ms - it saved on cpu, but...
> ... just trying to make sure folk grok the tradoffs with a bit of
> laughter.
> 
> carry on!
Hah, so you do not have any concern about this patch.
Patch 3 sent, https://patchwork.kernel.org/patch/11122175/
> 
> >
> >>
> >> 0xFFFEFFFF

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
