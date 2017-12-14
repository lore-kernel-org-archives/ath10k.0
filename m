Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by merlin.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ePTME-0001e6-6g
 for ath10k@lists.infradead.org; Thu, 14 Dec 2017 13:15:27 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: "htt version request timed out" with the last 4.1.1.c1 firmware
Date: Thu, 14 Dec 2017 13:14:56 +0000
Message-ID: <87bmj1moxc.fsf@kamboji.qca.qualcomm.com>
References: <2025478478.2725588.1512857709726.ref@mail.yahoo.com>
 <2025478478.2725588.1512857709726@mail.yahoo.com>	<4122842.1D0mIpT2Ae@uapou>
In-Reply-To: <4122842.1D0mIpT2Ae@uapou> (Paul Nuville's message of "Sat, 09
 Dec 2017 23:23:02 +0100")
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
To: Paul Nuville <paulnuville@yahoo.fr>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Paul Nuville <paulnuville@yahoo.fr> writes:

> I've installed Archlinux on a Samsung Galaxy Book 10.6", and I'm trying to set 
> up the wifi. The only firmware that seems to be suitable is the lastest 4.1.1.c1 
> one. But I've some errors and neither ip ad networkmanager are able to set up 
> the wlan interface. 
> Here are some outputs : 
>

[...]

> [ 1777.861815] ath10k_pci 0000:01:00.0: qca6174 hw3.2 target 0x05030000 
> chip_id 0x00340aff sub 144d:c150
> [ 1777.861817] ath10k_pci 0000:01:00.0: kconfig debug 0 debugfs 1 tracing 0 dfs 
> 0 testmode 0
> [ 1777.862589] ath10k_pci 0000:01:00.0: firmware ver WLAN.RM.2.0-00180-
> QCARMSWPZ-1 api 4 features wowlan,ignore-otp,no-4addr-pad crc32 75dee6c5
> [ 1777.926402] ath10k_pci 0000:01:00.0: failed to fetch board data for 
> bus=pci,vendor=168c,device=003e,subsystem-vendor=144d,subsystem-device=c150 
> from ath10k/QCA6174/hw3.0/board-2.bin
> [ 1777.926428] ath10k_pci 0000:01:00.0: board_file api 1 bmi_id N/A crc32 
> ed5f849a
> [ 1781.596516] ath10k_pci 0000:01:00.0: htt version request timed out

ath10k didn't file the correct board file from board-2.bin. Try updating
to the latest board-2.bin:

https://github.com/kvalo/ath10k-firmware/blob/master/QCA6174/hw3.0/board-2.bin

The md5sum should be:

eddaa17fa2092bcd6713720116e421f1

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
