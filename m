Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mout.kundenserver.de ([212.227.126.131])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZSPnj-0007dW-3l
 for ath10k@lists.infradead.org; Thu, 20 Aug 2015 13:22:40 +0000
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH/RFT 0/2] ath10k: add qca6164 support
Date: Thu, 20 Aug 2015 15:22:11 +0200
Message-ID: <2368480.ClS0E9V45b@wuerfel>
In-Reply-To: <CAAay3RQ7N4CFpY3ffxc83Xh2rPDFxne9DZKi+Pay4-Z-+XQ5Bg@mail.gmail.com>
References: <1439469147-9408-1-git-send-email-michal.kazior@tieto.com>
 <CAAay3RQ7N4CFpY3ffxc83Xh2rPDFxne9DZKi+Pay4-Z-+XQ5Bg@mail.gmail.com>
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
To: Oscar Rydberg <oscarrydberg@gmail.com>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, twilightrook@gmail.com, Michal Kazior <michal.kazior@tieto.com>, joseph.salisbury@canonical.com, vvanpo@gmail.com

On Tuesday 18 August 2015 11:52:45 Oscar Rydberg wrote:
> I can confirm this patch did it for my Lenovo Yoga 3 14 with QCA6164, the
> WLAN interface is now alive, up and running perfectly fine!
> (After running modprobe -r ideapad-laptop that is, should anyone have
> trouble enabling it)
> 
> I had tried all the board.bin files from the windows drivers before, so the
> added sanity check seems to be what finally solved it.

I hope to test it in my Yoga 3 11 (1170) in the next days. Meanwhile, what is
the problem you see with the ideapad-laptop driver? I have recently submitted
a couple of bug fixes for the Yoga 1170, can you try if the patch below
fixes this for you?

	Arnd
	
commit 9d6d311add697014bdccb18d625db7e38676adbf
Author: Arnd Bergmann <arnd@arndb.de>
Date:   Sat Jun 13 15:13:11 2015 +0200

    ideapad: add rfkill whitelist entry for Yoga 3 1170
    
    This adds one more entry to the whitelist of machines that do not have
    a physical rfkill switch. Unfortunately, the Yoga 3 generation seems
    to use upper-case letters for the YOGA 3 Pro-1370, while it uses normal
    capitalization for its Yoga 3 1170 sibling.
    
    In order to catch all variants of the Yoga 3, I'm now using both strings
    as wildcards here, which should also cover the 1470 model, and possible
    changes in the string that could happen in firmware updates.
    
    Signed-off-by: Arnd Bergmann <arnd@arndb.de>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index cb7cd8d79329..8e455c1429ee 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -855,7 +855,14 @@ static const struct dmi_system_id no_hw_rfkill_list[] = {
 		.ident = "Lenovo Yoga 3 Pro 1370",
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
-			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3 Pro-1370"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo YOGA 3"),
+		},
+	},
+	{
+		.ident = "Lenovo Yoga 3 1170 / 1470",
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
+			DMI_MATCH(DMI_PRODUCT_VERSION, "Lenovo Yoga 3"),
 		},
 	},
 	{}


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
