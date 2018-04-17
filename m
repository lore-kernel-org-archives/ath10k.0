Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x230.google.com ([2607:f8b0:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8S9h-0000T9-Tw
 for ath10k@lists.infradead.org; Tue, 17 Apr 2018 15:04:30 +0000
Received: by mail-vk0-x230.google.com with SMTP id b16so12014607vka.5
 for <ath10k@lists.infradead.org>; Tue, 17 Apr 2018 08:04:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1756157.Q00gyP1f8V@bentobox>
References: <1756157.Q00gyP1f8V@bentobox>
From: Chris Blake <chrisrblake93@gmail.com>
Date: Tue, 17 Apr 2018 10:04:13 -0500
Message-ID: <CALpBJjp_Bf_0HdGpBDvGqqPW7j=Gq5rmftoJhhhOYkdQuV9R2w@mail.gmail.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Meraki MR33 specific BDFs
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Kalle Valo <kvalo@codeaurora.org>, ath10k@lists.infradead.org, Christian Lamparter <chunkeey@gmail.com>

On Tue, Apr 17, 2018 at 3:15 AM, Sven Eckelmann
<sven.eckelmann@openmesh.com> wrote:
> Hi,
>
> The support for this device was added a while ago to OpenWrt. This AP requires
> two special BDFs to get the Wi-Fi PHYs working (correctly). The  bmi-board-
> id='s would clash with one of the the IPQ401X AP-DK boards because QCA doesn't
> provide special IDs for customers and seems to use the AP-DK board-ids in the
> wifi firmware to change its behavior.
>
> Now to the questions from the wiki page [1]:
>
> * description for what hardware this is:
>
>   - it is a IPQ4029 based board
>   - one QCA40xx radio is used as 2.4GHz radio
>   - one QCA40xx radio is used as 5GHz radio
>
> * origin of the board file (did you create it yourself or where you
>   downloaded)
>
>   - Chris didn't include this info in the OpenWrt commit (maybe he can add it
>     here)
>   - most likely taken from stock firmware image
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=Meraki-MR33
>       sha256sum:
>       44e8e733d5fc9bd747520d492c776a6fa4cd7effed69098aeb6f9d437785ebad
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=Meraki-MR33
>       sha256sum:
>       e816565130fae895cfa0c1760cfb47703f1bc5f24ce87922f86e94d4e2b6ccd2
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")
>
> Kind regards,
>         Sven
>
> [1] https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

Hello,
For the Meraki MR33, the board file was pulled out of the factory
firmware image with assistance from Christian Lamparter, who I have
CCd to this thread.

Regards,
Chris Blake

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
