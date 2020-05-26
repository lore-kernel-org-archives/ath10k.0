Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdb2C-0004dV-0X
 for ath10k@lists.infradead.org; Tue, 26 May 2020 14:58:29 +0000
Received: by mail-pj1-f67.google.com with SMTP id z15so64321pjb.0
 for <ath10k@lists.infradead.org>; Tue, 26 May 2020 07:58:26 -0700 (PDT)
From: Luis Chamberlain <mcgrof@kernel.org>
Subject: [PATCH v3 5/8] ath10k: use new taint_firmware_crashed()
Date: Tue, 26 May 2020 14:58:12 +0000
Message-Id: <20200526145815.6415-6-mcgrof@kernel.org>
In-Reply-To: <20200526145815.6415-1-mcgrof@kernel.org>
References: <20200526145815.6415-1-mcgrof@kernel.org>
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
To: jeyu@kernel.org, davem@davemloft.net, kuba@kernel.org
Cc: linux-wireless@vger.kernel.org, aquini@redhat.com, linux-doc@vger.kernel.org, peterz@infradead.org, daniel.vetter@ffwll.ch, linux@dominikbrodowski.net, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, glider@google.com, GR-everest-linux-l2@marvell.com, mchehab+samsung@kernel.org, will@kernel.org, michael.chan@broadcom.com, robh@kernel.org, paulmck@kernel.org, bhe@redhat.com, corbet@lwn.net, mchehab+huawei@kernel.org, Luis Chamberlain <mcgrof@kernel.org>, ath10k@lists.infradead.org, derosier@gmail.com, tiwai@suse.de, mingo@redhat.com, dvyukov@google.com, samitolvanen@google.com, yzaikin@google.com, dyoung@redhat.com, pmladek@suse.com, elver@google.com, sburla@marvell.com, aelior@marvell.com, keescook@chromium.org, arnd@arndb.de, sfr@canb.auug.org.au, gpiccoli@canonical.com, rostedt@goodmis.org, fmanlunas@marvell.com, cai@lca.pw, tglx@linutronix.de, andriy.shevchenko@linux.intel.com, johannes@sipsolutions.net, kvalo@codeaurora.org, netdev@vger.kernel.org, rdunlap@infradead.org, schlad@suse.de, dianders@chromium.org, vkoul@kernel.org, mhiramat@kernel.org, akpm@linux-foundation.org, dchickles@marvell.com, bauerman@linux.ibm.com

This makes use of the new taint_firmware_crashed() to help
annotate when firmware for device drivers crash. When firmware
crashes devices can sometimes become unresponsive, and recovery
sometimes requires a driver unload / reload and in the worst cases
a reboot.

Using a taint flag allows us to annotate when this happens clearly.

I have run into this situation with this driver with the latest
firmware as of today, May 21, 2020 using v5.6.0, leaving me at
a state at which my only option is to reboot. Driver removal and
addition does not fix the situation. This is reported on kernel.org
bugzilla korg#207851 [0]. But this isn't the first firmware crash reported,
others have been filed before and none of these bugs have yet been
addressed [1] [2] [3].  Including my own I see these firmware crash
reports:

  * korg#207851 [0]
  * korg#197013 [1]
  * korg#201237 [2]
  * korg#195987 [3]

[0] https://bugzilla.kernel.org/show_bug.cgi?id=207851
[1] https://bugzilla.kernel.org/show_bug.cgi?id=197013
[2] https://bugzilla.kernel.org/show_bug.cgi?id=201237
[3] https://bugzilla.kernel.org/show_bug.cgi?id=195987

Cc: linux-wireless@vger.kernel.org
Cc: ath10k@lists.infradead.org
Cc: Kalle Valo <kvalo@codeaurora.org>
Acked-by: Rafael Aquini <aquini@redhat.com>
Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
---
 drivers/net/wireless/ath/ath10k/pci.c  | 2 ++
 drivers/net/wireless/ath/ath10k/sdio.c | 2 ++
 drivers/net/wireless/ath/ath10k/snoc.c | 1 +
 3 files changed, 5 insertions(+)

diff --git a/drivers/net/wireless/ath/ath10k/pci.c b/drivers/net/wireless/ath/ath10k/pci.c
index 1d941d53fdc9..818c3acc2468 100644
--- a/drivers/net/wireless/ath/ath10k/pci.c
+++ b/drivers/net/wireless/ath/ath10k/pci.c
@@ -1767,6 +1767,7 @@ static void ath10k_pci_fw_dump_work(struct work_struct *work)
 		scnprintf(guid, sizeof(guid), "n/a");
 
 	ath10k_err(ar, "firmware crashed! (guid %s)\n", guid);
+	taint_firmware_crashed();
 	ath10k_print_driver_info(ar);
 	ath10k_pci_dump_registers(ar, crash_data);
 	ath10k_ce_dump_registers(ar, crash_data);
@@ -2837,6 +2838,7 @@ static int ath10k_pci_hif_power_up(struct ath10k *ar,
 	if (ret) {
 		if (ath10k_pci_has_fw_crashed(ar)) {
 			ath10k_warn(ar, "firmware crashed during chip reset\n");
+			taint_firmware_crashed();
 			ath10k_pci_fw_crashed_clear(ar);
 			ath10k_pci_fw_crashed_dump(ar);
 		}
diff --git a/drivers/net/wireless/ath/ath10k/sdio.c b/drivers/net/wireless/ath/ath10k/sdio.c
index e2aff2254a40..8b2fc0b89be4 100644
--- a/drivers/net/wireless/ath/ath10k/sdio.c
+++ b/drivers/net/wireless/ath/ath10k/sdio.c
@@ -794,6 +794,7 @@ static int ath10k_sdio_mbox_proc_dbg_intr(struct ath10k *ar)
 
 	/* TODO: Add firmware crash handling */
 	ath10k_warn(ar, "firmware crashed\n");
+	taint_firmware_crashed();
 
 	/* read counter to clear the interrupt, the debug error interrupt is
 	 * counter 0.
@@ -915,6 +916,7 @@ static int ath10k_sdio_mbox_proc_cpu_intr(struct ath10k *ar)
 	if (cpu_int_status & MBOX_CPU_STATUS_ENABLE_ASSERT_MASK) {
 		ath10k_err(ar, "firmware crashed!\n");
 		queue_work(ar->workqueue, &ar->restart_work);
+		taint_firmware_crashed();
 	}
 	return ret;
 }
diff --git a/drivers/net/wireless/ath/ath10k/snoc.c b/drivers/net/wireless/ath/ath10k/snoc.c
index 354d49b1cd45..071ee7607a4c 100644
--- a/drivers/net/wireless/ath/ath10k/snoc.c
+++ b/drivers/net/wireless/ath/ath10k/snoc.c
@@ -1451,6 +1451,7 @@ void ath10k_snoc_fw_crashed_dump(struct ath10k *ar)
 		scnprintf(guid, sizeof(guid), "n/a");
 
 	ath10k_err(ar, "firmware crashed! (guid %s)\n", guid);
+	taint_firmware_crashed();
 	ath10k_print_driver_info(ar);
 	ath10k_msa_dump_memory(ar, crash_data);
 	mutex_unlock(&ar->dump_mutex);
-- 
2.26.2


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
