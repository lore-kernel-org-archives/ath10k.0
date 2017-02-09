Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cblwf-0002EZ-VD
 for ath10k@lists.infradead.org; Thu, 09 Feb 2017 10:27:23 +0000
MIME-Version: 1.0
Date: Thu, 09 Feb 2017 15:56:59 +0530
From: akolli@codeaurora.org
Subject: Re: QCA4019: calibration files and board files
In-Reply-To: <4082394.QILMJyBdPS@bentobox>
References: <1591748.RGYhBEn8I1@bentobox> <4082394.QILMJyBdPS@bentobox>
Message-ID: <017699fcd5b2f14fee8708fc8d8863cf@codeaurora.org>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: ath10k@lists.infradead.org, shashidhar.lakkavalli@openmesh.com

On 2017-02-08 16:33, Sven Eckelmann wrote:
> Hi Anilkumar Kolli,
> 
> we've noticed that your change in QSDK [1] removed the call to
> ath10k_download_and_run_otp in ath10k_download_cal_data after the call 
> to
> ath10k_core_get_board_id_from_otp. We reported [2] this to ath10k when 
> we
> asked for some clarifications regarding the loading process of the 
> pre-cal +
> board-2.bin data.
> 
> It was also told us by QCA (private mail) and by Adrian Chadd [3] that 
> the
> ath10k_download_and_run_otp step should have been done.
> 
> The used release were we noticed this was
> caf_AU_LINUX_QSDK_RELEASE_DATE_R1_TARGET_ALL.5.0.639.021.
> 
> Will this be fixed in the QSDK? Why is a different implementation used 
> than in
> the official ath10k version [4]?
> 

Thanks for pointing this, I broke the sequence in qsdk while loading cal 
data
from flash MTD partitions. I will revert these changes in QSDK patch[1].

@@ -224,21 +224,13 @@
  +		 * from board data content and caldata content downloaded in
  +		 * previous steps.
  +		*/
-+		goto load_bdata_and_run_otp;
++		goto done;
  +	}
  +
   	ret = ath10k_download_cal_file(ar, ar->cal_file);
   	if (ret == 0) {
   		ar->cal_mode = ATH10K_CAL_MODE_FILE;
-@@ -1401,6 +1520,7 @@ static int ath10k_download_cal_data(stru
- 		   "boot did not find target EEPROM entry, try OTP next: %d\n",
- 		   ret);
-
-+load_bdata_and_run_otp:
- 	ret = ath10k_download_and_run_otp(ar);
- 	if (ret) {
- 		ath10k_err(ar, "failed to run otp: %d\n", ret);
-@@ -2024,6 +2144,8 @@ static int ath10k_core_probe_fw(struct a
+@@ -2025,6 +2144,8 @@ static int ath10k_core_probe_fw(struct a
   			   "could not load pre cal data: %d\n", ret);
   	}

Thanks,
Anil.

> Kind regards,
> 	Sven
> 
> 
> [1]
> https://source.codeaurora.org/quic/qsdk/oss/system/feeds/wlan-open/commit/?id=cd78cb8fcbc28af3e538743177f106ec8c5fe295
> [2] 
> http://lists.infradead.org/pipermail/ath10k/2017-January/009025.html
> [3] 
> http://lists.infradead.org/pipermail/ath10k/2017-January/009104.html
> [4]
> https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/commit/?id=3d9195ea19e4854d7daa11688b01905e244aead9

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
