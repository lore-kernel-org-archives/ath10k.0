Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from alexa-out.qualcomm.com ([129.46.98.28])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1eNFTJ-00070o-Jx
 for ath10k@lists.infradead.org; Fri, 08 Dec 2017 10:01:39 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] QCA9888 hw2.0: Add QCA9886 to board-2.bin
Date: Fri, 8 Dec 2017 10:01:06 +0000
Message-ID: <87y3mdsfmm.fsf@kamboji.qca.qualcomm.com>
References: <9c5d3e03-8d0f-596b-4e9a-f549342a450c@o2.pl>
In-Reply-To: <9c5d3e03-8d0f-596b-4e9a-f549342a450c@o2.pl> (Henryk Heisig's
 message of "Mon, 3 Jul 2017 23:33:25 +0200")
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
To: Henryk Heisig <hyniu@o2.pl>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Henryk Heisig <hyniu@o2.pl> writes:

> This patch adding QCA9886 wlan device used in
> Archer C58/C59/C60 with bus=pci,bmi-chip-id=0,bmi-board-id=20mmm
>
> Signed-off-by: Henryk Heisig <hyniu@o2.pl>

I prefer having the original board.bin and adding it to board-2.bin
myself:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/boardfiles

Where did you download this file?

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
