Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYGKO-0004Si-T8
 for ath10k@lists.infradead.org; Mon, 21 Oct 2013 14:19:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add error handling to ath10k_pci_wait()
References: <20131017083615.31028.25088.stgit@localhost6.localdomain6>
Date: Mon, 21 Oct 2013 17:19:02 +0300
In-Reply-To: <20131017083615.31028.25088.stgit@localhost6.localdomain6> (Kalle
 Valo's message of "Thu, 17 Oct 2013 11:36:15 +0300")
Message-ID: <87vc0qso4p.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> ath10k_pci_wait() didn't notify any errors to callers, it
> just printed a warning so add proper error handling.
>
> Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

Applied, I just changed the commit log to this:

commit f3782744c9b50edf94d28e37a937ff84f267dfab
Author: Kalle Valo <kvalo@qca.qualcomm.com>
Date:   Thu Oct 17 11:36:15 2013 +0300

    ath10k: add error handling to ath10k_pci_wait()
    
    ath10k_pci_wait() didn't notify any errors to callers, it
    just printed a warning so add proper error handling. This fixes
    a crash Ben reported:
    
    ath10k: MSI-X interrupt handling (8 intrs)
    ath10k: Unable to wakeup target
    ath10k: target took longer 5000 us to wake up (awake count 1)
    ath10k: Failed to get pcie state addr: -16
    ath10k: early firmware event indicated
    BUG: unable to handle kernel NULL pointer dereference at 0000000000000004
    IP: [<ffffffffa06ae46c>] ath10k_ce_completed_send_next+0x47/0x122 [ath10k_pci]
    
    Reported-by: Ben Greear <greearb@candelatech.com>
    Signed-off-by: Kalle Valo <kvalo@qca.qualcomm.com>

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
