Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jU0c0-0008Hj-Rh
 for ath10k@lists.infradead.org; Thu, 30 Apr 2020 04:15:50 +0000
Subject: RE: Ath10k reboot regression with v5.7-rc1 on dragonboard 845c
From: Govind Singh <govinds@qti.qualcomm.com>
Date: Thu, 30 Apr 2020 04:15:42 +0000
Message-ID: <DM5PR02MB38935D19B8733C543FDC8BA09CAA0@DM5PR02MB3893.namprd02.prod.outlook.com>
References: <CAMi1Hd1ReJnYsw3Rg6ECGM-7zzciRqJvJGUm3tuYtHhmGipnZA@mail.gmail.com>
In-Reply-To: <CAMi1Hd1ReJnYsw3Rg6ECGM-7zzciRqJvJGUm3tuYtHhmGipnZA@mail.gmail.com>
Content-Language: en-US
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
To: Amit Pundir <amit.pundir@linaro.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: "manivannan.sadhasivam@linaro.org" <manivannan.sadhasivam@linaro.org>, John Stultz <john.stultz@linaro.org>, "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>

Hi Amit,
Seems del_server is being notified early due to qrtr-ns migration from userspace to kernel prior remote(modem + wifi) actually went down.
As per of del_server we are removing the MSA permission via SCM call, but remote(wifi user pd in modem Q6) is still accessing the region.

BR,
Govind

-----Original Message-----
From: ath10k <ath10k-bounces@lists.infradead.org> On Behalf Of Amit Pundir
Sent: Wednesday, April 29, 2020 9:51 PM
To: ath10k@lists.infradead.org
Cc: bjorn.andersson@linaro.org; John Stultz <john.stultz@linaro.org>; manivannan.sadhasivam@linaro.org
Subject: [EXT] Ath10k reboot regression with v5.7-rc1 on dragonboard 845c

Hi,

I see a reboot regression with v5.7-rc1 on Dragonboard 845c
(wcn3990/ath10k_snoc) running AOSP. "reboot" or "reboot bootloader"
commands do not work as expected when the board is connected to WiFi AP. I see "ath10k_snoc 18800000.wifi: firmware crashed"... dump in dmesg and board reboots into usb debug/crash mode. I do not see this reboot regression when the board is not connected to WiFi.

It started with qrtr-ns migration from userspace to kernel which landed in v5.7-rc1. I didn't run into this reboot issue when I was running qrtr-ns userspace tool. According to Mani, in-kernel qrtr-ns just live long enough to catch modem shutdown requests and advertise it to the modem, unlike the userspace tool. Which seem to be the case here. I further narrowed it down to ath10k_qmi_remove_msa_permission()
call in ath10k shutdown path. If I comment out that function call then the reboot command works as expected.

Any thoughts as to what might be going wrong? I do not understand qrtr/ath10k/qmi to see how msa permissions are getting mapped-unmapped here. I'd be happy to help debug things.

Regards,
Amit Pundir

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
