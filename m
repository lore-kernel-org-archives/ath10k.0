Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6NZq-0000eh-S5
 for ath10k@lists.infradead.org; Mon, 05 Aug 2013 16:24:11 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH v2] ath10k: fix device teardown
References: <1374129572-6079-1-git-send-email-michal.kazior@tieto.com>
 <1375427747-9539-1-git-send-email-michal.kazior@tieto.com>
Date: Mon, 5 Aug 2013 19:23:07 +0300
In-Reply-To: <1375427747-9539-1-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 2 Aug 2013 09:15:47 +0200")
Message-ID: <87pptsf6ok.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> This fixes interrupt-related issue when no
> interfaces were running thus the device was
> considered powered down.
>
> The power_down() function isn't really powering
> down the device. It simply assumed it won't
> interrupt. This wasn't true in some cases and
> could lead to paging failures upon FW indication
> interrupt (i.e. FW crash) because some structures
> aren't allocated in that device state.
>
> One reason for that was that ar_pci->started
> wasn't reset. The other is interrupts should've
> been masked when teardown starts.
>
> The patch reorganized interrupt setup and makes
> sure ar_pci->started is reset accordingly.
>
> Reported-by: Ben Greear <greearb@candelatech.com>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Thanks, applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
