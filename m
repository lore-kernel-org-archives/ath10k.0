Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h20ql-000871-7C
 for ath10k@lists.infradead.org; Thu, 07 Mar 2019 21:46:49 +0000
Date: Thu, 7 Mar 2019 22:46:45 +0100 (CET)
From: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:ath11k-bringup 3/42]
 drivers/net/wireless/ath/ath11k/qmi.c:1989:1-7:
 ERROR: missing iounmap; ioremap on line 1935 and execution via conditional
 on line 1965 (fwd)
Message-ID: <alpine.DEB.2.21.1903072240280.2558@hadrien>
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
To: Kalle Valo <kvalo@codeaurora.org>
Cc: kbuild-all@01.org, ath10k@lists.infradead.org

The messages below about iounmap are for the function ath11k_qmi_load_bdf
in qmi.c.  There are three occurrences of goto out that need to jump to
the iounmap above the out: label.

The message about the lock is about the goto fallback on line 4103.
Should the spinlock be unlocked here?

The message about unsigned in dp_tx.c is because the variable
ring_entry_sz is declared as u32 (line 561).

julia

---------- Forwarded message ----------
Date: Fri, 8 Mar 2019 05:28:10 +0800
From: kbuild test robot <lkp@intel.com>
To: kbuild@01.org
Cc: Julia Lawall <julia.lawall@lip6.fr>
Subject: [ath6kl:ath11k-bringup 3/42]
    drivers/net/wireless/ath/ath11k/qmi.c:1989:1-7: ERROR: missing iounmap;
    ioremap on line 1935 and execution via conditional on line 1965

CC: kbuild-all@01.org
CC: ath10k@lists.infradead.org
TO: Kalle Valo <kvalo@codeaurora.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git ath11k-bringup
head:   e7daa3ec639f390e383dae0db9e6b143bcc7b5bc
commit: 258bbf525e652e244aa8b2331f55fda573fbe926 [3/42] ath11k: add driver
:::::: branch date: 5 hours ago
:::::: commit date: 4 weeks ago

>> drivers/net/wireless/ath/ath11k/qmi.c:1989:1-7: ERROR: missing iounmap; ioremap on line 1935 and execution via conditional on line 1965
   drivers/net/wireless/ath/ath11k/qmi.c:1989:1-7: ERROR: missing iounmap; ioremap on line 1935 and execution via conditional on line 1971
   drivers/net/wireless/ath/ath11k/qmi.c:1989:1-7: ERROR: missing iounmap; ioremap on line 1935 and execution via conditional on line 1977
--
>> drivers/net/wireless/ath/ath11k/dp_rx.c:977:6-15: ERROR: iterator variable bound on line 976 cannot be NULL
--
>> drivers/net/wireless/ath/ath11k/wmi.c:4140:1-7: preceding lock on line 4088
--
>> drivers/net/wireless/ath/ath11k/dp_rx.c:278:16-22: ERROR: application of sizeof to pointer
--
>> drivers/net/wireless/ath/ath11k/mac.c:711:5-8: Unneeded variable: "ret". Return "0" on line 719
   drivers/net/wireless/ath/ath11k/mac.c:418:5-11: Unneeded variable: "status". Return "0" on line 451
--
>> drivers/net/wireless/ath/ath11k/mac.c:3274:2-3: Unneeded semicolon
--
>> drivers/net/wireless/ath/ath11k/dp_tx.c:641:5-18: WARNING: Unsigned expression compared with zero: ring_entry_sz < 0

Please review and possibly fold the followup patch.

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
