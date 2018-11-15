Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gN5Wc-0006Lm-GK
 for ath10k@lists.infradead.org; Thu, 15 Nov 2018 00:28:51 +0000
Received: by mail-pf1-x441.google.com with SMTP id h3so2207130pfg.1
 for <ath10k@lists.infradead.org>; Wed, 14 Nov 2018 16:28:40 -0800 (PST)
Date: Wed, 14 Nov 2018 16:28:36 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
Message-ID: <20181115002836.GA71934@google.com>
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
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
To: Wen Gong <wgong@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Hi Wen,

On Wed, Nov 14, 2018 at 10:50:48AM +0800, Wen Gong wrote:
> QCA6174A/QCA9377 PCIe chips support PCIe L1 and L1SS, and indicate the
> L1/L1SS capabilities in PCI configuration space. Currently ath10k driver
> write target PCIe config flags to disallow HW enter into L1, this leads
> some HW modules are still powered up even when both system PCIe RC and
> QCA6174A/QCA9377 endpoint decides to enter into L1 or L1SS.
> 
> This cause ~12 mA power drain of bottom power consumption for all scenarios.
> Fix this issue by removing the drive code to write PCIe config flags.
> 
> Tested with QCA6174 PCI with firmware
> WLAN.RM.4.4.1-00109-QCARMSWPZ-1, but this will also affect QCA9377 PCI.
> It's not a regression with new firmware releases.
> 
> Signed-off-by: Wen Gong <wgong@codeaurora.org>

Is there some reason L1 was disabled in the first place? Was it known to
be unreliable?

Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
