Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hgr4o-0007CU-6a
 for ath10k@lists.infradead.org; Fri, 28 Jun 2019 13:38:09 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Update OpenMesh A62 specific BDFs
References: <2795259.fejyDvFH3e@bentobox>
Date: Fri, 28 Jun 2019 16:38:02 +0300
In-Reply-To: <2795259.fejyDvFH3e@bentobox> (Sven Eckelmann's message of "Thu, 
 10 Jan 2019 13:59:14 +0100")
Message-ID: <87zhm1de4l.fsf@kamboji.qca.qualcomm.com>
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
To: Sven Eckelmann <seckelmann@datto.com>
Cc: ath10k@lists.infradead.org

Sven Eckelmann <seckelmann@datto.com> writes:

> The OpenMesh A62 AP requires three special BDFs to get the Wi-Fi PHYs working 
> (correctly). The  bmi-board-id='s would clash with one of the the IPQ401X 
> AP-DK boards because QCA doesn't provide special IDs for customers and seems 
> to use the AP-DK board-ids in the wifi firmware to change its behavior. This 
> request contains the two files for QCA4019. The QCA9888 one will be submitted 
> in a different request.
>
> This update contains:
>
> * add of the antenna gain
> * adjustments of the antenna sensitivity (see minCCA power threshold and
>   configAddr)
> * CTLs for DFS channels
>
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a QCA4018 based module (based on qcom-ipq4019-ap.dk04.1)
>   - one QCA4018 radio is used as 2.4GHz radio
>   - one QCA4018 radio is used as 5GHz radio
>   - an additional QCA9888 5GHz radio is attached via PCI
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - it was created by the ODM and QCA for the OpenMesh A62
>   - was provided by the ODM to OpenMesh for this product (this includes
>     distribution)
>   - it is the latest release from 2018-11-28
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
>       md5sum: 8c4ab812be4c62d4f5eae26125efc407
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
>       md5sum: 170400a46d78f2adf82f16ac3fac0abf
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Thanks, added to QCA4019/hw1.0/board-2.bin:

https://github.com/kvalo/ath10k-firmware/commit/12ce541d08fc6a7ffbc7850cec5209bbf123033e

New:


Changed:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62

Deleted:

0 board image(s) added, 2 changed, 0 deleted, 41 in total

https://github.com/kvalo/ath10k-firmware/commit/12ce541d08fc6a7ffbc7850cec5209bbf123033e

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
