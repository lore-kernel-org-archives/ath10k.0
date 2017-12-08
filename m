Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNFIo-0002ec-1h
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 09:51:18 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: search DT for qcom, ath10k-calibration-variant
Date: Fri, 8 Dec 2017 09:50:12 +0000
Message-ID: <87bmj9tup8.fsf@kamboji.qca.qualcomm.com>
References: <20170310080615.22958-1-sven.eckelmann@openmesh.com>
 <20170310080615.22958-2-sven.eckelmann@openmesh.com>
 <3853747.Q0JJmSnsYM@debian64>
In-Reply-To: <3853747.Q0JJmSnsYM@debian64> (Christian Lamparter's message of
 "Fri, 10 Mar 2017 19:20:54 +0100")
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
To: Christian Lamparter <chunkeey@googlemail.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Aeolus Yang <aeolus@qti.qualcomm.com>, Sven Eckelmann <sven.eckelmann@openmesh.com>, "ext.waldemar.rymarkiewicz@tieto.com" <ext.waldemar.rymarkiewicz@tieto.com>

Christian Lamparter <chunkeey@googlemail.com> writes:

> On Friday, March 10, 2017 9:06:15 AM CET Sven Eckelmann wrote:
>> Board Data File (BDF) is loaded upon driver boot-up procedure. The right
>> board data file is identified on QCA4019 using bus, bmi-chip-id and
>> bmi-board-id.
>> 
>> The problem, however, can occur when the (default) board data file cannot
>> fulfill with the vendor requirements and it is necessary to use a different
>> board data file.
>> 
>> This problem was solved for SMBIOS by adding a special SMBIOS type 0xF8.
>> Something similar has to be provided for systems without SMBIOS but with
>> device trees. No solution was specified by QCA and therefore a new one has
>> to be found for ath10k.
>> 
>> The device tree requires addition strings to define the variant name
>> 
>>     wifi@a000000 {
>>     	status = "okay";
>>     	qcom,ath10k-calibration-variant = "RT-AC58U";
>>     };
>> 
>>     wifi@a800000 {
>>     	status = "okay";
>>     	qcom,ath10k-calibration-variant = "RT-AC58U";
>>     };
>> 
>> This would create the boarddata identifiers for the board-2.bin search
>> 
>>  *  bus=ahb,bmi-chip-id=0,bmi-board-id=16,variant=RT-AC58U
>>  *  bus=ahb,bmi-chip-id=0,bmi-board-id=17,variant=RT-AC58U
>> 
>> Signed-off-by: Sven Eckelmann <sven.eckelmann@openmesh.com>

[...]

> @Aeolus Yang / Kalle / QCA: Would it be possible to assign a variant string to
> the Asus RT-AC58U?

What do you mean? Add qcom,ath10k-calibration-variant to that board's
device tree or something else?

> I've attached the necessary bmi-board-id=16 and bmi-board-id=17 board 
> files to this mail as well. So, all that needs to be done is to add
> them to the board-2.bin on your codeaurora / ath10k-firmware project.
>
> Kalle: Can you please update the board-2.bin for the IPQ40XX on your
> ath10k-firmware project on github?

Where did you get these board files from?

BTW, it seems lots of people want to add board files so I wrote
instruction how I prefer them submitted:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA40XX/hw1.0/board-2.bin
>
> It looks like this board-2.bin has support for a few more boards.

I checked and that should be in ath10k-firmware.git now:

$ ath10k-bdencoder --diff ../board-2.bin board-2.bin  | tail -1
0 board image(s) added, 0 changed, 0 deleted, 9 in total



-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
