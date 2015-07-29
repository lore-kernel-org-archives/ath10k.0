Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZKMhH-00010M-31
 for ath10k@lists.infradead.org; Wed, 29 Jul 2015 08:26:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: suppress 'failed to process fft' warning messages.
References: <1437490215-11214-1-git-send-email-kevin@darbyshire-bryant.me.uk>
Date: Wed, 29 Jul 2015 11:25:46 +0300
In-Reply-To: <1437490215-11214-1-git-send-email-kevin@darbyshire-bryant.me.uk>
 (Kevin Darbyshire-Bryant's message of "Tue, 21 Jul 2015 15:50:15
 +0100")
Message-ID: <87lhdz74l1.fsf@kamboji.qca.qualcomm.com>
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
To: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk> writes:

> When using DFS channels on Ath10k, kernel log has repeated warning message
> 'failed to process fft: -22' typically under medium/heavy traffic.
>
> This patch switches the warnings to driver debug (WMI events) mode only
> thus reducing log file noise.
>
> DFS and spectral scan share underlying HW mechanisms and enabling one
> (DFS) enables the other (spectral scan) as far as event reporting from
> firmware to driver is concerned. Spectral scan events take no part in
> processing of DFS radar pulses which are delivered as distinct events,
> so the fft (spectral event) warning is harmless and DFS interference
> detection/protection still occurs.
>
> Symptoms seen & fix tested in both debug & non-debug modes on TP-Link
> Archer C7 v2 platform.
>
> Signed-off-by: Kevin Darbyshire-Bryant <kevin@darbyshire-bryant.me.uk>

Thanks, applied.

In the future please use v2, v3 to mark different versions of the patch
so that I can easily find the latest version:

https://www.kernel.org/doc/Documentation/SubmittingPatches

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
