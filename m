Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.candelatech.com ([208.74.158.172] helo=ns3.lanforge.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbfOw-0002Pt-Ry
 for ath10k@lists.infradead.org; Wed, 30 Oct 2013 23:42:15 +0000
Message-ID: <5271993E.5010103@candelatech.com>
Date: Wed, 30 Oct 2013 16:41:50 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [PATCH/RFT 00/12] ath10k: pci fixes 2013-10-30
References: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
In-Reply-To: <1383133346-8135-1-git-send-email-michal.kazior@tieto.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

On 10/30/2013 04:42 AM, Michal Kazior wrote:
> Hi,
> 
> This patchset contains a slew of PCI/CE cleanups
> and fixes. The aim of the patchset is to deal with
> CE null dereference bugs Ben has been reporting on
> the mailing list for some time now.
> 
> I've done some brief testing and don't see any
> major regressions. I wasn't able to reproduce the
> reported bugs though. @Ben: Could you perhaps test
> this, please?

I have done a bit of testing on this.  First, I did see
a total machine lockup, but I have been seeing those fairly
often on module reloads, so probably that was nothing new
in your patches.

I am also still running the crash avoidance patches I posted
recently.

And good news for me at least...with some modified firmware,
I am getting two stations to associate to the same AP and
pass traffic to each other (no encryption..that probably
doesn't work yet) :)

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
