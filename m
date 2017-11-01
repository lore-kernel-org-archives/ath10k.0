Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e9qfQ-0003CG-Vc
 for ath10k@lists.infradead.org; Wed, 01 Nov 2017 10:54:43 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: firmware crash; Atheros QCA6174 doesn't work
Date: Wed, 1 Nov 2017 10:54:16 +0000
Message-ID: <87o9omxo9z.fsf@kamboji.qca.qualcomm.com>
References: <50327789.T1NR8j5T4B@laptopv>
 <0eeb4088a7fb48faa3334b4a40f1d020@NALASEXR01G.na.qualcomm.com>
In-Reply-To: <0eeb4088a7fb48faa3334b4a40f1d020@NALASEXR01G.na.qualcomm.com>
 (Ryan Hsu's message of "Wed, 1 Nov 2017 06:49:15 +0000")
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
To: Ryan Hsu <ryanhsu@qti.qualcomm.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, "phaef5Ie@nurfuerspam.de" <phaef5Ie@nurfuerspam.de>

Ryan Hsu <ryanhsu@qti.qualcomm.com> writes:

>> ### 3. dmesg user made firmware ####
>> 
>> 
>> [ 1772.091031] ath10k_pci 0000:01:00.0: pci irq msi oper_irq_mode 2
>> irq_mode 0 reset_mode 0 [ 1772.369412] ath10k_pci 0000:01:00.0: qca6174
>> hw3.2 target 0x05030000 chip_id 0x00340aff sub 144d:c150 [ 1772.369417]
>> ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 1 dfs 0 testmode 0
>> [ 1772.370701] ath10k_pci 0000:01:00.0: firmware ver
>> qca61x4_2_2_samsung_api_5 api 5 features  crc32 93d04d09 [ 1772.452929]
>> ath10k_pci 0000:01:00.0: failed to fetch board data for bus=pci,bmi-chip-
>> id=0,bmi-board-id=0 from ath10k/QCA6174/hw3.0/board-2.bin [ 1772.452942]
>
> Are you using the same driver you rebuild on #2? This all 0 seems to
> be like the same issue that has been fixed.
> Can you help to check the ath10k git you're using have this fix as well?
> https://patchwork.kernel.org/patch/9486941/

That patch should be in v4.11-rc1 and all releases after that.

d2e202c06ca4 ath10k: ignore configuring the incorrect board_id

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
