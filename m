Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f9Ajo-0003sp-JF
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 14:40:46 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add GL.iNet GL-B1300 specific BDFs
References: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
Date: Thu, 19 Apr 2018 17:40:24 +0300
In-Reply-To: <CAEYLdSij6gAAmG2+MQmfGD-m4tOi3O-h0HNmQutwrdQb_iG3Gg@mail.gmail.com>
 (Dongming Han's message of "Tue, 27 Mar 2018 14:48:05 +0800")
Message-ID: <87in8nl0o7.fsf@kamboji.qca.qualcomm.com>
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
To: Dongming Han <workspace4hdm@gmail.com>
Cc: ath10k@lists.infradead.org

Dongming Han <workspace4hdm@gmail.com> writes:

> Tying to upstream BDFs of GL.iNet GL-B1300 to ath10k-firmware.
> This router uses two changed BDFs based on
> boardData_1_0_IPQ4019_Y9803_wifi0.bin & boardData_1_0_IPQ4019_Y9803_wifi1.bin.
> We changed BDF for target power of both BDFs and FEM control parameter
> antCtrlCommon2_G_0_0 of boardData_1_0_IPQ4019_Y9803_wifi0.
>
> I'm not quite sure if ath10k driver need to add these two changed BDF
> to work properly
> for this board.
>
> I think the ART data is made based on BDF. Maybe the antCtrlCommon logic
> and target power parameter is passed to driver by ART but not BDF?
> That way we're all happier no need to mantain these change. Please advise.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4028 based router. More information [2]
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - we create it. Can also be extracted from manufacturer firmware[3].
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GL-B1300
>    sha256sum: 34d5b821826aad1699666ec95df19a1767245ab424068161275a7ace947eedee
>   - bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=GL-B1300
>    sha256sum: d0abd802b3d04b51f4a40883157e86b1ff3a204c660d0aa3365ae8e55f625a3e
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

Added now, please check:

https://github.com/kvalo/ath10k-firmware/commit/3af9ae584691acbe2356e30fac8380ad4840d8a6

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=GL-B1300

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 18 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=GL-B1300

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 19 in total

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
