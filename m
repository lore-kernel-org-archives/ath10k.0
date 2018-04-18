Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f8qNx-0002Ln-Re
 for ath10k@lists.infradead.org; Wed, 18 Apr 2018 16:56:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0: Add Meraki MR33 specific BDFs
Date: Wed, 18 Apr 2018 16:56:23 +0000
Message-ID: <87o9igmp1l.fsf@kamboji.qca.qualcomm.com>
References: <1756157.Q00gyP1f8V@bentobox>
In-Reply-To: <1756157.Q00gyP1f8V@bentobox> (Sven Eckelmann's message of "Tue, 
 17 Apr 2018 10:15:29 +0200")
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
To: Sven Eckelmann <sven.eckelmann@openmesh.com>
Cc: Chris Blake <chrisrblake93@gmail.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

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

I added these now, please check that I did it correctly. It's very easy
for me to make a mistake.

https://github.com/kvalo/ath10k-firmware/commit/66be3a48d9cf17ace8413cf478a5954483393af4

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
