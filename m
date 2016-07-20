Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPuMD-0006jY-Ec
 for ath10k@lists.infradead.org; Wed, 20 Jul 2016 16:28:27 +0000
Date: Wed, 20 Jul 2016 21:57:51 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: [PATCH 2/2] ath10k: Fix sending NULL/ Qos NULL data frames for
 QCA99X0 and later
Message-ID: <20160720162751.GA17599@atheros-ThinkPad-T61>
References: <1466700001-4883-1-git-send-email-mohammed@qca.qualcomm.com>
 <1466700001-4883-2-git-send-email-mohammed@qca.qualcomm.com>
 <CA+BoTQnUvF2Zy7_WuEi0V+KjByRghVmoeR6yrs6hu6ag=KmBqQ@mail.gmail.com>
 <20160627143600.GA5292@atheros-ThinkPad-T61>
 <CA+BoTQn+HeishCMf4hjpWjLBmvFG2r0gosBv77RTyk7+uOAvPA@mail.gmail.com>
 <20160629094754.GA8867@atheros-ThinkPad-T61>
 <CAD2nsn3TOSaOCmm5YT6_D+aaoH9=pagQamDDz2VT+nKrFH0K8g@mail.gmail.com>
 <900ae7541c5a4194a2f73479e1dd8bb2@aphydexm01b.ap.qualcomm.com>
 <CA+BoTQmHW=uYompSLXUv2d+-Nr=11KYuA=VrmUz6X2T+D=-=Ag@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+BoTQmHW=uYompSLXUv2d+-Nr=11KYuA=VrmUz6X2T+D=-=Ag@mail.gmail.com>
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
Cc: "Raja, Tamizh Chelvam" <c_traja@qti.qualcomm.com>, Mohammed Shafi <shafi.wireless@gmail.com>, linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "Shajakhan,
 Mohammed Shafi (Mohammed Shafi)" <mohammed@qti.qualcomm.com>

On Wed, Jul 20, 2016 at 02:22:29PM +0200, Michal Kazior wrote:
> On 20 July 2016 at 13:43, Shajakhan, Mohammed Shafi (Mohammed Shafi)
> <mohammed@qti.qualcomm.com> wrote:
> > Michal,
> >
> > Can you please let me know if this change is fine or not ?
> > I am waiting infinitely for  your reply long time
> 
> Sorry. I was absent for a while and this email slipped by.

[shafi] ah ok, i thought you had blacklisted this change :)

> 
> Quoting your other email:
> 
> > is this patch is good to go (or) should i re-work  ?
> > I had replied to Michal's comment of introducing a new firmware
> > feature flag will not address the issue in older firmware / code.
> > Let me know if i had missed something very obvious.
> 
> I couldn't really find any conclusion to this thread in my inbox.
> 
> The hw_params approach is definitely wrong. The ACK problem is
> firmware-specific, not hardware-specific.

[shafi] sure let me see if i can figure out an alternative way that shall be
accepted by you and Kalle

> 
> I'm fine with removing the workaround completely if 636 is guaranteed
> to not be broken, including AP and P2P GO operation. The client
> operation will probably work since wmi-roam event is used for HW
> connection monitoring.

[shafi] sorry i am not sure how to validate that, so i will keep this workaround

> 
> Nullfunc tx-status ack/noack reports could be probably fixed up using
> sta kickout events (with short timeouts) as a fallback. This would
> make it easier for users because otherwise they'd need to enable
> disassoc_low_ack in hostapd (which is probably impossible with
> wpa_supplicant for p2p, no?).
> 
>
[shafi] let me check this, i think we usually don't enable disassoc_low_ack to
avoid kicking out stations frequently.

shafi

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
