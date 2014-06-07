Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.duncanthrax.net ([2001:470:70c5:1111::170])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wt9rC-0002ye-W9
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 06:12:00 +0000
Received: from hsi-kbw-091-089-013-092.hsi2.kabelbw.de ([91.89.13.92]
 helo=[10.12.27.253])
 by smtp.eurescom.eu with esmtpsa (TLSv1:DHE-RSA-AES128-SHA:128)
 (Exim 4.80.1) (envelope-from <svens@stackframe.org>)
 id 1Wt9qm-0000KI-N1
 for ath10k@lists.infradead.org; Sat, 07 Jun 2014 08:11:32 +0200
Message-ID: <5392AD19.3060103@stackframe.org>
Date: Sat, 07 Jun 2014 08:11:37 +0200
From: Sven Schnelle <svens@stackframe.org>
MIME-Version: 1.0
Subject: Re: compat-wireless-2014-05-22 breaks ath10k in an Archer C7 v2
References: <8738fimmjp.fsf@kamboji.qca.qualcomm.com>
 <53924F5F.5090104@gmail.com> <87wqctjn6o.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87wqctjn6o.fsf@kamboji.qca.qualcomm.com>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hi Kalle,

Am 07.06.2014 07:36, schrieb Kalle Valo:
> Kamal Koshy <kamal.koshy@gmail.com> writes:
>
>> Attaching the result of dd if=/dev/mtd4 > ~/mtd4
> Thanks, I'll take a look at that later. But before that, do you know
> what's the mac address of the QCA9880 device with the proprietary
> driver? (_not_ with ath10k) That would help searching for the
> calibration data.
>
To me it looks like ath9k calibration data starts at 0x1000, and ath10k 
calibration data
starts at 0x5000 in that mtd image. That's the same as on my board.

Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
