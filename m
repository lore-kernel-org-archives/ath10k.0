Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a3QBa-0003hK-HD
 for ath10k@lists.infradead.org; Mon, 30 Nov 2015 15:16:14 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 0/6] ath10k: print crc32 checksum
References: <20151125133654.25507.10863.stgit@potku.adurom.net>
Date: Mon, 30 Nov 2015 17:15:40 +0200
In-Reply-To: <20151125133654.25507.10863.stgit@potku.adurom.net> (Kalle Valo's
 message of "Wed, 25 Nov 2015 15:37:56 +0200")
Message-ID: <87h9k3ikmb.fsf@kamboji.qca.qualcomm.com>
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
To: ath10k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org

Kalle Valo <kvalo@qca.qualcomm.com> writes:

> Print crc32 checksum for firmware and board files. Also some improvements how
> we print info messages during boot.
>
> ---
>
> Kalle Valo (6):
>       ath10k: fix otp board id error message
>       ath10k: reorganise hardware and firmware info messages
>       ath10k: always show bmi chip ids and subdevice ids
>       ath10k: split driver info messages during device initialisation
>       ath10k: print crc32 checksums for firmware and board files
>       ath10k: implement fw_checksums debugfs file

All six applied.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
