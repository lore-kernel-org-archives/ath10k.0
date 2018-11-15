Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gNMcl-0003Rw-8G
 for ath10k@lists.infradead.org; Thu, 15 Nov 2018 18:44:20 +0000
Received: by mail-pl1-x644.google.com with SMTP id f12-v6so9906009plo.1
 for <ath10k@lists.infradead.org>; Thu, 15 Nov 2018 10:44:08 -0800 (PST)
Date: Thu, 15 Nov 2018 10:43:33 -0800
From: Brian Norris <briannorris@chromium.org>
Subject: Re: [PATCH] ath10k: support PCIe enter L1 state
Message-ID: <20181115184333.GA87504@google.com>
References: <1542163848-837-1-git-send-email-wgong@codeaurora.org>
 <20181115002836.GA71934@google.com>
 <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <c94346b26a6d4b11a045a176ca854051@aptaiexm02f.ap.qualcomm.com>
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
To: Wen Gong <wgong@qti.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Wen Gong <wgong@codeaurora.org>

Hi,

On Thu, Nov 15, 2018 at 06:38:25AM +0000, Wen Gong wrote:
> > -----Original Message-----
> > From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Brian Norris
> > 
> > Is there some reason L1 was disabled in the first place? Was it known to be
> > unreliable?
>
> Hi Brian,
> It is a BUG for power, and it is not considered this BUG before.
> So this change will fix the bug.

I understand that the existing behavior is suboptimal for power, but on
the other hand, code that goes out of its way to *clear* the L1 flag
doesn't just pop up out of nowhere. Somebody clearly wrote that! If it
just meant "we didn't verify L1 at first", then maybe it's fine to
enable it unconditionally and see what happens, but if it meant "we
tried L1 on some old chip XXXX and it caused problems", then it would be
nice to know what those problems were.

Or maybe that is hard to figure out, given there's no public git history
tracking the original code, and we just need to try it out.

Anyway, I'm giving it a try here, but I just wanted to ask :)

Thanks,
Brian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
