Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9QnA-00034m-T1
 for ath10k@lists.infradead.org; Mon, 08 Oct 2018 08:21:35 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: Asus RT-AC58U boardfile (was Re: [PATCH 2/2] ath10k: search DT
 for qcom, ath10k-calibration-variant)
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <3853747.Q0JJmSnsYM@debian64>
 <87bmj9tup8.fsf@kamboji.qca.qualcomm.com>
 <5423847.QPV7e8Q2Ao@debian64>
Date: Mon, 08 Oct 2018 11:21:13 +0300
In-Reply-To: <5423847.QPV7e8Q2Ao@debian64> (Christian Lamparter's message of
 "Mon, 29 Jan 2018 21:09:50 +0100")
Message-ID: <87in2cetmu.fsf@kamboji.qca.qualcomm.com>
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
To: Christian Lamparter <chunkeey@gmail.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Sven Eckelmann <sven.eckelmann@openmesh.com>

Christian Lamparter <chunkeey@gmail.com> writes:

> Sven's boarddata for the OpenMesh A42 has been accepted. \o/
> So let's try to get the board data for the RT-AC58U merged.
>
> On Friday, December 8, 2017 10:50:12 AM CET Kalle Valo wrote:
>> > I've attached the necessary bmi-board-id=16 and bmi-board-id=17 board 
>> > files to this mail as well. So, all that needs to be done is to add
>> > them to the board-2.bin on your codeaurora / ath10k-firmware project.
>> >
>> > Kalle: Can you please update the board-2.bin for the IPQ40XX on your
>> > ath10k-firmware project on github?
>
> Since some time has passed since the original submission, I just stick to
> answering the questions in the the guide from:
> <https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles>
>
>> description for what hardware this is
> The hardware is the ASUS RT-AC58U [0]. It has a IPQ4018 SoC which
> hosts two ath10k wifis. <https://www.asus.com/Networking/RT-AC58U/>
> It's based on the qcom-ipq4019-ap.dk01.1-c2. machid: 0x8010100 .
> the 5GHz and 2.4GHz radio components were drastically changed and
> as a result, the device's wifis don't work very well with the reference
> board-2.bin values. The 5GHz wifi suffers the most, the max throughput
> tops out at 6 Mbps, even in the best possible "lab conditions".
>
>> origin of the board file (did you create it yourself or where you downloaded)
>
> These files are available in ASUS's GPL Source Code release.
>
> The source code can be downloaded from this site:
> <https://www.asus.com/Networking/RT-AC58U/HelpDesk_Download/>
> Just select "Driver & Tools" in the right frame and "Others"
> in the "Please select OS". It's the second tab called "Source Code":
>
> |Version 3.0.0.4.380.8119
> |2017/10/30  522.32 MBytes
> |GPL of ASUS RT-AC58U for firmware 3.0.0.4.380.8119
> (Note: If you press "Show all", it will list two older releases as well.
> The boarddata files I sent you back then came from the original 
> GPL_RT-AC58U_3.0.0.4.380.6516-g6772678 release. But the boarddata_*.bin
> files have been updated since. So I'm attaching the new ones this time.)
>
> The zip file contains one big GPL_RT-AC58U_3.0.0.4.380.8119-gdb642b4.tgz
> which in turn contain these these two files.
> asuswrt/release/src/router/qca-wifi-fw.ipq40xx/RT-AC58U/boarddata_0.bin
> asuswrt/release/src/router/qca-wifi-fw.ipq40xx/RT-AC58U/boarddata_1.bin
>
> I took the liberty of renaming the files to:
>
> boarddata_0 -> bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ASUS-RT-AC58U.bin
> boarddata_1 -> bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-RT-AC58U.bin
>
>> ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
>
> Following OpenMesh A42 example of "VENDOR-DEVICE", I choose to go with:
> "ASUS-RT-AC58U" as the variant string:
>
> full board name (ATH10K_BD_IE_BOARD_NAME):
> bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ASUS-RT-AC58U
> bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-RT-AC58U
>
>     {
>         "data": "bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ASUS-RT-AC58U.bin", 
>         "names": [
>             "bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ASUS-RT-AC58U"
>         ]
>     }, 
>     {
>         "data": "bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-RT-AC58U.bin", 
>         "names": [
>             "bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-RT-AC58U"
>         ]
>     },   
>
>     (if this is appended at the end of board-2.json, please remove the
>      last comma)
>
>> attach the actual board file (board.bin)
> attached.
>
> just in case. These are the sha256sum:
> d9eb177737983ed320027d50711fd17fadc8057ff0a99d1d455342ef7a7bb1af  \
>     bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=ASUS-RT-AC58U.bin
>
> 24969cd91553fd915c51a8fe51c7b7e0e273679e1349b47d0a6c5ef4b4bb4a1b  \
>     bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=ASUS-RT-AC58U.bin
>
> I also verified that the ASUS' firmware for the RT-AC58U 
> (FW_RT_AC58U_30043808119.ZIP) uses the very same files.

Added, thanks. But please do double check that I didn't do any mistakes.

https://github.com/kvalo/ath10k-firmware/commit/4b89c2b7efef0ba663339c1a42c673e97c7562bd

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
