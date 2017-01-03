Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wj0-x22d.google.com ([2a00:1450:400c:c01::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1cOOtw-0005Fm-Kh
 for ath10k@lists.infradead.org; Tue, 03 Jan 2017 13:13:17 +0000
Received: by mail-wj0-x22d.google.com with SMTP id sd9so259731259wjb.1
 for <ath10k@lists.infradead.org>; Tue, 03 Jan 2017 05:12:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170103124140.GA8576@atheros-ThinkPad-T61>
References: <CACBNxUFLP9aTm-T043Cb37nGojt8DT9SGvSkQPL6v7w+=8Jcug@mail.gmail.com>
 <20170103124140.GA8576@atheros-ThinkPad-T61>
From: "K.Mani" <sailormani@gmail.com>
Date: Tue, 3 Jan 2017 18:42:54 +0530
Message-ID: <CACBNxUG8NAPUtxHwk8zrPB7_h1PnNSBBj_6XoLhDjOBgJbA8pg@mail.gmail.com>
Subject: Re: QCA8994 booting failed
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
To: Mohammed Shafi Shajakhan <mohammed@codeaurora.org>
Cc: ath10k@lists.infradead.org

Thanks a lot for the prompt reply..it worked

Thanks
Mani

On Tue, Jan 3, 2017 at 6:11 PM, Mohammed Shafi Shajakhan
<mohammed@codeaurora.org> wrote:
> On Tue, Jan 03, 2017 at 06:03:13PM +0530, K.Mani wrote:
>> I'm using Annapurna board(Alpine soc V1) on kernel-linux-3.10.20 openWRT.
>> The board has two QCA9984 wlan boards(2.4 & 5 Ghz). I downloaded the
>> firmware files from net.
>> Used, insmod ath10k_core.ko skip_otp=1 also tried without skip_otp param
>>
>> The wlan 5.0Ghz board bootsup & connects to ssid, pings perfectly.
>> But the 2.4Ghz board fails to bootup, stating "failed to fetch board file".
>
> kindly try the board-2.bin
> https://source.codeaurora.org/quic/qsdk/oss/firmware/ath10k-firmware/plain/ath10k/QCA9984/hw1.0/
>>
>> [  209.550433] ath10k_pci 0001:01:00.0: bmi lz stream start address 0x0
>> [  209.550669] ath10k_pci 0001:01:00.0: bmi execute address 0x1234 param 0x10
>> [  210.942841] ath10k_pci 0001:01:00.0: bmi execute result 0x1000
>> [  210.942848] ath10k_pci 0001:01:00.0: boot get otp board id result
>> 0x00001000 board_id 4 chip_id 0
>> [  210.942856] ath10k_pci 0001:01:00.0: boot using board name
>> 'bus=pci,bmi-chip-id=0,bmi-board-id=4'
>> [  210.942930] ath10k_pci 0001:01:00.0: board name
>> [  210.942938] ath10k_pci 0001:01:00.0: 00000000: 62 75 73 3d 70 63 69
>> 2c 62 6d 69 2d 63 68 69 70  bus=pci,bmi-chip
>> [  210.942944] ath10k_pci 0001:01:00.0: 00000010: 2d 69 64 3d 30 2c 62
>> 6d 69 2d 62 6f 61 72 64 2d  -id=0,bmi-board-
>> [  210.942950] ath10k_pci 0001:01:00.0: 00000020: 69 64 3d 31
>>                             id=1
>> [  210.942957] ath10k_pci 0001:01:00.0: failed to fetch board data for
>> bus=pci,bmi-chip-id=0,bmi-board-id=4 from
>> ath10k/QCA9984/hw1.0/board-2.n
>> [  271.089644] ath10k_pci 0001:01:00.0: failed to fetch board data
>> [  271.095555] ath10k_pci 0001:01:00.0: failed to fetch board file: -2
>>
>> One difference I found from the bootlogs
>> For 5.0Ghz log shows, bmi execute result 0x400
>> But 2.4Ghz log shows, bmi execute result 0x1000
>> Could this be the issue, if so how to fix it?
>>
>> Help needed.
>>
>> Thanks
>> Mani
>>
>> _______________________________________________
>> ath10k mailing list
>> ath10k@lists.infradead.org
>> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
