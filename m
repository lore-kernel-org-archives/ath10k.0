Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTpSh-0001CE-Kn
 for ath10k@lists.infradead.org; Wed, 29 Apr 2020 16:21:28 +0000
Received: by mail-wm1-x343.google.com with SMTP id u127so2696647wmg.1
 for <ath10k@lists.infradead.org>; Wed, 29 Apr 2020 09:21:26 -0700 (PDT)
MIME-Version: 1.0
From: Amit Pundir <amit.pundir@linaro.org>
Date: Wed, 29 Apr 2020 21:50:48 +0530
Message-ID: <CAMi1Hd1ReJnYsw3Rg6ECGM-7zzciRqJvJGUm3tuYtHhmGipnZA@mail.gmail.com>
Subject: Ath10k reboot regression with v5.7-rc1 on dragonboard 845c
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
To: ath10k@lists.infradead.org
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, John Stultz <john.stultz@linaro.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Hi,

I see a reboot regression with v5.7-rc1 on Dragonboard 845c
(wcn3990/ath10k_snoc) running AOSP. "reboot" or "reboot bootloader"
commands do not work as expected when the board is connected to WiFi
AP. I see "ath10k_snoc 18800000.wifi: firmware crashed"... dump in
dmesg and board reboots into usb debug/crash mode. I do not see this
reboot regression when the board is not connected to WiFi.

It started with qrtr-ns migration from userspace to kernel which
landed in v5.7-rc1. I didn't run into this reboot issue when I was
running qrtr-ns userspace tool. According to Mani, in-kernel qrtr-ns
just live long enough to catch modem shutdown requests and advertise
it to the modem, unlike the userspace tool. Which seem to be the case
here. I further narrowed it down to ath10k_qmi_remove_msa_permission()
call in ath10k shutdown path. If I comment out that function call then
the reboot command works as expected.

Any thoughts as to what might be going wrong? I do not understand
qrtr/ath10k/qmi to see how msa permissions are getting mapped-unmapped
here. I'd be happy to help debug things.

Regards,
Amit Pundir

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
