Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1joizG-0005om-IC
 for ath10k@lists.infradead.org; Fri, 26 Jun 2020 07:41:28 +0000
Date: Fri, 26 Jun 2020 09:41:19 +0200
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
Subject: ath10k_pci spams dmesg "failed to send pdev bss chan info request"
Message-ID: <20200626074119.2aonlyfqb3ve65p3@pali>
MIME-Version: 1.0
Content-Disposition: inline
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
To: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, linux-wireless@vger.kernel.org

Hello!

During testing 5.8.0-rc2 kernel version with Compex WLE900VX card
(ath10k) I see following error in dmesg which is periodically repeating,
sometimes every second:

ath10k_pci 0000:01:00.0: failed to send pdev bss chan info request

Card has firmware version 10.1 and features wmi-10.x,has-wmi-mgmt-tx,mfp

That error message is located in file ath10k/mac.c in the function
ath10k_mac_update_bss_chan_survey().

I checked that 'ret' variable in that function contains value -95 which
is -EOPNOTSUPP. It seems that ath10k_wmi_pdev_bss_chan_info_request() is
not really supported by firmware 10.1.

That function is used only by ath10k_get_survey() function and
ath10k_get_survey() ignores all errors from the function
ath10k_mac_update_bss_chan_survey(). Which seems wrong as get_survey()
could return -EOPNOTSUPP when it is not supported.

Could we at least skip printing that error message when 'ret' is
-EOPNOTSUPP?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
