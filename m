Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cGnOK-0002oz-KV
 for ath10k@lists.infradead.org; Tue, 13 Dec 2016 13:45:15 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [RFC v2 05/11] ath10k: htc: refactorization
Date: Tue, 13 Dec 2016 13:44:44 +0000
Message-ID: <87inqoymd0.fsf@kamboji.qca.qualcomm.com>
References: <1479496971-19174-1-git-send-email-erik.stromdahl@gmail.com>
 <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
In-Reply-To: <1479496971-19174-6-git-send-email-erik.stromdahl@gmail.com>
 (Erik Stromdahl's message of "Fri, 18 Nov 2016 20:22:45 +0100")
Content-Language: en-US
Content-ID: <FBE106D596261441BB63FA9F8ECBDCE1@qualcomm.com>
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
To: Erik Stromdahl <erik.stromdahl@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Erik Stromdahl <erik.stromdahl@gmail.com> writes:

> Code refactorization:
>
> Moved the code for ep 0 in ath10k_htc_rx_completion_handler
> to ath10k_htc_control_rx_complete.
>
> This eases the implementation of SDIO/mbox significantly since
> the ep_rx_complete cb is invoked directly from the SDIO/mbox
> hif layer.
>
> Since the ath10k_htc_control_rx_complete already is present
> (only containing a warning message) there is no reason for not
> using it (instead of having a special case for ep 0 in
> ath10k_htc_rx_completion_handler).
>
> Signed-off-by: Erik Stromdahl <erik.stromdahl@gmail.com>

I tested this on QCA988X PCI board just to see if there are any
regressions. It crashes immediately during module load, every time, and
bisected that the crashing starts on this patch:

[ 1239.715325] ath10k_pci 0000:02:00.0: pci irq msi oper_irq_mode 2 irq_mode 0 reset_mode 0
[ 1239.885125] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/pre-cal-pci-0000:02:00.0.bin failed with error -2
[ 1239.885260] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/cal-pci-0000:02:00.0.bin failed with error -2
[ 1239.885687] ath10k_pci 0000:02:00.0: qca988x hw2.0 target 0x4100016c chip_id 0x043202ff sub 0000:0000
[ 1239.885699] ath10k_pci 0000:02:00.0: kconfig debug 1 debugfs 1 tracing 1 dfs 1 testmode 1
[ 1239.885899] ath10k_pci 0000:02:00.0: firmware ver 10.2.4.70.59-2 api 5 features no-p2p,raw-mode,mfp,allows-mesh-bcast crc32 4159f498
[ 1239.941836] ath10k_pci 0000:02:00.0: Direct firmware load for ath10k/QCA988X/hw2.0/board-2.bin failed with error -2
[ 1239.941993] ath10k_pci 0000:02:00.0: board_file api 1 bmi_id N/A crc32 bebc7c08
[ 1241.136693] BUG: unable to handle kernel NULL pointer dereference at   (null)
[ 1241.136738] IP: [<  (null)>]   (null)
[ 1241.136759] *pdpt = 0000000000000000 *pde = f0002a55f0002a55 [ 1241.136781] 
[ 1241.136793] Oops: 0010 [#1] SMP

What's odd is that when I added some printks on my own and enabled both
boot and htc debug levels it doesn't crash anymore. After everything
works normally after that, I can start AP mode and connect to it. Is it
a race somewhere?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
