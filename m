Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9V9d-0001Jm-Ep
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 13:01:11 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA9984 hw1.0: Add Netgear Orbi Pro SRK60
 specific BDFs
References: <CAOX2RU5j9hsvZP4J_x3t0_L03budt_GLUN4FdtrM+7sKZ-wuXg@mail.gmail.com>
Date: Mon, 08 Oct 2018 16:00:42 +0300
In-Reply-To: <CAOX2RU5j9hsvZP4J_x3t0_L03budt_GLUN4FdtrM+7sKZ-wuXg@mail.gmail.com>
 (Robert Marko's message of "Sun, 2 Sep 2018 13:25:04 +0200")
Message-ID: <87woqsd24l.fsf@kamboji.qca.qualcomm.com>
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

> I am currently working on the Netgear Orbi Pro SRK60 support for
> OpenWrt. This
> AP requires three special BDFs to get the Wi-Fi PHYs working (correctly). The
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because
> QCA doesn't provide special IDs for customers and seems to use the AP-DK
> board-ids in the wifi firmware to change its behavior.
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
>   - it is based on latest 2.1.4.16 firmware
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA9984 hw1.0
>
>   + bus=pci,bmi-chip-id=0,bmi-board-id=6,variant=Netgear-Orbi-Pro-SRK60
>      md5sum:
>      1725321919ee4dac521db1b3253c8f8d
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Added, thanks. Please double check my changes:

https://github.com/kvalo/ath10k-firmware/commit/b4cf08bbce8c3b9ef9a5a7248a800e40beed5b2d

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
