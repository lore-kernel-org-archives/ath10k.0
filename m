Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cEbjN-0007XX-70
 for ath10k@lists.infradead.org; Wed, 07 Dec 2016 12:53:54 +0000
Date: Wed, 7 Dec 2016 18:22:45 +0530
From: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Subject: Re: boot kernel panic with QCA6174 and kernel 4.8
Message-ID: <20161207125245.GA4429@atheros-ThinkPad-T61>
References: <c932ec30-7538-3229-e965-cfea18742e9c@maloteaux.net>
 <20161207124149.GA4410@atheros-ThinkPad-T61>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20161207124149.GA4410@atheros-ThinkPad-T61>
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
To: Alexandre Maloteaux <alexandre@maloteaux.net>
Cc: ath10k@lists.infradead.org


Hi,

also worth putting a print in 'ath10k_debug_print_board_info'
debug.c

~/ath/drivers/net/wireless/ath/ath10k$ git diff

diff --git a/drivers/net/wireless/ath/ath10k/debug.c
b/drivers/net/wireless/ath/ath10k/debug.c
index bfc0215..89ab4af 100644
--- a/drivers/net/wireless/ath/ath10k/debug.c
	+++ b/drivers/net/wireless/ath/ath10k/debug.c
@@ -169,6 +169,12 @@ void ath10k_debug_print_board_info(struct ath10k *ar)
	else
	scnprintf(boardinfo, sizeof(boardinfo), "N/A");

	+	       if (IS_ERR_OR_NULL(ar->normal_mode_fw.board)) {
		+               printk("\nAvoided oops ?\n");
		+               WARN_ON(1);
		+               return;
		+       }
		+
		ath10k_info(ar, "board_file api %d bmi_id %s
				crc32 %08x",
				ar->bd_api,
				boardinfo,

Let me know if it helps, or you need a patch format

regards,
shafi

On Wed, Dec 07, 2016 at 06:11:49PM +0530, Mohammed Shafi Shajakhan wrote:
> Hi,
> 
> On Wed, Dec 07, 2016 at 09:40:29AM +0100, Alexandre Maloteaux wrote:
> > Hi
> > Since recent kernel upgrade on Arch linux ;  im facing  boot kernel
> > panics with the ath10k_pci and QCA6174 802.11ac Wireless Network Adapter
> > on an Eurocom P5 Pro laptop.
> > 
> > This is the main call stack dump :
> > 
> > ath10k_print_driver_info(ath10k_core)
> > ath10k_pcl_fw_crashed_dump (ath10k_pci)
> > ath10k_pcl.tasklet
> 
> [shafi] If you have the source of the same and with the help of gdb we
> can get the exact line
> 
> > 
> > So far i can circumvent the kernel panic by appending
> > modprobe.blacklist=ath10k_pci  to the kernel command line.
> > Once the Os is booted i can load the module with modprobe without
> > triggering the kernel panic.
> > 
> > I also unpacked the initrd and the firmware file are not located in
> > lib/firmware.
> 
> [shafi] interesting your log (image file) seems to show the firmware is crashed
> ? if the firmware is missing you can give a try with this
> https://patchwork.kernel.org/patch/9412085/ but the call trace looks completely
> different, if the f/w is not there
> 
> long time back we fixed a race https://patchwork.kernel.org/patch/9167045/ but
> it should be available in 4.8.11
> 
> > 
> > I could not setup kdump so early in the boot process so i have attached
> > a screenshot of the on screen dump.
> > 
> > lspci :
> > 06:00.0 Network controller: Qualcomm Atheros QCA6174 802.11ac Wireless
> > Network Adapter (rev 20)
> > 
> > uname -r
> > 4.8.11-1-ARCH
> > 
> > Best Regards
> 
> 
> > _______________________________________________
> > ath10k mailing list
> > ath10k@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/ath10k
> 
> 
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
