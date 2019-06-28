Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgrD7-0002y8-8G
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:46:42 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update Netgear Orbi Pro SRK60
 specific BDFs
References: <CAOX2RU591S72kfihFV04uP4Mp03cwp2LA+ZXwKQchMZbHPd8aQ@mail.gmail.com>
Date: Fri, 28 Jun 2019 16:46:37 +0300
In-Reply-To: <CAOX2RU591S72kfihFV04uP4Mp03cwp2LA+ZXwKQchMZbHPd8aQ@mail.gmail.com>
 (Robert Marko's message of "Wed, 27 Mar 2019 14:26:16 +0100")
Message-ID: <871rzdddqa.fsf@kamboji.qca.qualcomm.com>
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
To: Robert Marko <robimarko@gmail.com>
Cc: ath10k@lists.infradead.org

Robert Marko <robimarko@gmail.com> writes:

> I am currently working on the Netgear Orbi Prok SRK60 support for
> OpenWrt. This
> AP requires three special BDFs to get the Wi-Fi PHYs working (correctly). The
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> QCA doesn't provide special IDs for customers and seems to use the AP-DK
> board-ids in the wifi firmware to change its behavior.
>
> This update improves stability and performance.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4019 based module (based on qcom-ipq4019-ap.dk04.1-c1)
>   - one QCA4019 radio is used as 2.4GHz radio
>   - one QCA4019 radio is used as 5GHz radio
>   - an additional QCA9984 5GHz radio is attached via PCI
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was pulled from the factory firmware image
>   - it is based on latest 2.3.0.0 firmware
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>   + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Netgear-Orbi-Pro-SRK60
>      md5sum:
>      28eee902927c105f4ce259e3e5b187f3
>
>   + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Netgear-Orbi-Pro-SRK60
>      md5sum:
>      195fddececf3c50cf83bc48df3c1b1c7
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Netgear-Orbi-Pro-SRK60
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Netgear-Orbi-Pro-SRK60

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 50 in total

https://github.com/kvalo/ath10k-firmware/commit/06a5f4bf7ebbc4f12240f74348585d3b5c20f5be

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
