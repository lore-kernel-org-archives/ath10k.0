Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVc26-0008Bs-C3
 for ath10k@lists.infradead.org; Fri, 05 Aug 2016 10:07:15 +0000
From: "Thiagarajan, Vasanthakumar" <vthiagar@qti.qualcomm.com>
Subject: Re: [PATCH 4/4] ath10k: Enable support for QCA9984
Date: Fri, 5 Aug 2016 10:06:41 +0000
Message-ID: <57A4652F.9000303@qti.qualcomm.com>
References: <1461164356-9158-1-git-send-email-vthiagar@qti.qualcomm.com>
 <1461164356-9158-5-git-send-email-vthiagar@qti.qualcomm.com>
 <loom.20160509T113952-8@post.gmane.org> <57306645.2060600@qti.qualcomm.com>
 <CAHyQSvKPo2-Pc9PPVY-mHUK0TX93CzxnwMob125Aruqiem7J7Q@mail.gmail.com>
 <878tzhg61o.fsf@kamboji.qca.qualcomm.com>
 <CAHyQSvLpqRNmTL4Tvb7SDtKptzwejfbB7DeQC3NNMb=qqn06GA@mail.gmail.com>
 <5732DB82.1020007@qti.qualcomm.com>
 <CAH1sOKUgb0pGmzN4pAy5GHseAW4QHHgyqJx4kgze5_27R8SKxg@mail.gmail.com>
In-Reply-To: <CAH1sOKUgb0pGmzN4pAy5GHseAW4QHHgyqJx4kgze5_27R8SKxg@mail.gmail.com>
Content-Language: en-US
Content-ID: <993B587E8D60494C82059F754CF717B7@qualcomm.com>
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
To: bharath yadav <uddandibharath7@gmail.com>
Cc: Archisman Maitra <archisman001@gmail.com>, "Valo,
 Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On Thursday 04 August 2016 07:50 PM, bharath yadav wrote:
> Hi.,
> I am trying to enable support for QCA9984 on latest stable backports-4.4.2-1 using the above patch.
>
> downloaded "https://kernel.googlesource.com/pub/scm/linux/kernel/git/kvalo/ath/" (ath.git) has the patch
> applied for qca9984 but it has downloaded the kernel tree.
>
> please give me info on which version of backports we need to use for QCA9984 or how to build ath10k alone from
> ath.git kernel tree.

I dont think there is any new backports tarball for recent ath.git available. You may need to create one,
please refer https://wireless.wiki.kernel.org/en/users/drivers/ath10k/backports for information
to create your own backports tarball.

Vasanth

>
> On Wed, May 11, 2016 at 12:43 PM, Thiagarajan, Vasanthakumar <vthiagar@qti.qualcomm.com
> <mailto:vthiagar@qti.qualcomm.com>> wrote:
>
>     On Wednesday 11 May 2016 12:23 PM, Archisman Maitra wrote:
>      > Hi,
>      >
>      > Thank you for providing me the binaries.
>      >
>      > I have started working on the mac80211 driver and have some questions:-
>      >
>      > a) I am working with OpenWRT framework, which uses mac80211 driver dated 1-10-2016. I have noticed that the
>      > patch that you have provided, uses a different mac80211 driver. Would that be a problem?
>      >
>      > Ex:-
>      > ------------------------------------------------------------------------------------------------
>      >          .id = QCA9984_HW_1_0_DEV_VERSION,
>      >          .dev_id = QCA9984_1_0_DEVICE_ID,
>     >          .name = "qca9984/qca9994 hw1.0",
>      >          .patch_load_addr = QCA9984_HW_1_0_PATCH_LOAD_ADDR,
>      >          .uart_pin = 7,
>      >          .otp_exe_param = 0x00000700,
>      >          .continuous_frag_desc = true,
>      >          .channel_counters_freq_hz = 150000,
>      >          .max_probe_resp_desc_thres = 24,
>      >          .hw_4addr_pad = ATH10K_HW_4ADDR_PAD_BEFORE,
>      >          /*
>      >          .tx_chain_mask = 0xf,
>      >          .rx_chain_mask = 0xf,
>      >          .max_spatial_stream = 4,
>      >          .cal_data_len = 12064, */
>      >          .fw = {
>      >              .dir = QCA9984_HW_1_0_FW_DIR,
>      >              .fw = QCA9984_HW_1_0_FW_FILE,
>      > -------------------------------------------------------------------------------------------------
>      >   Here, the commented out members are not present in my driver source code.
>      >
>      > b)  "ath10k_pci 0001:01:00.0: unable to read from the device" This is encountered at runtime. Upon
>      > investigating, it is seen that  ath10k_bmi_execute(ar, address, BMI_PARAM_GET_EEPROM_BOARD_ID, &result)
>      > returns 0 in drivers/net/wireless/ath/ath10k/core.c when called from ath10k_core_get_board_id_from_otp
>      >
>      > On browsing the source of the error I have found the control to go from ath10k_bmi_execute ---->
>      >   ath10k_pci_hif_exchange_bmi_msg in drivers/net/wireless/ath/ath10k/pci.c ------>  ath10k_pci_bmi_wait in
>      > drivers/net/wireless/ath/ath10k/pci.c where it returns  -ETIMEDOUT
>
>     Can you please move to the latest ath10k src (ath.git) and enable 0x420 (bmi and boot related debug) ath10k
>     debug mask?.
>
>     You can enable the debug through modparam, insmod ath10k_core debug_mask=0x420.
>
>
>     Vasanth
>
>     _______________________________________________
>     ath10k mailing list
>     ath10k@lists.infradead.org <mailto:ath10k@lists.infradead.org>
>     http://lists.infradead.org/mailman/listinfo/ath10k
>
>
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
