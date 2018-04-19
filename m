Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out-ams-01.qualcomm.com ([185.23.61.162])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f96gW-0005so-9u
 for ath10k@lists.infradead.org; Thu, 19 Apr 2018 10:21:02 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: ath10k-firmware: QCA4019 hw1.0/QCA9888 hw2.0: Add OpenMesh A62
 specific BDFs
Date: Thu, 19 Apr 2018 10:20:41 +0000
Message-ID: <87zi1zlcp3.fsf@kamboji.qca.qualcomm.com>
References: <3706510.gbe5VexPLA@bentobox>
In-Reply-To: <3706510.gbe5VexPLA@bentobox> (Sven Eckelmann's message of "Thu, 
 29 Mar 2018 12:11:02 +0200")
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Sven Eckelmann <sven.eckelmann@openmesh.com> writes:

> I am currently starting to prepare the OpenMesh A62 support for Openwrt. This  
> AP requires three special BDFs to get the Wi-Fi PHYs working (correctly). The  
> bmi-board-id='s would clash with one of the the IPQ401X AP-DK boards because 
> QCA doesn't provide special IDs for customers and seems to use the AP-DK 
> board-ids in the wifi firmware to change its behavior.
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
>   - it is the latest release from 2018-03-29
>
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
>   - QCA4019 hw1.0
>
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62
>       sha256sum:
>       df5dc5a55506e2a58dcb0b8542f40226d3bfd530a6fc0bc90c728ab18a57144c
>     + bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62
>       sha256sum:
>       96c3d044fe26522c75313c210ace6f85d5bdcdbce3350214d92467501a01fb88
>
>   - QCA9888 hw2.0
>
>     + bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62
>       sha256sum:
>       c85b23763e748abeb7e8c42e243dab1fc58d1bff94111e4058bdf31ddb14cefa
>
> * attach the actual board file (board.bin)
>
>   - The name of the files are equal to the id string in the board-2.bin
>     (minus the ".bin")

I added these now, please check the results:

https://github.com/kvalo/ath10k-firmware/commit/a262aac7cfe5ae5833378b4f1b0634f873a4df4d

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=20,variant=OM-A62

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 14 in total

New:
bus=ahb,bmi-chip-id=0,bmi-board-id=21,variant=OM-A62

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 15 in total

New:
bus=pci,bmi-chip-id=0,bmi-board-id=16,variant=OM-A62

Changed:


Deleted:

1 board image(s) added, 0 changed, 0 deleted, 16 in total

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
