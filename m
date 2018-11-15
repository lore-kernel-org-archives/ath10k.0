Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-tai-01.qualcomm.com ([103.229.16.226])
 by casper.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNBIa-0007eP-CV
 for ath10k@lists.infradead.org; Thu, 15 Nov 2018 06:38:46 +0000
Subject: RE:  [PATCH] ath10k: support PCIe enter L1 state
From: Wen Gong <wgong@qti.qualcomm.com>
Date: Thu, 15 Nov 2018 06:38:25 +0000
Message-ID: <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
In-Reply-To: <20181115002836.GA71934@google.com>
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
To: Brian Norris <briannorris@chromium.org>, Wen Gong <wgong@codeaurora.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> -----Original Message-----
> From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Brian
> Norris
> Sent: Thursday, November 15, 2018 8:29 AM
> To: Wen Gong <wgong@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org; ath10k@lists.infradead.org
> Subject: [EXTERNAL] Re: [PATCH] ath10k: support PCIe enter L1 state
> 
> Hi Wen,
> 
> >
> > Signed-off-by: Wen Gong <wgong@codeaurora.org>
> 
> Is there some reason L1 was disabled in the first place? Wa
s it known to be
> unreliable?
> 
Hi Brian,
It is a BUG for power, and it is not considered this BUG before.
So this change will fix the bug.

> Brian
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
