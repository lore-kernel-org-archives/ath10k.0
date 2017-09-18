Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dtxfN-0006yc-Be
 for ath10k@lists.infradead.org; Mon, 18 Sep 2017 15:08:59 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: QCA988X: FW firmware-5.bin_10.2.4.70.63-2 crashes at ath10k load
Date: Mon, 18 Sep 2017 15:08:29 +0000
Message-ID: <87377kdoya.fsf@kamboji.qca.qualcomm.com>
References: <ba581279-8a7b-c38d-fa91-b4a85dd80b15@hauke-m.de>
In-Reply-To: <ba581279-8a7b-c38d-fa91-b4a85dd80b15@hauke-m.de> (Hauke
 Mehrtens's message of "Sun, 17 Sep 2017 22:08:58 +0200")
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
To: Hauke Mehrtens <hauke@hauke-m.de>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hauke Mehrtens <hauke@hauke-m.de> writes:

> I am using a BT Home Hub 5A with LEDE and backports-4.14-rc1 + some
> patches from the LEDE repository. It has one QCA988X card in it which
> works like expected with FW firmware-5.bin_10.2.4-1.0-00029, but crashes
> with FW firmware-5.bin_10.2.4.70.63-2.

Thanks for the report. I have been waiting for a fix from the firmware
team but I now reverted the broken release from both ath10k-firmware and
linux-firmware:

https://github.com/kvalo/ath10k-firmware/commit/a70d26758a9ad7cf81ebf2e7bf4383c50a5ea5ae

https://lkml.kernel.org/r/1505746857-31938-4-git-send-email-kvalo@qca.qualcomm.com

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
