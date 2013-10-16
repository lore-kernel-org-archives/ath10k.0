Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VWTtP-0005nt-GP
 for ath10k@lists.infradead.org; Wed, 16 Oct 2013 16:24:16 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: Fwd: ath10k related kernel crash in wireless-testing
 (3.12.0-rc3-wl+)
References: <52588F0C.3000009@candelatech.com>
 <525EB81E.5060305@candelatech.com>
Date: Wed, 16 Oct 2013 19:23:49 +0300
In-Reply-To: <525EB81E.5060305@candelatech.com> (Ben Greear's message of "Wed, 
 16 Oct 2013 09:00:30 -0700")
Message-ID: <87li1t5gmi.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

> I sent this to the wrong list the first time.
>
> Do you know if this is already addressed?  If not, I'll see if I can
> find a fix.

[...]

> ath10k: MSI-X interrupt handling (8 intrs)
> ath10k: Unable to wakeup target
> ath10k: target took longer 5000 us to wake up (awake count 1)
> ath10k: Failed to get pcie state addr: -16
> ath10k: early firmware event indicated
> BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
> IP: [<ffffffffa06ae46c>] ath10k_ce_completed_send_next+0x47/0x122
> [ath10k_pci]

I think there are two bugs here:

1) Cold reset doesn't always work, Michal has a patch for that. That's
   why the wakeup fails:

http://lists.infradead.org/pipermail/ath10k/2013-October/000638.html

2) We enable interrupts too early and if wakeup fails and we get a
   spurious interrupt ath10k crashes. We don't have a fix for this yet.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
