Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VTWoF-0007CG-Tm
 for ath10k@lists.infradead.org; Tue, 08 Oct 2013 12:54:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH/RFT v2 1/4] ath10k: fix add_interface failure handling
References: <1380805765-31521-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-1-git-send-email-michal.kazior@tieto.com>
 <1380865425-3791-2-git-send-email-michal.kazior@tieto.com>
Date: Tue, 8 Oct 2013 15:54:11 +0300
In-Reply-To: <1380865425-3791-2-git-send-email-michal.kazior@tieto.com>
 (Michal Kazior's message of "Fri, 4 Oct 2013 07:43:42 +0200")
Message-ID: <87mwmjsz2k.fsf@kamboji.qca.qualcomm.com>
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

> If something failed along add_interface() setup it
> was possible to leak a vdev id, vdev and peer.
>
> This could end up with leaked FW state or FW crash
> (assuming add_interface() failure wasn't a result of
> a crash).
>
> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>

Then I apply this patch on top of current ath.git master branch (commit
18fe0b53e76) interface up fails on the managed mode:

$ sudo ip link set wlan1 up
RTNETLINK answers: Invalid argument

Logs don't have anything special (the TX encap error was already
before):

[ 1259.818863] ath10k: MSI-X didn't succeed (1), trying MSI
[ 1259.819298] ath10k_pci 0000:02:00.0: irq 49 for MSI/MSI-X
[ 1259.820055] ath10k: MSI interrupt handling
[ 1260.747877] ath10k: UART prints disabled
[ 1260.828219] ath10k: firmware 10.1.389 booted
[ 1260.837585] ath10k: htt target version 2.1
[ 1260.838498] ath10k: Failed to set TX encap: -22

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
